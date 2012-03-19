Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9bOI-0006VN-Ns
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 13:08:46 +0100
Received: by wera1 with SMTP id a1so5808575wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 04:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ToYGdNEJ5P9zsTqmXHQCVNTw6DYFEzm3L7lanhF+fi8=;
	b=N66f6kcWsVsvyWsroYmD2GgL4jKbdCHrpyZ7HCAjz2vxsU4cBHuQ7Rwow+ZNn7D2xr
	/75SBYJ2PhsA/EvOtMkRiqmpjhFkqPPnOKBdwOvo4FYB4++Ez8dhtwCDNa9kreHy3N6v
	oWUKOYWLzcaqJpax2Vt+5wG9ygu6tKTM3/f4/pHQxCeoHKcUfr5YCV1mVe+wkrT7nLB0
	I0HChQo7plq8+hTIKALgikMnlJMwKmbVZKdRda4F3IcB/m38yn36EbYpLJJg9M08tptt
	ABdPeU9TuuPM34oRw0ubplJQ1OrXopWihttpqicm2JMN7YUSnY90WNI7Qm/ZosSF3hrO
	zvqA==
Received: by 10.180.95.1 with SMTP id dg1mr19239191wib.21.1332158395682;
	Mon, 19 Mar 2012 04:59:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm11710351wib.8.2012.03.19.04.59.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 04:59:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120319115236.GA1947@mcrowe.com>
Date: Mon, 19 Mar 2012 12:59:53 +0100
Message-Id: <511DBFC2-F4AF-4C39-91D2-F59F686F21F5@dominion.thruhere.net>
References: <1331915573-28368-1-git-send-email-mac@mcrowe.com>
	<BE489DAB-2E22-4B8F-A565-10C5DF842857@dominion.thruhere.net>
	<20120319115236.GA1947@mcrowe.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkbn5TPB7FY3+EABDXA7vCoKoFfGRXoznZpMrlr0xP5GiXC396WhgWpTE1U94hiQJMWvtAk
Subject: Re: [PATCH] libc-common: Apply Debian-naming to libc debug symbols too
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
X-List-Received-Date: Mon, 19 Mar 2012 12:08:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 mrt. 2012, om 12:52 heeft Mike Crowe het volgende geschreven:

> Op 16 mrt. 2012, om 17:32 heeft Mike Crowe het volgende geschreven:
>>> The magic in rootfs_ipk.bbclass expects to generate debug package
>>> names by just appending '-dbg'.
>=20
> It turns out that the above was a local change so that statement was
> incorrect. Nevertheless the change probably makes sense anyway.
>=20
>>>                                This breaks for eglibc because whilst
>>> the binary package has been renamed to libc6 the debug package is
>>> still called libc-dbg. This patch ensures that the debug package is
>>> renamed too.
>>> ---
>>> meta/classes/libc-common.bbclass |    1 +
>>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>>=20
>>> diff --git a/meta/classes/libc-common.bbclass =
b/meta/classes/libc-common.bbclass
>>> index 962f205..d0c1ab4 100644
>>> --- a/meta/classes/libc-common.bbclass
>>> +++ b/meta/classes/libc-common.bbclass
>>> @@ -27,4 +27,5 @@ python populate_packages_prepend () {
>>> 		bpn =3D d.getVar('BPN', True)
>>> 		d.setVar('PKG_'+bpn, 'libc6')
>>> 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
>>> +		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
>>> }
>=20
> On Fri, Mar 16, 2012 at 08:39:00PM +0100, Koen Kooi wrote:
>> Missing PR bump
>=20
> On eglibc?

On everything that uses that class.

>=20
>>                and broken upgrade path.
>=20
> I'm having trouble coming up with a way to solve that. I think the
> libc6-dbg package needs to RPROVIDE, RREPLACE and RCONFLICT with
> libc-dbg but if I add the following:
>=20
>  d.setVar('RPROVIDES_' + bpn + '-dbg', bpn + '-dbg')
>  d.setVar('RCONFLICTS_' + bpn + '-dbg', bpn + '-dbg')
>  d.setVar('RREPLACES_' + bpn + '-dbg', bpn + '-dbg')

Does d.setVar('RREPLACES_' + bpn + '-dbg', 'libc-dbg') work?

regards,

Koen

>=20
> Then the package names undergo translation and I get:
>=20
>  Provides: libc6-dbg
>  Replaces: libc6-dbg
>  Conflicts: libc6-dbg
>=20
> Which is clearly wrong. :(
>=20
> How would you recommend I provide backward compatibility for this
> change (assuming it is still seen as desirable?)
>=20
> Thanks for your comments.
>=20
> Mike.
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



