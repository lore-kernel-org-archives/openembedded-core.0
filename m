Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id B722465CED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 20:09:34 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id z60so3339683qgd.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 13:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=agw0V5IVGhE4Xyo7odBpAxhjtGd0HP0gQCCbd4BX/Xs=;
	b=IgFjH1eolPACTGBcMNWzxdeK5VYx2O61aMjktkFJK7NFRIcnIrkZVccUGmByL8XSoF
	SjzESJfJVqDSh/mvpFYuVvetMfhjHQFY8ZGaDhHgVrG+VQR7Lt6IgOVklExRoDk9B3VZ
	w0Ksuwkf5lf864A3ZAgEVDwKAlTXa6/b7AcguooCQ0DoFq2RFfWPcE31w2aif8QWv+GQ
	5iHMiFDI9u72r86DDmo8qbh2r9oPMddHfsnuzjIckfpc+pD26ZlqMhRMcxZtUm23b4DN
	okMsuK85fLn9F8I5Q1c6gg14sp9VMAUrLxAkMmCgOjJhcRZB8Jok5HpAcMh186aFVJoE
	Cf0g==
X-Gm-Message-State: ALoCoQnjDphOwZE2BdBVMHWQ3O9GgcAgHng7cl4ty+L4imA34fOeu02iHieIZ5yUClOOuu4Z9FYY
X-Received: by 10.140.109.244 with SMTP id l107mr37567615qgf.80.1414786174265; 
	Fri, 31 Oct 2014 13:09:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 31 Oct 2014 13:09:14 -0700 (PDT)
In-Reply-To: <CAGNsrLDxfpu=X1k7CLREuQCe64z7UDhzQbt1S9rLvm4W5WogTg@mail.gmail.com>
References: <1414571901-17418-1-git-send-email-fathi.boudra@linaro.org>
	<CAJTo0LY+r2qFgFmOmEXda1brymM8wpAfYFywsDAfWNtuedC+Ng@mail.gmail.com>
	<1414753109.7649.91.camel@ted>
	<CAGNsrLDxfpu=X1k7CLREuQCe64z7UDhzQbt1S9rLvm4W5WogTg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Oct 2014 20:09:14 +0000
Message-ID: <CAJTo0LaWb6ck-KYn8N-AG47xAHNEB2QP-AjXiB+nuWYqjFewgg@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: update to 20140828 release
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
X-List-Received-Date: Fri, 31 Oct 2014 20:09:40 -0000
Content-Type: multipart/alternative; boundary=001a113b7e5059c2620506bd93e3

--001a113b7e5059c2620506bd93e3
Content-Type: text/plain; charset=UTF-8

On 31 October 2014 12:46, Fathi Boudra <fathi.boudra@linaro.org> wrote:

> fwiw, it has been built and tested on armv7 and armv8 architectures, both
> successfully.
> Now I'm lokking why this issue is triggered on x86:
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/minnow/build/build/tmp/sysroots/minnow/usr/include/tirpc/rpc/rpc.h:74:61: fatal error: rpc/rpcb_clnt.h: No such file or directory
>
>
Have a failure on ARM then:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/85/steps/BuildImages/logs/stdio

Presumably you didn't do a build from a clean tmp, whereas the autobuilder
always does.  It's amazing how many missing build dependencies this picks
up, which is precisely why the autobuilder does it.

Ross

--001a113b7e5059c2620506bd93e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 October 2014 12:46, Fathi Boudra <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.org</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div>fwiw, it has been built and test=
ed on armv7 and armv8 architectures, both successfully.<br></div><div>Now I=
&#39;m lokking why this issue is triggered on x86:</div><div><pre style=3D"=
font-family:&#39;Courier New&#39;,courier,monotype,monospace;color:rgb(0,0,=
0);font-size:medium"><span>/home/pokybuild/yocto-autobuilder/yocto-worker/m=
innow/build/build/tmp/sysroots/minnow/usr/include/tirpc/rpc/rpc.h:74:61: fa=
tal error: rpc/rpcb_clnt.h: No such file or directory</span></pre></div></b=
lockquote></div><div class=3D"gmail_extra"><br></div>Have a failure on ARM =
then:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-arm/b=
uilds/85/steps/BuildImages/logs/stdio">https://autobuilder.yoctoproject.org=
/main/builders/nightly-arm/builds/85/steps/BuildImages/logs/stdio</a></div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Presumably =
you didn&#39;t do a build from a clean tmp, whereas the autobuilder always =
does.=C2=A0 It&#39;s amazing how many missing build dependencies this picks=
 up, which is precisely why the autobuilder does it.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113b7e5059c2620506bd93e3--
