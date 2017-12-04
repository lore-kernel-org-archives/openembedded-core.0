Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 214A06060F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 11:42:14 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id m11so11555939iti.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 03:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P1aT8gb3DpdnIqkk3lXG58/BZuiieC/99tLQbDts300=;
	b=YYyl1WcCGarIW5niEQRlo6m7j4PeKgsXZEiaBJI1pIlJuiZgWKw+210Mcc0jqM26ui
	cvN1zkBRpf7I68kSFJquuz3EsRXdAQOBOG9Mr7XcScEELhfxWf8x1vJbKcPrjP996RuA
	i/eJO6toU75iDR4q8ETEkF4OCY5JMAUgVhWjJRICB3Wo2ljAcNnD322veYd5MdWaZses
	sCb7CvFHRIho24NzuqVwFZZ8cAR6+fj+wDj66xI5fTJUQwGu6jpLyeIP1QLhKKPYzbIW
	fMNf+T5GcVgmgoqPKmn6ZCDgRhdJY0wxJ/M6pEPEYnWFKQ4Q+t5LLffcHFwFPmRd4FEd
	Vv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P1aT8gb3DpdnIqkk3lXG58/BZuiieC/99tLQbDts300=;
	b=sQBhBzqtxKs+PNsRzCuR0K+Sne2sWAfxVBIy8NmavtQKppWMO8617LTzGXdy4hoKRB
	GIfVGDphk6hN3m+/MfymYPtdxQNmiMSmwl2QHHtRehkUfNn5o0GtHn3p4uy+OEHqHsZC
	tL6IvLdkUjKzaCdzXcLXq0YT83nrZJogerJ3wWtg1TSkgDfNQn3R0n2E7ebc3OnbbKKq
	J9iYJ45RCtW92OaNpsd3y0+JvhBSp2gDev8VpRtnI+TTJyT+a+BzQ17lkfRjQpvkuZyl
	Cx0Q1b+qxDDBjmmP4CFCCpnmjql185hDf+g9J6eKvMF1/qUMRFxnFTo1rVtcp7y/NEK4
	Y2Xg==
X-Gm-Message-State: AKGB3mLxezATYTU6sHfE5zzYWyLRBFV1Q6gY4g6AwH0ChNJWeVYEPyS7
	qETKxKa5u1C2+m53XvWDyWq6s280aPzAHNdth6/P9w==
X-Google-Smtp-Source: AGs4zMZVQP0ohyf14dC3W5EI1MCKQ92raCpAr7F2Ih+kCU73GCjOo1u0MMS1liU6r7jGyxv4WiGbLH76VyU0uK63P0w=
X-Received: by 10.36.80.148 with SMTP id m142mr13195711itb.6.1512387736288;
	Mon, 04 Dec 2017 03:42:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Mon, 4 Dec 2017 03:41:55 -0800 (PST)
In-Reply-To: <CAJ86T=V85wNuQdpS1PjoTQORM8xzMPWo-0pNpBaiXkGpxr=wKg@mail.gmail.com>
References: <1509141048-32541-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=WSqJysxG6mBxbKnKpsp9TaFN=gfWGv0k7joF5LVU--XQ@mail.gmail.com>
	<CAJ86T=V85wNuQdpS1PjoTQORM8xzMPWo-0pNpBaiXkGpxr=wKg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Dec 2017 11:41:55 +0000
Message-ID: <CAJTo0LZMZx=qS7XwpzwCP58LQ=hn2JO4zpVW4Owfjzj0P1t7wg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: set more conservative default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Mon, 04 Dec 2017 11:42:15 -0000
Content-Type: multipart/alternative; boundary="001a114387b8c8eead055f823503"

--001a114387b8c8eead055f823503
Content-Type: text/plain; charset="UTF-8"

Nope its queued now.  You'll have noticed from the status reports we've
been holding back on merging whilst trying to stabilise the autobuilders.

Ross

On 1 December 2017 at 19:45, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Nov 7, 2017 at 2:35 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> > On Fri, Oct 27, 2017 at 2:50 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >> Setting IMAGE_FSTYPES_DEBUGFS to the same value as IMAGE_FSTYPES can
> >> lead to creating a large number of DEBUGFS filesystem images, many of
> >> which may not make much sense (or may not even be buildable).
> >
> > Ping.
>
> Ping again. Any issues with this change?
>
> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> ---
> >>  meta/conf/bitbake.conf | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index 9696273..15feb57 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -757,7 +757,7 @@ require conf/sanity.conf
> >>  DL_DIR ?= "${TOPDIR}/downloads"
> >>  SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
> >>  IMAGE_FSTYPES ?= "tar.gz"
> >> -IMAGE_FSTYPES_DEBUGFS ?= "${IMAGE_FSTYPES}"
> >> +IMAGE_FSTYPES_DEBUGFS ?= "tar.gz"
> >>
> >>  INITRAMFS_FSTYPES ?= "cpio.gz"
> >>  # The maximum size in Kbytes for the generated initramfs image size.
> >> --
> >> 1.9.1
> >>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114387b8c8eead055f823503
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nope its queued now.=C2=A0 You&#39;ll have noticed from th=
e status reports we&#39;ve been holding back on merging whilst trying to st=
abilise the autobuilders.<div><br></div><div>Ross</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 1 December 2017 at 19:45, An=
dre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" ta=
rget=3D"_blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><span class=3D"">On Tue, Nov 7, 2017 at 2:35 PM, Andre McC=
urdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt;=
 wrote:<br>
&gt; On Fri, Oct 27, 2017 at 2:50 PM, Andre McCurdy &lt;<a href=3D"mailto:a=
rmccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;&gt; Setting IMAGE_FSTYPES_DEBUGFS to the same value as IMAGE_FSTYPES c=
an<br>
&gt;&gt; lead to creating a large number of DEBUGFS filesystem images, many=
 of<br>
&gt;&gt; which may not make much sense (or may not even be buildable).<br>
&gt;<br>
&gt; Ping.<br>
<br>
</span>Ping again. Any issues with this change?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;&gt; Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail=
.com">armccurdy@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/conf/bitbake.conf | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt;&gt; index 9696273..15feb57 100644<br>
&gt;&gt; --- a/meta/conf/bitbake.conf<br>
&gt;&gt; +++ b/meta/conf/bitbake.conf<br>
&gt;&gt; @@ -757,7 +757,7 @@ require conf/sanity.conf<br>
&gt;&gt;=C2=A0 DL_DIR ?=3D &quot;${TOPDIR}/downloads&quot;<br>
&gt;&gt;=C2=A0 SSTATE_DIR ?=3D &quot;${TOPDIR}/sstate-cache&quot;<br>
&gt;&gt;=C2=A0 IMAGE_FSTYPES ?=3D &quot;tar.gz&quot;<br>
&gt;&gt; -IMAGE_FSTYPES_DEBUGFS ?=3D &quot;${IMAGE_FSTYPES}&quot;<br>
&gt;&gt; +IMAGE_FSTYPES_DEBUGFS ?=3D &quot;tar.gz&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 INITRAMFS_FSTYPES ?=3D &quot;cpio.gz&quot;<br>
&gt;&gt;=C2=A0 # The maximum size in Kbytes for the generated initramfs ima=
ge size.<br>
&gt;&gt; --<br>
&gt;&gt; 1.9.1<br>
&gt;&gt;<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114387b8c8eead055f823503--
