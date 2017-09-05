Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9603977F69
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:40:55 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id 188so3213570pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 21:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XVJ+feA4YEjfiLgxrg22HL0lUf7wVyPra0mMRBLE/FI=;
	b=eVXgVFmotAhAS3mTeOnjVh4SAd3sHgxrRE9anzwok7k3qa9vHIP6dBdX0Gat9VlNqJ
	Q+dOXiRZNkorPPNihs8dN+wPZVWtEc6v5rtqfzUTmiYWBtUKWOFc3lvdUaWf2l8rxk5z
	e+Yq4O5NdvSGPbmdfZTIX3XEG3a/yBgDfaP/bXEqd4mzrDRDxZG2JYpKY+TUdVBk8PJO
	CmVKgh91u49C9hOkLzutxBfDLV52yNBm4VkWTZxYWa1Of3fT7A6HBal5+GYQ+Yxwz7WD
	5vajSjblablcFmo1nTw6wL8FHVpJ3eINSBYUD1Chqv7SXYLOh+8U7VUWjd78RRF+2B6c
	THXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XVJ+feA4YEjfiLgxrg22HL0lUf7wVyPra0mMRBLE/FI=;
	b=ae6vaTOYbKiZc2TqZU8HOnd9gxKKIibtlr6R+qubZpPc5Qoi6Mi4kusaFkj8vdITql
	2NCZaAfVdgUb40nsFX+obgryuCefZurc1vtFCOxVakkeh8vJyJbBgYtL/R1fvB3CUW0C
	5p9RbyazFd5A2xlXX2RqQNht9v8n2WvlAyuoBhTSxRT6Z/0uccUN6k4zMOwfUHd7+0fN
	0i/3HHJLYYUJXM1ZwZ5uzpcze0rvefEvXOLS5PeRG3MD1+/Y1N74QW/OAFEjnEobyqVj
	j1mYAWVynHdOXQC/y4j6Ng5pMX9DvCpw7/PXxmWHB3JMbsvFsgPCCAjZzoElnWtT/sm6
	R7yg==
X-Gm-Message-State: AHPjjUiE5PeVoriPAp3FWATyGHY42rvD1mHryN0hQ0XcDrl+Jncj4YxO
	nMzjv18tkZwNoUSl8Gpln5f6npzKBg==
X-Google-Smtp-Source: ADKCNb5TfZCdh98nxZjGxIgKqVoW7fJB6UFN1qpBa8156KyRS+rupROSKn7xgMuB+1bdpTVSdTAgORV3NiuvbIFWKII=
X-Received: by 10.84.218.199 with SMTP id g7mr2952072plm.215.1504586456460;
	Mon, 04 Sep 2017 21:40:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 4 Sep 2017 21:40:26 -0700 (PDT)
In-Reply-To: <59AE28D3.8060006@windriver.com>
References: <1504585784-112682-1-git-send-email-zhixiong.chi@windriver.com>
	<59AE28D3.8060006@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Sep 2017 21:40:26 -0700
Message-ID: <CAMKF1soSaNQQ03bss2fJtrxePhOhZexWaG0vMQ_hU-VgH5oDiw@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glibc: add ld.so locks in _libc_fork
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
X-List-Received-Date: Tue, 05 Sep 2017 04:40:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 4, 2017 at 9:32 PM, Zhixiong Chi <zhixiong.chi@windriver.com> w=
rote:
> Rebase it to the master branch for glibc 2.26.
>
>
> On 2017=E5=B9=B409=E6=9C=8805=E6=97=A5 12:29, Zhixiong Chi wrote:
>>
>> The patch in this Bugzilla entry was requested by a customer:
>>    https://sourceware.org/bugzilla/show_bug.cgi?id=3D4578
>>    https://www.sourceware.org/bugzilla/show_bug.cgi?id=3D19282
>>
>> If a thread happens to hold dl_load_lock and have r_state set to RT_ADD =
or
>> RT_DELETE at the time another thread calls fork(), then the child exit
>> code
>> from fork (in nptl/sysdeps/unix/sysv/linux/fork.c in our case)
>> re-initializes
>> dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child
>> subsequently requires ld.so functionality before calling exec(), then th=
e
>> assertion will fire.
>>
>> The patch acquires dl_load_lock on entry to fork() and releases it on ex=
it
>> from the parent path.  The child path is initialized as currently done.
>> This is essentially pthreads_atfork, but forced to be first because the
>> acquisition of dl_load_lock must happen before malloc_atfork is active
>> to avoid a deadlock.
>>
>> The __libc_fork() code reset dl_load_lock, but it also needed to reset
>> dl_load_write_lock.

can you send a ping to glibc bugzilla as well

