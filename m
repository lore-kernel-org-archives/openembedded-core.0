Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 700E06AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 23:43:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l6so1170449wml.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 16:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ZOOxLkNVpRK7YfatUZ65sZzIh3KDbBU//QeEPJkUS1k=;
	b=eo9yNrOJnP3BElshGJDhXgGQdzJjRUX+ek0/HLhphjQ8xkcrcH9jshKX9V1WB0mNmI
	6CUHsEEXRVMqX+QXwRv8Aj7lISejy3VaqOnM+bzu7dncTHredGAXiKa0whoIhlmsWJS1
	95KcQ25t3bmiOpImXOJ/VBpBgjKj2kgBLd/oJtjoKhrNOGsigreCXKaoCzlaliJWTWBo
	qTH9rRuBNWjJ70cAmKEUYoykCxzwrnSjykk+djjqu3a83ag6U7esxmd8e7dsC0+qdB5i
	GQF/o/QJOwFQx6+kIDggorRcqSDYEM4vPGoG7Z4kk1yUEHjSnZpKX5DWBRfCKjJBuLiT
	kr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ZOOxLkNVpRK7YfatUZ65sZzIh3KDbBU//QeEPJkUS1k=;
	b=f2gHU83PQN5GP0YMO03iwngVHMqCNoKoPk4hDNvK7oc5qHfAKeR2kNMYETXMwEVs2l
	f8Qf857J4jR7wIvAecUpKj/4x9+PqG9MEBK5//H197B/ncPFau5mhufQRHX27mBMivr/
	lbN28B1zPM3RgMNXsoGyEuo31+5/NoTmtK/id7N3W9UruYZSCkRI9NZjXdO5uXxZZhcj
	iX4BX2CP9LkVUXJhj3La3aZyJr9eH9HdHSyMkylJ/wbgeQJX7XZqhcRcQ4KLqXbm1rWj
	9c9OB9X2yQOWI1HMxCc+nca4sT7cUki92yWXGF52tuwK9t1y2HwH8avI621r3vbsaQ9U
	+Swg==
X-Gm-Message-State: AOPr4FWh198x2mHLUwMYL6Sq5gqghD+Z00ScMPFJJ1RIqsHk2VHKLcegFjrY41TAsuwGecPseWl1LbiuDaaDyg==
MIME-Version: 1.0
X-Received: by 10.28.49.3 with SMTP id x3mr610584wmx.4.1460418194483; Mon, 11
	Apr 2016 16:43:14 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Mon, 11 Apr 2016 16:43:14 -0700 (PDT)
In-Reply-To: <CAJTo0LZkC4Q22PNMKnjSA97v-7T1yxvne6kraBydNS9-PVOqjQ@mail.gmail.com>
References: <cover.1460085139.git.liezhi.yang@windriver.com>
	<a9ea8a660f37bbcf917c71360512ab155241114e.1460085139.git.liezhi.yang@windriver.com>
	<CAJTo0LY9PMgCJXqAL8qw=u37UyTo+o=ykzGdb8Vv_4w+5O58ag@mail.gmail.com>
	<CAJTo0LZkC4Q22PNMKnjSA97v-7T1yxvne6kraBydNS9-PVOqjQ@mail.gmail.com>
Date: Mon, 11 Apr 2016 16:43:14 -0700
Message-ID: <CAJ86T=UO6JrOUVsjN=d56DN5TvuOG6jDNh9G0QEiAdzTNivLWg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pbzip2: fix for rebuild
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
X-List-Received-Date: Mon, 11 Apr 2016 23:43:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 11, 2016 at 7:48 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 11 April 2016 at 15:46, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> Wouldn't "oe_runmake clean" be simpler?
>
> Or not disabling do_configure in the recipe, as base.bbclass's do_configure
> includes an invocation to make clean.

Since the bzip2 source files were changed, updating bzip2's PR (r5 ->
r6) to force a full rebuild of pbzip2 might be a more robust solution?

More curious though is that after cleansstate, pbzip2-native doesn't
build for me at all - the LIC_FILES_CHKSUM is wrong following the
update from pbzip2 1.1.12 -> 1.1.13

  http://git.openembedded.org/openembedded-core/commit/?id=80712b7c0959c197ccb21efd5e7a963d1d2e83ae

???


> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

