Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id ABEDC6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 22:15:21 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 66so2836151pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 15:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=gi56W5epMTdJM7Qrmyou+0HKu9j5SDOhTh2PGB0OlYc=;
	b=DHEGBSTVpvOSR9x83K+hhtG97fy/h3LsNV5NAkfGPJWHQib8fOa1L4lJ6isxAWUXwt
	MowbxJMDuzkAyN2+db3cK9TlKqQOaAdApB2vZSCC+fWYkyJNBtXl9YMmVK1wal25DkC+
	ne+DGRLnR+e1y2+zEJA4kkH4k3C6FkaUGpUxasvH5k48pHlemwKfE7TzA+kAhS1UExgj
	qy7U1wY+ZSkYc1qQli7mgsGxkQmLj/UjwtAf1sTKSNd5Tv9L2jP0YooLla9OybzgHUWM
	qCW5d0j9g7/IVJx64l52RVtV30aXPtYRTVn4GMdVtgc6U6b2Eg29N6fRpkU+Owxxaeph
	lVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=gi56W5epMTdJM7Qrmyou+0HKu9j5SDOhTh2PGB0OlYc=;
	b=MPul956M+ONlD9ocXtaaf+piD+ZzE9rEPDJ+RNMP7YkZmbzXvYuMf5NQzAe20REIZJ
	JkXi3hG3EnD4aUxGg27wrHIpNbBhmr1EScFK/SlihnRU3RXhhmQMtCFOhr8tLqKRcc5e
	pQK8NVHyoKaPEv3hf5U3Kd3XeT3ZV+8ZeNyESvpzG9p2EXeWet5HrkH9H9cskEW5tLo2
	Qm7oPD1lodCfdTct3HsHbHsfBWGl7ItqyykQAKFOEIwwdJgiKIoobakyxzDeaBEL9cKi
	N9aAXQbQ84yiFzMUHMARiSQaG3bBjA4t/u6eRbCibPFyqiovoK+mTIJ3JB6j8E9EsH0o
	fHMA==
X-Gm-Message-State: ALyK8tLr2nCZL/oyOftXQAyyFFPqP1waM1TT9+DWECtQfaGzA/XuErCg8apQozXNhlQ14w==
X-Received: by 10.98.15.68 with SMTP id x65mr4295222pfi.66.1467929721811;
	Thu, 07 Jul 2016 15:15:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d936:bf98:12e5:c256?
	([2601:202:4001:9ea0:d936:bf98:12e5:c256])
	by smtp.googlemail.com with ESMTPSA id
	i20sm6365376pfj.91.2016.07.07.15.15.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jul 2016 15:15:20 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1467911314.git.tom.zanussi@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <577ED475.2040708@gmail.com>
Date: Thu, 7 Jul 2016 15:15:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1467911314.git.tom.zanussi@linux.intel.com>
Subject: Re: [PATCH 0/1][krogoth] Fix systemtap
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
X-List-Received-Date: Thu, 07 Jul 2016 22:15:21 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 07/07/2016 10:10 AM, Tom Zanussi wrote:
> This patch is required for systemtap to work with krogoth and the 4.4 kernel.
> 
> The following changes since commit 98c57bb512ea6790db8604fcf0b88c81651d2ab4:
> 
>   build-appliance-image: Update to krogoth head revision (2016-07-06 17:28:04 +0100)

merged into  akuster/krogoth-next for staging.

thanks,
Armin

> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib tzanussi/systemtap-memory-flags-krogoth
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/systemtap-memory-flags-krogoth
> 
> Tom Zanussi (1):
>   systemtap: Add missing memory flag to fix stap module compilation
> 
>  ...48-by-updating-systemtap-s-memory-flag-us.patch | 73 ++++++++++++++++++++++
>  meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
>  2 files changed, 74 insertions(+)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Fix-BZ1285348-by-updating-systemtap-s-memory-flag-us.patch
> 

