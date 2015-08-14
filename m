Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id E712165C78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:51:51 +0000 (UTC)
Received: by qkfj126 with SMTP id j126so24176896qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 03:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=itIX8eFnpJ3lzD6Jibs3tm2FIvDTytGIn5hxpXrIjoM=;
	b=b44KBJLe1J2M/QkrvTqZZ7VgMg+rqY1nM98QWRZkfgoxSha6sQac5W7QOrZvzC/EGt
	Hh/JeHVo1g+Vm3XdAc+FOXe24oh1yzv6HnFlxVPfQG+n/4LHj/A/ayIGUfaMYrQpMr2A
	6A61XzZqczBI8ErIOI9s1WXFGPqNeHmfEeOzTxxWQLMkXZCb9IJ/KKSxtW+KoDd6pmOr
	QEgYGOqkcaCa0JpuCuE8CKS0jDa7Bf52IMiJ/W4gTOZVfo7bVkDoLzrvGJWd77ElNd2w
	YAAeD3GgWB/xMnkilvYk2kQ1okygapwsOJFqPEl8Xf3SYBEEfmsvYYdPpubxbnICXWs7
	AKGA==
X-Gm-Message-State: ALoCoQlFrriHoy4Br1u9zZp2wVwaoWiPaZqfx1gcm3335f17tUMepKXo23+B0ziGGBfXMGQd9Zhi
X-Received: by 10.55.55.82 with SMTP id e79mr3942729qka.100.1439549511765;
	Fri, 14 Aug 2015 03:51:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 14 Aug 2015 03:51:32 -0700 (PDT)
In-Reply-To: <1439372036.28153.29.camel@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<6af40fe1752b8cf25efca4a906361c4437249841.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0LbMmZ9rf-Jq_XoGJzTCj_0E=1qene_ooyf_T_nWsH60Jw@mail.gmail.com>
	<1439372036.28153.29.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Aug 2015 11:51:32 +0100
Message-ID: <CAJTo0LYZg-gX1_-qeiJ2O1KDDhoYGi0BdJJp3z=hBhYhma9TVA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] mtd-utils: keep xattr support enabled
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
X-List-Received-Date: Fri, 14 Aug 2015 10:51:55 -0000
Content-Type: multipart/alternative; boundary=001a114900f449236a051d433d41

--001a114900f449236a051d433d41
Content-Type: text/plain; charset=UTF-8

On 12 August 2015 at 10:33, Patrick Ohly <patrick.ohly@intel.com> wrote:

> > There's a "xattr" DISTRO_FEATURE that should be respected here for
> > target builds (and explicitly enabled for native I guess).
>
> I can add that check, if you want.
>
> > Does enabling xattr mean adding build dependencies?
>
> No, the conditional code uses lgetxattr and llistxattr, which are in
> glibc.


From five seconds of google it looks like these are in musl and uclibc too,
so I've merged this  to MUT as-is.

Ross

--001a114900f449236a051d433d41
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 August 2015 at 10:33, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; T=
here&#39;s a &quot;xattr&quot; DISTRO_FEATURE that should be respected here=
 for<br>
&gt; target builds (and explicitly enabled for native I guess).<br>
<br>
</span>I can add that check, if you want.<br>
<span class=3D""><br>
&gt; Does enabling xattr mean adding build dependencies?<br>
<br>
</span>No, the conditional code uses lgetxattr and llistxattr, which are in=
<br>
glibc.</blockquote><div><br></div><div>From five seconds of google it looks=
 like these are in musl and uclibc too, so I&#39;ve merged this =C2=A0to MU=
T as-is.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a114900f449236a051d433d41--
