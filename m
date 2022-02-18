Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9AFC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 13:41:00 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web12.10844.1645191656427729535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 05:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=XxzUQ0Rb;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 21IDep1k012157
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 14:40:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1645191652;
	bh=+jBxjFelX7lnDrsjJebUWo5vt0s4UxuFXvcCNLoQoG4=; l=1093;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=XxzUQ0RbqsVM3vJBB6XG+OrESrBzksf8hPr817v9JOdtO8eVJ/f0RGLLyX8lmyk7n
	 oQD1Coub86Eyg24jFNQ+afySEqZM/Y5ch7ajcOdDK++2LFFI/8dzd10ZE9rBIJnd3z
	 HB/9XlMKHpHjnFq2EITK8sNrP46kUXE77kXX7Bh8=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 21IDenRe042383
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Fri, 18 Feb 2022 14:40:50 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 7F5913D00AD; Fri, 18 Feb 2022 14:40:45 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 21IDejHk012132
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 18 Feb 2022 14:40:45 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nL3V6-000UkV-AL; Fri, 18 Feb 2022 14:40:45 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: "Saul Wold" <Saul.Wold@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] convert-variables: Script for Inclusive
 Language variable renames
References: <20220217003248.581903-1-saul.wold@windriver.com>
Date: Fri, 18 Feb 2022 14:40:44 +0100
In-Reply-To: <20220217003248.581903-1-saul.wold@windriver.com> (Saul Wold's
	message of "Wed, 16 Feb 2022 16:32:48 -0800")
Message-ID: <ly35kg9tsz.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 13:41:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161937

"Saul Wold" <Saul.Wold@windriver.com> writes:

> From: Saul Wold <Saul.Wold@windriver.com>
>
> This script searches for a list of variable that have been renamed
> and converts them to their more descriptive names.

again: most of these renamings make identifiers much less descriptive
because they now sound like boolean flags instead of lists


> +"BB_SETSCENE_ENFORCE_WHITELIST":"BB_SETSCENE_ENFORCE_IGNORE_TASKS",
> +"BB_HASHBASE_WHITELIST":"BB_BASEHASH_IGNORE_VARS",
> +"BB_HASHTASK_WHITELIST":"BB_TASKHASH_IGNORE_TASKS",
> +"CVE_CHECK_PN_WHITELIST":"CVE_CHECK_SKIP_RECIPE",
> +"CVE_CHECK_WHITELIST":"CVE_CHECK_IGNORE",
> +"MULTI_PROVIDER_WHITELIST":"BB_MULTI_PROVIDER_ALLOWED",
> +"PNBLACKLIST":"SKIP_RECIPE",
> +"SDK_LOCAL_CONF_BLACKLIST":"ESDK_LOCAL_CONF_ALLOW",
> +"SDK_LOCAL_CONF_WHITELIST":"ESDK_LOCAL_CONF_REMOVE",
> +"SDK_INHERIT_BLACKLIST":"ESDK_CLASS_INHERIT_DISABLE",
> +"SSTATE_DUPWHITELIST":"SSTATE_ALLOW_OVERLAP_FILES",
> +"SYSROOT_DIRS_BLACKLIST":"SYSROOT_DIRS_IGNORE",
> +"UNKNOWN_CONFIGURE_WHITELIST":"UNKNOWN_CONFIGURE_OPT_IGNORE",



Enrico

