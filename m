Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id C88D4601A4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 17:25:36 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hh10so433849pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2016 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=/F2+VjWFLMaqm2ceIYEdA+rNbW5eL3PIUU4V7Sz+zOM=;
	b=Frnb23BKqDC1vvfmh2oQ108VhkFtfu9Sazq/GMZYkrMIoPtG8zlipR6Ztl3j87YCJP
	pOrMHBy7weL9mQAls59EqZ11bseO3ptz6pboj/+4Dfi/71HfnRlmC/2rDCsq2VblA84L
	y1UpFeda6awG6inZdn47qvrV2qMqHQXeC50e0pEMM6OPpBYvATOdHcBvjTXMWhPdiEXI
	z6b91KSjbCjTkHSt8uvbLOlAQmY0PRFevrZ30BS61MtHLsZ2MRjfQ1kVEHD9b7yOQHSV
	MRYS/0Kmn55KNadHilhwp2MHo3WxMgXGAqqpcEhZsdYT6AtZQeRoWk11Yrn1ZbZ4Y1H+
	lEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=/F2+VjWFLMaqm2ceIYEdA+rNbW5eL3PIUU4V7Sz+zOM=;
	b=aN7xZG4/mIshp+fXGD6JC6LFUf+4ebE7aVBmZtUl33+Nup4Q0mk/aX+ve14vHGPKMI
	uB585zWYWeVLKBQy8kZm+SvECdpnOgqfqFQ+BW1KKsCOK6bJtTNhc+U8vMXL1hiNE1mC
	1ECtAFcHVOf6C5G4U+KuVkh77Dw6Tmm8fYk2OZzhmMpH1WeM7dYAIIroauCCY5r6qSyz
	rsu1GwIowbLXMBUmU9KI7hfZfHfu9KU40EcBgAyA2bt0NXpawzJaCJQ0CdYZNrceQusC
	L1hFBrFtZ+kZtV/G+XPX55f4zTmbKq/LUaALWIDxzPVt9Dt8909cV+r2NLOSG2LqAZth
	1W7g==
X-Gm-Message-State: ALyK8tLlncg35eL7HAx8aA7kRNpqp1cpCG1Rc2uVAzMbqiEGo4ZEvtIvg9kFQ4o2NNpKBw==
X-Received: by 10.66.160.199 with SMTP id xm7mr20193356pab.78.1468085136794;
	Sat, 09 Jul 2016 10:25:36 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:6ce8:588a:7616:ca9?
	([2601:202:4001:9ea0:6ce8:588a:7616:ca9])
	by smtp.googlemail.com with ESMTPSA id
	d65sm5305802pfa.45.2016.07.09.10.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jul 2016 10:25:35 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1468018113-32659-1-git-send-email-akuster808@gmail.com>
	<CAMKF1sro1hRSYMG8O4bEck78EyJbpWunmOWZG_43a2je3nPXQQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5781338B.6070800@gmail.com>
