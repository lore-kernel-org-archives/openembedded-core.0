Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E92D06FF69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 13:18:38 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p65so189656300wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Ri6d9XhcxEmXLR6HN5M01i9LF3CfOkMC3g31XcdC4+g=;
	b=Zms5UEK4ztxDTXP8Wf3nwWxIUMOv0w2R0v0N0/5gCIdo4y0r3oGTbIwXHVK9i7Y73/
	0gWOvjcOzY4jIDHmCTRtLPhqOBDjNQE+5EqqS7lDiKH5/dUXtJ3Y7R1vrPIVTlAozPfv
	dzV3MkklEQ0BU8dOn6GlTamQmjR8Qb9pLrkjleSD9KjHYxNIAUz25Rz0BB/vuEuR5TAq
	N0lH/H86V30bbL8AiT2atCnpVD4goSSkrlczaHSJpvxhnAm5xCRuiod1/lT46CPLQAgk
	ASgnFfKwW7IREZm3wdyuZDBAV4NV+fyXcXA+J95d/0eVYpzkd2nwgd/akQyRcpnEk4Fd
	SZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Ri6d9XhcxEmXLR6HN5M01i9LF3CfOkMC3g31XcdC4+g=;
	b=Pe4MR1GQ0EM6CHBIACjB4iKilyKvmkyXHw7Vidsjt3QS/X79k0SLABr7Z4M84vbMeX
	IOimfhvWjvCbNLW/kKEDI7Q09/rJOUGtRo58StVNtOSsqon56YyaAgJHnq29lEJhsOvX
	LjwqXAvpzDnQ9QMvzNjlh2BcxDCTFGXRmDWZ91yuQceb3/R1CJNay9ZS81JE6axiqJKm
	3pHO+o7vcr+G8u5X7PRghsl0To72KX/y4TBNybO7rYWamKU2FcfO11KS1DcTHPjYGRi4
	Sjg+brsfZYrqgll8px3BH0s2WRwD6J9xkwfig1faKLD85aPXIPJWqS3PPu9MQ/OEHKG8
	uHzQ==
X-Gm-Message-State: AD7BkJJ7EjVKWWctnIJ9KXjRsROnHrjVhU+YM7pa4fpFlv+PIRh0mB8Lj27c35k85yR0TQ==
X-Received: by 10.194.216.40 with SMTP id on8mr4210578wjc.40.1458134318665;
	Wed, 16 Mar 2016 06:18:38 -0700 (PDT)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	vw2sm3020136wjc.43.2016.03.16.06.18.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 06:18:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1458130840.2038.23.camel@pbcl.net>
Date: Wed, 16 Mar 2016 14:18:36 +0100
Message-Id: <3CD796C7-081D-4A3E-A529-14C47561239E@gmail.com>
References: <E262EC7C-008A-421F-894E-40BED850BDEB@gmail.com>
	<1458130840.2038.23.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3112)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND 1/4] ARM: handle missing thumb suffix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2016 13:18:42 -0000
X-Groupsio-MsgNum: 79692
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A34166D0-B279-489B-8DDA-A1021D5CE01D";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_A34166D0-B279-489B-8DDA-A1021D5CE01D
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> Am 16.03.2016 um 13:20 schrieb Phil Blundell <pb@pbcl.net>:
> 
> On Wed, 2016-03-16 at 10:34 +0100, Jens Rehsack wrote:
>> When enabling tune for arm926ejs, poky optionally appends suffixes for
>> thumb and dsp support. Since sometimes arm926ejse (ARM code) and sometime
>> arm926ejste (thumb code) is used in PACKAGE_ARCH, allow both.
> 
> Personally I think this is a further argument for fixing the tune files
> to simply not append these suffixes rather than doubling up the allowed
> architectures everywhere.  See previous discussion on the oe-core list.

Yes, you're invited to send patches. Meanwhile - why does it bother you
a platform (kirkwood) doesn't has build errors anymore by applying that
patch?

> Also, just on a matter of style, if you are submitting a patch to
> oe-core then the description probably oughtn't to refer to things that
> "Poky" does.

Again: Please send me an updated commit message. I tried my best in
digging down where and what is appended to dozen of flags resulting
in proper or weird build behavior.

"All that smells" makes you look wise - but doesn't help in particular
projects :)

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_A34166D0-B279-489B-8DDA-A1021D5CE01D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW6V0tAAoJEESZlq7c5QqdTIMP/2XMml2deqgqI9LpjPbmLwSq
tPfx44cV4VKg7XG32dWvDnA4u/N+DJqUA03lw42LMpQ+r5zxrHna7m3ywpJm/8UO
4r1+isa9xZyESBgm2LmHDKxTgoQ4D8uVv9Jg9ZPW3SZCsqTNCdkzv1vB1wDMcFGl
DaU58LuTjbMPx3XONVLZ+QXhA8w3hT3GfQQ+J/ylXwECBwUr2IEtx7pnSMJ5lleF
YEZKZ1+clhIIvshjWrDxUVifl4HNPjTMfOEsox96DV5II3MfGqCkBtdK9u+aNy7G
Hopv9htCTCBkncASf/EII9iqKWyJy7o+P4Lx5+oGQjUkDTaDtOnMSRC6ie0Cr6wG
0sHPmdd/2uHpg53egNGTK6CeymBnp+s2gk5NvxAqNJFZT0iBJOmtJXocpu9tcKu8
/a8tWilQBUK7r/CZfwQyrMgOd2BSyO8S5bVG7oTOWupCBLPF6EfFuRVQlSXmNbXe
APX6/9mlwXY5qhT1sNZ1gwoUId/HHAQ56zmgQy7iL4yHomxF3ZI1Kvu3zdrYZLNM
u4H3EMSEfsF/4rnlnhNTeD5eS6JCGvUBRTvbdLt3oH8fYpGsBg9B3WFEqM2C7HOz
Ccw4rmbLwKXcZAUsU3xiGlB1xVE+qr5xcUVvVGDSad4PtIhKKElXRSCoOy/SsKVV
NG/gzRXGpFXSsGGwZaJt
=xhV5
-----END PGP SIGNATURE-----

--Apple-Mail=_A34166D0-B279-489B-8DDA-A1021D5CE01D--
