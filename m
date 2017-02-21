Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8C4FD71989
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 08:36:33 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id p22so115914597qka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=riBkUGmGEh5WEMH+pyQHgYXN66/pk2rvY/lElgQ/FOg=;
	b=ScKcZOnEF0vtq3T8hOQWudAZ58lzZ3Iov85dgkbluCfkoOeuKWOdLCmE/lVsvwQY1S
	Ps0QD6C5XVuqx8jv1c4dC/MTYCRz+YaY8lUTcugEE2cWTb1y+BgB/mhP7KWFSdG8jZZA
	+BZR2YK7g06swCCba1vYoleYMaroyg38tK/AQOtQx3oVIkCY1ijhhx62WWV8C6NdM/Jp
	LcZG6rkh7TYgszmcepKwQlC305Avrh0RkD+GfXZXjvHUVdZdRiSx38TqPCFfZAFcYr8m
	vKWCdalIDbvIMWZgnwfOD3p4hp15dsvUtoJicB9p6XBzsySctlyc7R4HT7AnXIrF7ybJ
	607A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=riBkUGmGEh5WEMH+pyQHgYXN66/pk2rvY/lElgQ/FOg=;
	b=awdQyy6H/kIcg5Y9XNHtA7WC88qdiBRpELPoEYnSCdgbQzg+tSEMw8ed/fLJkpe11H
	dJpUPy+Nj9b+ksHoLTWfo2DwLv0to96wLp7OnAakl+022smXeEJLEGg+gbZMGkQaABm9
	6ou7pSALounoLBwnR6pQaqJIgAZlKP4MgUJTXxJJs6y7EaiHB8KvKy7HZYrpaK6duJX9
	qn/vHgsiCJMFADxjcrD2cdCYGodrWu3cGWLQEK/fE0RkHoiJyCO8KxREDG+u4zo92V+X
	14kvNrS/BoPdcvnJ301GWxW+xwjEcWeNdRk3fZv7YqimAOS0uz9m3pP5Bf2pDldqaAN3
	cznA==
X-Gm-Message-State: AMke39nxSIP6xQU7HB5J2oLIvUVTLLMedCmBtrt0/yl5J05JoDlrKI7DACTlxW0QGPvRHpKm60oP2vNz2t8ACYU2
X-Received: by 10.55.3.18 with SMTP id 18mr22551674qkd.244.1487666195056; Tue,
	21 Feb 2017 00:36:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 21 Feb 2017 00:36:14 -0800 (PST)
In-Reply-To: <CABcZANnhQ3L=ZsgrFjBo1S8Ffd3WwGgsGwp9KMjRD1UyM4UUUg@mail.gmail.com>
References: <1487637458-15893-1-git-send-email-ross.burton@intel.com>
	<CABcZANnhQ3L=ZsgrFjBo1S8Ffd3WwGgsGwp9KMjRD1UyM4UUUg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 08:36:14 +0000
Message-ID: <CAJTo0LZEGzZK+kCMQFODN3rtjNo_=ZBJAUR83AnveKzQB4y_9Q@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: 6.0+20160625 -> 6.0+20161126
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
X-List-Received-Date: Tue, 21 Feb 2017 08:36:34 -0000
Content-Type: multipart/alternative; boundary=001a114c832819d9f205490647f8

--001a114c832819d9f205490647f8
Content-Type: text/plain; charset=UTF-8

On 21 February 2017 at 04:58, Christopher Larson <kergoth@gmail.com> wrote:

> What will happen when ccache is in use via CCACHE?
>

Thanks for the excellent review. :)

Ross

--001a114c832819d9f205490647f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 February 2017 at 04:58, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra=
">What will happen when ccache is in use via CCACHE?<br></div></blockquote>=
<div><br></div><div>Thanks for the excellent review. :)</div><div><br></div=
><div>Ross=C2=A0</div></div><br></div></div>

--001a114c832819d9f205490647f8--
