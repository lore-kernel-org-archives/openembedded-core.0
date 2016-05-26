Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5F95360796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 19:13:22 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id z189so87777595itg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PdmGU+NihKppqJ04ePq1CKkIDEQDQ5hPHs/2EurDyCo=;
	b=C/4hYPP1EejZkN452E0dqLsT45WCZvIZZ/0I7gJe0Bq8uEZdlhIBVO9pxdmZ+NDxP/
	n80VkVW6ts1/NVCyJ8dyBJOV7UGKpm1gKnzVX6GBO4H4a54nZQGn2wYhrav/VO+Hck9c
	Kjc4nOx3Le+zEn2vJv01qsPuTekeax8wDxw1SdVypuZCsX0XRNdVqpnx9vUS3dvpsBOp
	lLcdXh8XTcNC7UrJOFtUii1dMStBzRKhalYtHQEbIsOhDuBKqWQr6Q/x/1ZOl8kzXmZI
	ip+xO56FIIGENC7W1HIzL8FEA6rILfLAIWwdQnjG+Yad0VEyYrzfTZNXByin7NU48Q+9
	LCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PdmGU+NihKppqJ04ePq1CKkIDEQDQ5hPHs/2EurDyCo=;
	b=VLxHoKFIOVwMWW8tbeDHdFhrur8ikG42w0F5gUXMlog4KSeFjE56JCce8XL/XlogjV
	eZNQdrmaCkTdy5hrp0l9pdQJi6azku8kNg2gvG5shY2tO+9fcaNHVhL45bELuXRs49oA
	hvCGGjZp9oIxzvHyULud5HN2xqOoYHLQAUVcQHIVVbCwenzj2Y0oU8DNTlWIbCnespZN
	7JnRiTcGHdfDyHfGyneEp1ZYhm2BFA3Kg+u62R7hEgb5sGRF7bCR/aNNO8/thJUg4rAM
	u+Fz3846zseOY+W35enoKzGlUBv/ctQONN0Q5jL6piJtazI46SK0PpfqAvS4Tohcl75o
	dfCA==
X-Gm-Message-State: ALyK8tKJL8uPM5segqBU3D7eT6X7iLYBXB/o/NMIiGgR29Rn6pcpua6swmW3MhN0XIWmQLKLovO4/KSOVI248jGw
X-Received: by 10.36.217.79 with SMTP id p76mr4815506itg.38.1464290003153;
	Thu, 26 May 2016 12:13:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 26 May 2016 12:13:03 -0700 (PDT)
In-Reply-To: <20160526172357.GB2575@jama>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<20160526172357.GB2575@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 May 2016 20:13:03 +0100
Message-ID: <CAJTo0LZB4hGFdGoavFwxgWg2bvj_7nPEWyT4c=jfjx-=wRKcJw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Thu, 26 May 2016 19:13:25 -0000
Content-Type: multipart/alternative; boundary=001a1145ed9e7ccc370533c3950d

--001a1145ed9e7ccc370533c3950d
Content-Type: text/plain; charset=UTF-8

On 26 May 2016 at 18:23, Martin Jansa <martin.jansa@gmail.com> wrote:

> This wayland upgrade breaks libsdl2
>
> http://errors.yoctoproject.org/Errors/Details/68336/
>
> libsdl2 needs fix from here:
> https://hg.libsdl.org/SDL/rev/330f500d5815
>

And literally nothing in oe-core uses libsdl2.  Does anyone who knows SDL
have an opinion on whether we should switch qemu and ffmpeg to use libsdl2,
or keep on libsdl and move libsdl2 to meta-oe?

Ross

--001a1145ed9e7ccc370533c3950d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 May 2016 at 18:23, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mail=
to:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1l0" class=3D"=
a3s aXjCH m154ee193efeaf5a4">This wayland upgrade breaks libsdl2<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Details/68336/" rel=3D"nor=
eferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/68=
336/</a><br>
<br>
libsdl2 needs fix from here:<br>
<a href=3D"https://hg.libsdl.org/SDL/rev/330f500d5815" rel=3D"noreferrer" t=
arget=3D"_blank">https://hg.libsdl.org/SDL/rev/330f500d5815</a></div></bloc=
kquote></div><br>And literally nothing in oe-core uses libsdl2.=C2=A0 Does =
anyone who knows SDL have an opinion on whether we should switch qemu and f=
fmpeg to use libsdl2, or keep on libsdl and move libsdl2 to meta-oe?</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a1145ed9e7ccc370533c3950d--
