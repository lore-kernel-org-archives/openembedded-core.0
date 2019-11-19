Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id D4A807F81C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:51:35 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id d3so8296976qvs.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O7OiQtZyXOy7s8vaZyn/aVh6rOT5qjvTG3Vdm2/NYc0=;
	b=BQoaeDKc+46aPS112xnLlDKXgGytOTT4iVB/blMHx09CnoYaxS4a9viZa4+fpFG6S3
	NZPdGSR7CmxSynUUdgjIyIKtn47TbKswnDDlSHUH1dHPKF1Rv8Gpd1cQx4P6hPHSyqku
	ww3rky36TYPVVyw/dIb0O5csRgD6Fn4zKePjbVZQ7OtzssU/Yq8ZegTziZBMKcaUAyTW
	BbWmFRTyuWsR4K/XQa4p58poDxnWqpjqpkrR2L8oTNLwaCqjcFoDYkIa9hOtrCDAndiV
	mBpwNwNLAtQDJdrp7siUI1Ig2HJGAFbjKxp9xHsaZdXrwibg6rERG9W9Uj8nj7Oc7M8F
	gGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O7OiQtZyXOy7s8vaZyn/aVh6rOT5qjvTG3Vdm2/NYc0=;
	b=fzONhUeM4fhdr7CTl9lkeK+NmPGSp03C3ylRRUTxC/ekWnLV4V9zpSB1Pa2Za2Y3SN
	JMl0EaLN4P1D15OII1dE3B437Q36dfXeKGt712b1SHoMSP63ay4Uh/sjnqDknRBKzzCg
	4xsQ+Xl8B00Ytwcb5vMHe/ql5aS6s1rueiNzQtkhXYebvii8u5z1cG4oUDA0YzckUl9j
	CfIujAiybw3p9Q+dFidsz7+I14fZb/nl6f+H+B5vBBtrOW/a74vIy1bSi3NFhAhDHVuL
	KkapYxAqHesIlogqySyo1OCqWth2OTRNcWc24S4klbRfWULjRz20krD1Fk1ihqBC72lW
	+xKA==
X-Gm-Message-State: APjAAAUy4sdwj0DirRI2eJZSpez8L1wDJOjO914oKG4X49JWAAqcC3wj
	xC6ntqxJ1l61H/rRcON5ZzLDHvEY2JoSaYCw8/4=
X-Google-Smtp-Source: APXvYqwzZsYDhVKe4dg+o8/trwWn+/V27CmN/oGCCb0sT2TqUxUg2NjzkkTll9w+PtO/q1JTSRWr6e6OxUZp6aEA/gM=
X-Received: by 2002:ad4:4789:: with SMTP id z9mr31663368qvy.109.1574178696473; 
	Tue, 19 Nov 2019 07:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-13-alex.kanavin@gmail.com>
	<CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
	<CANNYZj9rV_qvPV0j7oPwAUw7MCEeVj1NOYXSVGfj_k9w_yEPdQ@mail.gmail.com>
In-Reply-To: <CANNYZj9rV_qvPV0j7oPwAUw7MCEeVj1NOYXSVGfj_k9w_yEPdQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2019 07:51:05 -0800
Message-ID: <CAMKF1spKz9eE6DjDmqHUC_ak0joX4jwrzAVFwDdmKdUtyBVaWA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Tue, 19 Nov 2019 15:51:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 19, 2019 at 3:41 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 18 Nov 2019 at 21:09, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, Nov 18, 2019 at 6:33 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > The homepage: https://www.kernel.org/doc/man-pages/download.html
>> > specifies that the latest tarballs are published one level up
>> > from where we currently take them.
>> >
>>
>> archive is a better location for what it's worth. Since long after a
>> release, the tarball may disappear from
>> level up but chances of it being in archive are higher. So Let's not
>> change this URI, unless there is another
>> reason that I missed.
>
>
> I have to disagree actually! The reasons are:
> 1. Taking man-pages from archive means we are always shipping an out of date version, particularly if a tarball is archived months or years later than it was released.
> 2. Specifically here, the main folder has all man-page releases going back 1.5 years, which is longer than yocto release's support window. Meanwhile, the archive is missing several latest releases.
> 3. Even if a yocto release ships a version of man-pages that is then archived and removed from main folder, it is trivial and safe to backport an update from master. man-pages tarballs contain pre-built documentation and don't threaten release stability.
>
> If this becomes a real problem, we can also write to Michael Kerrisk and ask that he doesn't move tarballs around.

think about building a release after many years, if we do not have to
update SRC_URI to point to archive then its one less things to do
given that the same copies are in archive for current releases too
its just better for long term.

>
> Alex

