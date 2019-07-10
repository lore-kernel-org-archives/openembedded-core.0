Return-Path: <matthias.schiffer@ew.tq-group.com>
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
	by mail.openembedded.org (Postfix) with ESMTP id B21457EEFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 12:40:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.62,474,1554760800"; 
   d="scan'208";a="8149201"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
	by mx1-pgp.tq-group.com with ESMTP; 10 Jul 2019 14:40:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
	by tq-pgp-pr1.tq-net.de (PGP Universal service);
	Wed, 10 Jul 2019 14:40:04 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 10 Jul 2019 14:40:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
	t=1562762404; x=1594298404;
	h=message-id:subject:from:to:date:in-reply-to:references:
	mime-version:content-transfer-encoding;
	bh=8BxxEVsdctVikE0nBAnTouDClwEy+wnuFWwihJjAkdo=;
	b=FnmptJlXFMRZAVNHXsJpO+ezrZ4nx7hDYP0nfjQJ8cn5yLpWNOjwn/ll
	fHbxwtj03hFW5+zEv7cY7MdjK5ujuAFcXf8OTQem1mq1kHPcW8JAvZmBG
	xhkFl7obAOeDfaL9GJ9iYsZDVI8/w6ojBVSXcgsl7L9kc7nn+P3pldOWs
	lOIv3bQfkYVot6BRIvonnXHOrSXFh1iVVWpo2OLGQdp15b8catF08283W
	YxrkdUn3QsXQC0D52DEQPt4D7kcT7USeWScbuwb4fBDXovl1YSdSmVin3
	EBrHxyhrW0qrV7WiVSBJR0+3kTY5j2FTuIR354vbzU7Wp2CPqhVdWCMDS A==;
X-IronPort-AV: E=Sophos;i="5.62,474,1554760800"; 
   d="scan'208";a="8149200"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
	by mx1.tq-group.com with ESMTP; 10 Jul 2019 14:40:03 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
	[10.117.49.26])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 25E8D280074
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:40:39 +0200 (CEST)
Message-ID: <714432f19e29fc660170d05ff3907ff2e40b1e95.camel@ew.tq-group.com>
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 14:40:01 +0200
In-Reply-To: <20190710123132.2332.61175@do>
References: <20190710121353.32717-1-matthias.schiffer@ew.tq-group.com>
	<20190710123132.2332.61175@do>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHN5c3RlbWQ6IGJhY2twb3J0IHBhdGNoIHRvIGZpeCBzeXNjdGwgd2FybmluZyBvbiBib290?=
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
X-List-Received-Date: Wed, 10 Jul 2019 12:40:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-07-10 at 12:31 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: systemd: backport patch to fix sysctl warning on boot
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/18605/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This
> is
> an automated response. Several tests have been executed on the
> proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series cannot be parsed correctly due to
> malformed diff lines [test_mbox_format] 
>   Suggested fix    Create the series again using git-format-patch and
> ensure it can be applied using git am
>   Diff line        Hunk is shorter than expected
> 
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 4cbb7392c7)

I'm not sure what is going on here, the patch applies fine for me.

Is it possible that the patchtest stumbles over unicode characters in
the added patch file? I don't see how that could be avoided, as the
patch touches a line where an emoji was used in a comment...

Kind regards,
Matthias


> 
> 
> 
> If you believe any of these test results are incorrect, please reply
> to the
> mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns.
> Otherwise we would appreciate you correcting the issues and
> submitting a new
> version of the patchset if applicable. Please ensure you
> add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH
> v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     
> http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 


