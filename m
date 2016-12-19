Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 916EC7732C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 20:31:45 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id t184so27224268qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 12:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YuCOJDtunlOVkr4lNjyqzsI6zDKbnXQvDiTjQVOV81Y=;
	b=Sc4KshM21Hoi2zHfLqzzQBljszkF7pLtODN4k8RpLzMk4pl1hjtq+MrHwX1iXZpgmZ
	Lqel1Gfg599nWatMsKEIvId2G+/nWnuYgf2FJbL6FRUQK3kkRAokjyBv7ljgoiYmJADb
	MwwdXqrSeqtypBj0eFuZeCnoSIrCNtXLmS1BS13TxvtWVp7K/XgV23GgIxBB3Qfb0mNu
	PIyrNQwnnSLTBPF3ZSrUNNhbKIrVmR31LcpupBA8c9Q4QP+2oyzx4Wx1e1xqfZ7BxMLJ
	CdN03b+wLoh0mCVnGhDsNxTd8Lg0GO722zNTN/a1Bg0q5bLFrz6kjUFh9yTJgReLFcth
	XyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YuCOJDtunlOVkr4lNjyqzsI6zDKbnXQvDiTjQVOV81Y=;
	b=FTmG0OqL1OOjvWJCHtYdTVLvcCWriUwH+nYI2MWZrhe5jdIReKBhItCSRjT54bQOSL
	lrYT8RxFYBgw1lwm/YCTgcPxczFO3icnKbEUYZ4DKpSHOspU8wMNxA6z6yPyZWiITMND
	E0rPsQPnz4Ebg3N0fTAro0wKeXPfiUrrbSQ8aoD5jad5Od0vEc2z0jv7tM7pd5PAQ/Of
	kWf8hTMiUP31bL/qmzgTSX3Ksl+nJTSc3fZq7FQ5tBsAcfwdu5z1uZw5chx78te39Obr
	fiLTk+2K1wUcpU52Zn+VzKJlDmVDzhakd+aqv9h+sG1OQ3VQ3GrkGHkOjRERPq0FQOel
	sSNA==
X-Gm-Message-State: AIkVDXK8nEx2nqeT+JRf2o0L03ElvuA+y3a+iT/1Ni6Eu199Xuev5fksYSF7L7pMohnOevtwdDk+y/2MgUpuZ6Xg
X-Received: by 10.55.31.24 with SMTP id f24mr4732656qkf.221.1482179506358;
	Mon, 19 Dec 2016 12:31:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 12:31:25 -0800 (PST)
In-Reply-To: <20161219152324.GA1056@openSUSE-i7.site>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20161219152324.GA1056@openSUSE-i7.site>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 20:31:25 +0000
Message-ID: <CAJTo0LYV2qMTBVpm8ASDb7BdwwezWfysAn6fJbM7Xwh6FXCcyg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Mon, 19 Dec 2016 20:31:45 -0000
Content-Type: multipart/alternative; boundary=001a1147e2baf89367054408ce3c

--001a1147e2baf89367054408ce3c
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 15:23, Trevor Woerner <twoerner@gmail.com> wrote:

> Is anyone else seeing build failures as a result of this commit?
>

Can you reproduce this on demand?

Ross

--001a1147e2baf89367054408ce3c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 15:23, Trevor Woerner <span dir=3D"ltr">&lt;<a href=
=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3nd" class=3D"=
a3s aXjCH m15917ae915227cc9">Is anyone else seeing build failures as a resu=
lt of this commit?<br></div></blockquote></div><br>Can you reproduce this o=
n demand?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a1147e2baf89367054408ce3c--
