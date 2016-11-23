Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 12A8A6E64F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 11:03:30 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id t79so18373138wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 03:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=H9ixrY8icimneSBdZUPNJ1qCmc2Y7NKk2lmdQoe+cCs=;
	b=GdShUjVLQdVsWS6w+lpZoW1Q/hP6GPRtDFW2HSCnjD4Psk5Y1oaAZdDIjGaiCrCiap
	GE7/zsvA2Ry0LNHrrhNWrEK2HYXrMGqhFK4zE5RYbyuiFdz8PjlU+Xrt2jfDyexAvr4v
	qkBwEZwWyXMsawldq1LK4Q1B0AgWtTuWVqEB+HB3ijneFZLwpKPlOyb9E4M94fZbrLct
	HPwx6RqfGW0AsPTFZuBTYF2GDnuF2QEqWgzfbEhUZjHqkXfgOxFtju4+eKfqcwY5Upy7
	40lA3H6kqYfPkKptu9mYbX/e3cszHm8ZbXHZe7gUq6t4iUirQNQS7tlqFICkLd4xZ3H3
	r39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=H9ixrY8icimneSBdZUPNJ1qCmc2Y7NKk2lmdQoe+cCs=;
	b=Pvs0iQF1vwoF4H5pkm32djQU48yPvIr4Xb+yTGiOtcaPoPOt7xu5vD7MRUMOs+YdyY
	uvMF/v5wxZeshZOzuP0LlUBsh1pHacRJe+IgEgUQVCXrIIUN10MKGrAggbvKFjYzrFUL
	ORDvp3jntgQCGhW0j8pmuJFT5NGJ21AuZu+P/mD0JDIYU+a2Rhs7CSuEzkBoUd9mldbt
	TFgNlAsJx7uxhCtOlMM8c9mxlGbnl6DQuC03zLD5DRgc7crNoM35NSlFgeVxYys4VEmx
	AcbdnXoJxbeK5uip0NPzWp/KXS492dXrRyK3gRdwEtN71O42yMKGjQXccba6klzoB1Qk
	gX2w==
X-Gm-Message-State: AKaTC02rBuH7jHE67VU9VhvBCvNluHCJ4CJyoOqE6gVzyiBT23pQv+MMcOzUt9voIV4liUw5J5v67xltVDuc3w==
X-Received: by 10.28.54.214 with SMTP id y83mr2616319wmh.45.1479899011716;
	Wed, 23 Nov 2016 03:03:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Wed, 23 Nov 2016 03:03:11 -0800 (PST)
In-Reply-To: <71ba6b2a-4a87-9544-d249-c3fccc48a9f5@pengutronix.de>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<776827b7-ca3e-e319-c2f0-b8b15bef4fb2@pengutronix.de>
	<CAD4b0_LrF=sQMV3r+3Kb8hqxcqD9U_LBMesxCyby+FGS7YssFQ@mail.gmail.com>
	<71ba6b2a-4a87-9544-d249-c3fccc48a9f5@pengutronix.de>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 23 Nov 2016 12:03:11 +0100
Message-ID: <CAD4b0_Jb8JN3a8_X22Rdb5AUUghs9eYhhK0CXyEMBNoPL_JVjw@mail.gmail.com>
To: Enrico Joerns <ejo@pengutronix.de>
Cc: Eduard Bartosh <eduard.bartosh@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Wed, 23 Nov 2016 11:03:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 11:12 AM, Enrico Joerns <ejo@pengutronix.de> wrote:
> On 11/23/2016 10:24 AM, Maciej Borz=C4=99cki wrote:
>>
<snip>
>
> Yes, what the genimage class (see below) does, is unpacking the final
> rootfs.tar.xz inside a fakeroot environment and call the genimage tool wi=
th
> the --rootpath argument set to this path.
>
> The mountpoint=3D"/home" tells genimage to pack all content in directory =
/home
> into a separate data ext4 image (temporary named 'home.ext4') and all oth=
er
> content in a rootfs ext4 image (temporary named 'rootfs.ext4').
>
> The `image` section then specifies how to construct the final disk image
> using the referenced generated rootfs and datafs images (and optionally s=
ome
> bootloader, non-partition-data, etc.).
>
>
> Note that this is only one way to use genimage. Another common way to use=
 it
> is to simply construct complex disk images out of different filesystem
> images, e.g. with
>
>   partition barebox {
>           image =3D "barebox-any-platform.img"
>           size =3D 1M
>           in-partition-table =3D false
>   }
>
>> I see there's a large overlap in functionality with wic (at least for
>> block devices), so perhaps the best way would be introduce genimage as
>> another IMAGE_CMD.
>>
>> I've quickly checked at https://layers.openembedded.org and there are no
>> recipes for genimage/libconfuse listed there. Do happen to have done
>> integration with OE in some private repo already? Would it be possible
>> for you to post the relevant patches?
>>
>
> We have a layer for this, which is potentially publicly available but not
> advertised as the general plan was to move some of its content to upstrea=
m
> (oe-core, meta-oe) and split up other content (e.g. the rauc update tool
> stuff) to separate layers that will be made publicly available. But, as
> always, there are more plans than time left ;)
>
> Well, to make a long story short, the path to the git repository is:
>
>   https://git.pengutronix.de/cgit/meta-ptx
>
> The genimage class I mentioned above you can find in it, too:
>
>   https://git.pengutronix.de/cgit/meta-ptx/tree/classes/genimage.bbclass
>
>
> When starting with Yocto I thought about changing from genimage to wic fo=
r
> disk image creation as wic already seemed to become the standard solution
> for building disk images. But back in these days it was a very separate t=
ool
> and there was no integration with the BSP itself (which is crucial when
> having to reproduce builds). But the main reason why I decided to stay wi=
th
> genimage was that wic simply did not cover most of the use cases I requir=
ed
> for building complex disk images for different embedded platforms. I'm
> pretty sure that this has changed in some points, but had no time to get
> deeper into this topic again, yet.
>
>
> Hope that helps, best regards

Thanks a lot. Very helpful indeed.

--=20
Maciej Borzecki
RnDity

