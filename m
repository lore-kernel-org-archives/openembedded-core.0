Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB5F781FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 22:06:07 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id o88so4112063pfk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 15:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=u/dmoPkqhvEwG6AlOEFo1mHCu9MxDL2yK2IfA1Z4YXs=;
	b=hJ/hZ+u1BBjd1xJRoUv2myBYkNAp04m4dRaoibFHoSK+xiinbrZQIxPwwaL3vBsB1X
	k6hYW91NKTkcnQYIvHQ5zJ9LfwFWL2S8pZLOXCaPclnY7fmCYvX8hJ4JOKlbCMFXXb53
	IiA/EmU2zGgrNccVG+IOHzNagSWakTdQXepOE4aLF/X+WUE/L5cLHKS6M1lN8tUMMvn+
	NyQ28HzJ9XTicjouGjResHm4SXEtI7j1Lj52PWEgJjrAllqMNfazknZ3GLpUxo4/P12t
	90lyle+O0cUQZpkEiW+Dc1ZZEBs6kx1fDowfqRSCg8DHsHmcqiqBRmR/e8j6adKynM5J
	8IgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=u/dmoPkqhvEwG6AlOEFo1mHCu9MxDL2yK2IfA1Z4YXs=;
	b=lwoPvLhawQd9H58yBVSb2ddF9c/Ry8efnRGXSIwAOqpvNd6f/WSPQ8guK/Cjh+rzbJ
	JZB8Z/dd5rXwE8sW65vwdIon05bGURFZ6pmDKXc7pImPcNvqlvDsiUoCRyjLqL0CF/AS
	LVv20QVCsfZcnouPaPAMnMfbWiKrLT7Xww/S/LgzuV/81IRoLAcCJpQnRP7KIO5Wg/q4
	XrxK3RDAoAqv11RLpo5NcsakO8tuSYXENf73b1aJs4+EXOWpooN6tJ51c/DIbqRcnMeh
	JEzGOJk3UJ2cqzXhDcvfNSjTmTTeDsMyxzTQ9yLi0YGKe/hgAtTAS3Sbas14cVC04SfG
	HKRQ==
X-Gm-Message-State: AIVw113vEmfpAw/Bn6iwOiZ54+4XTjicAG73F+4cvbjMoGEQueErcX9k
	ceUkmtGSAtZkAgteeT4=
X-Received: by 10.84.217.208 with SMTP id d16mr3877920plj.269.1500415568271;
	Tue, 18 Jul 2017 15:06:08 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	o24sm7351945pfk.116.2017.07.18.15.06.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 15:06:07 -0700 (PDT)
To: Yuanjie Huang <yuanjie.huang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20170718061445.19196-1-yuanjie.huang@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <4d6ade1e-6e98-10fd-72e2-8f02a52586cc@gmail.com>
Date: Tue, 18 Jul 2017 15:06:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718061445.19196-1-yuanjie.huang@windriver.com>
Subject: Re: [morty][PATCH] glibc: Fix CVE-2015-5180
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
X-List-Received-Date: Tue, 18 Jul 2017 22:06:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Yualie,

On 07/17/2017 11:14 PM, Yuanjie Huang wrote:
> Backport upstream patch to fix NULL pointer dereference and process
> crash in libresolv. (CVE-2015-5180)
I will have to hand merge the bb file as I have several other glibc 
changes sitting in my contrib branch.
Thanks for the patch.

> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
>   meta/recipes-core/glibc/glibc/CVE-2015-5180.patch | 136 ++++++++++++++++++++++
>   meta/recipes-core/glibc/glibc_2.24.bb             |   1 +
>   2 files changed, 137 insertions(+)
>   create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-5180.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2015-5180.patch b/meta/recipes-core/glibc/glibc/CVE-2015-5180.patch
> new file mode 100644
> index 0000000000..638f652c4d
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2015-5180.patch
> @@ -0,0 +1,136 @@
> +From a8476611d5bca2032a2d18c503996762ac26a489 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Sat, 31 Dec 2016 20:22:09 +0100
> +Subject: CVE-2015-5180: resolv: Fix crash with internal QTYPE [BZ #18784]
> +
> +Also rename T_UNSPEC because an upcoming public header file
> +update will use that name.
> +
> +(cherry picked from commit fc82b0a2dfe7dbd35671c10510a8da1043d746a5)
> +
> +Upstream-Status: Backport[master]
> +CVE: CVE-2015-5180
> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> +---
> + ChangeLog                     | 11 +++++++++++
> + NEWS                          |  6 ++++++
> + include/arpa/nameser_compat.h |  6 +++---
> + resolv/nss_dns/dns-host.c     |  2 +-
> + resolv/res_mkquery.c          |  4 ++++
> + resolv/res_query.c            |  6 +++---
> + 6 files changed, 28 insertions(+), 7 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 0fbda9020e..180634e658 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,14 @@
> ++2017-03-07  Siddhesh Poyarekar  <siddhesh@sourceware.org>
> ++
> ++	[BZ #18784]
> ++	CVE-2015-5180
> ++	* include/arpa/nameser_compat.h (T_QUERY_A_AND_AAAA): Rename from
> ++	T_UNSPEC.  Adjust value.
> ++	* resolv/nss_dns/dns-host.c (_nss_dns_gethostbyname4_r): Use it.
> ++	* resolv/res_query.c (__libc_res_nquery): Likewise.
> ++	* resolv/res_mkquery.c (res_nmkquery): Check for out-of-range
> ++	QTYPEs.
> ++
> + 2016-01-28  Carlos O'Donell  <carlos@redhat.com>
> + 	    Alexey Makhalov <amakhalov@vmware.com>
> + 	    Florian Weimer <fweimer@redhat.com>
> +diff --git a/NEWS b/NEWS
> +index b0447e7169..366f602aac 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -71,6 +71,12 @@ Security related changes:
> +   and exits.  Over time, this could result in a denial of service due to
> +   memory exhaustion.  Reported by Matthias Schiffer.  (CVE-2016-5417)
> +
> ++* The DNS stub resolver functions would crash due to a NULL pointer
> ++  dereference when processing a query with a valid DNS question type which
> ++  was used internally in the implementation.  The stub resolver now uses a
> ++  question type which is outside the range of valid question type values.
> ++  (CVE-2015-5180)
> ++
> + The following bugs are resolved with this release:
> +
> +   [1170] localedata: ne_NP: update Nepali locale definition file
> +diff --git a/include/arpa/nameser_compat.h b/include/arpa/nameser_compat.h
> +index 2e735ede4c..7c0deed9ae 100644
> +--- a/include/arpa/nameser_compat.h
> ++++ b/include/arpa/nameser_compat.h
> +@@ -1,8 +1,8 @@
> + #ifndef _ARPA_NAMESER_COMPAT_
> + #include <resolv/arpa/nameser_compat.h>
> +
> +-/* Picksome unused number to represent lookups of IPv4 and IPv6 (i.e.,
> +-   T_A and T_AAAA).  */
> +-#define T_UNSPEC 62321
> ++/* The number is outside the 16-bit RR type range and is used
> ++   internally by the implementation.  */
> ++#define T_QUERY_A_AND_AAAA 439963904
> +
> + #endif
> +diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
> +index 5f9e35701b..d16fa4b8ed 100644
> +--- a/resolv/nss_dns/dns-host.c
> ++++ b/resolv/nss_dns/dns-host.c
> +@@ -323,7 +323,7 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
> +
> +   int olderr = errno;
> +   enum nss_status status;
> +-  int n = __libc_res_nsearch (&_res, name, C_IN, T_UNSPEC,
> ++  int n = __libc_res_nsearch (&_res, name, C_IN, T_QUERY_A_AND_AAAA,
> + 			      host_buffer.buf->buf, 2048, &host_buffer.ptr,
> + 			      &ans2p, &nans2p, &resplen2, &ans2p_malloced);
> +   if (n >= 0)
> +diff --git a/resolv/res_mkquery.c b/resolv/res_mkquery.c
> +index 12f9730199..d80b5318e5 100644
> +--- a/resolv/res_mkquery.c
> ++++ b/resolv/res_mkquery.c
> +@@ -103,6 +103,10 @@ res_nmkquery(res_state statp,
> + 	int n;
> + 	u_char *dnptrs[20], **dpp, **lastdnptr;
> +
> ++	if (class < 0 || class > 65535
> ++	    || type < 0 || type > 65535)
> ++	  return -1;
> ++
> + #ifdef DEBUG
> + 	if (statp->options & RES_DEBUG)
> + 		printf(";; res_nmkquery(%s, %s, %s, %s)\n",
> +diff --git a/resolv/res_query.c b/resolv/res_query.c
> +index 944d1a90f5..07dc6f6583 100644
> +--- a/resolv/res_query.c
> ++++ b/resolv/res_query.c
> +@@ -122,7 +122,7 @@ __libc_res_nquery(res_state statp,
> + 	int n, use_malloc = 0;
> + 	u_int oflags = statp->_flags;
> +
> +-	size_t bufsize = (type == T_UNSPEC ? 2 : 1) * QUERYSIZE;
> ++	size_t bufsize = (type == T_QUERY_A_AND_AAAA ? 2 : 1) * QUERYSIZE;
> + 	u_char *buf = alloca (bufsize);
> + 	u_char *query1 = buf;
> + 	int nquery1 = -1;
> +@@ -137,7 +137,7 @@ __libc_res_nquery(res_state statp,
> + 		printf(";; res_query(%s, %d, %d)\n", name, class, type);
> + #endif
> +
> +-	if (type == T_UNSPEC)
> ++	if (type == T_QUERY_A_AND_AAAA)
> + 	  {
> + 	    n = res_nmkquery(statp, QUERY, name, class, T_A, NULL, 0, NULL,
> + 			     query1, bufsize);
> +@@ -190,7 +190,7 @@ __libc_res_nquery(res_state statp,
> + 	if (__builtin_expect (n <= 0, 0) && !use_malloc) {
> + 		/* Retry just in case res_nmkquery failed because of too
> + 		   short buffer.  Shouldn't happen.  */
> +-		bufsize = (type == T_UNSPEC ? 2 : 1) * MAXPACKET;
> ++		bufsize = (type == T_QUERY_A_AND_AAAA ? 2 : 1) * MAXPACKET;
> + 		buf = malloc (bufsize);
> + 		if (buf != NULL) {
> + 			query1 = buf;
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
> index b60b692723..a3bdba2190 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -38,6 +38,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>              file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>              file://0026-build_local_scope.patch \
>              file://0028-Bug-20116-Fix-use-after-free-in-pthread_create.patch \
> +           file://CVE-2015-5180.patch \
>   "
>   
>   SRC_URI += "\


