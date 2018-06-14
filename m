Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB2475430
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 19:20:47 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b134-v6so4328154vke.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=c/iw3hd4c6JnYEhllZThQ5JCrtlCDPYSieL3ZMpDWkQ=;
	b=DCh/B3g2OGz9pVk1MeMhnCxWKizHxj+c7mpXmsUehMvzFEnGWKabqN4F51Q52Tx5xo
	I1BQX2xIJ/mCMHpI56jkYmHF+inW9eZElj4fpt24ZXl3dq6TNdiLXXD8PMfngQ3pYTUI
	VFMcuuztxrsR4jSvc+CC+T3oaKczTjEdic0ERyYWmYEhHhHVlU5M05+2HwIQXDM7NCTi
	1u5P9038TBZ8ejy6ytX7MRsqHimXBX+OUCf8ipVJxOAVzj5witRoK6wctPso07MvdrJd
	NnPDVdEZ/pJtXBV8jLnHRAm/zNUeuYg0k2EHbUBX2hAbXWh3sJ6M0xXQ2ZDbqZWs/CFS
	oh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=c/iw3hd4c6JnYEhllZThQ5JCrtlCDPYSieL3ZMpDWkQ=;
	b=oOmdg7EwC6PdxXgebicM/dpIq0c29iun6rBzDkAO8xjKA540xASjYg8GOkGRJcxQrj
	/CqZonNHRZZX19Z5nIBh1m4v/JqAdljPxIcRrbTMbqwNsa2o+bjbz+FhIRbs/rDITye+
	SNgXDcymkuxwP//0nX20szki7iC5D+qZJqeKGb61AdQJxi9SleG/piY5JyohUJLbJm8F
	haDdprrEe9iJ94wl+qcGXu0y3DQjEeeRXJx9YDt6Ntp1uuqW9jo5XZ7w/Ml9rsgaQ5f/
	L4AGVGQ/a4gNaoE0QDHj7DiCa9JvmORn6Q9hiqgj3yfGGDbWhY1YcRxITxUqF6fzG3kD
	x5hw==
X-Gm-Message-State: APt69E20rzhD10Ch/VbneenuaV/P6Fffd2p4Xc1gPhVf/5wl7f77rJeN
	qr0Qvr7rpBBBxTkeXSHpIH8cGtWw5vanyneOgGDOcA==
X-Google-Smtp-Source: ADUXVKKe8mHPa2ablRmmfvdbU86DUMh5OMvkmtKQc1+MZl6j49IaH3H0YZGwCBInJadOB7Pw7RPs6vooIltZPCPI40M=
X-Received: by 2002:a1f:9615:: with SMTP id
	y21-v6mr2428420vkd.154.1529004047861; 
	Thu, 14 Jun 2018 12:20:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Thu, 14 Jun 2018 12:20:47 -0700 (PDT)
In-Reply-To: <bcb49b46-b97e-399b-5a6c-c994b1628ad6@gmail.com>
References: <1528968947-430998-1-git-send-email-mingli.yu@windriver.com>
	<bcb49b46-b97e-399b-5a6c-c994b1628ad6@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 14 Jun 2018 12:20:47 -0700
Message-ID: <CAJ86T=U0iM3u5Vv-4hOvLFSNs5K8D66++kiRRWqKq7MW=JGyEw@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: set -fomit-frame-pointer explicitly
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
X-List-Received-Date: Thu, 14 Jun 2018 19:20:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 14, 2018 at 9:38 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On 6/14/18 2:35 AM, mingli.yu@windriver.com wrote:
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>
>> When build ltp with -fno-omit-frame-pointer,
>> it will trigger below error:
>> | cve-2015-3290.c: In function 'child_thread':
>> | cve-2015-3290.c:416:1: error: bp cannot be used in asm here
>>
>> And there is also some comment as below in the source
>> file ltp/20180515-r0/git/testcases/cve/cve-2015-3290.c
>> * Build with -O2.  Don't use -fno-omit-frame-pointer.
>>
>> So explicitly set -fomit-frame-pointer for compiler
>> to fix the above build error.
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>  meta/recipes-extended/ltp/ltp_20180515.bb | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
>> index b07c1b9..5ec25ed 100644
>> --- a/meta/recipes-extended/ltp/ltp_20180515.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
>> @@ -19,6 +19,10 @@ LIC_FILES_CHKSUM = "\
>>  DEPENDS = "attr libaio libcap acl openssl zip-native"
>>  DEPENDS_append_libc-musl = " fts "
>>  EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
>> +
>> +# -fomit-frame-pointer to handle cases where optimisation is set to -O0 or frame
>> +# pointers have been enabled by -fno-omit-frame-pointer earlier in CFLAGS, etc.
>> +CFLAGS_append = " ${@bb.utils.contains('SELECTED_OPTIMIZATION', '-fno-omit-frame-pointer', '-fomit-frame-pointer', '', d)}"

This doesn't cover all cases - there may be times when the compiler
chooses to enable frame pointers without being called with
-fno-omit-frame-pointer.

You could make the append conditional on x86 though (based on the
error message, it's the x86 frame pointer register which is being used
by inline assembler).

> may be just append it unconditionally, what do we lose ?
> CFLAGS += "-fomit-frame-pointer"
>
>>  CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>>  CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
>>  SRCREV = "96cbf48313afa65ef4d693d3441cbfd60a8d9b27"
>>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

