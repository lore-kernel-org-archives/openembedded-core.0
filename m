Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 288CE719B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:24:52 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f82so14341280wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L+mb0EeNNtkHQZeSFYbKydbtWzCXO4Jwu6qazx48mxA=;
	b=M5pXZxt4/uAgdR7hEVEaHQS3La68RcBpax26HvEQjVTV31yPUFQpWVtdLUrssNXwfe
	BMD+c7SRwVD8asKO9gZ8bLEgYdPT1kmDIBDoPGoRw13d+7e1VOiaJLWVu2XKiPSYqq+8
	/qLa0PbOIwpknc/tkOPObWPW8rZ3zIPruDzkCjWaDKnyOfygNhWrgjdVHKpsRhmqie0S
	7QZjvPgBJ5Z63u27pFBp0LEStHHgRWwTGQbcd4cwlJNgftAova5G0UjvCobzYO7gImBA
	6qfGZojjqEmLYPTq3a3kjqJXOgrvsokALISt7jRFeOftPMhQHedegpwWBl7wK9ivWVR5
	urUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L+mb0EeNNtkHQZeSFYbKydbtWzCXO4Jwu6qazx48mxA=;
	b=Fu1okjMvXHO6s1mTtAnMkFUHhP4q8WP/3km1CcW+Q1yR8qXqzUcQOLMtmE6IjWf4oa
	bbi2xNDY3x3ZGjO/h6qp/bC2IflmN7l191B+o6jNocrGcLP7d9HDzr6ri8ymKUkUhUzR
	TezhF/4b34UJi08lcG5FsescmYsldb8s4VyrrtiKUKKRsLQ/d70fg23IwB0r1Rg2d+B+
	v/fKFyAwqFFRR/2iEXRgwjyLRB4AT2+qZ3v8bPU0Hte4mY0PvBqozKXW2lTjOKPZWqim
	Z3LqJ+as9iYRu8NMjLEEUSclAPlTVwdt4BUXuJuGqhsX1582oHyn+dDwgcmAleptCo0o
	nq3g==
X-Gm-Message-State: AKaTC00pZvQVNeoLkVUyX3qVDkl3OUwFa8rgAUK8XbK4e3+KB4onv/JEo4MLjqU5Nc5p7hBf12EMPo7X0+t7/Q==
X-Received: by 10.28.54.214 with SMTP id y83mr2212248wmh.45.1479893093261;
	Wed, 23 Nov 2016 01:24:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Wed, 23 Nov 2016 01:24:32 -0800 (PST)
In-Reply-To: <776827b7-ca3e-e319-c2f0-b8b15bef4fb2@pengutronix.de>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<776827b7-ca3e-e319-c2f0-b8b15bef4fb2@pengutronix.de>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 23 Nov 2016 10:24:32 +0100
Message-ID: <CAD4b0_LrF=sQMV3r+3Kb8hqxcqD9U_LBMesxCyby+FGS7YssFQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Nov 2016 09:24:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 9:40 AM, Enrico Joerns <ejo@pengutronix.de> wrote:
> On 11/22/2016 12:54 PM, Kristian Amlie wrote:
>>
>> On 22/11/16 12:10, Patrick Ohly wrote:
>>>>
>>>> ...
>>>
>>>
>>> All of these introduce some special mechanism. Let me propose something
>>> that might integrate better with the existing tooling:
>>>
>>> The "rootfs" directory gets redefined as representing the entire virtual
>>> file system. When creating a disk image, it gets split up into different
>>> partitions based on the image configuration.
>>>
>>> For example, the /home or /data directories in the rootfs could hold the
>>> content that in some image configurations goes into separate partitions.
>>>
>>> The advantage of this approach is that the tooling for staging content
>>> for image creation does not need to be changed. The same staged content
>>> then can be used to create different images, potentially even using
>>> different partition layouts.
>>
>>
>> That's a very good idea. I think it beats all of my suggestions!
>
>
> I totally agree with this solution, because it is the same approach we are
> already using for several years.
>
> Instead of wic we are using the genimage tool
> (http://public.pengutronix.de/software/genimage/) together with a Yocto
> class for easing image creation, but its pretty much the same concerning its
> base purpose.
>
> We called the option to split up 'mountpoint' while assuming that the
> splitted partition will be mounted to the same location in the file system
> it was taken from.
>
> An example configuration would look like this (stripped down to the
> essential parts):
>
>   image my-disk-image {
>           [...]
>           partition root {
>                   image = "rootfs.ext4"
>                   [...]
>           }
>
>           partition home {
>                   image = "home.ext4"
>                   [...]
>           }
>   }
>
>   image rootfs.ext4 {
>           [...]
>           mountpoint = "/"
>   }
>
>   image home.ext4 {
>           [...]
>           mountpoint = "/home"
>   }
>
> Maybe a similar approach could be used in wic, too.

I went through the README from genimage repo
https://git.pengutronix.de/cgit/genimage/tree/README. Definitely looks
interesting and covers storage medias that are not supported by wic
right now. The split option does not seem to be documented though. If I
understood you correctly, the partition is seeded with data from
location specified by `mountpoint` inside IMAGE_ROOTFS. Is that correct?

I see there's a large overlap in functionality with wic (at least for
block devices), so perhaps the best way would be introduce genimage as
another IMAGE_CMD.

I've quickly checked at https://layers.openembedded.org and there are no
recipes for genimage/libconfuse listed there. Do happen to have done
integration with OE in some private repo already? Would it be possible
for you to post the relevant patches?

-- 
Maciej Borzecki
RnDity

