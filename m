Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 27B7A73078
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 21:11:22 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id m124so5461195oig.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 13:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Bv5KqxiBPLIVeAoLvBCJM1SnNBiMA1YIILj/V9Dcjnk=;
	b=jqo+DofddZeG+c6AeiK75GhwyastM8vfYOANrSYpEw8oAUnzEoE6rT46WjavpKHPCt
	tEn+OEp0I0xLD9I7exD57ukXE7ff82z46Qc7R64oZ03Y9koEp6YInCTIsVyg39z7As6s
	USJZ/xD8beRQqSqQp8+4Dsokxut9JQPstEXtj7AWl5jhFjAbtyFpMyS5v28s5h8nuxq6
	jiT1uRB4JTnccr8fp2lIlPVYKcuNrsCw50AbjT7WSmJ+R+V4c55PNJgbxnIK9Mz3eHdb
	ldY2/5SMAEa6D2ilv7XZga3i4FVq1SHVjQ7xVchymflf4T1Jem3cRcs2G6qmmpSiftvG
	x4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Bv5KqxiBPLIVeAoLvBCJM1SnNBiMA1YIILj/V9Dcjnk=;
	b=m4gE2wHrzIf/WXXuv0oJRIM++soDcQeEFwUlpES+JGpFAcFhgWugeyjlxDwqlPJFqx
	l37qoYsMyeiZk4M93J5IC59gx/otenT1HLU04taVnvI2iVO62gd33qffOOtCYkwsdkbI
	9HrOzef3gfE0+6k6IeEuGkxUAz9GlKWU5cNKxE34qWb3sx4TWlDMF0bLWqE5P3QvcXIw
	EOz3sJFYpKsONRrUaNOpwcgJGn9ssvVsmQy3HlLDNfsibvoG2RGRhLanRmIrmXDzEp/M
	gAmVLlU6i5f7ypnAlbgk/wByRD3NzdFojEqYyTcJRWiiUQuE8xg0UukKUzA8PM7wEO2m
	D2PQ==
X-Gm-Message-State: AMke39m58Sc05xBig8v/M7i4ytgSl13p9cYrZgt2p7YWNz0AIv36Uw6F68Dz0v9flTIgzw==
X-Received: by 10.202.218.134 with SMTP id r128mr6982131oig.2.1489093883746;
	Thu, 09 Mar 2017 13:11:23 -0800 (PST)
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com.
	[74.125.82.170])
	by smtp.gmail.com with ESMTPSA id 36sm3366479otz.13.2017.03.09.13.11.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Mar 2017 13:11:22 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f170.google.com with SMTP id 19so65146815oti.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 13:11:22 -0800 (PST)
X-Received: by 10.157.48.59 with SMTP id d56mr8018157otc.81.1489093881955;
	Thu, 09 Mar 2017 13:11:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.26.5 with HTTP; Thu, 9 Mar 2017 13:11:21 -0800 (PST)
In-Reply-To: <20170306190728.GA19275@linux.intel.com>
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
	<d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
	<CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
	<ccfcafd7-cd74-3330-2a64-ccd1e7a27984@ossystems.com.br>
	<20170306181327.GA18694@linux.intel.com>
	<bad2d5fb-ee7d-e32f-7f97-da988d126f0f@ossystems.com.br>
	<20170306190728.GA19275@linux.intel.com>
Date: Thu, 9 Mar 2017 18:11:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrinftPt-L9-voxmpG6Fs0L7x2dLmEnCwkWUZgGWD9ZLQ@mail.gmail.com>
Message-ID: <CAP9ODKrinftPt-L9-voxmpG6Fs0L7x2dLmEnCwkWUZgGWD9ZLQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Prevent duplicate entries on fstab
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
X-List-Received-Date: Thu, 09 Mar 2017 21:11:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 6, 2017 at 4:07 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Mon, Mar 06, 2017 at 03:48:00PM -0300, Fabio Berton wrote:
>> Hi Ed,
>>
>> The main motivation to my patch is prevent to duplicate entries. For
>> example, if I add to my fstab line:
>>
>> LABEL=data           /data                auto defaults              0  1
>>
>> and add to wsk file:
>>
>> part /data --ondisk mmcblk0 --fstype=ext4 --label data --align 8192
>> --size 500M --extra-space 0
>>
>> Final fstab will have two entries for /data.
> This can be easily avoided if you remove leading slash:
> part data --ondisk mmcblk0 --fstype=ext4 --label data --align 8192 --size 500M --extra-space 0

HACK ALERT!

>> In most Linux distros mount /boot partition, if we have kernel image
>> or boot script to update we need to mount /boot partition. Why the
>> reason to not mount /boot?
>>
> The code that skips / and /boot was brought to wic codebase more than 4
> years ago: https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=75c143a7aef46ecea07cf33edd2b1a0192e10149
>
> I don't know exact reason to be honest. However, I think we need to be careful with this
> kind of legacy. It doesn't mean we shouldn't remove it, but it should
> not be done as a side effect of the patch addressing absolutely
> different issue, I believe.

While discussing this with Fabio here, at O.S. Systems, we ended
agreeing that wic touching the fstab is wrong. The fstab should be
prepare as part of the image and not mangled during the disk
generation.

The mangled fstab is disastrous if someone uses an image upgrade. The
generated tarball or filesystem WILL NOT be the same running on the
device as wic will add entries.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

