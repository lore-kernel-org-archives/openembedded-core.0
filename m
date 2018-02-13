Return-Path: <robert_joslyn@selinc.com>
Received: from volare.selinc.com (volare.selinc.com [74.117.214.143])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1B47814B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 21:31:14 +0000 (UTC)
Received: from pps.filterd (volare.selinc.com [127.0.0.1])
	by volare.selinc.com (8.16.0.22/8.16.0.22) with SMTP id w1DLQgaf028309
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 13:31:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
	h=in-reply-to :
	references : to : mime-version : subject : message-id : from : date :
	content-type; s=SELinc2017;
	bh=bMT3xeXh11a0232c6wn3VFIwn9/+ZTwQKxAIVvLSZUE=;
	b=2DaET+HrPm4qpuEk34ZE652sRE7RIdadavUuB0cz9ZKDDHu0dEKIXZQiVvpwMGflxMYu
	WcRWOldZZHTsQ8c57bGSFUNDDhok3vUxta7cfAoRFZn+LfNQjEb2flqiBSJAEgUr6hvj
	3j/KzSAO4ybxyhE7UZWW/izCSKQnacbVvQRxaJz6UXaXdIYeOImMKYf5lfY3GJHc1v8t
	0Y/VXrdlTc/bt+cy7a2sSEAeEc+SJBofPMT3G112vt3nAItjUyOMpj7qwVnBQeUCxEVd
	1Xc70vnQM+XCGhnKQvdZ8k2K6T9KlaQ6fRktuL8oRG3umdAB9DXAtte8vYj5mFKBciga
	YQ== 
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by volare.selinc.com with ESMTP id 2g1w5rkx0p-1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 13:31:16 -0800
In-Reply-To: <20180213200430.15536.59430@do.openembedded.org>
References: <20180213195629.32713-1-robert_joslyn@selinc.com>
	<20180213200430.15536.59430@do.openembedded.org>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: 53119DD1:11E1A373-88258233:00729E83;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
Message-ID: <OF53119DD1.11E1A373-ON88258233.00729E83-88258233.007636E8@selinc.com>
From: robert_joslyn@selinc.com
Date: Tue, 13 Feb 2018 13:31:13 -0800
X-MIMETrack: S/MIME Sign by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 02/13/2018 01:31:13 PM,
	Serialize by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 02/13/2018 01:31:13 PM,
	Serialize complete at 02/13/2018 01:31:13 PM,
	S/MIME Sign failed at 02/13/2018 01:31:13 PM: The cryptographic key was
	not found,
	Serialize by Router on Edison/SEL(Release 9.0.1FP9 HF139|October 06,
	2017) at 02/13/2018 01:31:16 PM,
	Serialize complete at 02/13/2018 01:31:16 PM
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8804
	signatures=668670
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wZW5zc2w6IFVwZ3JhZGUgZnJvbSAxLjAuMmsgdG8gMS4wLjJu?=
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
X-List-Received-Date: Tue, 13 Feb 2018 21:31:15 -0000
Content-Type: text/plain; charset="US-ASCII"

Patchwork <patchwork@patchwork.openembedded.org> wrote on 02/13/2018 
12:04:30 PM:

> == Series Details ==
> 
> Series: openssl: Upgrade from 1.0.2k to 1.0.2n
> Revision: 1
> URL   : https://urldefense.proofpoint.com/v2/url?
> 
u=https-3A__patchwork.openembedded.org_series_10958_&d=DwICaQ&c=zVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-
> 
Gb60_N6TVnLk&r=jKjb9x138uKtDnkEJ0l_Ks7NxaK4YpEWM1o0MkNOIx0&m=e7jg3aTWVYdmFaC21AlrNvOx1_qajpaOj2OHjsTZ654&s=9QNMi3VNaubjQf3y9jBZmv5TBjaNNWdE9v75bBdAzR8&e=
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
> * Issue             Series does not apply on top of target branch 
> [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  pyro (currently at 2c61e60cc5)
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to 
the
> mailing list (openembedded-core@lists.openembedded.org) raising 
yourconcerns.
> Otherwise we would appreciate you correcting the issues and submitting a 
new
> version of the patchset if applicable. Please ensure you add/increment 
the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] 
->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     https://urldefense.proofpoint.com/v2/url?
> 
u=https-3A__www.openembedded.org_wiki_Commit-5FPatch-5FMessage-5FGuidelines&d=DwICaQ&c=zVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-
> 
Gb60_N6TVnLk&r=jKjb9x138uKtDnkEJ0l_Ks7NxaK4YpEWM1o0MkNOIx0&m=e7jg3aTWVYdmFaC21AlrNvOx1_qajpaOj2OHjsTZ654&s=-
> jCJpJdJRPInvZ3mPBypauSGq16-k4Z4vRCcXMQ9F70&e=
> Test framework: https://urldefense.proofpoint.com/v2/url?
> 
u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_patchtest&d=DwICaQ&c=zVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-
> 
Gb60_N6TVnLk&r=jKjb9x138uKtDnkEJ0l_Ks7NxaK4YpEWM1o0MkNOIx0&m=e7jg3aTWVYdmFaC21AlrNvOx1_qajpaOj2OHjsTZ654&s=QrASQqaT3MEEj1zQgTDQ5iQO93aJ2zooq57BdIgB1cU&e=
> Test suite:     https://urldefense.proofpoint.com/v2/url?
> 
u=http-3A__git.yoctoproject.org_cgit_cgit.cgi_patchtest-2Doe&d=DwICaQ&c=zVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-
> 
Gb60_N6TVnLk&r=jKjb9x138uKtDnkEJ0l_Ks7NxaK4YpEWM1o0MkNOIx0&m=e7jg3aTWVYdmFaC21AlrNvOx1_qajpaOj2OHjsTZ654&s=fqNrlIHFwuTo2gHbIXgrogfoHFxaSl1EvqECV2p4Y-
> w&e=
> 

Unfortunately, this is caused by my company's email filter replacing URLs 
with redirects from proofpoint (which you can see more of above). It's an 
attempt at preventing us from clicking on malicious URLs, but I had no 
idea it did the replacement on outgoing email as well as incoming... I'll 
try to send the patch from a personal email account later.

Thanks,
Robert

