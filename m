Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 486886BA53
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 17:43:46 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id v11so30496753itj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VzrK8agv5kzYftQ40FqxkV4Qlh8Z8ZqNz+WqtznIvD8=;
	b=B1rkYjx689GRB1v9DDzHLZmOCEhmDPagR6sPorlmT5e5NLG4JpIG7B6+CgyyXjfmPr
	ubrx1hcKuchI+OV+pLQ8h3Uj5kl+EeAa7OEp6EMtwZlQ6/uW0CYpGhO1ztNs56Re0xOg
	L3i4K8dLemb3fvcCDzUFPsnYNJ+BNv1wt70tULKkCaZGRoDbsg5U9yYfJH/C73l3G53T
	PVlWneDUDp+O9J1G2jpkGJI/icXIOGx80zg483PRIgv8az/W5A3JnXe8pNpgVU6Kd6tE
	00PwFmm3wQHKIZ+/0NiOl1H3vN69AFT2+2lrv0AeutkQiXmWaXfqpBnIC/cEWj0lBcYf
	33Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VzrK8agv5kzYftQ40FqxkV4Qlh8Z8ZqNz+WqtznIvD8=;
	b=hgvnRmtBeknQJ1ps/R55jHwXzDv/T4T+i7yDM2mqT1T5jTNB3vFDsTAkGn2Ye6kyMD
	6uaDyCox7dXCBvMLVmL+/dSsKcbmUTf5EPQ3nfWmrkVmSONtiSlnAIHIHrggeB7uLmzc
	oG85R6I+XTPkWHpibaLavKb9bO97bvkbzZKuYZQ2BvKc1xk0wIBQBT4HjM9yQzVcKC/I
	uIacsX1JaT8yri8ARkla5CXklHTbjZCmFEgf19oiAVdq6Bj0ewYIkUqLd4RctSIHEOnp
	vtWrVGgf07poycRx94viG6qfaqwhNwZRCRAOgQ6ibEJLpADV/Rej7CmGXwEkfpdc+XT4
	3Hqw==
X-Gm-Message-State: AGRZ1gK6nyY1BHbGMgX4DXBZaSkaL0HUNS/2MfOZQZRbvPeMz1BqfU+u
	6hEecM/R1oqF1rNByZK5DWqfibEN8QBfsbfHbrpW+A==
X-Google-Smtp-Source: AFSGD/Wy1fVLglYRAsUrrkDezHB9CXL4Dcnh750DyUe69V5E/kZNsOq2yMdGyVriDRph/lY6Z1yqVga443lS3uYu1lQ=
X-Received: by 2002:a24:1d8e:: with SMTP id
	136-v6mr6313924itj.62.1542303828022; 
	Thu, 15 Nov 2018 09:43:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542247292.git.Qi.Chen@windriver.com>
	<61202575a1c0b4be44534526dd22fc85c9dadfd2.1542247292.git.Qi.Chen@windriver.com>
In-Reply-To: <61202575a1c0b4be44534526dd22fc85c9dadfd2.1542247292.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Nov 2018 17:43:36 +0000
Message-ID: <CAJTo0LZi1ouNpFqrhQ0EhwWfXcX3By54-YCBY6wuifaOjBmw8A@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] busybox: use example.org instead of google.com in wget test case
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
X-List-Received-Date: Thu, 15 Nov 2018 17:43:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Nov 2018 at 01:57, Chen Qi <Qi.Chen@windriver.com> wrote:
> Use example.org to ensure it's always reachible.

Is this because of China's firewall?  You'd think that google.com
would have excellent uptime.

Ross

