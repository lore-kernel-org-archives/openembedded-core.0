Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id E392F731BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 09:12:56 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id gy3so9143034igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iI0F9+8xa62nkxBIGQMdhxzXLtJ3F0gXAlwdA+qOtM8=;
	b=HHluTOyX1FA1RuhE1KV+11jRNixsMRRx++qJvhyfOrv/DhSTxz9DC82cFxvoz+lyWO
	+G/OU9KaNjidSyr8oZf2phfO7mFFU9LIpRmU0UfT+yxhd9yxONjXJ8ysavpb8Dcwah8I
	hCmHbXTJzqoQnnAVMWgglnbDB962XIAh3W5xBDdm6394xkASycVXmlBvVGg97pWEkop1
	QdxGaZkj2kBrxpOL+u85JEdi699VeJMx77TjfZhd5HK+JKnlsgtJpfbSc/ZliY043dK+
	F2ykkp4V9hXTR4mFW+xC2bGDghbAxMqwbxC40G8NEO48CrhAxqfdqSHMj9osmxdL4wzu
	4+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iI0F9+8xa62nkxBIGQMdhxzXLtJ3F0gXAlwdA+qOtM8=;
	b=eN+8iyNoMns3f2jRzj5H12HuxJncmMjtDTDjP4zZpfBM9uZ9pZWySuldZQ3XDf4jak
	pipAfiI+/6BWpAT7TLyvAqZITDFidiZDDjohx4Cpfs/4EQ8vL4XHRVyoskv4xqld5TNN
	qvyZcl1EWYJL9/jZuXbqc7MhjiII1pUdmFrf/DCrcEx60ey2qlEJo7qssVMnSRWZ53US
	r02tvXC8Oq+XDSL13z/F/UADJfiFqDix9wS4QOjDg5XeQIixAvHLFviaNvbaX6gcxYdB
	PPDVuo0W3IVWR30LLjP7EHmVAk6CQNh72Gupvxwjx8fyD4lvZji/0/lGF2VH7o27YzdG
	//Xg==
X-Gm-Message-State: AD7BkJLbhO2w9HpEvdCK88VI+GYQuH99r2i8TNnPvVHw2QwsYyYs+vss79QTVVxS5yblkMK+YyGwM1bt1HRtdOo9
X-Received: by 10.50.78.8 with SMTP id x8mr2403543igw.78.1460020377135; Thu,
	07 Apr 2016 02:12:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Thu, 7 Apr 2016 02:12:37 -0700 (PDT)
In-Reply-To: <5705C7DE.2000102@windriver.com>
References: <1459891560-4178-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=XXJtGhRqvtkXp1aAHMYN8Y0VDrUJZfDhqNkodtbOXymw@mail.gmail.com>
	<CAJTo0LZSmc3+nOGn1dK9CzKqd+aAkAnFdk=tkk-gCHPqz+8NNg@mail.gmail.com>
	<5705C7DE.2000102@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Apr 2016 10:12:37 +0100
Message-ID: <CAJTo0LaGS9g=-kamcNL8Z+QcC2JkM-C-iE0BJv1H0ARoSYaprw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bzip2: set correct soname
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
X-List-Received-Date: Thu, 07 Apr 2016 09:12:58 -0000
Content-Type: multipart/alternative; boundary=089e01183a4cf2179e052fe17bc9

--089e01183a4cf2179e052fe17bc9
Content-Type: text/plain; charset=UTF-8

On 7 April 2016 at 03:37, Robert Yang <liezhi.yang@windriver.com> wrote:

> I got this error when build in an old build dir:
>
> | pbzip2: error while loading shared libraries: libbz2.so.0: cannot open
> shared object file: No such file or directory
> | WARNING: exit code 127 from a shell command.
> | ERROR: Function failed: do_image_tar (log file is located at
> /buildarea/lyang1/test_fetch/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_image_tar.33968)
> ERROR: Task 19 (/buildarea/lyang1/poky/meta/recipes-core/images/
> core-image-minimal.bb, do_image_tar) failed with exit code '1'
>
> It is OK when clean pbzip2-native and rebuild. But I wonder how can this
> happen since pbzip2-native DEPENDS on bzip2-native.
>

Can you find the cooker log for this run?  Did it rebuild pbzip2-native as
expected?

Ross

--089e01183a4cf2179e052fe17bc9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 April 2016 at 03:37, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":f3v" cla=
ss=3D"a3s" style=3D"overflow:hidden">I got this error when build in an old =
build dir:<br>
<br>
| pbzip2: error while loading shared libraries: libbz2.so.0: cannot open sh=
ared object file: No such file or directory<br>
| WARNING: exit code 127 from a shell command.<br>
| ERROR: Function failed: do_image_tar (log file is located at /buildarea/l=
yang1/test_fetch/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/t=
emp/log.do_image_tar.33968)<br>
ERROR: Task 19 (/buildarea/lyang1/poky/meta/recipes-core/images/<a href=3D"=
http://core-image-minimal.bb" rel=3D"noreferrer" target=3D"_blank">core-ima=
ge-minimal.bb</a>, do_image_tar) failed with exit code &#39;1&#39;<br>
<br>
It is OK when clean pbzip2-native and rebuild. But I wonder how can this<br=
>
happen since pbzip2-native DEPENDS on bzip2-native.</div></blockquote></div=
><br>Can you find the cooker log for this run?=C2=A0 Did it rebuild pbzip2-=
native as expected?</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--089e01183a4cf2179e052fe17bc9--
