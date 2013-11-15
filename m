Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id EC72C6D73F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 22:08:37 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id qd12so5387389ieb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 14:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iMzdkJhudUV/3Htk1Y4QNwmVhTern9aHEK1dY+xtulE=;
	b=KwDXIk2LXojut0Azk67uXFH7hjFJLTb/n87dFnwUbamxU54zwlmB6LHCn2a4TM7Ieq
	yMpZRVEhQTRj71bYbwNM6Nkl/L+p9pGJO6M0dPmB3himmakf7VOULwfIjDz2oYWEzq5q
	J/g3S0Sh8CdqeThi5SZzp8ky+DOdUvx7icb96rkSQIiiiSL+Co2L0jqqp9+WzWjyBGs+
	6jv8PiQHF1BHrJy6HvnGNqrtef5Qjpb2wC5BCWE5Cg5pisMpCGxlt5WLm6c0Cv2ZpXH2
	vfvtUv6FbEubeB1oTYFOCKNN9pMGkT5MpeyUTFePwHkCJ6vwacJxgXZ8D7TjuFZ+O6B9
	zbvw==
X-Received: by 10.50.26.36 with SMTP id i4mr5917522igg.33.1384553319480; Fri,
	15 Nov 2013 14:08:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.79.167 with HTTP; Fri, 15 Nov 2013 14:08:09 -0800 (PST)
In-Reply-To: <20131115213705.GE31430@jama>
References: <20131112103426.B32915026B@opal> <20131115213705.GE31430@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Nov 2013 14:08:09 -0800
Message-ID: <CAMKF1sqsyD8w08qbiQK4UYzNaKNQJOcwZpHjeow73GgC5R=bWA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Ross Burton : glib-2.0: move more logic to the .inc
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
X-List-Received-Date: Fri, 15 Nov 2013 22:08:38 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 15, 2013 at 1:37 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Nov 12, 2013 at 10:34:26AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 55b950500fd9d944042e3c2b0872685f0a60e8eb
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=55b950500fd9d944042e3c2b0872685f0a60e8eb
>>
>> Author: Ross Burton <ross.burton@intel.com>
>> Date:   Fri Nov  8 16:06:38 2013 +0000
>>
>> glib-2.0: move more logic to the .inc
>>
>> The .bb was getting larger with configuration being arbitarily split between .bb
>> and .inc.  To help adding a glib_git recipe, strip the .bb down to SRC_URI.
>>
>> Also don't remove $libdir/gio as it should be owned by glib.
>
> IIRC we had fix for this QA warning before and now I see it again:
>
> WARNING: QA Issue: glib-2.0-dbg: found library in wrong location:
> /usr/share/gdb/auto-load/usr/lib64/libgobject-2.0.so.0.3800.1-gdb.py
> glib-2.0-dbg: found library in wrong location:
> /usr/share/gdb/auto-load/usr/lib64/libglib-2.0.so.0.3800.1-gdb.py
>
> Is it possible that something was left out? I don't know since when I
> have this warning, so it could be since last glib-2.0 upgrade as well.

FWIW the location of this file is correct, glob is being greedy here.
We should check if name ends with .so<0-9.>
then warn/error out

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

