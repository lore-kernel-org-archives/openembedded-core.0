Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0406B78685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 13:29:17 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id f23-v6so7421288plr.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xTFx1VCudHVwm5ID8EGfveWVlR/D5+22UP+BWwP4VAQ=;
	b=RADFmcq9TfwAWTKu+C3R/xFXsOddcFykQ7VIDhtcOAdzXACB5nMXyvK215iCvfZVaM
	1hVRTWaafQWtu+aTT6/70LEeVAHU0VFqgT/TcKrfa3ti+c4r5BPy2nm+2OeEruGhuUs7
	VmDJfyLxX2z+jLXckMISYgi+dys9yDwp9wBAGgNi7YaV1HRO/vXdNZzId7+0NyKEfcYW
	MmrXRUCf9MTsjbGYkRCU6TntcdraREEFFOBGYKxRmInndTUG7a1xTbng7rhZA0KUsTBh
	6Py4ZwnFKvTm7LZAWQL+arEkSX4iSWDvyXmogzsxxR6BZ9txB3zJfa2bE/SzWQG4STcH
	ZxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xTFx1VCudHVwm5ID8EGfveWVlR/D5+22UP+BWwP4VAQ=;
	b=rWlVenlDyjh74LOElQRpzn3TRlDnn1IEZNK279OiFX8fU4ZyubgV2TrSPKc9u1DE1r
	Sl1Cx7h2x8LrucZKmLXtJrqXv6S69mgnrQhPzzdQBwOkAZ4Xiqwg+Uq7SGB7vPUD6Lf4
	gOvuUf7zQN4JigvLsAsOk9gG8LsxR8sVnywjNCSwtQYSCqmSONW+DZbE15X5lBhsVenn
	N+PCKN2zQm7QHBppslnDm96Eq0uryVKVDjjy9AKe5i3K13R8kSwIQxDPTbhfoYV/oVQ5
	Wc4D91nVtBE/HBG4ACoTLiAgXCJxSJrBRWgTeo8WJG4lHv7pDNI6OP+3scqYHaJgvp5S
	2vcg==
X-Gm-Message-State: AElRT7FVLCAAhtii+kXlQVlumtclnsfi9LQkOfte7G6N0h/YgdDs60SL
	6fs5Y44FqeMJB0nkIV5EtW/2Xej4O4t6mUJSN2A=
X-Google-Smtp-Source: AG47ELuDxse81+3N7wQIFBVEGcSZq7CE775Z4s1Jpbx6o2TXLSCwO+K4oTBNWME/WlOzMuNQ3GflSNDg4tPCk2aQexE=
X-Received: by 2002:a17:902:63:: with SMTP id
	90-v6mr30044421pla.125.1521811758993; 
	Fri, 23 Mar 2018 06:29:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.173.149 with HTTP; Fri, 23 Mar 2018 06:28:48 -0700 (PDT)
In-Reply-To: <566d1fb6-3fc6-8bd4-da75-07b5ff798f64@cisco.com>
References: <20180322173742.40112-1-oobitots@cisco.com>
	<CAMKF1sojOiyVd8eRcVt=59U6a1+3YhW3DeeDEsW=VhHuT4_ghw@mail.gmail.com>
	<566d1fb6-3fc6-8bd4-da75-07b5ff798f64@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Mar 2018 06:28:48 -0700
Message-ID: <CAMKF1so6L=syzKYR1uzXMFiRjD=AxKyaU+OKZktRqzj9pgoAuw@mail.gmail.com>
To: "Oleksiy Obitotskyy (cisco)" <oobitots@cisco.com>
Cc: XE-Linux <xe-linux-external@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcp-wrappers: Fix build with clang
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
X-List-Received-Date: Fri, 23 Mar 2018 13:29:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 23, 2018 at 4:16 AM, Oleksiy Obitotskyy (cisco)
<oobitots@cisco.com> wrote:
> Hello,
>
> I would like to clarify your question.
> Function fix_options has no prototype into tcpd.c and miscd.c and generate
> warnings
> 'warning: implicit declaration of function' but links fine.
> So should I add prototype for fix_options or leave it as is?

I would suggest that fix it also now while you are there.

>
> On 23.03.18 07:21, Khem Raj wrote:
>>
>> On Thu, Mar 22, 2018 at 10:37 AM, Oleksiy Obitotskyy <oobitots@cisco.com>
>> wrote:
>>>
>>> Fix non-void function 'fix_options' should return a value.
>>>
>> this patch is ok. Can you also check if this function signature is needed
>> in
>> other source files as well ?
>>
>>> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
>>> ---
>>>   .../0001-Fix-build-with-clang.patch                | 30
>>> ++++++++++++++++++++++
>>>   .../tcp-wrappers/tcp-wrappers_7.6.bb               |  1 +
>>>   2 files changed, 31 insertions(+)
>>>   create mode 100644
>>> meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
>>>
>>> diff --git
>>> a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
>>> b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
>>> new file mode 100644
>>> index 0000000..e601409
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
>>> @@ -0,0 +1,30 @@
>>> +From 46ade5e6f3bd3e11b6dd25fa0116c39753d2ba06 Mon Sep 17 00:00:00 2001
>>> +From: Oleksiy Obitotskyy <oobitots@cisco.com>
>>> +Date: Mon, 5 Feb 2018 08:29:10 -0800
>>> +Subject: [PATCH] Fix build with clang
>>> +
>>> +Fix "error: non-void function 'fix_options' should return a value".
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
>>> +---
>>> + fix_options.c | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/fix_options.c b/fix_options.c
>>> +index b5e81b8..9958ff4 100644
>>> +--- a/fix_options.c
>>> ++++ b/fix_options.c
>>> +@@ -29,7 +29,7 @@ static char sccsid[] = "@(#) fix_options.c 1.6
>>> 97/04/08 02:29:19";
>>> +
>>> + /* fix_options - get rid of IP-level socket options */
>>> +
>>> +-fix_options(request)
>>> ++void fix_options(request)
>>> + struct request_info *request;
>>> + {
>>> + #ifdef IP_OPTIONS
>>> +--
>>> +2.10.3.dirty
>>> +
>>> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>>> b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>>> index 5fdbbce..8519da6 100644
>>> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>>> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>>> @@ -44,6 +44,7 @@ SRC_URI =
>>> "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
>>>              file://safe_finger.8 \
>>>              file://makefile-fix-parallel.patch \
>>>              file://musl-decls.patch \
>>> +           file://0001-Fix-build-with-clang.patch \
>>>              "
>>>
>>>   SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
>>> --
>>> 2.10.3.dirty
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

