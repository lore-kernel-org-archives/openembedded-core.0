Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8E2C83F21
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 14:14:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.9524.1752588871560518110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 07:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Yrye8t5W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF6FF43987;
	Tue, 15 Jul 2025 14:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752588868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUDcAmlhAfOW6VPFh1aqSel4wrHxxyXQlxKMT3NK8CM=;
	b=Yrye8t5W8zfoly8kvJeuoZbxQdC4iVvu8Z4Z31PW9vMODk/rp6JNskxTd3Eeb+t/0ugotc
	yBLUzZeh/Ec0qQuWdDi0TQC2k2T5Hdbg/C6U7X9ZYJ88oc4ETU+KsFpiLmturogdrUZAQJ
	7Nk6EmN2EfKiofjOR9QKrpRqBsKVGs++cmceTLWK6FMLCH7KtStEZwzwAIToberBp28oaQ
	Ci/tVXQONT+afloySgE1ne7VQj8ERU2whAJNWnPw+9JbQUa4iWE2WZ82/jB4U+lDYedlwm
	sqdPYTRZanhEsjC90/OYZ8cBx3tg3Zd3DlOA2PyNfQQRvw6+5hfvltsgafud+w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Jul 2025 16:14:27 +0200
Message-Id: <DBCOWIPUT0N8.ZG0EWT6KR0Y@bootlin.com>
Subject: Re: [OE-core] [PATCH 06/19] hwlatdetect: upgrade 2.8 -> 2.9
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250715080819.622-1-wangmy@fujitsu.com>
 <20250715080819.622-6-wangmy@fujitsu.com>
In-Reply-To: <20250715080819.622-6-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehhedtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfedukeejieelhfduiefhhfefheegueduvdelteevgedvlefhledvtefhtefgleehnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpkhgvrhhnvghlrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpt
 hhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220297

On Tue Jul 15, 2025 at 10:08 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-rt/rt-tests/rt-tests.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-t=
ests/rt-tests.inc
> index a2e8558c4c..2042768d5a 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> @@ -1,6 +1,6 @@
> -SRCREV =3D "f5b910a90b6f5ab0ef6df392e009ffe1429d53af"
> -PV =3D "2.8"
> +SRCREV =3D "9166c3f0bb9c5d3e31dc80aff165a5073b5ac5be"
> +PV =3D "2.9"
>  PE =3D "1"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;br=
anch=3Dmain;protocol=3Dhttps"
> +SRC_URI =3D "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;br=
anch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}"
> =20

Hi Wang,

Thanks for the recipe update.

It looks like there is some issue when applying the
0001-sched_attr-Do-not-define-for-glibc-2.41.patch patch after this
update:

ERROR: lib32-rt-tests-1_2.9-r0 do_patch: Applying patch '0001-sched_attr-Do=
-not-define-for-glibc-2.41.patch' on target directory '/srv/pokybuild/yocto=
-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-rt-t=
ests/2.9/sources/rt-tests-2.9'
...
Hunk #1 FAILED at 42.
Hunk #2 succeeded at 72 with fuzz 2 (offset 4 lines).
1 out of 2 hunks FAILED -- rejects in file src/include/rt-sched.h

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2025

Can you fix this build issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


