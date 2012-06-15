Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1SfYpU-0005n6-In; Fri, 15 Jun 2012 17:52:57 +0200
Received: by pbbrq2 with SMTP id rq2so5256827pbb.6
	for <multiple recipients>; Fri, 15 Jun 2012 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=SmyJCNV49UQM4AU+yPJX63pf8cvBUS66EutYrhMubm8=;
	b=d1Rpn03seqwRgmlezWGvUnNZ7wHyy8df7KxUfdsQJjYfH7PBXYvZfQEO+K9QC9A3Bh
	okP29aj0opXuRtPRXk0ac7KIvGZkTI3en+4P5r7mpLuO5zCmvgHDYwCDEJbwqpv4TNe8
	XU0AArHM/ypj8bPinpqvC3ZQ8X7KsjMFh+EqMt67GlKTKoGdTCLMm0vf53umlmtN72sl
	Msqcc+zZnpIp9MJJU+hFRCgyteOOciKicBKrospiA5N+eZJFu74vTCmTMgCG4wL2mzq7
	bHBjL/0MUqUO6SgpkXQQaaNbUoFK48TVNMFkv0PG/mnPkhdecffMIn265lsfSjkktyDH
	O9Ng==
Received: by 10.68.225.42 with SMTP id rh10mr9839691pbc.116.1339774936865;
	Fri, 15 Jun 2012 08:42:16 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id iv8sm13587392pbc.53.2012.06.15.08.42.14
	(version=SSLv3 cipher=OTHER); Fri, 15 Jun 2012 08:42:15 -0700 (PDT)
Message-ID: <4FDB57DB.5090407@gmail.com>
Date: Fri, 15 Jun 2012 08:42:19 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
In-Reply-To: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: Proposal: Creating meta-networking
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 15:52:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/15/2012 8:15 AM, Joe MacDonald wrote:
> Hi all,
> 
> We've been talking about this on-and-off at Wind River for a while
> now, but it now seems like a reasonable time to bring a proposal to
> the OE community at large.  We're thinking about creating a new
> layer to house recipes, etc.  for networking packages.  I'll try to
> address what seem to be the most immediate questions (certainly the
> ones we've been thinking most about any time I've discussed this
> with anyone):
> 
> Who would use this?
> 
> The intent is that this would be a layer generally useful directly
> on top of the Yocto Project / OE-core, but it would also draw from
> and compliment meta-oe.  Right now I'm imagining two main groups
> interested in this layer.
> 
> - Anyone building a small networking device (eg. a home router / 
> bridge / switch).
> 
> - Anyone wanting to add network services to their device (eg. 
> anything that might benefit from a small ftp/tftp server)
> 
> What will it include?
> 
> The focus should be on networking protocols, daemons, servers and
> utilities. The plan is for a staged approach.  Initially we're
> going to bring forward a number of recipes from OE Classic that
> aren't currently in OE-core or the meta-oe layer.  The short list
> right now is:
> 
> - aoetools - openldap - quagga - radvd - tftp-hpa - traceroute -
> tunctl - vblade - vlan - xl2tpd
> 
> The next two stages would run concurrently, with Wind River 
> contributing a number of recipes we intend to support for the 
> long-term.  That list is still being firmed up but will include:
> 
> - freeradius - netcat - racoon2 - rdist
> 
> There's about another six or seven packages on the short list
> right now, generally in the same vein.
> 
> The other stage is migrating packages that seem like obvious fits
> into this layer from meta-oe.  The current list under consideration
> would be:
> 
> - atftp - bridge-utils - dnsmasq - dnsmasq-dbus - inetutils -
> ipsec-tools - iw - libnet - libnfnetlink - net-snmp - ntp -
> ntp-ssl - openvpn - ptpd - rp-pppoe - samba - strongswan - talloc -
> tcpdump - vsftpd
> 
> That's a lot of stuff, are you going to organize it somehow?
> 
> The plan is that we will have subdirectories for logical groups of 
> recipes in much the same way meta-oe is organized today.  Groupings
> I would propose right now would be:
> 
> - recipes-daemons - containing stuff like atftp, dnsmasq, racoon2,
> radvd, etc. - recipes-protocols - containing stuff like quagga,
> openldap, xl2tpd, maybe iscsi if it appears, etc. -
> recipes-support - containing the rest, aoetools, bridge-utils,
> traceroute, etc.
> 
> This is definitely the least-clear part of our plan so far and
> would need the most feedback and fine-tuning, I expect.
> 
> Why move anything from meta-oe?
> 
> "Networking" covers such a broad area and touches so much that it 
> really seems like 'meta-networking' should be a home for all of
> the embedded networking bits.  Leaving some parts in meta-oe and
> having the rest in meta-networking would ultimately seem a bit
> arbitrary.
> 
> Who is 'we'?
> 
> Wind River is volunteering to maintain the layer and any recipes
> we contribute at the outset.  For recipes imported from OE Classic
> it'd be great if the maintainers there continued ownership, but if
> that's not possible, WR will also sign up for general maintenance.
> For recipes imported from meta-oe we would hope that the current
> maintainers would continue support in meta-networking once it's
> created.  WR definitely won't be able to do this alone so we're
> hoping for help from everyone here.
> 
> When are you doing this?
> 
> I've been working on a prototype on and off for the last little bit
> but considering the scope and potential impact, it seemed best to
> open up the discussion here first and if it seemed like a generally
> desirable thing, we'd get some version of this up and available
> within a few days of consensus.
> 
> So what does everyone think?  Awesome idea?  Terrible idea?
> (Hopefully) something in between?  All feedback is welcome.
> 

I think creating a networking layer is fine idea, alongside meta-oe,
as a separate layer in meta-openembedded repo. Reshuffling recipes
from meta-oe into different layers is fine. I would like to avoid copies.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/bV9sACgkQuwUzVZGdMxSaVgCeJN3phaSkPA18pJkb4mtjq2i5
BzQAnRK05weQOYDQxFc9ZqWz04MUrqB6
=8Cdm
-----END PGP SIGNATURE-----


