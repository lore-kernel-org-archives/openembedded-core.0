Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5290E72F32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 07:33:55 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id g138so3460338itb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 23:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=fXY5pxz7B4PMKPSkzHNgELkhQx1fK6dmIAcBqgtUNbM=;
	b=sGpKhp8eJW7SMHO8A0nbgJ+F7qrbKnZW+mULxsCARLqIg+9M09RA9rfHO+lZ7zpjDJ
	WMH1mWe6OaEJ8GHlT6PgDbhIP9IntJfuREv2GX0iKIPNUhaaRsTY3KIfvw1xGnU0lhwZ
	MF9jJ9PqEzhv+jKGN4CaCW8VliDTn/Wm/+8KvD9rnVeuq+PGpy8mh+VHdZ/0U27pePBt
	2tfDVvhfsASahe5+YiYhuNkzsOOr/xQyJAvNZSzkyF62dxdh2eq9LpBAl6KPZCA9gNkb
	y6tbXhMoPIR+Mc6i7AQI711JCqSUR/xYnzEet5tCOXWG8GLsKH/VAdCzBTOMh8QMXtdS
	eU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=fXY5pxz7B4PMKPSkzHNgELkhQx1fK6dmIAcBqgtUNbM=;
	b=rHzjHzJYVRoGk0Tlm3IiYNDFMvFod8f3c/lQGik0cetXkI21a96E2vOOwQol9Aj6tF
	iE0tu0wheJsWccppsv+GKxT/rSW7Sjrz8+Jr0Zt28ty+Z3YHFPd9eKyoE26rHQYefXJd
	3lDe5+S9pawnh+fzIQGYevg3bBcfDhK8CAkf18J5B6hp+mOP2vCtuP5B2T6NW1YhekcS
	nhNfi84e5OGsI6jjhyIhSz1pBkgI5oh2vxDe393r6Izh6iY5nQhW4OEUi9ZDw00Zl97B
	wXARdy1zgyZAOb5rXjIQgsZryuC/bQn/a4y1srLyndoNirT6/utarkyoYrO+LtabM5U2
	4jFA==
X-Gm-Message-State: AFeK/H1Y4a5zaRvrXOxa8U/BW0aJV+/ZbR2kWQVEuKnEtPtgYJgyITZA8u8TBGLe1ZlP1ije
X-Received: by 10.36.241.15 with SMTP id c15mr833554iti.77.1489131237024;
	Thu, 09 Mar 2017 23:33:57 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DCF9.dip0.t-ipconnect.de. [93.232.220.249])
	by smtp.gmail.com with ESMTPSA id
	o191sm4090115iod.11.2017.03.09.23.33.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Mar 2017 23:33:55 -0800 (PST)
Message-ID: <1489131232.7785.390.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 10 Mar 2017 08:33:52 +0100
In-Reply-To: <CAP9ODKrinftPt-L9-voxmpG6Fs0L7x2dLmEnCwkWUZgGWD9ZLQ@mail.gmail.com>
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
	<d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
	<CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
	<ccfcafd7-cd74-3330-2a64-ccd1e7a27984@ossystems.com.br>
	<20170306181327.GA18694@linux.intel.com>
	<bad2d5fb-ee7d-e32f-7f97-da988d126f0f@ossystems.com.br>
	<20170306190728.GA19275@linux.intel.com>
	<CAP9ODKrinftPt-L9-voxmpG6Fs0L7x2dLmEnCwkWUZgGWD9ZLQ@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 10 Mar 2017 07:33:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-03-09 at 18:11 -0300, Otavio Salvador wrote:
> On Mon, Mar 6, 2017 at 4:07 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > On Mon, Mar 06, 2017 at 03:48:00PM -0300, Fabio Berton wrote:
> >> Hi Ed,
> >>
> >> The main motivation to my patch is prevent to duplicate entries. For
> >> example, if I add to my fstab line:
> >>
> >> LABEL=data           /data                auto defaults              0  1
> >>
> >> and add to wsk file:
> >>
> >> part /data --ondisk mmcblk0 --fstype=ext4 --label data --align 8192
> >> --size 500M --extra-space 0
> >>
> >> Final fstab will have two entries for /data.
> > This can be easily avoided if you remove leading slash:
> > part data --ondisk mmcblk0 --fstype=ext4 --label data --align 8192 --size 500M --extra-space 0
> 
> HACK ALERT!
> 
> >> In most Linux distros mount /boot partition, if we have kernel image
> >> or boot script to update we need to mount /boot partition. Why the
> >> reason to not mount /boot?
> >>
> > The code that skips / and /boot was brought to wic codebase more than 4
> > years ago: https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=75c143a7aef46ecea07cf33edd2b1a0192e10149
> >
> > I don't know exact reason to be honest. However, I think we need to be careful with this
> > kind of legacy. It doesn't mean we shouldn't remove it, but it should
> > not be done as a side effect of the patch addressing absolutely
> > different issue, I believe.
> 
> While discussing this with Fabio here, at O.S. Systems, we ended
> agreeing that wic touching the fstab is wrong. The fstab should be
> prepare as part of the image and not mangled during the disk
> generation.

I agree that it is a hack, and I also would prefer to not have wic
modify the existing rootfs. That also breaks when IMA is enabled,
because then the content of the /etc/fstab must match the security.ima
xattr that was calculated for the unmodified content.

However, it's a problem that doesn't have a good solution. The image
recipe which describes what goes into the rootfs and thus determines the
content of /etc/fstab has little control over the IMAGE_FSTYPES - that's
typically set by the BSP or the user.

Suppose IMAGE_FSTYPES = "ext4 wic", and the WKS_FILE has multiple
partitions and thus needs more entries in /etc/fstab than the
single-partition "ext4" - the result of do_rootfs simply cannot work for
both.

Right now, all one can do is assume (or perhaps check) that the right
IMAGE_FSTYPES are set.

> The mangled fstab is disastrous if someone uses an image upgrade. The
> generated tarball or filesystem WILL NOT be the same running on the
> device as wic will add entries.

When do you take a snapshot of the rootfs? Is it as another do_image_*
task, via an IMAGE_FSTYPE entry?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




