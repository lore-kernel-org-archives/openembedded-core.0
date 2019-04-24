Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id D60AC6D61B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 14:31:13 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id h5so14865557lfm.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 07:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=hLtmc6L1mmL6qO1zfy4xsBO5WFXaXFg4jrYH7BucQ1c=;
	b=q9VVcmkod5PBx7dlAgDhYkUVAlsMOF3lSBMva9vboFE09t2OceIAGehCVPAEVywMz4
	yUvke5aqNXd3RwAIXX4WqwCJpYUUN+AIEtkhStKn+cvgHGGYAm5zCQE3o7Ici0idBvGi
	KqmtCSIHB1E/HdqkMx0mfltDVMbn+fq0TBJmDIpzbrRh/Wr2Kli+UPP3rUk1VFo+BEwN
	QlY38Ih3OJaQ+69nc4MwdGNPm1vH9sxzAWic8OPTS8wsLj3kO9sGyczGsQhIUezTBOXR
	3l9SYrbdBoPhEULv41xDZFrTxlgmuZG4r7CxRDt8Mzl/qZJlYq1uRubatfCE1MG53owR
	hggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=hLtmc6L1mmL6qO1zfy4xsBO5WFXaXFg4jrYH7BucQ1c=;
	b=TUx1u2OsePqBflhTVExfqs5RW6BcLU7aBy1l8QlXA04zquoSPK66XrZpwqTpr6p2YB
	z6hbajG/O6QWUKCoPG4NpCIAWDAvMqml55VqTIpc0qDvWyup3RZtnZYaQv1UB6z79TGs
	7p7iYXilEWZ0sg7XBzqiIdXIHln/+DjwEnNAhzVUlCHJkV84iAQ7BzV2FezBoKtRRLEo
	zZLeQto1lhXwvNmX0rVtZSxpweY86gzcN01Yk/dpGWB7SVF7lTrxnynBG2mWdpLS0aUm
	M0bHEflcCsq55UVpjQSSgk9pET63TTLAbBJV5dKooEKpDRx7xprFt1GTWMrI/HJ9Gu5d
	Kl7Q==
X-Gm-Message-State: APjAAAV8yik6wSmxDSaWtBYdkSp7OC9JeRy92vTYZxGhvG93T/f/VllV
	yhxm0oxHA8cLnHauq98NO22Im3cC09o=
X-Google-Smtp-Source: APXvYqwTk3O63T3Cw3MlUIN+XsWBoqpEBmTrIdC6f+8o8HtstEVwAi6lwdSeyFJLOfRLr6C7XbvcTw==
X-Received: by 2002:a19:2d57:: with SMTP id t23mr16176982lft.99.1556116273825; 
	Wed, 24 Apr 2019 07:31:13 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id d25sm482672lja.91.2019.04.24.07.31.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 07:31:12 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190323163858.15371-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LaYdMRz41qeojHLsv9zj+VL6u7EL8LwM3=JKnKcriw_bQ@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <891ea63e-134f-ded4-b0a7-f1c75022d4cd@oleksandr-kravchuk.com>
Date: Wed, 24 Apr 2019 16:31:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaYdMRz41qeojHLsv9zj+VL6u7EL8LwM3=JKnKcriw_bQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ninja: upate to 1.9.0
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
X-List-Received-Date: Wed, 24 Apr 2019 14:31:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Sure. It's already in master though.

Should I send a new patch or just a diff with master?

On 23/04/2019 11:26, Burton, Ross wrote:
> On Sat, 23 Mar 2019 at 16:39, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> +++ b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
>> @@ -0,0 +1,39 @@
>> +2ff54ad7478a90bd75c91e434236a Mon Sep 17 00:00:00 2001
>> +From: makepost <makepost@firemail.cc>
>> +Date: Mon, 24 Dec 2018 03:13:16 +0200
>> +Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
>> +
>> +In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
>> +compatibility macro. Should help avoid hardcoding platform detection.
>> +---
>> + src/disk_interface.cc | 14 ++++----------
>> + 1 file changed, 4 insertions(+), 10 deletions(-)
>> +
>> +diff --git a/src/disk_interface.cc b/src/disk_interface.cc
>> +index d4c2fb087..dc297c449 100644
>> +--- src/disk_interface.cc
>> ++++ /src/disk_interface.cc
>> +@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
>> +   // that it doesn't exist.
>> +   if (st.st_mtime == 0)
>> +     return 1;
>> +-#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
>> ++#if defined(_AIX)
>> ++  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
>> ++#elif defined(__APPLE__)
>> +   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
>> +           st.st_mtimespec.tv_nsec);
>> +-#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 || defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
>> +-       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) || defined(__FreeBSD__))
>> +-  // For glibc, see "Timestamp files" in the Notes of http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
>> +-  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and define the right macro values above.
>> +-  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
>> +-  // For bionic, C and POSIX API is always enabled.
>> +-  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
>> ++#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
>> +   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_nsec;
>> +-#elif defined(_AIX)
>> +-  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
>> + #else
>> +   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
>> + #endif
> This patch has no Signed-off-by or Upstream-Status.  Can you add those please?
>
> Ross

