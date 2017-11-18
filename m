Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id C4D2E78685
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 09:08:04 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id C8D365C37E5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 10:02:41 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 18 Nov 2017 10:03:41 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20171118090301.2783.15393@do.openembedded.org>
References: <20171118085357.47305-1-stefan@agner.ch>
	<20171118090301.2783.15393@do.openembedded.org>
Message-ID: <789b135f8ab78e296dd336ac9a21f68f@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510995761; bh=fsV4iXhnRVKld2/GXUMKMJwpit+cS5CN0sdsFjZfAQ0=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Subject:In-Reply-To:References:Message-ID;
	b=C3gcdl2/+FwkrE2PCsX/K0QDJM2j8etBZyH/ZaNZLfrIGyGUOsJrtMrJYu7JNMfIr0B25R0MBeRYWvb0h6B3yAbWlnloWo4iPmdKK8hzOFEAr0r/BP4DNnEBKE5QBLA76WKx4W+QjrGU0I4sWYg6L6YQrLtwv0JZtr4vqcbMsg8=
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjJdIG9wZW5zc2wxMDogVXBncmFkZSAxLjAuMmwuLi4iIGFuZCAzIG1vcmU=?=
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
X-List-Received-Date: Sat, 18 Nov 2017 09:08:05 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-11-18 10:03, Patchwork wrote:
> == Series Details ==
> 
> Series: "[v2] openssl10: Upgrade 1.0.2l..." and 3 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/9868/
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
> * Patch            [v2,1/4] openssl10: Upgrade 1.0.2l -> 1.0.2m
>  Issue             Missing or incorrectly formatted CVE tag in
> included patch file [test_cve_tag_format]
>   Suggested fix    Correct or include the CVE tag on cve patch with
> format: "CVE: CVE-YYYY-XXXX"

I did not add any new patches which address CVE, hence I think this is a
false positive/not applicable.

--
Stefan

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
> Guidelines:    
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe

