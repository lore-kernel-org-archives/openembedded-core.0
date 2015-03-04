Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1933560144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 20:35:42 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id w8so35553089qac.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2015 12:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hdNijWzXil5/1X1H+J79Wk/WspredbuSwkl8/yEK0OM=;
	b=FT/Y2Ih346AFcwmVoicSNnsVsFaRO274vtLPmeI/9z2w31Gh2G0WpZRop94wvbM72Q
	0GKfwgbSYy03c07CL5YqARadYjUpiDopUTvSCdCO/8syWoNZuhgmX7kJI6x3sI3Kdvka
	A3mdm0ah1+/cEMp/P8Aa97p6UmT2SPXTZsXApRcfzWPE8C+1YKclPz+Llw2+4QNIVEUF
	2zWTAtCgUV3ffBERiSzTietwxFfMbZIklzyvxdovir0gtiqO1lZVzTYZkpWlEOyTw0xt
	OLcid3jh/4rF7zlltTscQhyONkVrCeCPWbREmxIXSPF/4bu+IMciUQLe374OlYBYfY5N
	5+ZA==
X-Gm-Message-State: ALoCoQl2+3vPqzobYirNGLU3YvUeu9AG66JJhNYQZ45aTNAnHwU0pfuYOV2ohB7MppvCS+UANb3H
X-Received: by 10.140.232.3 with SMTP id d3mr8446209qhc.82.1425501343900; Wed,
	04 Mar 2015 12:35:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 4 Mar 2015 12:35:23 -0800 (PST)
In-Reply-To: <CAFoFrHa7TdpNSo25q21BO+SOtaqVkJw26Vz3dK+ntGAtKkMd=g@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-5-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcS_ZWC38KgLUQceEL6hWt2jz0JE8W09Sjku8zCV5QJJng@mail.gmail.com>
	<CAFoFrHa7TdpNSo25q21BO+SOtaqVkJw26Vz3dK+ntGAtKkMd=g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Mar 2015 20:35:23 +0000
Message-ID: <CAJTo0Lbsd6zB4xMo7gpdNREsoVjVhpQn9-O7YWJU95YY3ageBw@mail.gmail.com>
To: Naresh Bhat <naresh.bhat@linaro.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 4/4] grub: Update grub git recipe
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
X-List-Received-Date: Wed, 04 Mar 2015 20:35:45 -0000
Content-Type: multipart/alternative; boundary=001a11c128b03b183305107c6546

--001a11c128b03b183305107c6546
Content-Type: text/plain; charset=UTF-8

On 4 March 2015 at 07:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:

> As far as I understand, when autotools is inherited, it jumps to ${B}
> to build, and B is assigned with ${WORKDIR}/build
>

Thats right, but if the recipe fails to work with B!=S then please inherit
autotools-brokensep instead of autotools, so broken recipes are clearly
marked as such.  B!=S makes builds far more reliable so fixing the
recipe/upstream to work with that is preferable to simply using
autotools-brokensep.

Also we're feature frozen now, so merging of these patches will have to
wait for the 1.9 cycle to open.

Ross

--001a11c128b03b183305107c6546
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2015 at 07:46, Naresh Bhat <span dir=3D"ltr">&lt;<a href=3D"mail=
to:naresh.bhat@linaro.org" target=3D"_blank">naresh.bhat@linaro.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1bb" class=3D"=
a3s" style=3D"overflow:hidden">As far as I understand, when autotools is in=
herited, it jumps to ${B}<br>
to build, and B is assigned with ${WORKDIR}/build</div></blockquote></div><=
br>Thats right, but if the recipe fails to work with B!=3DS then please inh=
erit autotools-brokensep instead of autotools, so broken recipes are clearl=
y marked as such.=C2=A0 B!=3DS makes builds far more reliable so fixing the=
 recipe/upstream to work with that is preferable to simply using autotools-=
brokensep.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Also we&#39;re feature frozen now, so merging of these patches will ha=
ve to wait for the 1.9 cycle to open.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a11c128b03b183305107c6546--