Date: Sat, 9 Jul 2016 10:25:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sro1hRSYMG8O4bEck78EyJbpWunmOWZG_43a2je3nPXQQ@mail.gmail.com>
Cc: Armin Kuster <akuster@mvisa.com>, Armin Kuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] glibc: CVE-2016-4429
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
X-List-Received-Date: Sat, 09 Jul 2016 17:25:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 07/08/2016 04:08 PM, Khem Raj wrote:
> On Fri, Jul 8, 2016 at 3:48 PM, Armin Kuster <akuster808@gmail.com> wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> Signed-off-by: Armin Kuster <akuster@mvisa.com>
>> ---
>>  meta/recipes-core/glibc/glibc/CVE-2016-4429.patch | 86 +++++++++++++++++++++++
>>  meta/recipes-core/glibc/glibc_2.24.bb             |  1 +
>>  2 files changed, 87 insertions(+)
>>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-4429.patch
>>
>> diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-4429.patch b/meta/recipes-core/glibc/glibc/CVE-2016-4429.patch
>> new file mode 100644
>> index 0000000..074c60d
>> --- /dev/null
>> +++ b/meta/recipes-core/glibc/glibc/CVE-2016-4429.patch
>> @@ -0,0 +1,86 @@
>> +From bc779a1a5b3035133024b21e2f339fe4219fb11c Mon Sep 17 00:00:00 2001
>> +From: Florian Weimer <fweimer@redhat.com>
>> +Date: Mon, 23 May 2016 20:18:34 +0200
>> +Subject: [PATCH] CVE-2016-4429: sunrpc: Do not use alloca in clntudp_call [BZ
>> + #20112]
>> +
>> +The call is technically in a loop, and under certain circumstances
>> +(which are quite difficult to reproduce in a test case), alloca
>> +can be invoked repeatedly during a single call to clntudp_call.
>> +As a result, the available stack space can be exhausted (even
>> +though individual alloca sizes are bounded implicitly by what
>> +can fit into a UDP packet, as a side effect of the earlier
>> +successful send operation).
> 
> this should be covered with latest pull I have sent especially this patch
> https://patchwork.openembedded.org/patch/126637/
> 
> would be nice if you could test this one out.

This fix in the update you have submitted for master.

This is one of those "Do I fix master knowing updates are imitate."
quandaries.  Time to address stable branches.

- armin

> 
>> +---
>> + ChangeLog         |  7 +++++++
>> + NEWS              |  4 ++++
>> + sunrpc/clnt_udp.c | 10 +++++++++-
>> + 3 files changed, 20 insertions(+), 1 deletion(-)
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2016-4429
>> +Signed-of-by: Armin Kuster <akuster@mvista.com>
>> +
>> +Index: git/ChangeLog
>> +===================================================================
>> +--- git.orig/ChangeLog
>> ++++ git/ChangeLog
>> +@@ -1,3 +1,9 @@
>> ++2016-05-23  Florian Weimer  <fweimer@redhat.com>
>> ++       CVE-2016-4429
>> ++       [BZ #20112]
>> ++       * sunrpc/clnt_udp.c (clntudp_call): Use malloc/free for the error
>> ++       payload.
>> ++
>> + 2016-05-11  Florian Weimer  <fweimer@redhat.com>
>> +
>> +       Do not use mcheck in localedef.
>> +Index: git/NEWS
>> +===================================================================
>> +--- git.orig/NEWS
>> ++++ git/NEWS
>> +@@ -48,6 +48,10 @@ Security related changes:
>> +   called with the GLOB_ALTDIRFUNC flag and encountered a long file name.
>> +   Reported by Alexander Cherepanov.  (CVE-2016-1234)
>> +
>> ++* The Sun RPC UDP client could exhaust all available stack space when
>> ++  flooded with crafted ICMP and UDP messages.  Reported by Aldy Hernandez'
>> ++  alloca plugin for GCC.  (CVE-2016-4429)
>> ++
>> + The following bugs are resolved with this release:
>> +
>> +   [The release manager will add the list generated by
>> +Index: git/sunrpc/clnt_udp.c
>> +===================================================================
>> +--- git.orig/sunrpc/clnt_udp.c
>> ++++ git/sunrpc/clnt_udp.c
>> +@@ -388,9 +388,15 @@ send_again:
>> +         struct sock_extended_err *e;
>> +         struct sockaddr_in err_addr;
>> +         struct iovec iov;
>> +-        char *cbuf = (char *) alloca (outlen + 256);
>> ++        char *cbuf = malloc (outlen + 256);
>> +         int ret;
>> +
>> ++        if (cbuf == NULL)
>> ++          {
>> ++            cu->cu_error.re_errno = errno;
>> ++            return (cu->cu_error.re_status = RPC_CANTRECV);
>> ++          }
>> ++
>> +         iov.iov_base = cbuf + 256;
>> +         iov.iov_len = outlen;
>> +         msg.msg_name = (void *) &err_addr;
>> +@@ -415,10 +421,12 @@ send_again:
>> +                cmsg = CMSG_NXTHDR (&msg, cmsg))
>> +             if (cmsg->cmsg_level == SOL_IP && cmsg->cmsg_type == IP_RECVERR)
>> +               {
>> ++                free (cbuf);
>> +                 e = (struct sock_extended_err *) CMSG_DATA(cmsg);
>> +                 cu->cu_error.re_errno = e->ee_errno;
>> +                 return (cu->cu_error.re_status = RPC_CANTRECV);
>> +               }
>> ++        free (cbuf);
>> +       }
>> + #endif
>> +       do
>> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
>> index 77630e3..c2a31e0 100644
>> --- a/meta/recipes-core/glibc/glibc_2.24.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
>> @@ -37,6 +37,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>>             file://0023-eglibc-Install-PIC-archives.patch \
>>             file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
>>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>> +           file://CVE-2016-4429.patch \
>>  "
>>
>>  SRC_URI += "\
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

