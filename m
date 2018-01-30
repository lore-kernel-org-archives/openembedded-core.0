Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id F35A8786CD;
	Tue, 30 Jan 2018 13:42:01 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id 63so15390569lfv.4;
	Tue, 30 Jan 2018 05:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Rqk39JDemll32fQmPaTF67sHmQzCQ3MBYT1lT79j3XA=;
	b=gkfvWjzoYF4C+279uzDW0RIDl82hV4DIdQc3RZzm9mvOo9DlwixtPpqf57JOUOn6/h
	M7xChuFv+kSzf2PJG7tlXVv2VUa6kMVwCSSTAxFdN6mza/e6hRhIcde1Ta774IUd4Yoq
	wuwm3Bef8GBBrxWiI7o6dEcBx3B/KC7dM3lU8aTH/R7i4mbe/GLOtO5Qn878bDLt92Rd
	c63dMhzFipHASZAl/MV0OyfwGvO6xkUejXVGPMkiBrNbD/PVS1J19ZlgSCVgJAqJX7UJ
	nhilKjQ0WXSMZDr5Ci05uSuu33NsAU6jhEtrHkJnnmQAcunhHbn+wOCYWEeUJUpIaqO/
	Wjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Rqk39JDemll32fQmPaTF67sHmQzCQ3MBYT1lT79j3XA=;
	b=hLsm0s0b87SJxWBb5/GvveCVgAVJildlQlxp3eT0hqW+KPmj7wlI7JDltJVPvu4EYL
	UkhpsKQOvHS61fknfY/FZeAGf7VACAQoSWXO80PwikDroKk3kCB09y06g6rc/Rej5B7O
	wBCpqhZV+JvMXnf3XV8gHxyTAFRfKynJBnXxRLsfEgMjcK1Z1vzcDcqTgn864knFYJfZ
	bZrq7dksA4poi71ozNVC9vwsRdYHo8COCM0434xy26vze9A2TaD/vhTwWkAC93lIPTT6
	LkzoiBqabBlYRMMPYejqDBoN8qXsh+Gd1HHrkFQ527DCiZNDh2cDbj/udbl8Aluw7DeN
	OxKw==
X-Gm-Message-State: AKwxytfuw6lFUv6RG4TaQ7hYMzzY5NN6qhmCCDcvL34lq1BvIzW/YUmf
	mHk6S90kLnWX7qaVOS2NfIhj9CCZnfImyMXVsCo=
X-Google-Smtp-Source: AH8x227kXunBLqw6pP985qBmUjfKF07Hhv4G5FxDVAavlg6aEa1E4Ke4IAq6cTPAl3qYcwKwEycw+16x8YEkAyizsUM=
X-Received: by 10.46.117.29 with SMTP id q29mr11985486ljc.65.1517319722563;
	Tue, 30 Jan 2018 05:42:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.18.151 with HTTP; Tue, 30 Jan 2018 05:42:02 -0800 (PST)
In-Reply-To: <CA+chaQdNcJeiBCpWfXC_hSb-tV7pUa-0KuVW+qhgKCBT5ievnA@mail.gmail.com>
References: <151721583389.32622.5504232841603929200@git.openembedded.org>
	<20180129085034.D24DD233435@git.openembedded.org>
	<CA+chaQdNcJeiBCpWfXC_hSb-tV7pUa-0KuVW+qhgKCBT5ievnA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 Jan 2018 08:42:02 -0500
Message-ID: <CADkTA4P2sz4Rywju16xxveBo0AtZ95x-q+kdnKV1kRudwAW66g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 21/29: linux-libc-headers: 4.12 -> 4.14.13
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
X-List-Received-Date: Tue, 30 Jan 2018 13:42:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 30, 2018 at 5:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Hi,
>
> you've forgot to update the version in
> meta/conf/distro/include/tcmode-default.inc:
>
> meta/conf/distro/include/tcmode-default.inc:LINUXLIBCVERSION ?= "4.12%"
> meta/conf/distro/include/tcmode-default.inc:PREFERRED_VERSION_linux-libc-headers
> ?= "${LINUXLIBCVERSION}"
> meta/conf/distro/include/tcmode-default.inc:PREFERRED_VERSION_nativesdk-linux-libc-headers
> ?= "${LINUXLIBCVERSION}"
>
> causing:
> NOTE: preferred version 4.12% of nativesdk-linux-libc-headers not available
> (for item nativesdk-linux-libc-headers)
> NOTE: versions of nativesdk-linux-libc-headers available: 4.14.13
> NOTE: preferred version 4.12% of linux-libc-headers not available (for item
> linux-libc-headers)
> NOTE: versions of linux-libc-headers available: 4.14.13
> NOTE: preferred version 4.12% of linux-libc-headers not available (for item
> linux-libc-headers-dev)
> NOTE: versions of linux-libc-headers available: 4.14.13
> NOTE: preferred version 4.12% of nativesdk-linux-libc-headers not available
> (for item nativesdk-linux-libc-headers-dev)
>
> In every build, can you please fix it?

I also missed this in the way in, since I wasn't cc'd on the patch and this is
something that I take care of when doing the revs for each release.

<end rant>

I see you sent a patch to fix it anyway, thanks for that!

Bruce


>
> Thanks
>
>
>
> On Mon, Jan 29, 2018 at 9:50 AM, <git@git.openembedded.org> wrote:
>>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master
>> in repository openembedded-core.
>>
>> commit 71776273bbcb8b08aa55296c82ec2a10b0978a57
>> Author: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> AuthorDate: Fri Jan 26 17:00:08 2018 +0800
>>
>>     linux-libc-headers: 4.12 -> 4.14.13
>>
>>     Upgrade linux-libc-headers from 4.12 to 4.14.13.
>>
>>     Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  .../{linux-libc-headers_4.12.bb => linux-libc-headers_4.14.13.bb}     | 4
>> ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git
>> a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
>> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
>> similarity index 71%
>> rename from
>> meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
>> rename to
>> meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
>> index f0d0abf..455ad4b 100644
>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
>> @@ -7,5 +7,5 @@ SRC_URI_append_libc-musl = "\
>>
>> file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch \
>>     "
>>
>> -SRC_URI[md5sum] = "fc454157e2d024d401a60905d6481c6b"
>> -SRC_URI[sha256sum] =
>> "a45c3becd4d08ce411c14628a949d08e2433d8cdeca92036c7013980e93858ab"
>> +SRC_URI[md5sum] = "4e8bb562f8fd33d5ef1feb0435ed2b02"
>> +SRC_URI[sha256sum] =
>> "4ab46d1b5a0f8ef83b80760f89ae4f5c88431b19b3cf79ffa0c66d6b33e45772"
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

