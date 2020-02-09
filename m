Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A1E6B60B0E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 23:35:26 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w8so3837216qts.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 15:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=unlWHYtIhfYZtEPSdBTg1pm7IBlHK7R1EbkOaw+Fh5Y=;
	b=AgMt6qtVfE/62jWUzzrPbcedNevY/GTJwTIveIRkNAv8ZYRoO1mrGC92tbEtZz3wAi
	DzPas+wGqRhlue8ViOpb1KDTYRaedtoFmFGvZesZfOkXj2FeC72TepN105O9shIVsTBv
	lpNLOu1GpNtkEpJl3unxD35X5mI39x0m1MUGDHojXXDxsK5htcPf9F/x72NKJxn5iMeG
	BiLFhyl4iFkcoBGSETy2WcK9lS6MRPRTMaQizUk8Qp3zwnZSS3bHxF4fJp8fr5RBk7u8
	sJbV6vUmjgm1nrF7uT2a31VEICL9vQRGiJ/FRlyMLMCVlCEQFduYgu3CTwZWWeF5bXj3
	TP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=unlWHYtIhfYZtEPSdBTg1pm7IBlHK7R1EbkOaw+Fh5Y=;
	b=lH6Nq9K2xtpHftHdvEcgUL7juo/ey3/6lPR0HK6gMwrKFztEWtFQh14/Gq1zP+BPtj
	ceeKZ182YOlisfDg7kONY/3mm5dlI20ezMQmpgBONiFs1B8sENkvJra/yzuzJrLPDwPy
	DQpYZJ+azNcbPSplNpHm8tB7NWgmYs+oOJdYnjJcSLhktTqnkzZ3irx7BJCpa7M/kjXT
	wjErRtG4S9jdwU4m2WMH/JbVVPyYVg7/Mb39T8YDLOjvi4UYwrGp8OC30YlIk2dbEqhR
	Zm5SgWyPidhpb2Wcmsg/VtebX5iEiw/FlAL7jYoZFZFnFVvpSnyfceax1H97sandFTAh
	yfFQ==
X-Gm-Message-State: APjAAAW/CYEXzKAY3M8GfrYwII/3T/DTeJSIJIr/Jj1K+vJMxq37Islg
	LtdeI084Zk/J25gW8oW0qDBjLFO3kNTf5lP97PfzxFWq
X-Google-Smtp-Source: APXvYqxdKRowY6FlQwP/X41mV4hqJ2RFIzWNdJZpoIKk1MWDsT48NITrREBd7vnphGOSOOgX4Ub5YaMgbQ8koCpg0NM=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr7816616qtn.378.1581291327178; 
	Sun, 09 Feb 2020 15:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20200208000110.29065-1-scott.branden@broadcom.com>
	<CAMKF1spdaO+wpwowYzfu=vigB+tSJPtwS46eimFenj=0hmhLFA@mail.gmail.com>
	<55bb9c66-a419-c43d-111b-e5442db8df91@broadcom.com>
	<CAMKF1spFfVojndyrOXa6TFXHUO-DNR3xr3Dj7jwGa8g--Pdz1Q@mail.gmail.com>
	<2159565f-eaca-697d-0711-e39aeccb1ba2@broadcom.com>
In-Reply-To: <2159565f-eaca-697d-0711-e39aeccb1ba2@broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Feb 2020 15:35:01 -0800
Message-ID: <CAMKF1srW_aR=4TZBxTdnTXwRWZg0u7TDhiNme9JsE8NSzXy_sw@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] x265: add x265 recipe
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
X-List-Received-Date: Sun, 09 Feb 2020 23:35:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 9, 2020 at 11:27 AM Scott Branden
<scott.branden@broadcom.com> wrote:
>
>
>
> On 2020-02-08 11:18 a.m., Khem Raj wrote:
> > On Fri, Feb 7, 2020 at 8:02 PM Scott Branden <scott.branden@broadcom.com> wrote:
> >> Hi Khem,
> >>
> >> On 2020-02-07 5:12 p.m., Khem Raj wrote:
> >>
> >>
> >>
> >> On Fri, Feb 7, 2020 at 4:01 PM Scott Branden via Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
> >>> Add x265 recipe from latest revision of stable branch.
> >>
> >> I wonder if it belongs to core are there deps on it that we need in common metadata
> >>
> >> I simply followed where x264 recipe is located and placed x265 beside it.
> >> Both are needed when enabled in ffmpeg.
> >>
> >> I don't know if that answers your question as to where they should be located.
> > idea is to keep small and therefore we should assess the inclusions in core
> > we have many packageconfigs which require packages from other layers
> > so if ffmpeg needs it and is optional then it should be fine to keep
> > it in meta-multimedia and packageconfig in ffmpeg disabled by default.
> I don't see why x264 would be in core and x265 in meta-multimedia.
> Both should be moved to meta-multimedia then?
>

I followed the thread a bit and I see there are followups where
usecase for other recipes in core is now
established, where this seemed a leaf package being added to oe-core,
So perhaps it should be added
to validation loops as well like x264.

> I think you would also require a bbappend to fffmpeg recipe to add x264
> and x265 to ffmpeg packageconfig.
> if that is the case, why not move ffmpeg to meta-multimedia as well?
>

You would not go down that line of thought since these packages are in
the dependency chain for validating reference
images in core along with they being used by other packages from other layers.

> >
> >>>
> >>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> >>> ---
> >>>   meta/recipes-multimedia/x265/x265_git.bb | 20 ++++++++++++++++++++
> >>>   1 file changed, 20 insertions(+)
> >>>   create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
> >>>
> >>> diff --git a/meta/recipes-multimedia/x265/x265_git.bb b/meta/recipes-multimedia/x265/x265_git.bb
> >>> new file mode 100644
> >>> index 0000000000..796fbbc13a
> >>> --- /dev/null
> >>> +++ b/meta/recipes-multimedia/x265/x265_git.bb
> >>> @@ -0,0 +1,20 @@
> >>> +SUMMARY = "H.265/HEVC video encoder"
> >>> +DESCRIPTION = "A free software library and application for encoding video streams into the H.265/HEVC format."
> >>> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
> >>> +
> >>> +LICENSE = "GPLv2"
> >>> +LICENSE_FLAGS = "commercial"
> >>> +LIC_FILES_CHKSUM = "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
> >>> +
> >>> +DEPENDS = "gnutls zlib libpcre"
> >>> +
> >>> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
> >>> +          "
> >>> +
> >>> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
> >>> +
> >>> +S = "${WORKDIR}/git/source"
> >>> +
> >>> +inherit lib_package pkgconfig cmake
> >>> +
> >>> +AS[unexport] = "1"
> >>> --
> >>> 2.17.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
>

