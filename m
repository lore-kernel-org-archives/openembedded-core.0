Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id EBD83798D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 15:47:51 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j9-v6so13472792otl.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zAEdtIkzXDF/yHQrfu9W34NdAMj6FKOGG2WeH2XjdEw=;
	b=C2HX8aKTUNkzKmZSx2sVK95yhzAGIEZSeysEDX26RuYCnsMfNDqMRS8LlP8w498CmI
	M1Fvscv0vhzkikzglv+OV/GZtS98k9oCYN/364CCRHP6VNfsdwGS4bgKZL1LdY0F5ENt
	BU677A5AjKQCNE8dkPFmWfGkX6mXmXhGF5ZFIehNQu/ztz5i4Lqnr/JKzsxhy2LD+vMO
	B0JDWJK87nIfU/mOgMJbgSDuYH7bWeFzEJR+WlEbXlUqPqfuqd1HQOITnBRk8QwZLuX1
	Qsq3Rp+iehYgsyQIywHMN3GGigLjd8vNOSHBhe76S5EEDOP8H90lyJDvTIj2sJQZdlf7
	4QeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zAEdtIkzXDF/yHQrfu9W34NdAMj6FKOGG2WeH2XjdEw=;
	b=nI6AHIKA6hWEMdpumdCGg2nAyEamUqRZULSyo3ElnQ56jmnoF6SVniTwjQfXpPxKC+
	WJ2nYq5P7uZGx/sdt3FuqL+jucoi80j0G0bLX8SgZsi0wQES1CC1u7jXRkwDFGluiYLw
	78kUgJI1ercfHXfYT+jfAdaOycN3HZ5rZSFgX10nGbdjan8nrKrRhpdf8dpgik7GV1bF
	7TgCpSLBl1/IgkMj2YKhrH5DGaFIaHjLkRY8XxeuWmxxA5/L3ICwK+gqMEkr1p3sazuB
	ae3HTXYp4MQYRxBt7MRWgyk5OEsPRJ++eAdjEt2EVk1jfSwJAmlf6SwO1cH/sdJq13GK
	ZlXg==
X-Gm-Message-State: APzg51C4d94XFpofCBQpidbA1HRhUn/mO260kJkkI9klTzdviN8uMf3L
	QEuRybmU3CK92CY1uzy1uBmZ0LSe/7wUHeRbkdfkgA==
X-Google-Smtp-Source: ANB0VdZl8j2vB3sQCFmUg488t5nLUhDHNr/RtuzqQBkNxHxhJs3la2DFSbJn6iBbSIxRCcy0MCQ4pN9VcCrcutH3rgw=
X-Received: by 2002:a9d:2253:: with SMTP id
	o77-v6mr27450553ota.204.1537544872962; 
	Fri, 21 Sep 2018 08:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180916054532.1312-1-hongzhi.song@windriver.com>
	<65182ac2-33bd-a68a-be2e-7851809b4329@windriver.com>
	<b1c2a3c9-49e2-851f-246a-0328a956c21f@windriver.com>
In-Reply-To: <b1c2a3c9-49e2-851f-246a-0328a956c21f@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Sep 2018 16:47:41 +0100
Message-ID: <CAJTo0LYXBU3wB-TKq4y_8fNnA7yiuU+6Qr2Pfnhr-11+9e=cJQ@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3 v5] udev-extraconf/mount.sh: add systemd-mount command for systemd
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
X-List-Received-Date: Fri, 21 Sep 2018 15:47:52 -0000
Content-Type: text/plain; charset="UTF-8"

I just looked at this.  Didn't we merge the old patch from April and
not this series?

Ross
On Wed, 19 Sep 2018 at 10:44, Hongzhi, Song <hongzhi.song@windriver.com> wrote:
>
> Sorry for ping.
>
> The patch has been merged.
>
> --Hongzhi
>
>
> On 09/19/2018 05:37 PM, Hongzhi, Song wrote:
> > ping..
> >
> > --Hongzhi
> >
> >
> > On 09/16/2018 01:45 PM, Hongzhi.Song wrote:
> >> v5:
> >>      perfect a few codes based on v4
> >> v4:
> >>      fix the recursively dependency for the systemd-mount
> >> v3:
> >>      perfect syntax
> >>
> >> Hongzhi.Song (3):
> >>    udev-extraconf/mount.sh: add support to systemd
> >>    udev-extraconf/mount.sh: Fix the recursively dependency for the
> >>      systemd-mount
> >>    udev-extraconf/mount.sh: Skip the entry in /etc/fstab when using the
> >>      systemd-moun
> >>
> >>   meta/recipes-core/udev/udev-extraconf/mount.sh | 92
> >> +++++++++++++++++++++-----
> >>   1 file changed, 74 insertions(+), 18 deletions(-)
> >>
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

