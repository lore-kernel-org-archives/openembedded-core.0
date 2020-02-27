Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 69A2A61135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 19:51:11 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id w6so383579otk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 11:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8XKWKpnKPWJ9WZfoCcIfSjSd2m/vgCpeU6d95cMq6zM=;
	b=pmB/lxfhYfx87vqTT57dMgGEewTy76VEmnt8sVvMlntpfGePlNXb1i+GCUOemIiYAf
	taaJ/tpsAeB+8ts0cjeeCMqAvGygSctSd+iOmO5POs8O0pwC97tjMeR/fB6c0WqO3Cby
	HmWVnwUS87UQkZ/oZN5697jlL/y58AOqXN6uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8XKWKpnKPWJ9WZfoCcIfSjSd2m/vgCpeU6d95cMq6zM=;
	b=BDWHQw1b/LCy8fYI7sKzX75pyhbW3zkmbkkTwvRoYXpyRgbnWaqFxeSDsiybBDt+Dd
	qsc+a35IQOD/PtUoEXiXWCzbOa5g8p/pAEQhvKTl6c+UwQUxaM81GtB0rfYhLqWpvZiK
	0to/D8QDQ5PKIMe5SuiEPL+zZ7IGjGl9mHro+fYpUP5YscXX936a66slqaAgiR4Aeero
	Jb3d+SRqQaYL6rZq5s/QybvUDS5ZnsNysFNtr34YUgytfEN6FaVEZr41BZnmqE+EEy3K
	E9EQehOvwhDYDK/+C6u0+8F/atRV9fdUiHsCD1aHPlE9yspZ0CgmY6tOEbI04AFSNjyD
	0IZw==
X-Gm-Message-State: APjAAAXFmjuOvRiu4JsNeNIx9WH8kiGiU8hqXVkywi9GrPIaXl5n4e7p
	zhwgWuDMMV9oXQAhaDBV+lJUmWI/xLphA5P46T2rsg==
X-Google-Smtp-Source: APXvYqwN7tZX2qfe/GNSuCVIFgKy4E1R1cdgsirduUpLia7f06G5Y5hZf4SBT3Dhj4PSyCGnwsYKUkHMQcPT8XelvFQ=
X-Received: by 2002:a9d:6a06:: with SMTP id g6mr381135otn.305.1582833072224;
	Thu, 27 Feb 2020 11:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20200227042658.19619-1-akuster808@gmail.com>
	<312d477b-f5f5-16df-7867-c5c9f5619abb@geanix.com>
	<4e4b134c-3ac1-814b-5055-3a539904f52e@gmail.com>
In-Reply-To: <4e4b134c-3ac1-814b-5055-3a539904f52e@gmail.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Thu, 27 Feb 2020 19:50:59 +0000
Message-ID: <CAM9ZRVtM2Yy3KEKtNue+8PV9bp1q+JmXinFDb1LoBp4a13_6qA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Add include-dir option
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
X-List-Received-Date: Thu, 27 Feb 2020 19:51:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Feb 2020 at 19:43, akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 2/27/20 12:12 AM, Martin Hundeb=C3=B8ll wrote:
> > Hi Armin,
> >
> > On 27/02/2020 05.26, Armin Kuster wrote:
> >> This option allows for the inclusion of a single directory
> >> for a partition.
> >
> > I am unsure how this is used in a .wks file.
> Yeah, the documentation does not cover this.
>
> This is what I used to verified it works
>
> part  / --source rootfs --ondisk mmcblk1 --fstype=3Dext4 --label rootfs
> --align 4096 --exclude-path=3Dvar
> part  /var --source rootfs --ondisk mmcblk1 --fstype=3Dext4 --label var
> --align 4096 --include-dir=3Dvar
>
>
> >
> > From the code it looks similar to the include-path option, but
> > relative to the rootfs source dir instead of the wic working dir?
>
> the --include-path adds an entire rootfs  to the partition. I don't want
> the another rootfs. The help file even says that.  I want on directory.
> --exclude-dir allows me to "exclude" a dir .
>
>
> I used wic ls {path to partition}:{partition number}  to view the
> contents  of the partition.
>
> >
> > But the include-dir value is also used in the destination path?
> Then please document it and I don't mean the "help" file which is unclear=
.
>
> So how would you have "home" or "var" be in their own partitions? Please
> show an example.

IIRC,

part  / --source rootfs --ondisk mmcblk1 --fstype=3Dext4 --label rootfs
--align 4096 --exclude-path=3Dvar
part  /var --source rootfs --ondisk mmcblk1 --fstype=3Dext4 --label var
--align 4096 --rootfs-dir=3D${IMAGE_ROOTFS}/var

For an example see scripts/lib/wic/canned-wks/efi-bootdisk.wks.in

Thanks,
Paul

