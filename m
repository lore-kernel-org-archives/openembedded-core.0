Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E829C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 13:21:31 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.8799.1643980885654058033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 05:21:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=Ltkg1hcy;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 214DLLRR112469
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 4 Feb 2022 14:21:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1643980882;
	bh=ZNsFZq8hMVWnnkNFTp8tKYtWzYKalNJCU9IT9DsshDs=; l=1200;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=Ltkg1hcy+97TLne8G2hBqdByWGs8JlHeuKSNqWDKblYVpEaN1bSUH3sOtUO+Lzs6g
	 TYnPhShlIYPQ6Nh7rbwI68i10JtLTlqrkbHk5wSRvfRgF1KblbIqLPJgOSNHKt0KDF
	 T+BNsJroAGf+HNa9vq0nklo8+dFf6em8aA2Lwlxg=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 214DLJDp345917;
	Fri, 4 Feb 2022 14:21:20 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 262A2750B20; Fri, 4 Feb 2022 14:21:16 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 214DLF1p113727
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 4 Feb 2022 14:21:15 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nFyWZ-00H2tN-4A; Fri, 04 Feb 2022 14:21:15 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Jon Mason" <jdmason@kudzu.us>
Cc: yocto@lists.yoctoproject.org,
        Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>,
        OpenEmbedded Devel List
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] Inclusive Language Proposal for YP/OE
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
Date: Fri, 04 Feb 2022 14:21:15 +0100
In-Reply-To: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
	(Jon Mason's message of "Mon, 24 Jan 2022 11:17:58 -0500")
Message-ID: <lyiltukbsk.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 13:21:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161344

"Jon Mason" <jdmason@kudzu.us> writes:

> For BB_DISKMON_DIRS, the actions "ABORT, STOPTASKS and WARN" would
> become "HALT, NO_NEW_TASKS and "WARN".

I am not an native english speaker, but for "HALT" I will have to think
twice whether it will pause the operation or abort it.  I would stay at
"ABORT" because it makes much more clear what happens.


> BB_HASHCONFIG_WHITELIST -> BB_HASHCONFIG_IGNORE_VARS
> BB_SETSCENE_ENFORCE_WHITELIST -> BB_SETSCENE_ENFORCE_IGNORE_TASKS
> BB_HASHBASE_WHITELIST -> BB_BASEHASH_IGNORE_VARS
> MULTI_PROVIDER_WHITELIST -> BB_MULTI_PROVIDER_ALLOWED

The new variable names sound like boolean flags, not like lists.


> SSTATE_DUPWHITELIST -> SSTATE_ALLOW_OVERLAP_FILES
> CVE_CHECK_PN_WHITELIST -> CVE_CHECK_SKIPRECIPE
> CVE_CHECK_WHITELIST -> CVE_CHECK_IGNORECVE
> SYSROOT_DIRS_BLACKLIST -> SYSROOT_DIRS_IGNORE
> LICENSE_FLAGS_WHITELIST -> LICENSE_FLAGS_ACCEPTED
> UNKNOWN_CONFIGURE_WHITELIST -> UNKNOWN_CONFIGURE_OPT_IGNORE
> SDK_LOCAL_CONF_BLACKLIST -> ESDK_LOCALCONF_REMOVE
> SDK_LOCAL_CONF_WHITELIST -> ESDK_LOCALCONF_ALLOW
> SDK_INHERIT_BLACKLIST -> ESDK_CLASS_INHERIT_DISABLE

ditto; sounds like flags but not like lists


Enrico

