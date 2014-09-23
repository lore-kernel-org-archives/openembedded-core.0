Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9F771510
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 21:29:22 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id j107so4020121qga.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MnyaYmbXywTGygL+QGOWQmHdmv/MzPIRJq8R+LVVM+o=;
	b=RxmqAh1FjlKLhQBB3PwWoFmjGz0AbeKGgjxix9uXblHXxI7wpi8cHdRB9DW1mxRwcm
	Tw4Gq4BfvaaW2+XuFyxg56MV4ElX7Aq3SxCUHlZsakWqiXr402E+cPN/XRZbFt7aENHA
	nEqckwTalJwh1ax/tWcojqjc890mdvXiOGINA5dk2D2t+cybL7fB/of3QIi35gIzXhEH
	zbPRGQF2q2WfdTHd7wpkIVwtSYbClrLkDtflg+1MedAv/g1H5HaAa5wn4AOeEcFpJ39T
	R5UEr19lrDOduVtK7uZHbS4hUvhxmIkPVieYHyfB03lgJkqO4GpSPLFe7SCTVEj4MiBK
	cEeg==
X-Gm-Message-State: ALoCoQnfqUo9HJGp5CQY4dSxOCcncTgEGXZi9/iPmmBVSaJAMMZqrV3rcbjlYkWBZm0VtKJnydL6
X-Received: by 10.224.103.65 with SMTP id j1mr3542410qao.17.1411507763599;
	Tue, 23 Sep 2014 14:29:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 23 Sep 2014 14:29:03 -0700 (PDT)
In-Reply-To: <20140923204205.GF2480@denix.org>
References: <1410909001-3284-1-git-send-email-denis@denix.org>
	<1410909001-3284-2-git-send-email-denis@denix.org>
	<20140923202717.GD2480@denix.org>
	<CAJTo0LZv3xoTQ8kX4DXcBTRE5LMgtuWj_D6Kzg_tS5M7W0WuiQ@mail.gmail.com>
	<20140923204205.GF2480@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Sep 2014 22:29:03 +0100
Message-ID: <CAJTo0LbSZrc33VD8hDe6Fo+n9Pg2N+JdmYUVqET25YdOncBobw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] u-boot: update to version 2014.07
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
X-List-Received-Date: Tue, 23 Sep 2014 21:29:27 -0000
Content-Type: text/plain; charset=UTF-8

On 23 September 2014 21:42, Denys Dmytriyenko <denis@denix.org> wrote:
> If it has to wait until 1.8 window opens, I'll overlay it locally and will try
> to update to 2014.10 as soon as it gets released...

That would be great.  As I said I've queued 2014.07 locally so
assuming it continues to build that will go in.

Ross

