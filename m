Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763DDC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 00:02:53 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.4850.1635292963967837790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 17:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HhezjT+f;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id v20so707274plo.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 17:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UlBADfiyBaaAc0REzGt/fWeQcBupAfWiieCB+8r4U74=;
        b=HhezjT+fOaeBhG0BAbFDxQ/MPUqXRgN7njmlJ4tHqdBg6XOaCR5ZzhnFP1yP1DZ6Fc
         mJZ3p/LzKRzYNI2+ritMPtxQkJt4zOIBEuTd7KLRc0ddk050n84vwE1SSJaznerhAFK3
         hdiWwgtzQFV8Wp7+54S8y0YLi34JpXOvYRrk/hITVGXQnQQrshKPIAJNoun/s6cBrC6t
         fEzFUpPEYqWpzLb7k1SQpMR7aHm4Adour3hBFH1JJ06dLVW7tEskTJh9gMwrfiBgEQsS
         krfxmphIt9+BLQ1zeP4bpXxejI2BUa6ijQr6L0UDdge7Ub4lgwMklWCqN3wiwZzImxva
         PBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UlBADfiyBaaAc0REzGt/fWeQcBupAfWiieCB+8r4U74=;
        b=mRWch9Koz5i2Cqhl71jM6267tBTKFIbFw4LKbh4VR6s9EUCx7fFx7FOieCfK7Pdri6
         i//BuwSKPuPT4B0y4j6bUxEiem0A6vNruoL2JF15pAqvXi960FUvQctvGuWzKfk4/inF
         +GgBVtmuDDGpBiV3q3GC9NMTaNxmBWJ2eHu3QobQSmvTrWSAncL7quDiD32Noo82JLQh
         7n5aW41H5EZldsgG3+0k+5Nl45lO4fHB1ISXHQlJOTRqnQsdVrtnYMyvombdohp3ayAd
         HchcjSEBpBr07StSfV7y0K1T3xIu5AkxQ/RH4DT0FYBrdoiIWxdTGKMHtSYS1eu6EC0i
         FwGA==
X-Gm-Message-State: AOAM5311/dYyPmJQbRK94fYEeATtkjf7vkEN2ZhVHtNECaYxc9CFlFaT
	aU3G8XePf+lCA1fkB9yGC+T5JusQ+fhhSmanYDM=
X-Google-Smtp-Source: 
 ABdhPJwxhlpO7RO4ZRLkiIrnEH3yW/44TymFQC+Oc70JR2nWjcOfKz6ZWliKeTOi/t7lxI6KZdbEhfnYQVuOTkcTINw=
X-Received: by 2002:a17:90a:f184:: with SMTP id
 bv4mr2132854pjb.169.1635292962896;
 Tue, 26 Oct 2021 17:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211023065203.1624178-1-raj.khem@gmail.com>
 <16B193358866A17D.20978@lists.openembedded.org>
 <CA+chaQfFk1mNBbBERcbAqvdK4dGuXpyGzUtc3jyGxXRhShjpgQ@mail.gmail.com>
 <5036e93f-011a-57ce-5725-245097b86cb7@windriver.com>
In-Reply-To: <5036e93f-011a-57ce-5725-245097b86cb7@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Oct 2021 02:02:31 +0200
Message-ID: 
 <CA+chaQdBsitXP=y=nfpBDczQZ0GPEC=947iUdJFHSGGm7t+r6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade to 1.56.0
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Pgowda <pgowda.cve@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000028404405cf4a50c7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 00:02:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157462

--00000000000028404405cf4a50c7
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 27, 2021 at 1:44 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2021-10-26 8:12 a.m., Martin Jansa wrote:
> > Looks like it was caused by rust-cross issues reported in:
> > https://lists.openembedded.org/g/openembedded-core/message/156516
> > <https://lists.openembedded.org/g/openembedded-core/message/156516>
> >
> > Re-building libstd-rs in empty TMPDIR, just for qemuarm MACHINE without
> > using sstate worked.
>
> So sounds like there is there still a problem to be fixed...
> If you create a defect in the YP Bugzilla, Naveen will work on it.
>

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14613

--00000000000028404405cf4a50c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Oct 27, 2021 at 1:44 AM Randy Mac=
Leod &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windr=
iver.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On 2021-10-26 8:12 a.m., Martin Jansa wr=
ote:<br>
&gt; Looks like it was caused by rust-cross issues reported in:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
156516" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-core/message/156516</a> <br>
&gt; &lt;<a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/156516" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/message/156516</a>&gt;<br>
&gt; <br>
&gt; Re-building libstd-rs in empty TMPDIR, just for qemuarm MACHINE withou=
t <br>
&gt; using sstate worked.<br>
<br>
So sounds like there is there still a problem to be fixed...<br>
If you create a defect in the YP Bugzilla, Naveen will work on it.<br></blo=
ckquote><div><br></div><div><a href=3D"https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D14613">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
14613</a>=C2=A0</div></div></div>

--00000000000028404405cf4a50c7--

