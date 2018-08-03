Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08BC078BED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 02:19:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w732JENa025314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2018 19:19:15 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 2 Aug 2018 19:19:14 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180803005322.18552-1-kai.kang@windriver.com>
	<20180803020420.13841.71169@do.openembedded.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <718f5c18-5faf-474f-beb8-091fe5f4a6b9@windriver.com>
Date: Fri, 3 Aug 2018 10:17:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180803020420.13841.71169@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFJlbW92ZSBhbGxhcmNoIGZyb20gcmVjaXBlcyB3aGljaCByZGVwcyBUVU5FX1BLR0FSQ0ggcGFja2FnZXM=?=
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
X-List-Received-Date: Fri, 03 Aug 2018 02:19:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月03日 10:04, Patchwork wrote:
> == Series Details ==
>
> Series: Remove allarch from recipes which rdeps TUNE_PKGARCH packages
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/13360/
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
> * Patch            [1/2] remove allarch from recipes which rdepends on TUNE_PKGARCH packages
>   Issue             Shortlog does not follow expected format [test_shortlog_format]
>    Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"

Conflict with Ross's patch 'ca-certificates: upgrade 20170717 -> 
20180409' which is not merged in branches master and master-next.
I'll rebase on it.

Regards,
Kai

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
>
>

-- 
Regards,
Neil | Kai Kang


