Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5B68E6FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 13:38:24 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n21so95108215qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 05:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Gt15nguokX20ju/YNWddTAbzQYVxPH+0c0HmttTYOz4=;
	b=H4raVgLreztuj9GLPUP8hJxXUiU6kdSMBJEFYsD+9GX/PeOpMKTiWoRthriX/co+N2
	VVIeVLOEA3pANMVxo6dzj7ySrrzk2+XdjO4j6i5jv7UWfFwtCp0e7cEIyZR420sQcrgl
	7pdQrPJ48mV/EBW/nIVjKHRtWa5pGebY4Zz7KbFFIAPLXB19ZpjaLr8wEv2fJRcBvKJw
	5+RnZJS0meWxSKX04yCYRzXwj5OPa2twVCPajIzRkhheW+fUJVsKDXWfH+aiDaTqQmZm
	AFcIb4P7NcN+OKRN8cb5+L/MUSO4Yb3VCGgxgY9VL5f00dntZ3qE1vCAM/eaCPAfplX0
	ywEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Gt15nguokX20ju/YNWddTAbzQYVxPH+0c0HmttTYOz4=;
	b=l1mrxwf4aIRrEcthXdaCX/TUZSzex0nnoX9O6W2lRof/8GyyRQKp9j233XoHdbMwSQ
	9RY5/natSCtA31MKuzOLI+wuFnVDT10Jbg6gcmxnv2y9+cyvOaJyQR4SHdoJtkVzA+Mj
	98WBd+Q6Rj582P8x/rjA1ZAREyutw61JocP7XDzbFNW3fySYUwepAHjwYiV8+4NfRI0u
	SoLSVDG6WDnMU3Z1B/kJskysVfvc3NdUQeDVbKPaRiYeEqanb2BpWkj2gcUzYjo13M6c
	0dC/YqlIbOJPtMAjP1LOwpf3H5Rwzx2oZcHsibpuXR0NUi6P91e6/f4kCZFlhmozZlJe
	qMTQ==
X-Gm-Message-State: ABUngveeGgsuBPLf3byKfgNTIy9GsaQfK6ORHgwTUYqwah8b/pcUsthJel8oeMMvkKX8y9DKc4XqVJ4JJ7VoQIC2
X-Received: by 10.55.31.157 with SMTP id n29mr16265685qkh.221.1479130706358;
	Mon, 14 Nov 2016 05:38:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 14 Nov 2016 05:38:05 -0800 (PST)
In-Reply-To: <1479130386.8647.5.camel@ts.fujitsu.com>
References: <1479119619.8647.1.camel@ts.fujitsu.com>
	<CAJTo0LZ68DbpCMpHy=5AKuxsHNCjzw2vJMJBd1WC27VTga=fqg@mail.gmail.com>
	<1479130386.8647.5.camel@ts.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Nov 2016 13:38:05 +0000
Message-ID: <CAJTo0LZ=YZ0pY_pzwB-MGrD6oSsgs-a7Su0MnzL8O9PCP9Lumg@mail.gmail.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libdbus-c++
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
X-List-Received-Date: Mon, 14 Nov 2016 13:38:25 -0000
Content-Type: multipart/alternative; boundary=001a1147f2285446d5054142f4b5

--001a1147f2285446d5054142f4b5
Content-Type: text/plain; charset=UTF-8

On 14 November 2016 at 13:33, thilo.cestonaro@ts.fujitsu.com <
thilo.cestonaro@ts.fujitsu.com> wrote:

> Yeah I propably can and will be if I need to write my own. But the funny
> thing is, that there ones was a meta-oe dbus-c++ recipe and this was
> removed with the comment, that it didn't work and it's
> better to use the one from oe-core :)
> http://lists.openembedded.org/pipermail/openembedded-devel/
> 2011-August/079834.html
>
> So I just wanted to make sure, that none exists.
>

That's strange, I can't find any dbus-c++ in oe-core's history.  Maybe the
submitter was referring to plain libdbus or something else?

Ross

--001a1147f2285446d5054142f4b5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2016 at 13:33, <a href=3D"mailto:thilo.cestonaro@ts.fujitsu.=
com">thilo.cestonaro@ts.fujitsu.com</a> <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:thilo.cestonaro@ts.fujitsu.com" target=3D"_blank">thilo.cestonaro@ts.f=
ujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2zg" class=3D"a3s aXjCH m158630b4f8ed16c3">Yeah I propably can and wil=
l be if I need to write my own. But the funny thing is, that there ones was=
 a meta-oe dbus-c++ recipe and this was removed with the comment, that it d=
idn&#39;t work and it&#39;s<br>
better to use the one from oe-core :)<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-devel/2011-=
August/079834.html" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/<wbr>pipermail/openembedded-devel/<wbr>2011-August/079834.html<=
/a><br>
<br>
So I just wanted to make sure, that none exists.<br></div></blockquote></di=
v><br>That&#39;s strange, I can&#39;t find any dbus-c++ in oe-core&#39;s hi=
story.=C2=A0 Maybe the submitter was referring to plain libdbus or somethin=
g else?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a1147f2285446d5054142f4b5--
