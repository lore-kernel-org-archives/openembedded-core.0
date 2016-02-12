Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 99C2D7002B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 15:34:39 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id ik10so12443829igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 07:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cUAh2UPMchXdOT3OlF+6YTWjw+G3j8faA9M36ZyOfNs=;
	b=ZQY+fBSfRKrhfTBsZ2vrxoceIQ2aTWpLMX1gkjQmqWwMSfyAAQ2RA2+mvf3j6jeyVc
	/sVRmS1mU/YZM0zFDEiJGMb7vk/D/fKg4kZYsUK13v/GPHBzybFom+E2+geaeKqndekS
	YmEV0ZVlgDLxO+yonjALtNnVW9I2x4NWWUNxxzjH9ofpuL79LssJJ7PV10W2FRJW27TB
	BuZ2bu4Yp1/LgW0zO6YIug9NIce3bt1S95DEocQjCn2ggXb7chS6uENZXluyRcBiLAAe
	L8XKA2SC4YbMM/Ujhpr4u+vdOTm33NLAXv7CoCHep6WBdFJO5cT23u5fMS13lkTj8S6r
	5tyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cUAh2UPMchXdOT3OlF+6YTWjw+G3j8faA9M36ZyOfNs=;
	b=CTCV9pSVS7NzNAQmr6ZHBPWsmNDLyW6yVGJI+7wiIhcrk6MBcUVSR8OCpeaJXGJFam
	vcS6OwnnMTue8pHdu+QStEF5paDgh6mFL3j6fqZ5X4hhilvgbv1+5B4dTcp7666yNsTH
	wp9rh7FUzXUad3clm4nOtvZsu/elmho3Q9eMkMNs5rQQJPIMIR4VmetXVHt6qVlAj/pG
	YzHfLPSJNlailG794vgiLAl2+H+Fw2ZNYii3hP9+dIH1OHf2iua1GKudgwO2pdfMCKlZ
	x0PMkNTNnDdNnyGdjRfWjPj8bRWdksoNm9j4JNS8f8jjNsKdbK1n0v7G/tlONhvtvy3u
	AfPw==
X-Gm-Message-State: AG10YOTbGfsY4n1MtgdLbaYjWtTuysAXt/4sd0yWtGwm5nvvSqKNzdWyAi9EUlv8Dj6biW9CPo6RJyjm2LrRqmz7
X-Received: by 10.50.78.227 with SMTP id e3mr4496160igx.64.1455291280378; Fri,
	12 Feb 2016 07:34:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 12 Feb 2016 07:34:20 -0800 (PST)
In-Reply-To: <1455269758-21882-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1455269758-21882-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Feb 2016 15:34:20 +0000
Message-ID: <CAJTo0LZLUjz9hdLZcpX=pnQ_PSAjoJPmCBELwjhkK9gb2V5r6g@mail.gmail.com>
To: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/prservice: Added new tc: check pr-server stop msg
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
X-List-Received-Date: Fri, 12 Feb 2016 15:34:41 -0000
Content-Type: multipart/alternative; boundary=089e0111b734cfef5d052b946717

--089e0111b734cfef5d052b946717
Content-Type: text/plain; charset=UTF-8

On 12 February 2016 at 09:35, Francisco Pedraza <
francisco.j.pedraza.gonzalez@intel.com> wrote:

> +        runCmd('bitbake-prserv --host localhost --port 8585
> --loglevel=DEBUG --start')
> +        ret = runCmd('bitbake-prserv --host localhost --port 8585
> --loglevel=DEBUG --stop')
>

Just in case someone is running multiple selftests on the same machine, can
this port number be dynamically decided instead of hardcoding?

Some more context in the log would be good, I had to read the referenced
bug and the fix to understand what was being tested here.

Ross

--089e0111b734cfef5d052b946717
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 February 2016 at 09:35, Francisco Pedraza <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:francisco.j.pedraza.gonzalez@intel.com" target=3D"_blank">fran=
cisco.j.pedraza.gonzalez@intel.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div id=3D":1oc" class=3D"a3s" style=3D"overflow:hidden">+=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 runCmd(&#39;bitbake-prserv --host localhost --p=
ort 8585 --loglevel=3DDEBUG --start&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D runCmd(&#39;bitbake-prserv --host loca=
lhost --port 8585 --loglevel=3DDEBUG --stop&#39;)</div></blockquote></div><=
br>Just in case someone is running multiple selftests on the same machine, =
can this port number be dynamically decided instead of hardcoding?</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Some more cont=
ext in the log would be good, I had to read the referenced bug and the fix =
to understand what was being tested here.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0111b734cfef5d052b946717--
