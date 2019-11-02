Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDBA7F997
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2019 13:19:27 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c12so7551940wml.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Nov 2019 06:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7dIQbSFnxtESbLcqJmT3UK9XgV0WPrFCNUTCV6dx+Lo=;
	b=uy8/IqzwP1QXHK1YzuN9G9bJFMgc2IcwCOKxnYKvmJu/J+OaDJ+ZtQsjUvZL7KK4xd
	fFC6Jukq88dCJVhVt2j5e5/ZcRWKw3800mwh5kkWnq6FZsbdDDXjpcUWzyZMUNoexXZz
	9silS+sXdeBcAfT1T/cX2Oh6urkIgHsgLAD/gUTECI9NKVtsIRgK+zwd1flD1zW66hNZ
	ezDwduTniZ2diGn/VxmeUBjx7BYoSV6cZ1xNFjz8DGO+og16p3ikIqTOxxNI01NSPR8+
	ytinVikExflyraTnyuK542IsmYw1zHmr4wvvmmJFreggQ5xH3qie/zMJ9bWQ+EfSigr/
	mp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7dIQbSFnxtESbLcqJmT3UK9XgV0WPrFCNUTCV6dx+Lo=;
	b=LF5FRJ3e3GBc1WD9qTNndqxmtfmVAspBHxDttaLjo/kKMiO68awGyJHPtL6WagmJJ+
	9/XGKsFVn5IHAvoCxi1fZkkheIc3NK8IBeYH96W73l1qvA/TgZrIE9DaVKsxcZ538H8a
	mTQfRil60pz1lMVQxk3p/pEg5te+8iTDX9j0dM32GNPBGsdIZYoAJFH7gzwx0KVu83RK
	Hz1pW4StRmnQka/5RLQxsMiTU0/V8unbYFI+wdjhRKCfU+GIxcHBIdNTeWsIQogwmrXm
	5R4oLDzin4l3YVOvGANA6+r68PaHxEc90XgZRLniuR9NfTBdv7DpPimStQPFeS3xK95S
	oFXQ==
X-Gm-Message-State: APjAAAV6oiuy6nf01NVelM35RaUJXQeODrv3wFS898nVFkZgqLNuGxfp
	ybY1YQGGJM9dCRkxs+FJSQJB5ULGVrf65+l3vMs=
X-Google-Smtp-Source: APXvYqxSVzzDeQ1DhROzQtoVL9+X8MI7s1+umLhHXhpdy9wlh8+owXY5E9IHhS7rMC5IbqR5DK1n7i6HQzvp/+erlfU=
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr13651403wmi.123.1572700768030; 
	Sat, 02 Nov 2019 06:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191101184638.31898-1-ruslan.bilovol@gmail.com>
	<20191101201225.GA1826@localhost>
	<CANNYZj_qZedAe6dm-7=Lj1kfv1z_NHEfrfXQPVDH3yxTQBbNzA@mail.gmail.com>
In-Reply-To: <CANNYZj_qZedAe6dm-7=Lj1kfv1z_NHEfrfXQPVDH3yxTQBbNzA@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Sat, 2 Nov 2019 14:19:16 +0100
Message-ID: <CAHtQpK6=53q5j4Onggad_2P-24hu8uKe=+cubSRKx+Vh+X_zzA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [RFC] [PATCH] Provide users with project support status
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
X-List-Received-Date: Sat, 02 Nov 2019 13:19:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 2, 2019 at 12:02 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I too think that the information may never reach the target audience, as they could never update their builds to the point where it would start printing 'end of life'.

Would it make sense to include this message in base-files recipe?
Yocto does similar things with distro and machine name in /etc/issue
on target rootfs via do_install_basefilesissue(), so including this
state tag here would be also beneficial. Besides, users would see it
on every boot.

>
> What could work instead is printing a link to the wiki during 'oe-init-build-env'.

IMHO: This I think is beneficial for developers, but rather obscure to
the general audience which is booting device....

>
> Alex
>
> On Fri, 1 Nov 2019 at 21:12, Adrian Bunk <bunk@stusta.de> wrote:
>>
>> On Fri, Nov 01, 2019 at 07:46:38PM +0100, Ruslan Bilovol wrote:
>> > When OE/Yocto project goes through its lifecycle, there
>> > is no any way to identify where it is other than go
>> > to a Yocto wiki and look at current status.
>>
>> The status in the wiki can be updated.
>>
>> > Moreover, change from maintained to community maintained
>> > end EOLing happens silently so users not always know
>> > about that.
>> >
>> > This patch aims to remove this gap. The status should
>> > be changed so users can clearly identify at which point
>> > it is now:
>> >  Development -> Stable -> Community supported -> End Of Life
>> >
>> > It is now printed during the build.
>> >...
>>
>> What is printed is the status at the point in the
>> (sometime distant) past when a release was made.
>>
>> It is not uncommon for hardware to come with an example BSP based
>> on an older release like for example Yocto 2.0.3 (sic) today.
>>
>> The Yocto 2.0.3 release shipped as part of this distribution would
>> never print "End Of Life".
>>
>> cu
>> Adrian
>>
>> --
>>
>>        "Is there not promise of rain?" Ling Tan asked suddenly out
>>         of the darkness. There had been need of rain for many days.
>>        "Only a promise," Lao Er said.
>>                                        Pearl S. Buck - Dragon Seed
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Regards,
Andrey.

