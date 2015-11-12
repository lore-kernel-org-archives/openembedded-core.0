Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id A8E52771DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:13:24 +0000 (UTC)
Received: by igl9 with SMTP id 9so94060113igl.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 02:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QbmMA0fL2GvW6IHXneraxHc8gFvFr/G5wCLubhOTmCI=;
	b=zY7TYBp3rijB8LnsGnnY3vtPdGNHPWSZMqV43zTEn1U5feykGkHUI8zYpkmLWTSdYA
	PXSpIkj+jxcf1ZResxofZrrJJaSugaKbIlGUl2SRc8zeURIWD+zYHISv26JhknNsqe18
	YQW7f0DOpVrh6PdHuh9GVkbRD6HFkkKHxjjd17gO/tXPc2vlx3n1Bq0X52wMmObup7TQ
	HJc6Gzp6rseKewbTpSMWW1pbGtVwpi49lbUMVRE4rBjjYFYwBhndX6lto7AFa3j9DBqh
	XWEBtpkel1LEbtgnIb220E6V4gJu0YD0F4FFkyEY2uJcZKeGqXJF+VZzeTG24eZyywHI
	xNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QbmMA0fL2GvW6IHXneraxHc8gFvFr/G5wCLubhOTmCI=;
	b=ACjATX7KhE469q7kJYur3tkUBwkxjbRK/xyy+Y0ksfQNIOOu9O/jkKKhKAhLVhr/uN
	xF1F3DbUD7qpJhrC5U650HMbNzpo04yRv6wWJJAFRIH9wVMfupxUuufYEfrFqz1EvOae
	sZl+88Sv1x5xXgf/koqEsG6YiylUg18fyS/z2JbQrWCHhqu/Ul7mnMwuxmiSovnywijU
	/YWTxK1/qtZsqbtb093tHKFZyaH5oAIAMX0/3Ce72cVVcv5CYeeC8S4VgRaXxGOhzoiB
	GnkaT+sP4fGLmXelBaOatU5xq5pxri+b+1+tsoZuZ4/T+0UEac+V+Ttp2fLKLAdMjodT
	Ibyw==
X-Gm-Message-State: ALoCoQkImb1Z0N/SwVoDZ07qhdwXLOrrTUdBNT4xMjG4O+Fj3vdGR3hP4vVyHd4dXAyg2cHq8kpa
X-Received: by 10.50.64.147 with SMTP id o19mr34458969igs.52.1447323204299;
	Thu, 12 Nov 2015 02:13:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 12 Nov 2015 02:13:04 -0800 (PST)
In-Reply-To: <1447297446-18024-1-git-send-email-rongqing.li@windriver.com>
References: <1447297446-18024-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Nov 2015 10:13:04 +0000
Message-ID: <CAJTo0LYVnvcYH2NZBtKtupO_bjnr9MKFWYRH5519q8+5xJdY3w@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v2] e2fsprogs: fix the ptest
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
X-List-Received-Date: Thu, 12 Nov 2015 10:13:27 -0000
Content-Type: multipart/alternative; boundary=047d7bea2f9877c7fd0524553102

--047d7bea2f9877c7fd0524553102
Content-Type: text/plain; charset=UTF-8

On 12 November 2015 at 03:04, <rongqing.li@windriver.com> wrote:

> +cache_inode.patch speeds up the making ext* filesystem, but it leads
> +to the m_bigjournal ptest failure; In fact, when ext2fs_extent_node_split
> +is called, the cache goal should be reset
> +
> +the patch fixes the m_bigjournal ptest failure, and does not lost the
> +speed.
>

Please edit the patch, instead of patching a patch.

Ross

--047d7bea2f9877c7fd0524553102
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 November 2015 at 03:04,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rong=
qing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ir" class=3D"a=
3s" style=3D"overflow:hidden">+cache_inode.patch speeds up the making ext* =
filesystem, but it leads<br>
+to the m_bigjournal ptest failure; In fact, when ext2fs_extent_node_split<=
br>
+is called, the cache goal should be reset<br>
+<br>
+the patch fixes the m_bigjournal ptest failure, and does not lost the<br>
+speed.</div></blockquote></div><br>Please edit the patch, instead of patch=
ing a patch.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--047d7bea2f9877c7fd0524553102--
