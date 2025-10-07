Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CFECCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 14:51:44 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.20786.1759848702741098774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 07:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ehnpIjTc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E6B054E40F4A
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Oct 2025 14:51:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE2B8606C8;
	Tue,  7 Oct 2025 14:51:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28728102F2150;
	Tue,  7 Oct 2025 16:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759848700;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=yyiACdptO4pArXssXsnAiBSuw3EIc3UmtHe9dji+OkI=;
	b=ehnpIjTcqEul7ia/KA/Ca0bVKsS/0rtL12n5e6rBwrYDOxw7o/FPrXW3LUqKmVF1lHRl6D
	YFvVP3FXbu627kgO6eQnyX/7EJ7tGAW1up1ThI8vgXMhpgPIcK1Zq0ACpgJAGuXQ0XTBeD
	gyaFwoFDOlGgE+Asm7IVvG7Nldm+6wD56QTTeBsWparzK2TpE9mcfCwSeod36l+u61azW/
	O9Ak1GHPwh9ESsG5HGtTUu9xNQqSDtAVvgLWxOx7ssJlCbMheJVvl4ect8e+E072CMUp9I
	WyItiYGSRSuhFCfGhtvCrGimdObLqVacLotqD10Jl/uf8GNUFTcKNw7Onqfjvg==
Content-Type: multipart/mixed;
 boundary=a1d41c80da4d73f4ae77dcec81bcdfe0d6e50e03a37482a91b8b76a304b0
Mime-Version: 1.0
Date: Tue, 07 Oct 2025 16:51:37 +0200
Message-Id: <DDC6AQNV866W.OLD39GWU3AYP@bootlin.com>
Subject: Re: [OE-core][PATCH] linux-firmware: Move all firmware into
 sub-packages
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Ryan Eatmon" <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251006170804.9664-1-reatmon@ti.com>
 <DDBWZY3PMFQU.1HP666LHFOD0H@bootlin.com>
 <186C362D6E62D57C.5353@lists.openembedded.org>
 <d395d3a2-4467-4e62-beef-f7b5ab973e89@ti.com>
In-Reply-To: <d395d3a2-4467-4e62-beef-f7b5ab973e89@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 14:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224536

--a1d41c80da4d73f4ae77dcec81bcdfe0d6e50e03a37482a91b8b76a304b0
Content-Type: multipart/alternative;
 boundary=ce12112a6686649acadbe64d3d87dd6d8fb819866d24580c527acf7603ef

--ce12112a6686649acadbe64d3d87dd6d8fb819866d24580c527acf7603ef
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

On Tue Oct 7, 2025 at 2:54 PM CEST, Ryan Eatmon wrote:
>>=20
>> That is odd.=C2=A0 I don't get that error on my builds.=C2=A0 All of tho=
se files=20
>> should have been removed by the new REMOVE_UNLICENSED feature in the=20
>> recipe.=C2=A0 I'll take a look.
>
> I actually added some "debug" output to the do_install code.  Can you=20
> get the log.do_install file for that run?  My company's firewall setup=20
> is blocking the WebSockets stuff that the autobuilder site uses, so if=20
> it is available there I apologize.  Working with them to address it.
>

Hi Ryan,

I'm attaching the log. It contains a lot of "160: [: 1: unexpected
operator" or similar errors, so it might explain what we are seeing.

Also, if it can help you, I was able to reproduce it easily with this
tag:
https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Dautobuilder.yoctoproj=
ect.org/valkyrie/a-full-2531
Just ". oe-init-build-env" and "bitbake linux-firmware" should be
enough, no need to tweak the configuration.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--ce12112a6686649acadbe64d3d87dd6d8fb819866d24580c527acf7603ef--

--a1d41c80da4d73f4ae77dcec81bcdfe0d6e50e03a37482a91b8b76a304b0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=log.do_install.3041406.bz2
Content-Type: application/x-bzip2; name=log.do_install.3041406.bz2

