Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id DFA7F719A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 16:30:16 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id l7so6021464qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 08:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ttwVgc3nNkR+YDLNInhhqt6a/5QSpe4JLezK0J+anik=;
	b=OwnF9VfeomZqooGZLDh7EqdU+BkAZEHgVAu3kkDts3wm0f0kIQyTgEkil6HdXma7ft
	5rM1JzUtKpqrKIXXRzDBRNZDQGA6Y12/qc8ulezrc5QPtV5RkAHJhtuQ8QmHfTE7WVr1
	Dx3dLpa8auz/pOweEd/x/vFY0YRKj19QLrQRVMPSehfKwxzOOIFxaeSn9z7DnfIsf0FD
	5JPxJXbtBBvlH8v6dtEqhKLjhrMZiMRKHTDNMwkmWQUmw/7JCwvodNYqQUJqfIthoCZl
	bpxqA2zs5KvP6KJg+Bk8g0JHIkI1FmHRnY2/kXATauG0i+01gAbHIgcAA6VvDv8fGawG
	S1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ttwVgc3nNkR+YDLNInhhqt6a/5QSpe4JLezK0J+anik=;
	b=c/MwGLysh37sEI+ROTSN0CkwkZ/prZv7wHMzRmyhL83RpKym8415vch+EUbTvm897T
	JIQvhRnbO7KsDUGnjAEG6kH7bP5V8MG+CrQ+LOMHixbzS4cZ1dfYnXFsh6zDZiqp+a24
	ld6/L+i8X8fVhwBlorL5akR3E22VYfD2ylGnMVJP1tW3mBADR3YObatjwhmRHQggOyKv
	KegQqN4oPoN6pRM39I/V2HACEw32eOFjOEHbB7ILWrOuFKvmMy0JhK0qp0G6nHRqyry+
	Ys5GvnA1ghqXcA6S4DZw2Mf1SrvgAp5AXA/wx90poAoB3/C7T8w4AWQ4YLPLs2QR/UEl
	qCnQ==
X-Gm-Message-State: AIkVDXJOVWZ5bycrYrmYoxAj/lLLjAvLhq5wHb1szDtPD52GHoKTXgQBUD7WB9MzQh5+oQ7eQj3syHdyfXYDMnOf
X-Received: by 10.237.39.148 with SMTP id a20mr3350357qtd.65.1483633816732;
	Thu, 05 Jan 2017 08:30:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 5 Jan 2017 08:29:56 -0800 (PST)
In-Reply-To: <1483531104-32135-1-git-send-email-amarnath.valluri@intel.com>
References: <1483531104-32135-1-git-send-email-amarnath.valluri@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Jan 2017 16:29:56 +0000
Message-ID: <CAJTo0LaYG+mHGWOse4Yn7nLVT6wtP+x=f=fwgy=Q4wmmPyWQVg@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel: Modify kernel modules installation path.
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
X-List-Received-Date: Thu, 05 Jan 2017 16:30:17 -0000
Content-Type: multipart/alternative; boundary=f403045ee6d89fa46105455b6ae2

--f403045ee6d89fa46105455b6ae2
Content-Type: text/plain; charset=UTF-8

On 4 January 2017 at 11:58, Amarnath Valluri <amarnath.valluri@intel.com>
wrote:

> Use ${base_libdir}/modules inplace of /lib/modules for kernel modules
> installation path.
>

Does the kernel actually respect ${base_libdir}?

Ross

--f403045ee6d89fa46105455b6ae2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 January 2017 at 11:58, Amarnath Valluri <span dir=3D"ltr">&lt;<a href=
=3D"mailto:amarnath.valluri@intel.com" target=3D"_blank">amarnath.valluri@i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":4g8" class=3D"a3s aXjCH m15969587d3ce875b">Use ${base_libdir}/modules =
inplace of /lib/modules for kernel modules installation path.<br></div></bl=
ockquote></div><br>Does the kernel actually respect ${base_libdir}?</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--f403045ee6d89fa46105455b6ae2--
