Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id B7FE261324
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 21:39:48 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z193so14463541iof.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 13:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1ft8v5gBUkE7bKTvFsJ7HLC5vE/IH8SVXB4NDXPVwxc=;
	b=kCnaqnLLG/emm2cqollXnoJx0z43xs2nAWX/OVcBSGln48y/K0klyy5cf1w8fRobbm
	cjB2LyDpXZih9H8Qehf4WpRiwYMd4D3TRzzgs8Ixn6yTf13XLonPYrVIJJWKI5UIR4RN
	fg0zDMUxBbeuEkQWI6Y9FU8XHGFlIgWSQpknHNKPSyLx0wpmmROHtd/3M7il/sya/vcC
	vdpRecW37QkZ9tt4nr6UDhWSaWjDwX/Go26yyL3VlNATZ4Ex+XcSsytqqok9bJdTtfvY
	s0lw5Y1PnGRxsaVokkgE8s1kXHnVbbTGspbgBKWbc/H8VnxyfDL+d229dk5gP8YiJzc0
	T+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1ft8v5gBUkE7bKTvFsJ7HLC5vE/IH8SVXB4NDXPVwxc=;
	b=IAxQU0NwD/U87ZslVDdLzDfXj4ZiK9qJGtcTvSwwpACSutAbkoPdu3csooJNc/BWlI
	y+Nn/B04gGL/YyNL6Io32dw6L8A41bBJUHFhj82+m8rAJVfL6AnawDF4r0MRvh1YNSNF
	qcdabx5rZLcLiJqlbymfkNnhNKSOXTI3bYK6UPg95EbZ//fvnvIVVDCsEZO5QU9o3j1y
	j2Bi9DZHn3HvEFLl87Wgt7uKgh0ystAb/3nsXGI31AyEAOezTlCKTIdYP7EEykpgun/b
	ZwBlVw3paFsTwxauXwRi2MbpPH1z/KOk9P9mgN1+WAeqqHOwe/TtORq8J6D7eb/tPO94
	eRZg==
X-Gm-Message-State: APjAAAXOTRNWooGwIpjYMP9VdYkWy9jRSX0mhPDFzAds1p5zjS9Qo81q
	4N66UzndiD219T3OIEASjjoqgVH6+HwUtic7H/A=
X-Google-Smtp-Source: APXvYqydOv1XAceDCbq6pMZ89/1M6a5RYqpTPrpz4juASPsUr8bsFDDKOG1VA/JdZC5i15e/VA+WQH5gQ0Oz2CcOiGc=
X-Received: by 2002:a02:cc1b:: with SMTP id n27mr3837945jap.122.1581802789703; 
	Sat, 15 Feb 2020 13:39:49 -0800 (PST)
MIME-Version: 1.0
References: <20200215094450.19705-1-alex.kiernan@gmail.com>
	<41bb4973-dc7b-27d2-aee8-7d9e2627018e@gmail.com>
In-Reply-To: <41bb4973-dc7b-27d2-aee8-7d9e2627018e@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 15 Feb 2020 21:39:38 +0000
Message-ID: <CAO5Uq5RGEXL1n+2D7bzz0gOT+wu+6cMzwvKvb5fj491SSUHgdw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/2] meson.bbclass: Parameterise meson.cross
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
X-List-Received-Date: Sat, 15 Feb 2020 21:39:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 15, 2020 at 9:18 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 2/15/20 1:44 AM, Alex Kiernan wrote:
> > Add MESON_CROSS_BINARIES, MESON_CROSS_PROPERTIES as a colon separated
> > list of meson properties which are exported into meson.cross.
> >
>
> I am seeing errors
>
> 13:14:54   File
> "/mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/classes/meson.bbclass",
> line 130
> 13:14:54     echo "[properties]" > ${WORKDIR}/meson-tracker.cross
> 13:14:54                       ^
> 13:14:54 SyntaxError: invalid syntax
>

Is that tracker from meta-gnome?


-- 
Alex Kiernan

