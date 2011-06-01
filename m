Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QRjge-0001pk-6E
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 13:34:08 +0200
Received: by pvc30 with SMTP id 30so2622585pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=lhUq51dpGktDlfeCmWgdv6cR0eOTjFSidcIcKGZK1kA=;
	b=EchZa/KaawNCU357lzSSMXcXMQTTPpVvCEqaYjTmX4+2ym0vnSaRYNN8CmRPHDOJFB
	mx8T4f3Rf2Ur+W9wQxgxq7dsl2D8KK7ZeZaIUUFx5PINzXx3D246sWezQSlYsYxq6Mcc
	7+K1/rVNOess4KDW8JB2Xb4moUmx0s6qFvFJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ArGBm6pc5XygiYB/E0bdZZ3Ce8a5hOJbvcoVfhVq2S2GZSRSJ7pLxrGilTj/L3Bxf8
	a0mGrsPqQ6nRs8uvFjEymSUPwMteYCaqbnt9h0UwJBI8eQNYOO+fObRq/9ZxTyfc43AT
	l+NujcbpnG0xsWKgmt011gl0RSGl+OVP3ZrgA=
MIME-Version: 1.0
Received: by 10.142.63.6 with SMTP id l6mr1116774wfa.178.1306927852432; Wed,
	01 Jun 2011 04:30:52 -0700 (PDT)
Received: by 10.142.140.9 with HTTP; Wed, 1 Jun 2011 04:30:52 -0700 (PDT)
In-Reply-To: <BANLkTimJaw7oHSZws2JDY=PtjgpYd6YcuQ@mail.gmail.com>
References: <BANLkTimJaw7oHSZws2JDY=PtjgpYd6YcuQ@mail.gmail.com>
Date: Wed, 1 Jun 2011 13:30:52 +0200
Message-ID: <BANLkTik53-52ZgiXAaYWsD82c9wfi6VUGQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org, dongxiao.xu@intel.com
Subject: Re: [FIX] update mtd-utils to 1.4.4
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
X-List-Received-Date: Wed, 01 Jun 2011 11:34:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 22, 2011 at 10:44 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Hello,
>
> mtd-utils_1.4.1 is broken, in fact whole 1.4.X serie was plagued by
> mtd alignment bug until 1.4.4.
>
> See: http://lists.infradead.org/pipermail/linux-mtd/2011-April/034599.html
>
> Updated in oe-dev with commit f8e1b7793ff5b02fd27ce886b34a57c6c2358239.
>
> Regards
>
> Andrea
>

BUMP

I'll add that the recipe in oe-classic has a different, more grained, packaging

PACKAGES =+ "mkfs-jffs2 mkfs-ubifs"
FILES_mkfs-jffs2 = "${sbindir}/mkfs.jffs2"
FILES_mkfs-ubifs = "${sbindir}/mkfs.ubifs"

Please pick it in oe-core, thx

Andrea