QlpoOTFBWSZTWbEpkYIABcffgAAQUIf/8j+j34q////wUAYbvTrULs1KQiBQBEUam0nqbU0yBmoZ
NNGQZGTJtIZqYTHMAmmATIYAAmCYAAAMVNR6jQABoAAAAA009QAikQQ0GjQhoyJjSMI0DNIepmkB
UommphGiaJgRqbQpsp5T1G1HqDT9U09T9SbPfZCF4vIgIJBJAIBEJDedcW5zBC+5oAkp8YVaZ5FJ
brNGwQTBARCRCKYJRu3zx2FRPSqtuWO++oSrco03WyhSEaVu44MMNerCSLWAMLmzzXEx5RKc4E0q
c4A0om6jI2USy+4Ka6pgpZ/s8+KXJTZ0SoBSYA83XNBLOrp2jJvUQGkhgpzDA6hFRJ0cTYsfVMdO
59IASBjUhGgpyqsbRWjOSWa/7ylOAUhQ4ApjuAHuBTL9Lzy3nOxkCfpOr6W2fb4kjj4OJWvw/cJX
+HGvI7oRu0+R2IJ4HfFyCXGQFL4KR3QANnZw6TsifhbO1SR+fyvCPbCPeSMoR0jLKr08vy06MV/v
8MG+EUJH1JFE1vV4TnrjsU0JF60+e6uanSSNFaXr7rYuUIuxper8l9QloRWEWrTqbd+USMca+r6h
N+MI+h9wm2+EZ4opdKVBtAGU81tYKdRosiqvh7RH3AL6CQgGJxSKlSyAQrBIYgSWPqCsxiRtIV2Q
NgjtjTcr9ueeONs8s8qbq3rhoj6n2ntenFOsnzTsw+9jCp+ybvgrYrPRP7uFKMX4xv+CZb44PQ+h
fKavxTcANphCKmiv9hwH3R221gp5HXd6fnYdtGwl4xDEaexirZY+788Uu/n+vu4T5lOhp7890UEo
edHe3gpBSBErq/p+oDFR7EQADFHmXMqQwo+aJ6oJq0nK5w1blXNhpb8wVLQBwUBOm3mqE6Zt0pXC
+CIsnWE3MJiEpNKIKZQVIgAai6uUojBU1aL1GPPQ1lqCbwxsscrLIwWn81SzTkeqC3ImsnVCKQVS
AGlpaeNHNiY9ERwlRaEec8Z4BNMoRv6KZf783dmdh+gS7OEZUnDmE7kJrqLuoJeEbwlctu/E4Otv
8inOazO+sIrV26Vj1KUYRIqExrVO8jA57n+dttaNAlfLx9ndcBull4mgJB2xGInk9L8Rh0hErB01
GyaA3IDXivbAUDfDc3+tR4+jizOfDgY0V+MhElaApWOQdfjfEBucjbGe2MGWxHXoBS9xkgBt5Muo
kjQXrWIi/dS0s3Mu08SQbCZ10xnr3O/mEsSOJI/fgcSiRFsK7TWV8Kc6UIpb17l5Y2/9hY0Ka7c7
SJGpIwZR59SCeOGkiZbCtURw1h8ZTfZKGdAlYRdKqRUJUJWJH2pCRu4PX0VCUyUCdn8Qntr2kkcU
w0PkozTMeznCMjdjAT4d4KmBDQIPly6NukidKIkTWDn5iRlPdCMdIRgdnLXvJGYT2F9cGUdO+lrL
QjnvRIv3yCdttG40roz7tAlSSNy6CYVaCuEvlCLBLaUvQ7bNZ3yvleOTyCc58dpsyyzWwV2526Bg
E4q8pvSRjtirrzSjn4Ujr6V91exiwOSSN8wpehlCNoRnL8eFnF1TcmSCxI25WCeufCXhGeuKk5Rt
yvp2TK9JpeYxFSQe+dp15IjXvTdCRZn9dpyEjIJ1hOUSjL1TjNSLckE6SR4BPUJG8J/aZSSM7uW3
P2kjXZKgGoAZ3ASp79Tt/4u5IpwoSFiUyMEA
--a1d41c80da4d73f4ae77dcec81bcdfe0d6e50e03a37482a91b8b76a304b0--

