Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id E736A731D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 14:26:18 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id m186so27261637ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G6tGT8z/BPIzanlA+uqJma4u5WmdZiugyO+942cGSXs=;
	b=waRlqjjkMzMdEMz+fB8KeE90AzMSBsIMV7pZnW1f7VJk+sj6WNjQ+HcYyJRahSHkD4
	gWrWNP40D9YoXoBzNsP12swwXyQZlun8ckDUoQLd4ngtm/OZj/ZrUmsCGoDJjQMglJdK
	ZEjIEBc1O9bNKQAq+FOa7EXGBh3bbBL8rzGvpD8ESoXHMU28s+mJJRUfHy4qymJH6EB7
	c/R4v+25u6UU09nt/G/RH+U4mDzJAZkwGMIKb6JCW+0H3eiqThl2H60V5lWQ6k78Bx31
	9ox6P/eP8gAeyOSSLCFFm9gUvFgI/khDt4+pHv4tZA43hhSd28VQqTGD2nClynyGQhLv
	T5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G6tGT8z/BPIzanlA+uqJma4u5WmdZiugyO+942cGSXs=;
	b=P9ggkd4X4dNhpQ38ud1Z4w8W8EJftHxXsdre9Qb7dPyxmcuJXI8XOQVgUfg0ntrc9c
	UhA1CYgiJ2IqrMvxts/xc3A9lE+7amteZkgqvrW/wNogwh28WMddA+bUBWOCr3+9sJ31
	wMecu0mAGNPWs1LEGQDpllGA2HA/eQYTFkWvLeEbwyfUEbKEpNzcyvzVOi5DzwdD7QaR
	Wm8OeW5z7jnf/fpBkD4S8a/6hK8KMOCBi42AL60F86no0bSuFYjkPWyoEArQWI9hI3rb
	DOW8i9qpt5fLhUSQP9TwjM/Q8/JinLTcu7E4p3/JUEY4Kj6znbU+vNhe224nnxUWkndp
	kJcg==
X-Gm-Message-State: AE9vXwNiPEHfKHt4mEsa0ryp01f+naCQw60inxk1WPIGx3xi385iEH7fh9lZJaIvMdT66A593QtFtvkp/NSjrt5A
X-Received: by 10.107.199.195 with SMTP id x186mr25824368iof.88.1474035979042; 
	Fri, 16 Sep 2016 07:26:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Fri, 16 Sep 2016 07:25:58 -0700 (PDT)
In-Reply-To: <20160914050848.14612-1-jackie.huang@windriver.com>
References: <20160914050848.14612-1-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Sep 2016 15:25:58 +0100
Message-ID: <CAJTo0LZ6dn5LyMV34-UrJ75bz-gvqGGWaGWEcCkGpXBc_ty9hw@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: add support for additional boost libs
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
X-List-Received-Date: Fri, 16 Sep 2016 14:26:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c11be4eeaf6db053ca0bee7

--94eb2c11be4eeaf6db053ca0bee7
Content-Type: text/plain; charset=UTF-8

On 14 September 2016 at 06:08, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> * Added libs:
>   - container
>   - context
>   - coroutine
>   - exception
>   - graph_parallel
>   - locale
>   - math
>   - mpi
>   - wave
>
> * Add PACKAGECONFIG to add proper dependencies for boost-locale
>
> * context and coroutine are added only for x86 and powerpc
>

This patch appears to be periodically breaking boost in the autobuilder
runs.

| libs/math/build/../src/tr1/asinhf.cpp:6:21: error: while reading
precompiled header: No such file or directory

See http://autobuilder.yocto.io:8010/builders/nightly-x86-64-lsb/builds/56/
for the full logs.  A build earlier also ended with GCC internal errors,
but these may be related.

Ross

--94eb2c11be4eeaf6db053ca0bee7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 September 2016 at 06:08,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jac=
kie.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div id=3D"gmail-:18m" class=3D"gmail-=
a3s gmail-aXjCH gmail-m157272899329453d">From: Jackie Huang &lt;<a href=3D"=
mailto:jackie.huang@windriver.com">jackie.huang@windriver.com</a>&gt;<br>
<br>
* Added libs:<br>
=C2=A0 - container<br>
=C2=A0 - context<br>
=C2=A0 - coroutine<br>
=C2=A0 - exception<br>
=C2=A0 - graph_parallel<br>
=C2=A0 - locale<br>
=C2=A0 - math<br>
=C2=A0 - mpi<br>
=C2=A0 - wave<br>
<br>
* Add PACKAGECONFIG to add proper dependencies for <span class=3D"gmail-il"=
>boost</span>-locale<br>
<br>
* context and coroutine are added only for x86 and powerpc<br></div></block=
quote></div><br>This patch appears to be periodically breaking boost in the=
 autobuilder runs.</div><br>| libs/math/build/../src/tr1/asinhf.cpp:6:21: e=
rror: while reading precompiled header: No such file or directory<br><br><d=
iv class=3D"gmail_extra">See <a href=3D"http://autobuilder.yocto.io:8010/bu=
ilders/nightly-x86-64-lsb/builds/56/">http://autobuilder.yocto.io:8010/buil=
ders/nightly-x86-64-lsb/builds/56/</a> for the full logs.=C2=A0 A build ear=
lier also ended with GCC internal errors, but these may be related.<br></di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--94eb2c11be4eeaf6db053ca0bee7--
