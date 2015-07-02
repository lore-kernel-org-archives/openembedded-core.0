Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id B353E607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 11:14:41 +0000 (UTC)
Received: by qgii30 with SMTP id i30so31124938qgi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 04:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6t9RTXQtRCxkANf3H+f8K/i7dsctWi9191RZxxD3l0M=;
	b=BLAM2GtKs8tpH93aa1eew2jy64swORyIpndSNQ1MDIVr6Vh1yoiJ8hse9LotA3Lnsd
	s9bNwDC8tHsADBEGhZS8jcQjEAxphQmWrUmk7qU7e9dzOvw5lKt+MSg5w7sSDAp9Ni/S
	m+BMQ5SsF4gB7EytLmVmx4xrVhe1GrctjLPqAx4XGkZRmQuJpxZRlf/jy+3D267RggOO
	c9k/0oPUX/kELJxUaXV9s3B8YBXQp/oc08VamxUx+gI4EB/7IzAp3vtGTfPYbwdZ9Bhe
	X3ma9jDTF/kpFmJ5WPuvljNm1zsVaTVtFGNnGHtlRiu450RDIKj9UBqTodnQK0UAgWxg
	+8kQ==
X-Gm-Message-State: ALoCoQmbVfs2o7Hq6KDT6dh2sgnJNn9PbMWP5e7zqDeRUUy/xJ5392SKnwTaI0WsJ1W83ibaVSaj
X-Received: by 10.140.196.129 with SMTP id r123mr43582712qha.93.1435835681662; 
	Thu, 02 Jul 2015 04:14:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 2 Jul 2015 04:14:22 -0700 (PDT)
In-Reply-To: <EA10218E-4D41-4B06-8479-9D06D6F588AB@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
	<efc583454a3f6cce0b15d122320258aa8636b92c.1435774899.git.raj.khem@gmail.com>
	<CAJTo0LZdPcAh-bQCkO=WN49b_SAa3Gj8yPLTPPpKD+jVn_mG7Q@mail.gmail.com>
	<EA10218E-4D41-4B06-8479-9D06D6F588AB@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Jul 2015 12:14:22 +0100
Message-ID: <CAJTo0LY+NNsqLAuowNge_ivXJc5KF7GgCv_hsLiEKCWajsd_=A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] weston: Upgrade weston_1.6.0.bb -> weston_1.8.0.bb
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
X-List-Received-Date: Thu, 02 Jul 2015 11:14:44 -0000
Content-Type: multipart/alternative; boundary=001a11433952c3030d0519e28b80

--001a11433952c3030d0519e28b80
Content-Type: text/plain; charset=UTF-8

On 2 July 2015 at 02:38, Khem Raj <raj.khem@gmail.com> wrote:

> No, certain construct like %m which are used in weston are already part of
> musl. As of now it builds and boots fine with latest musl release and we
> will address any future issues
> if they arise. moreover upstream wayland/weston is very receptive for musl
> changes. Now regarding this patch, I will redo it and submit it upstream to
> incorporate the feedback,
> however the patch itself is ok its just the mechanics of it which needs to
> be changed.
>

Excellent, glad to hear it.

Ross

--001a11433952c3030d0519e28b80
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 July 2015 at 02:38, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div>No, certain construct like %m whi=
ch are used in weston are already part of musl. As of now it builds and boo=
ts fine with latest musl release and we will address any future issues</div=
><div>if they arise. moreover upstream wayland/weston is very receptive for=
 musl changes. Now regarding this patch, I will redo it and submit it upstr=
eam to incorporate the feedback,</div><div>however the patch itself is ok i=
ts just the mechanics of it which needs to be changed.</div></blockquote></=
div><br>Excellent, glad to hear it.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a11433952c3030d0519e28b80--
