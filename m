Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id DAFA5731AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 22:04:50 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id q21so69524859iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 14:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4MBRMaVnGzYrGOWdQMe5vojehUQRyq8KLfmhtmQoEas=;
	b=Jl60wL3KK9pS4Zk09WqsHKyNjtoJfiJx16EqmH5BfHtvuz9v4HP8baRlkBPGyZhAE4
	dCbCYyhzaZBGHoq2KIkVyiMW/ut7Hy3oFvqEY1CTnEXHQaOp3ivzTJbR1TjGB5YbX2kW
	bLhV4V4T3LLjBs0rcobjKgLpAm6orJKrfYn6kwTU3+xeOsDQ6WbjGU9HyJDSDHlNze5H
	2F64ALVolpT19UMYXJ583dQPkPGeXt3kR8JuDCYzK0VTYhit32fNGtzU1jbMbeQ34qbJ
	Ok2c/CIlyWB9YOuqnUYiytRJcjqV/n9x533BNI1CVZvGuYo8+2VY0bg/5chWQC6pYZe2
	UcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4MBRMaVnGzYrGOWdQMe5vojehUQRyq8KLfmhtmQoEas=;
	b=QH8//TsDuT0W2rticGKA8/dBYb/qgji8ic8LsVKKXJpZuIHL5uR0FtJYHZd77MbU6t
	wMxKbNmpOM1vfolWUu3spYF7i6C/wazfFUtyRXXw9IOFrCNVv8WNPtusLjvKC5me8XuS
	rSDA56gzEyFATyyXrNy55ENsYOqHlMIHvpLC4tm5P6T2S2V1uCvQyrcxREJE0Ma1ZfDC
	0sZQRM5r7uBZFH83Im+/e9jIzsfoUwaf8ioPD2MsYEcLu+KR2eN2za6YplhwfRZK7FWW
	F3IUVuFNcGyHvDQTD6cWOPS5QG4yutdfo/ushfcodP8w8R2DuVt7Ozjg1fBgRyWvsXfF
	CW1Q==
X-Gm-Message-State: AG10YORxGH4rgFrwN13FRd8A3AaioB1SseWNIoW7qtO9FWH7SVd8wtXeN4OJl8bVrdeDuvYqmMLPuvRZDyr+fj8h
X-Received: by 10.107.164.161 with SMTP id d33mr197768ioj.148.1453413891452;
	Thu, 21 Jan 2016 14:04:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 21 Jan 2016 14:04:32 -0800 (PST)
In-Reply-To: <1453413378.27999.173.camel@linuxfoundation.org>
References: <cover.1453363852.git.liezhi.yang@windriver.com>
	<20160121081654.GD31212@axis.com> <56A099D8.4020908@windriver.com>
	<2992852.OT1HfBaFUF@peggleto-mobl.ger.corp.intel.com>
	<1453413378.27999.173.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jan 2016 22:04:32 +0000
Message-ID: <CAJTo0LZJ=AZn1UA27ETxOaKx-rYgjXM7EYtfnYNoVrVzhFpNaQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] insane.bbclass: do_package_qa depends on WARN_QA and ERROR_QA
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
X-List-Received-Date: Thu, 21 Jan 2016 22:04:53 -0000
Content-Type: multipart/alternative; boundary=001a1141c976b646830529df4aad

--001a1141c976b646830529df4aad
Content-Type: text/plain; charset=UTF-8

On 21 January 2016 at 21:56, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Last time around we ended up with:
>
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f6ec8dfaf7f98ade05d6292d2fea42805c4d80a7
>

Thank you, my brain was saying I'd done this already :)

Ross

--001a1141c976b646830529df4aad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 January 2016 at 21:56, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":rr2" class=3D"a3s" style=3D"overflow:hidden">Last time ar=
ound we ended up with:<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Df6ec8dfaf=
7f98ade05d6292d2fea42805c4d80a7" rel=3D"noreferrer" target=3D"_blank">http:=
//git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Df6ec8dfaf7f98ade05d6292d2=
fea42805c4d80a7</a></div></blockquote></div><br>Thank you, my brain was say=
ing I&#39;d done this already :)</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a1141c976b646830529df4aad--
