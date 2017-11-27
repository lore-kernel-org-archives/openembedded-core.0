Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 430F177FED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 20:24:53 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id i14so34310185lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 12:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nvhic5K4JeVdoNBEH6V7npSBe2m9OZxW2wu9ODRbmrU=;
	b=t3g5GVfZpQq1MswWpnlsn9qNmOSTosXcKrfVFxRBL1MgNHBxgrqJ6c7/Jb5JAwvtlE
	12PGSQeMsZ8RgVVD3aqMen8wjqXGSAf7VrYvLjE7NkI8k+nQzrvKUP37TEmGMW6I/LsW
	MV69mkpn/0BLVKeVLwxgdPspo7sZI4qV5D7amhw+ctejGzai47rD6T2FZo83pYQ8fdfr
	xOvXtG5ie2GPunI9DrupW+X3LagnSjfR4bcW+3oO9upXCflQcvP6gotzRFN3/KPxldZP
	zYnOKPJyRiNIR/3zHH0tn44c043mF2Rq4C34Qh9zF8dNMOpUFlrUljhSxtbrEZ9RSu2s
	IhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nvhic5K4JeVdoNBEH6V7npSBe2m9OZxW2wu9ODRbmrU=;
	b=QewhBqlP5As7SNrgOjTfckZRSQtgqzHiCXYfu1aBmgMOYn/DJ9tvILc7NBGdvoN40w
	KgtZlCkxjqNjGNNDCWRoMXpwFyFV4Js5AdLjJg+5Q7PaH/VXPf60Od258IZ8+aGN9f5w
	+HOsMs5qljs1xDV/jID3X1DJXSNWr5uheTPehx/oBBq6xYHpMbZwm6L4Boo8D8sq3nrV
	a6QnHDvENMNaHz3KXT5dbqvXr6rjzTASZ6LFktIckm7lhcw43fCoQFi/19ysDSANssdt
	YfSPmn5Td8Apu5fFK/3pVwUQrqS9NiyKk553kKYXxmJVz371IBGNrGUWZCXsdUH1nvI2
	X9Ag==
X-Gm-Message-State: AJaThX5fZ1o6C4IsHhx5t3S7WENZ8Yd1qyQ+QLij+ltM7SUSvdcsCCNn
	7q/DxRMyXxrXhKKCXw4+DSS11UBedqO/fTiYV9o=
X-Google-Smtp-Source: AGs4zMb/LaroFutF+5FBQHMkc68fp33IbEjR7nd8UJG6cjLLBeL0YLXeT9t8EcsdzgOJX7KD8nCicDZdi516/YVfA+Q=
X-Received: by 10.25.38.145 with SMTP id m139mr10043664lfm.122.1511814294786; 
	Mon, 27 Nov 2017 12:24:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.59.196 with HTTP; Mon, 27 Nov 2017 12:24:53 -0800 (PST)
In-Reply-To: <b5ec6830-3185-054f-7354-d9caa66e692b@linux.intel.com>
References: <20171127183538.68275-1-danismostlikely@gmail.com>
	<b5ec6830-3185-054f-7354-d9caa66e692b@linux.intel.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Mon, 27 Nov 2017 14:24:53 -0600
Message-ID: <CACS+7ZT=pyM3uD-LbBy437NT=nHAS7ONarmMp0E3TA-b40LFaQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: fix python3 dependencies
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
X-List-Received-Date: Mon, 27 Nov 2017 20:24:54 -0000
Content-Type: text/plain; charset="UTF-8"

On 27 November 2017 at 13:16, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/27/2017 08:35 PM, Dan McGregor wrote:
>>
>> Add missing python3 dependency, and use python3 from the build
>> system.
>> -DEPENDS = "openssl libcap"
>> +DEPENDS = "openssl libcap python3"
>> -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
>> +inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
>> python3native
>
>
> This should have a more specific explanation. Namely:
>
> 1) why is target python3 needed at build time (if not, it should be in
> RDEPENDS of a specific package)

It's already in RDEPENDS as python3-core. It's needed at build time so
that the python component build of bind can find python in the
sysroot. Without this change I get:

| error: invalid Python installation: unable to open
/usr/lib/python3.5/config-3.5m/Makefile (No such file or directory)

With only inherit python3native I get:

| error: invalid Python installation: unable to open <recipe
sysroot>/usr/lib64/python3.5/config-3.5m/Makefile (No such file or
directory)

>
> 2) why is native python3 needed, and host python3 is not enough.

Host python3 gives me the error above. Possibly my host's python3 is
broken, but it's a Poky build appliance with multilib enabled.

I'll make it more explicit in my commit message.

Thanks.

>
>
> Alex

