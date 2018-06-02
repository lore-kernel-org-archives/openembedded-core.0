Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 039EF74FAE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 21:35:08 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 14-v6so17338328oie.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 14:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9dhWDLItuncXVkRI3XZhYDCMecdJIMM3wnWs9sG5Z4o=;
	b=Bb6PHPa1IboHJm3LpJBby3k16vHbAYkZqJVv293fXapkR1eIL9qp7UwA8i0CW/Jrtf
	bmQZCtPiYPStci4a2LtEM323xecqiaMpcxZ1HFn04OZ+3JIl8k96NXWlpvFbK1hsr3gK
	byChK8pH6QYptYie0zvz+EWd3WI/p7uA5CJOGQWDTuvu3hdz1geVOcZFDbNeiepgQjGs
	syLVomJS5n11iN9DVT2L4TQZ9THyWZ8s9bhIzAZeDbSpdOEcIYXRXfxHS91rRdqnH6BC
	SS4kIBkhhA2Tzwg6GXisSp9+EZpIzoQgHH4zVjkpqD3Y8wzZ6n7+T3idPu91CSxzC5PF
	lcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9dhWDLItuncXVkRI3XZhYDCMecdJIMM3wnWs9sG5Z4o=;
	b=r/V9bpt+9AAbGICoHgGWZvAZkuLvMYvqgzWhRJS6AdMBEys2O69Nez1ycQHDvZb8hQ
	/d9+WX1Z/ElFLDF3YaP4TQwsKOLLB6l7MW81tl7byzcsOaZCVaEdv6Yg7bZbim3ezh5T
	IRrwyoUFtlhqovKtYmfAZGlBKeIDrqGlrzCWHDUnuFH+9VeM3wji2EEp3VZGM96szG/O
	IPuo5KSQHEu6sGwfgTYy/sRg0jSxD2mAftItaWhfksEEJ1kLjNXWiVcxHA6MOJ4vBzmp
	oYCo6MFMWKhm3tZgyAa4jEnUW8KVawblQqkZo+hX0HrHNYn1ChSetetu3yJ02VicAXY6
	vY4g==
X-Gm-Message-State: ALKqPwcgpMwWnHohFCNYIfzZbkfWPDGuY5EVDOyeRYCnVAfSf4rCthU/
	/Z1xwFrJI6hOCw5nVghiCSOdm4K3k6BPvsQ5dcZb3g==
X-Google-Smtp-Source: ADUXVKLBLhZzA0+dbKhbXSB7KEVVMfTPHBs1KFX1HLKZpn5pMk7A6RS2DbpcKDt/bi7W/6MTLWM9CI3Wlqh72WhL5E0=
X-Received: by 2002:aca:47cb:: with SMTP id
	u194-v6mr9435320oia.45.1527975309919; 
	Sat, 02 Jun 2018 14:35:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Sat, 2 Jun 2018 14:35:09 -0700 (PDT)
In-Reply-To: <2a578a24-b2cf-fabf-c86a-89e5ca3ed1d9@sashko.rv.ua>
References: <20180601221440.29992-1-dev@sashko.rv.ua>
	<20180601221440.29992-2-dev@sashko.rv.ua>
	<CANNYZj8ZmdHAFix08WYXkLLJ1ZGf5pv8PAHqfR3B4GRHzM_n+w@mail.gmail.com>
	<2a578a24-b2cf-fabf-c86a-89e5ca3ed1d9@sashko.rv.ua>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 3 Jun 2018 00:35:09 +0300
Message-ID: <CANNYZj_KLQGyoQ1D+Bbh7sCqarKcnJu1fJBregJ+SPkQFnFDrg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/2] iso-codes: fix SRC_URI
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
X-List-Received-Date: Sat, 02 Jun 2018 21:35:09 -0000
Content-Type: text/plain; charset="UTF-8"

I'm sorry for being terse. Reviewing patches before morning coffee is
not always a great idea.

When changing SRC_URI, you still need to explain in the commit message
what's wrong with the old URI and how the new URI was chosen.

Specifically here, alioth is not temporarily down, it has been
deliberately taken offline:

https://wiki.debian.org/Alioth

and the same wiki page lists salsa.debian.org as the successor. Any
debian-driven projects are likely to have been moved there, and so
that's the first place I had checked.

Alex

2018-06-02 16:35 GMT+03:00 Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com>:
> On 02/06/18 07:19, Alexander Kanavin wrote:
>>
>> 2018-06-02 1:14 GMT+03:00 Oleksandr Kravchuk
>> <open.source@oleksandr-kravchuk.com>:
>>>
>>>   SRC_URI =
>>> "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
>>> +SRC_URI =
>>> "https://ftp.osuosl.org/pub/blfs/conglomeration/iso-codes/iso-codes-${PV}.tar.xz"
>>
>> The correct new URI is
>> https://salsa.debian.org/iso-codes-team/iso-codes, don't grab a random
>> ftp from google search results please.
>>
>> Alex
>
> It is not always easy to find "the new" official URI. I took the one that
> was around for a long time, not "a random ftp from google search results".
>
> I will fix and resend the patch.

