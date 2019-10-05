Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id A97886BCD6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2019 22:20:38 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 4ECC95C09C4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 00:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1570314038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=CMys0sGa/4IbOVdt2rqP6hI6hITMl76Ct67AdMYZIG4=;
	b=xLMhZ89nJXC3N5Aq1RmBUcvHJdmpEeW/EKalQM2xELGKSTFKBZiZRsyeiuXgEnDsOrDX7G
	y4npdC07KJUIyhgwL0gAslUBm3m982jPo9MxLW6IMKtNN4DWePeL+cpiyUKwx5CowTShGc
	qYhHpwW5LFh0zIVL7rmgEsy/q0GFA2I=
MIME-Version: 1.0
Date: Sun, 06 Oct 2019 00:20:38 +0200
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20191005213159.2334.53447@do>
References: <20191005210834.28170-1-stefan@agner.ch>
	<20191005213159.2334.53447@do>
Message-ID: <a35970e05f8d82a43f3f6aa81052bce2@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHpyYW06IHByb3Blcmx5IGltcGxlbWVudCBzeXN0ZW1kIHNlcnZpY2U=?=
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
X-List-Received-Date: Sat, 05 Oct 2019 22:20:38 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

As an on and off contributor I rely on the instructions in the OE wiki.
Unfortunately the example for meta-oe is just next of an example using
the openembedded-core@lists.openembedded.org. Maybe the second example
should contain the correct address for meta-oe as well?
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_patches

--
Stefan


On 2019-10-05 23:31, Patchwork wrote:
> == Series Details ==
> 
> Series: zram: properly implement systemd service
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/20315/
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
> * Issue             Series sent to the wrong mailing list or some
> patches from the series correspond to different mailing lists
> [test_target_mailing_list]
>   Suggested fix    Send the series again to the correct mailing list (ML)
>   Suggested ML     openembedded-devel@lists.openembedded.org
> [http://git.openembedded.org/meta-openembedded/]
>   Patch's path:    meta-oe/recipes-extended/zram/zram/dev-zram0.swap
> 
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 520c6f30cd)
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

