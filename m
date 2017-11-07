Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id C330E65D35
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 23:44:21 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 4so832826wrt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 15:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=CFnvMnbI6autqcvnDKnAV5PRe0DGCpYiOfKWPmJPT80=;
	b=q1VKsH1EfDEtGE6q0rWwNWFeB4Ek0x7RIxzRrn2obglX/4SSXzgUFJ/wXiKma852HA
	KgBw/T5XkK4jijjGxkOizzNw2nyDo2X3RUWTtX5xCWAtqfH9NQlkHOcZA7e1AoAYQ9eS
	Igoz8jMOkEKXGHQ7LYR9sAAsXNmfnclzGljpxOcMCGmpUcDg+LmQvAhYfMs5AVMd4v85
	h6Jev1ndyTKUWx73ygUR++TwC28qvj0hyHVli4EEgvpmdacKjMB7V/GGkMisyd68bere
	ewVKrIkXgBn7Legu6jW2tzA3qfW2RZxyYZP+b/1l/mI1KuHJo9tuoL6iAMjixlOSpf02
	WESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=CFnvMnbI6autqcvnDKnAV5PRe0DGCpYiOfKWPmJPT80=;
	b=dVpo08RqomyqAkV5KvfaOFmIF4az1ByGJM6ocy+w/SKwzF7r4hqQLYcYQcekaYUscX
	mF8Q8YN+Hk96ypqtjjy9913KA1hqu5Jnb9UYfGOax01yInQ449pTiqF+2g0dFacAFVrt
	SmCcARhzZy7ZGkNdVK76m9Vhc53+o77+036XxPDechF7Tcjva66Ty40PEeWBFB/xxg2+
	1NQehGojvcVdpO5DUlK40/XuJgaH/tSGnA8CtncmsNWAHszY4sK6jiI60SZxmac9DWEn
	eZafZhkqWRN/RyvyvkjQmkQXEIx4+F/gQ5a/SrQ/VQlbldoc9obdxYnJVOoiELBX/Jcx
	W20A==
X-Gm-Message-State: AJaThX4Sd2SkLoY6jdLH/TLY/5uZYF0adkKEg2zBV9wbpt22MTaBptKg
	0QKYizt0PhtrhhNzB7h1Ea1gROqD6ySa6cHAJOE=
X-Google-Smtp-Source: ABhQp+R5Lypcvf3vtejjq1Npbq+/vcA4UqNh1bqiNqEsk2a9wsp11+PR4rf94EIEMkUAsDpWS75aunOJrVW56JpfADA=
X-Received: by 10.223.182.3 with SMTP id f3mr319087wre.127.1510098262390; Tue,
	07 Nov 2017 15:44:22 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.147.11 with HTTP; Tue, 7 Nov 2017 15:43:51 -0800 (PST)
In-Reply-To: <e59a944e-af2b-f734-bd9a-161684de59f6@windriver.com>
References: <20171107001706.10052-1-alistair.francis@xilinx.com>
	<CAJTo0LYkCH6TNwGU27Av5-2UwpXZb7iogyM8ScQ_b6JA5jibFw@mail.gmail.com>
	<90db7b51-f472-ebb6-2f45-c2fc3720443c@linux.intel.com>
	<e59a944e-af2b-f734-bd9a-161684de59f6@windriver.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 7 Nov 2017 15:43:51 -0800
X-Google-Sender-Auth: oM__VitcUgHCv9bDHIVE24fUzfs
Message-ID: <CAKmqyKNzioN2qzjyk767YWR2id3GzNMLtZUh5K9QQAHgyOh2Kw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Update to glib 2.53.7
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
X-List-Received-Date: Tue, 07 Nov 2017 23:44:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 7, 2017 at 1:20 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2017-11-07 10:04 AM, Alexander Kanavin wrote:
>>
>> On 11/07/2017 11:58 AM, Burton, Ross wrote:
>>>
>>> Odd major version numbers are development releases, so this won't be
>>> accepted into oe-core.
>>
>>
>> Not to mention that I have already sent an update to 2.54.1 earlier.
>>
>> Alex
>
>
> but thanks for sending your work to the list, Alistair.
>
> If you are interested in maintaining this or other packages,
> just say so. There is a maintainer's list but we could
> certainly spread out responsibility if you volunteer.
>    http://recipes.yoctoproject.org/rrs/recipes/2.5/M1/

Thanks Randy,

I don't want to be the Glib maintainer unfortunately, I just had to
test something with Glib 2.53.4+ and I figured I would send the patch
once I got it working.

I did review Alex's patch though.

Thanks,
Alistair

>
>
>
> --
> # Randy MacLeod.  WR Linux
> # Wind River an Intel Company
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

