Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 05A7B6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 16:16:36 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id l6so13095521qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 08:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WdW3UbnjtXZ7DFzqENtWbQADm5Bh37pGd4YCBTqg/eM=;
	b=JAuJM+twyn+IF0fj49cbOsLOAJOvUWg8tSxIwj6bO5UGIV2Mfr/cnUajBps9wZcH4n
	5uMcd88+NuWUFwUpabaw95BHPO9W3koOC+uIbg4KcvGGFFZ1DeX6XLHmDw+lQgmrm38i
	42N30aV/O8+29m/MnOlwXL2sN5ppBD15iwhPHERmQz6le4HQkRO9RJJyEyoAf1g8eF90
	1EARqRWnVziB71FKLOiHjfKiD6u0ZE58/5ef6dmJ+f5DB/8WZf9IdFreNUlvrl+mXuXo
	tRj5097CDDyI0yS4oXcFt7JFbQuzBubSUtXf0j/2KvlMm+f2xbfuKhVeA5Tq21Rt4VyJ
	JHNw==
X-Gm-Message-State: ALoCoQmcsaeOaAeD45RIG0jEp06T44ZUaW/AWlBgF1YNwSpjqvjUihiG+drGNDpOvnuV4xeVf5ao
X-Received: by 10.224.23.71 with SMTP id q7mr11266052qab.22.1415981797195;
	Fri, 14 Nov 2014 08:16:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 14 Nov 2014 08:16:16 -0800 (PST)
In-Reply-To: <1414861479-5493-2-git-send-email-pab@pabigot.com>
References: <1414861479-5493-1-git-send-email-pab@pabigot.com>
	<1414861479-5493-2-git-send-email-pab@pabigot.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Nov 2014 16:16:16 +0000
Message-ID: <CAJTo0LZMvL-7bTvf_ou6PHmMpZXa81GWb3murA6t5EfceQXOow@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] pseudo: default --without-passwd-fallback
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
X-List-Received-Date: Fri, 14 Nov 2014 16:16:44 -0000
Content-Type: multipart/alternative; boundary=001a11c2315607ddb20507d3f444

--001a11c2315607ddb20507d3f444
Content-Type: text/plain; charset=UTF-8

Hi Peter,

Something in this series isn't working nicely with multilib enabled.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/pseudo is the
branch I was testing it in, hopefully I pulled in all the right pieces.

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/102
is current master building for multilib and succeeding.

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/105
is ross/pseudo which fails at rootfs time.

Will you be able to investigate this? (or tell me I merged the wrong
patches).

Ross

--001a11c2315607ddb20507d3f444
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div><br></div><div>Something in this series isn&=
#39;t working nicely with multilib enabled.</div><div><br></div><div><a hre=
f=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dross/pseudo=
">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dross/pseudo</a=
> is the branch I was testing it in, hopefully I pulled in all the right pi=
eces.<br></div><div><br></div><div><a href=3D"https://autobuilder.yoctoproj=
ect.org/main/builders/nightly-multilib/builds/102">https://autobuilder.yoct=
oproject.org/main/builders/nightly-multilib/builds/102</a> is current maste=
r building for multilib and succeeding.<br></div><div><br></div><div><a hre=
f=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bu=
ilds/105">https://autobuilder.yoctoproject.org/main/builders/nightly-multil=
ib/builds/105</a> is ross/pseudo which fails at rootfs time.<br></div><div>=
<br></div><div>Will you be able to investigate this? (or tell me I merged t=
he wrong patches).</div><div><br></div><div>Ross</div></div>

--001a11c2315607ddb20507d3f444--
