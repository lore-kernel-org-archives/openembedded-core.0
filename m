Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247C6C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 09:59:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.3570.1749117548929959485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 02:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vs2ksWbM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67F1643256;
	Thu,  5 Jun 2025 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749117547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dN95Wk0qSRYLl/fgX6oxVHiWpAt8xVBa20oolE2Mye0=;
	b=Vs2ksWbMYHKlhDZ/lTjOQIAxrYHp9psQEzJcx2hFS9VVmx8myPMuDNQ4/DbhXsqVP0J9ze
	HhZEZMw0SaHmVhYSxCeovrBk1wTLZvQ6Z2lC6qB4KoehdgEp1ZKR7JMCYYk5G1zUzbkhhF
	c5NHJ3lTCxxQNfsWQEcVqT8R2TzhE3Fi7H/0Ew8Fvnek/sDILMKOwgx3+1CX0NK26NiFJ+
	Ro4c5gqapQnm3aDwMmsHho2Xh/rxrTD4gPmeoYer+W2V2bFhCjpb0LuSPpQghL2IiNqR0q
	jH9MDFln/PaqxqdCS/9L63Hw38howvH2IqrqX8SnV07ee9No2Ctmcm4D7RQoOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 11:59:03 +0200
Message-Id: <DAEIF6QL7XAS.1NMY7JXUJYGZC@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/2] Upgrade automake and rpm
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1749092509.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1749092509.git.liezhi.yang@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefgeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegjeeutefhhffhtdekueejffefffekleeiheefgfffvdeiudffieehffeikeegueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgihhthhhusgdrtghomhdpudejrdgssgdpudekrdgssgdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehlihgviihhihdrhigrnhhgseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdro
 hhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 09:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217997

On Thu Jun 5, 2025 at 5:02 AM CEST, Robert Yang via lists.openembedded.org =
wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> The following changes since commit 2e817e6e4d53543766b935479b148a1950cc37=
c8:
>
>   oeqa/maturin/guessing-game: Bump dependencies to avoid security warning=
 (2025-06-04 08:08:28 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/robertlinux/yocto rbt/upgrade2
>   https://github.com/robertlinux/yocto/tree/rbt/upgrade2
>
> Robert Yang (2):
>   automake: 1.17 -> 1.18
>   rpm: 4.20.0 -> 4.20.1
>
>  ...report-error-when-the-path-of-Perl-c.patch | 27 +++++----
>  .../{automake_1.17.bb =3D> automake_1.18.bb}    |  2 +-
>  ...LUGINDIR-in-top-level-CMakeLists.txt.patch | 57 -------------------
>  ...lling-execute-package-scriptlets-wit.patch | 24 ++++----
>  ...ge-logging-level-around-scriptlets-t.patch | 27 +++++----
>  .../rpm/{rpm_4.20.0.bb =3D> rpm_4.20.1.bb}      |  5 +-
>  6 files changed, 47 insertions(+), 95 deletions(-)
>  rename meta/recipes-devtools/automake/{automake_1.17.bb =3D> automake_1.=
18.bb} (92%)
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDI=
R-in-top-level-CMakeLists.txt.patch
>  rename meta/recipes-devtools/rpm/{rpm_4.20.0.bb =3D> rpm_4.20.1.bb} (97%=
)

Hi Robert,

Thanks for the patches.

It looks like this is breaking several builds on the autobuilder, with
following error:

ERROR: rpm-native-1_4.20.1-r0 do_compile: Execution of '/srv/pokybuild/yoct=
o-worker/qemux86-64/build/build/tmp/work/x86_64-linux/rpm-native/4.20.1/tem=
p/run.do_compile.320418' failed with exit code 2
...
| gcc: error: unrecognized command-line option =E2=80=98-fhardened=E2=80=99

https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/1841
https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1779
https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/1680

Can you have a look at these please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


