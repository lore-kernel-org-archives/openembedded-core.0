Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.142.1596658619529391236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 13:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 075KGBVL018644
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 5 Aug 2020 13:16:32 -0700
Received: from mt-manjaro (128.224.72.53) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 5 Aug
 2020 13:16:06 -0700
References: <20200805185133.13830-1-matthew.zeng@windriver.com>
 <20200805190220.2264.95678@do> <87pn84x5fj.fsf@windriver.com>
 <6092f4f3c64934ba1b10d657ca3103ab98cb5a1e.camel@linuxfoundation.org>
User-agent: mu4e 1.4.12; emacs 27.0.91
From: "Matthew" <matthew.zeng@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXSDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBsdHA6IG1ha2UgY29weUZyb20gc2NwIGNvbW1hbmQgbm9uLWZhdGFsIChyZXY0KQ==?=
In-Reply-To: <6092f4f3c64934ba1b10d657ca3103ab98cb5a1e.camel@linuxfoundation.org>
Date: Wed, 5 Aug 2020 16:16:04 -0400
Message-ID: <87mu38x30b.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.72.53]
Content-Type: text/plain


Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> On Wed, 2020-08-05 at 15:23 -0400, Matthew wrote:
>> My poky master is the latest commit (5e1bc3ef5a * net-tools: fix
>> upstream version check) and my patch applies perfectly. Why is
>> Patchwork complaining?
>
> FWIW I just tried to apply the patch and it doesn't apply for me :(.
>
> (Stripping trailing CRs from patch; use --binary to disable.)
> patching file meta/lib/oeqa/core/target/ssh.py
> (Stripping trailing CRs from patch; use --binary to disable.)
> patching file meta/lib/oeqa/runtime/cases/ltp.py
> Hunk #1 FAILED at 78.
> 1 out of 1 hunk FAILED -- saving rejects to file meta/lib/oeqa/runtime/cases/ltp.py.rej
>
> The difference is trailing whitespace which is present on the line:
>
>             remote_src = "/opt/ltp/results/%s" % ltp_group
>
> but has been stripped in your patch.

Arghh, I configured automatic remove trailing whitespace on save, that must be the issue.

Patch with the whitespace sent.

>
> Cheers,
>
> Richard


--
Mingde (Matthew) Zeng
