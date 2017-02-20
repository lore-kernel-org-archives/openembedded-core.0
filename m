Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id DF92671E02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 20:56:13 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id b16so47112768qte.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1tCE/TGpbqQLvUMxfK9tJ1ejp30x4yqKWKKZfEOPa04=;
	b=zrA9IWQfOfiq5ieOqbNVpY38n+Jhh038bNOSkAtgzP94GUhC0yatZS90msAMR352Le
	MrYSIsAwzgIWgaXPxqSaC+Ybkcw0sBjEctvImavgqTamo37kedMG471Uy8Lc/wGQcfyy
	UAfE51ijSWO9NAELYyvj/6gYcr+F8jT27DxKs2tgJS2TYya8q8hCUjn0K35+TrWGR+XD
	DRm5oD8aiFvTNtxn/pTiUF9c9cNLY0nB6Xp00DR1CPUnxy+oAvthAi+1H2y4TKbzC8Gu
	M5BjPrPsiQ7Bw1m7swNNHr/MtgTdq9My4EvaADfwjM8ZTWO/7tyCjVfAcstygdCkfMe9
	8ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1tCE/TGpbqQLvUMxfK9tJ1ejp30x4yqKWKKZfEOPa04=;
	b=iKi2iWmYkY0e3kfo1cIHbCqleZ1ZWx0g8g2e/D1NBAqZRoVZ0MR4Bj688FaU37diuR
	irlEW+w26qc6MIExMiDBoS/sw0ewgd7kJELwlyKbA3FBuCJdwEX4bz2yptSGD5GmtV5+
	7I45hQTOWDVoEzchiNqDpCl2dm6vItl8nHuiPHL5Q0K4x6ZZv+23Mkg3WO+0Uuf5iVmG
	hY75DvMUw9wpDlQiT+tWw3kOnZp+Hjkvecr4AUonYjAbumR/SjK1zsc4Q26lr3Rz7m0S
	zLoq9ef2oEeYQoHCQxRllb+K4xHaIAf4nnauUrWAnLcu2DJNJPutCXbbtd2ru0vEVWyC
	vwiQ==
X-Gm-Message-State: AMke39kA//SdX7IjKy5gdV2Hg61YonQDIY3RN0BvFdDXeruwKfE9sbqtdfVnIJuv880Tl+9Dm9juQ+3bS9+ovMu2
X-Received: by 10.237.36.208 with SMTP id u16mr23479947qtc.105.1487624174687; 
	Mon, 20 Feb 2017 12:56:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 20 Feb 2017 12:55:54 -0800 (PST)
In-Reply-To: <1487575265.10318.121.camel@linux.intel.com>
References: <1487356080-8124-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0Lb5=tW_U4WizZBjmVTUzsmrOpaEmAmnVn5zJAZGZUPJVg@mail.gmail.com>
	<1487575265.10318.121.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Feb 2017 20:55:54 +0000
Message-ID: <CAJTo0LbbYA2uW4QU3TpEZsaAbfgM5ibLKBmmS+krz5yySzrKEg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt-package: use ${libdir} instead of /usr/lib
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
X-List-Received-Date: Mon, 20 Feb 2017 20:56:14 -0000
Content-Type: multipart/alternative; boundary=001a114104ce7e3a6b0548fc7ecb

--001a114104ce7e3a6b0548fc7ecb
Content-Type: text/plain; charset=UTF-8

On 20 February 2017 at 07:21, Saul Wold <sgw@linux.intel.com> wrote:

> Hmm, since this is a script would it make more sense to have this
> install create the "usr/lib" directory?  I am wondering is this will
> bullocks up a single root solution or a different non-standard libdir?
>

/usr/lib will most likely exist, but if I were writing the patch I'd be
sedding the right path into the unit.

Ross

--001a114104ce7e3a6b0548fc7ecb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 February 2017 at 07:21, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3qi" class=3D"a3s =
aXjCH m15a5ca03789f4d79">Hmm, since this is a script would it make more sen=
se to have this<br>
install create the &quot;usr/lib&quot; directory?=C2=A0 I am wondering is t=
his will<br>
bullocks up a single root solution or a different non-standard libdir?<br><=
/div></blockquote></div><br>/usr/lib will most likely exist, but if I were =
writing the patch I&#39;d be sedding the right path into the unit.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a114104ce7e3a6b0548fc7ecb--
