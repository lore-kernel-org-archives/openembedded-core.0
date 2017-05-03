Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 221EB60110
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 12:21:04 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id u75so12618676qka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/6DaF4IWNkmkIxlb28CujHq+kYV2H4L9Ap2XufJHSUM=;
	b=MESCQbMSft9Ejip/NjZ3j985DPxo8sSe9fZivmlseIBrKvNXKJ5IE2md2lTEBC0LJt
	eMckJK6J/v1PXMgPsGo2UvJfACFGAamai8cLngapckJZgkvVjkVk71y0nk/WR4bwMziP
	CBw822kQZh2I/RbkhP+Icq0WJ+W9ZAglVnzv6CfmqcvmvBGfYvC81peHpxlU6mnfhxaT
	ARgYZ1aDzjALsWfU/TRiA3BssJN4PvpRulSOBtllKJT208bLxLPDGppZqxNvtPn5yg2r
	s/JxDNg2M1OoSMPLMgZXVQe28o77OPpF4w0KHRjGxYQmOOhceikSi45vU+Av4VGa98s2
	iRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/6DaF4IWNkmkIxlb28CujHq+kYV2H4L9Ap2XufJHSUM=;
	b=h+b1VaNxI1IxB7GOaYIIJK02dnc21QeY73uj9I2TehfRg2g8OtP9obBL2a9vGS6tNY
	c5p+UVBbSW6gR1A+qLTJQnOylWt7JJKjIg3v7VKNrbTGUjppBeMJsl+PCjhlORO7tN1F
	hpq7WdYjPuKIIPQmEd83dgZ4EQ54WeBtdff8umUOHcSLvkjRuz8PMhqFBSWfzEu8bWzm
	qAZoS2G5+U/5hMtCpmKxhza3QqLqdB1VPx4Aq/TTtgEFU6WLDg8o9j5TEv3bVMiw06dn
	X7yrsO9zEXccpl9QbtF1z7D8chBrmUA65P3lfMpLzP0PGCZZPLctELM3dFcXVe7NqL7X
	sYmw==
X-Gm-Message-State: AODbwcBdsOqIW3L6a5p3bUPV0Hlez7JwYLT8lANwvyIXWcOsR73MC+4F
	Sn3NefQrabwPmQG/N0PMwNSJkLMP3X8z
X-Received: by 10.55.93.193 with SMTP id r184mr2439997qkb.221.1493814065707;
	Wed, 03 May 2017 05:21:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Wed, 3 May 2017 05:20:45 -0700 (PDT)
In-Reply-To: <1493813847.4241.251.camel@intel.com>
References: <aec82a5d8c1b622749a12bea2c478a8ff7f363b1.1493808889.git-series.patrick.ohly@intel.com>
	<1493810039.23535.57.camel@linuxfoundation.org>
	<1493812409.4241.247.camel@intel.com>
	<CAJTo0LaHhRHzxmUaaF8MCHgKTvJPqKa0Q+rOjAd1vx4Ps0RE2Q@mail.gmail.com>
	<1493813847.4241.251.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 May 2017 13:20:45 +0100
Message-ID: <CAJTo0LarupPCEy+-SU0ZpE1H-qhSBAdi=uG073fJZSFHqc25og@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] QemuRunner: avoid tainting os.environ
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
X-List-Received-Date: Wed, 03 May 2017 12:21:08 -0000
Content-Type: multipart/alternative; boundary=001a114ed8eebf5872054e9db00b

--001a114ed8eebf5872054e9db00b
Content-Type: text/plain; charset=UTF-8

On 3 May 2017 at 13:17, Patrick Ohly <patrick.ohly@intel.com> wrote:

> They could be logged in start(), but at the moment the logging is in
> launch(), and if we keep the semantic the same as in subprocess.Popen()
> (i.e. caller provides entire environment), then that logging doesn't
> know which env variables might be worth logging.
>

If you really cared, you could log the difference between the passed in env
and os.environ... :)
Ross

--001a114ed8eebf5872054e9db00b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 May 2017 at 13:17, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ob" class=3D"a3=
s aXjCH m15bce3ec220596af">They could be logged in start(), but at the mome=
nt the logging is in<br>
launch(), and if we keep the semantic the same as in subprocess.Popen()<br>
(i.e. caller provides entire environment), then that logging doesn&#39;t<br=
>
know which env variables might be worth logging.<br></div></blockquote></di=
v><br>If you really cared, you could log the difference between the passed =
in env and os.environ... :)</div><div class=3D"gmail_extra">Ross</div></div=
>

--001a114ed8eebf5872054e9db00b--
