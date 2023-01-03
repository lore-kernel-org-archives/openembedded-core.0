Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2C8C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 06:14:09 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.57614.1672726443538288298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 22:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X0ARfQ75;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id q2so30876991ljp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 22:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bwhbzJ8zu1eIYa5l2XkPEKOCjcbido7CmXzvr+jS4z0=;
        b=X0ARfQ75OCWAj1zcPXAi5VdkpBTOE5p+sTPf/mIZUh+j3iJXjJ/AT9EW5vGoIKGlkl
         q/S7PpZSKkkyDTGKrq9O+ExT5Gr/1ekVfv6gO/CYvwsv1evp0vzYykbzgzjPorUFgtKL
         O7563aBmg+8hYhx+XCSX5knV4ekNDma3B9gclxIS1s9Bo6xYXVNlelJBXL9MoUYWo6CF
         y+LxLJyl2LU9hmNw+0MzLrZuJPgpVYYRl5demOtk/0+cz2FTrN7r1Xg1ckhhkYX30LPN
         lhMTpbGgNVz/zMwSzG7Z05kaKNESSztGdqZGdaRWfzgkbTNt/gfHsrqp6wDQ7oC6lAzH
         WHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bwhbzJ8zu1eIYa5l2XkPEKOCjcbido7CmXzvr+jS4z0=;
        b=sxgkDAyLmOcOSnRmTHWRfZkI25f6eq/BXyzzqOYhObSPIiBuECvyav4tzMKvlBmaJb
         Pt0Hg8986EAjmXQhtWf5N5vsqY3ccuj3NoxGYIOT6FUOpgGMpCvRX2yVOQ9E2yXQc1WL
         4vvdUfMTLfHsvHrYFAN06ctCnqT5bfMKShUEGf3aTYBqhquROnX0+ikLGCmpNu76NWOU
         g6mHsnQ+Tpo6/1i3hnvJruj00eegS4sAv/X0u6e+vQAZKEVsXlLczRGqcgTqKo4OLRtc
         uinfMokd9o6Jpuq+qLwrcUDShOO4VdYjxKvvYxcnz5X4voKvABkgkTwApdxIjBm6YGxQ
         swyg==
X-Gm-Message-State: AFqh2krxghAK8zBRDE0T4/31XFiBx2PFkxSocxf5PXNCX6kyyZvGsPu1
	QXkZd7coRyNa5Q7na9JqlgDMnaVtsuLKM4QC975r1gp/1hA=
X-Google-Smtp-Source: AMrXdXvNoUVjQXTC1pLpdDZI0SaVc2tCA+bpgMoukm/sv0s6RxcqvvpswFCowfp3sE8GnjPYb6GiEavwJmT1ntC9SuI=
X-Received: by 2002:a05:651c:220d:b0:27f:d80a:b7c1 with SMTP id
 y13-20020a05651c220d00b0027fd80ab7c1mr1070654ljq.87.1672726441072; Mon, 02
 Jan 2023 22:14:01 -0800 (PST)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 3 Jan 2023 07:13:49 +0100
Message-ID: <CAApg2=T6gxWL6W0df=wxBJgGTBPDYof8AdM_MQm1mBtAG1kThg@mail.gmail.com>
Subject: NVD data format change and cve-check migration
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000539bba05f155f90d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175333

--000000000000539bba05f155f90d
Content-Type: text/plain; charset="UTF-8"

Hello all,
NVD (which we use for the cve-check database) has been working on the new
format for some time. What I understand is that they plan to retire old API
and all the feeds (like the one we use) by september 2023. Has anyone
started working on migration of the cve-check to this new format?

The current timeline: https://nvd.nist.gov/general/news/change-timeline

Kind regards,
Marta

--000000000000539bba05f155f90d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>NVD (which we use for the cve-ch=
eck database) has been working on the new format for some time. What I unde=
rstand is that they plan to <span class=3D"ng" style=3D"background:rgba(0,0=
,0,0) none repeat scroll 0% 0%!important">retire old</span> API and all the=
 feeds (like the one we use) by september 2023. Has anyone started working =
on migration of the cve-check to this new format?<br></div><div><br></div><=
div>The current timeline: <a href=3D"https://nvd.nist.gov/general/news/chan=
ge-timeline">https://nvd.nist.gov/general/news/change-timeline</a></div><di=
v><br></div><div>Kind regards,</div><div>Marta<br></div></div>

--000000000000539bba05f155f90d--

