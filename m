Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.4239.1596655428799648303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 12:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 075JNlSQ013257
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Aug 2020 12:23:48 -0700 (PDT)
Received: from mt-manjaro (128.224.72.53) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 5 Aug
 2020 12:23:47 -0700
References: <20200805185133.13830-1-matthew.zeng@windriver.com>
 <20200805190220.2264.95678@do>
User-agent: mu4e 1.4.12; emacs 27.0.91
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGx0cDogbWFrZSBjb3B5RnJvbSBzY3AgY29tbWFuZCBub24tZmF0YWwgKHJldjQp?=
In-Reply-To: <20200805190220.2264.95678@do>
Date: Wed, 5 Aug 2020 15:23:44 -0400
Message-ID: <87pn84x5fj.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.72.53]
Content-Type: text/plain


My poky master is the latest commit (5e1bc3ef5a * net-tools: fix upstream version check) and my patch applies perfectly. Why is Patchwork complaining?

Patchwork <patchwork@patchwork.openembedded.org> writes:

> == Series Details ==
>
> Series: ltp: make copyFrom scp command non-fatal (rev4)
> Revision: 4
> URL   : https://patchwork.openembedded.org/series/25475/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 10221e578f)
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


--
Mingde (Matthew) Zeng
