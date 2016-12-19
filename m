Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7A473181
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:05:29 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id u25so3147294qki.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 05:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h5yr061dGz0x91IFokCEMwxJQzH8K/YITa3YHTeJFIQ=;
	b=Asr4EbvcTKaR2qjSNJVO0S7IJQteosCCPZX29t+2I8ns0NyLkND9FrCndk9G4UGi57
	TMUy2L+cdCELpz/j6qPsE67Xk+NnM57xDzLs78Y2mFB/7nfkdE04S9x/wjJSdUUZ/K5f
	oLJRWmp/Ttk3NvUsto4fEcp4E7tTm7Q4ThCl9AXoprdryrr/lxTfZmXQ+r5VGcW9K0Ee
	nG9JbuF69hLG1bakPgLtPBXNGCvCB6zqotZ17togjoxakbRQYtjW305O2EGmPSasNI3u
	sQaE+CgqZMQfZqugfLCvaeDAIwfiZs6PMVPk+7fiAl8bAfckiDEOFrJ83hBgTjMusbhj
	gMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h5yr061dGz0x91IFokCEMwxJQzH8K/YITa3YHTeJFIQ=;
	b=Rrpszn7+5WjlmOE4r7sMC5qPBfbGSuGCQDn3zdT17JJ0wuFECZrZ+MPz6HsOJpu1zv
	TWqYBhXITgW6DsgfdmtM6YcJe05P8TeFm6rQYLUI+jFg0zheIUbCTEOZK8IYLTG7uviZ
	LX5FdBsLb6twXuli0L4N1ZTExrZgxih0T1+fnRYr9hZLamKWyvll6PDDwk7tvYzkC0wX
	cLbwAFDrpFPdeXkQFWrz9o6WcevFsexbKxnpWG2nfDxFwWni5ygBgWHmzw5px0gj8icr
	tAGJBxt6+5QL9dKqDxxuixxRZD4wGiRNpifGeJX5Qk5xwCgFnQZOBlZh7AilxGPPvYd3
	Kskg==
X-Gm-Message-State: AIkVDXKLoo2BUK2fKMOxHOeYN1nN5XN+bO3QIiRqvdXFLysr0QAv2gjZ0QHAIA5EgXM1CCbDqEkUwLZdDPoWWkGF
X-Received: by 10.55.39.88 with SMTP id n85mr957124qkn.244.1482152731465; Mon,
	19 Dec 2016 05:05:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 05:05:11 -0800 (PST)
In-Reply-To: <CAJTo0LaqOXdN7ASeT6gnGFqnptyB4NYAycR0w6kPG=7yTtNF-w@mail.gmail.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2453D84890@XSJ-PSEXMBX01.xlnx.xilinx.com>
	<CAJTo0LaqOXdN7ASeT6gnGFqnptyB4NYAycR0w6kPG=7yTtNF-w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 13:05:11 +0000
Message-ID: <CAJTo0LYYkQDxXC0Eh4Z9o1X9=HtnguaF0hUL_xLDQ3hymbEHsA@mail.gmail.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Mon, 19 Dec 2016 13:05:30 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b161026d80544029392

--94eb2c094b161026d80544029392
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 13:04, Burton, Ross <ross.burton@intel.com> wrote:

> You'd marked it for morty, so I'd assumed that it wasn't for master.
>

Ah just found the master version.  You can thank GMail's threading for
that. :(

Ross

--94eb2c094b161026d80544029392
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 13:04, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_ext=
ra">You&#39;d marked it for morty, so I&#39;d assumed that it wasn&#39;t fo=
r master.</div><div class=3D"yj6qo ajU"><div id=3D":2jw" class=3D"ajR" tabi=
ndex=3D"0"></div></div></blockquote></div><br>Ah just found the master vers=
ion.=C2=A0 You can thank GMail&#39;s threading for that. :(</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c094b161026d80544029392--