>>
>> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>> ---
>>   ...bc-reset-dl-load-write-lock-after-forking.patch | 37 ++++++++++++++
>>   .../0028-Bug-4578-add-ld.so-lock-while-fork.patch  | 57
>> ++++++++++++++++++++++
>>   meta/recipes-core/glibc/glibc_2.26.bb              |  2 +
>>   3 files changed, 96 insertions(+)
>>   create mode 100644
>> meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-after-=
forking.patch
>>   create mode 100644
>> meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.pa=
tch
>>
>> diff --git
>> a/meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-afte=
r-forking.patch
>> b/meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-afte=
r-forking.patch
>> new file mode 100644
>> index 0000000..777b253
>> --- /dev/null
>> +++
>> b/meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-afte=
r-forking.patch
>> @@ -0,0 +1,37 @@
>> +From a6bb73d1cfd20a73fbbe6076008376fb87879d1b Mon Sep 17 00:00:00 2001
>> +From: Yuanjie Huang <yuanjie.huang@windriver.com>
>> +Date: Thu, 18 Aug 2016 17:59:13 +0800
>> +Subject: [PATCH] reset dl_load_write_lock after forking
>> +
>> +The patch in this Bugzilla entry was requested by a customer:
>> +
>> +  https://www.sourceware.org/bugzilla/show_bug.cgi?id=3D19282
>> +
>> +The __libc_fork() code reset dl_load_lock, but it also needed to reset
>> +dl_load_write_lock.  The patch has not yet been integrated upstream.
>> +
>> +Upstream-Status: Pending [ Not Author See bugzilla]
>> +
>> +Signed-off-by: Damodar Sonone <damodar.sonone@kpit.com>
>> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
>> +---
>> + sysdeps/nptl/fork.c | 3 ++-
>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
>> +index 2b9ae4b..3d0b8da 100644
>> +--- a/sysdeps/nptl/fork.c
>> ++++ b/sysdeps/nptl/fork.c
>> +@@ -174,8 +174,9 @@ __libc_fork (void)
>> +       /* Reset locks in the I/O code.  */
>> +       _IO_list_resetlock ();
>> +
>> +-      /* Reset the lock the dynamic loader uses to protect its data.  =
*/
>> ++      /* Reset the locks the dynamic loader uses to protect its data.
>> */
>> +       __rtld_lock_initialize (GL(dl_load_lock));
>> ++      __rtld_lock_initialize (GL(dl_load_write_lock));
>> +
>> +       /* Run the handlers registered for the child.  */
>> +       while (allp !=3D NULL)
>> +--
>> +1.9.1
>> diff --git
>> a/meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.=
patch
>> b/meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.=
patch
>> new file mode 100644
>> index 0000000..f76237a
>> --- /dev/null
>> +++
>> b/meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.=
patch
>> @@ -0,0 +1,57 @@
>> +The patch in this Bugzilla entry was requested by a customer:
>> +  https://sourceware.org/bugzilla/show_bug.cgi?id=3D4578
>> +
>> +If a thread happens to hold dl_load_lock and have r_state set to RT_ADD
>> or
>> +RT_DELETE at the time another thread calls fork(), then the child exit
>> code
>> +from fork (in nptl/sysdeps/unix/sysv/linux/fork.c in our case)
>> re-initializes
>> +dl_load_lock but does not restore r_state to RT_CONSISTENT. If the chil=
d
>> +subsequently requires ld.so functionality before calling exec(), then t=
he
>> +assertion will fire.
>> +
>> +The patch acquires dl_load_lock on entry to fork() and releases it on
>> exit
>> +from the parent path.  The child path is initialized as currently done.
>> +This is essentially pthreads_atfork, but forced to be first because the
>> +acquisition of dl_load_lock must happen before malloc_atfork is active
>> +to avoid a deadlock.
>> +The patch has not yet been integrated upstream.
>> +
>> +Upstream-Status: Pending [ Not Author See bugzilla]
>> +
>> +Signed-off-by: Raghunath Lolur <Raghunath.Lolur@kpit.com>
>> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
>> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>> +
>> +Index: git/sysdeps/nptl/fork.c
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- git.orig/sysdeps/nptl/fork.c       2017-08-03 16:02:15.674704080
>> +0800
>> ++++ git/sysdeps/nptl/fork.c    2017-08-04 18:15:02.463362015 +0800
>> +@@ -25,6 +25,7 @@
>> + #include <tls.h>
>> + #include <hp-timing.h>
>> + #include <ldsodefs.h>
>> ++#include <libc-lock.h>
>> + #include <stdio-lock.h>
>> + #include <atomic.h>
>> + #include <nptl/pthreadP.h>
>> +@@ -60,6 +61,10 @@
>> +      but our current fork implementation is not.  */
>> +   bool multiple_threads =3D THREAD_GETMEM (THREAD_SELF,
>> header.multiple_threads);
>> +
>> ++  /* grab ld.so lock BEFORE switching to malloc_atfork */
>> ++  __rtld_lock_lock_recursive (GL(dl_load_lock));
>> ++  __rtld_lock_lock_recursive (GL(dl_load_write_lock));
>> ++
>> +   /* Run all the registered preparation handlers.  In reverse order.
>> +      While doing this we build up a list of all the entries.  */
>> +   struct fork_handler *runp;
>> +@@ -247,6 +252,10 @@
>> +
>> +         allp =3D allp->next;
>> +       }
>> ++
>> ++      /* unlock ld.so last, because we locked it first */
>> ++      __rtld_lock_unlock_recursive (GL(dl_load_write_lock));
>> ++      __rtld_lock_unlock_recursive (GL(dl_load_lock));
>> +     }
>> +
>> +   return pid;
>> diff --git a/meta/recipes-core/glibc/glibc_2.26.bb
>> b/meta/recipes-core/glibc/glibc_2.26.bb
>> index d453d8f..135ec4f 100644
>> --- a/meta/recipes-core/glibc/glibc_2.26.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.26.bb
>> @@ -41,6 +41,8 @@ SRC_URI =3D
>> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>>
>> file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
>>              file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch =
\
>>
>> file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
>> +           file://0027-glibc-reset-dl-load-write-lock-after-forking.pat=
ch
>> \
>> +           file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
>>   "
>>     NATIVESDKFIXES ?=3D ""
>
>
> --
> ---------------------
> Thanks,
> Zhixiong Chi
> Tel: +86-10-8477-7036
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

