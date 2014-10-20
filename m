Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 69478601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 15:05:06 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id z60so3655382qgd.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 08:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=T2bhNQ41mvA8D/SZralOWbydv10ZSHbvr/c+fQELSFs=;
	b=ToweP+bOVvm96iYWRbZpsEH8bVJ03iEKs/v558ooTpK/jgQPiNUpjagu5Sbl/acU+R
	5h8VD+eFCf5eYiX6hNk+oTOInxv6ZM14vlciv5TLV77+T5tlaD6BV+r7Uw6GjIg0vyWj
	+nPDHJ71pPiZ7oJoEf/y8jiFuHjl7X8Xhrqzc1wTp63nnoTTJy3XbLXVG0SfgF89RV4u
	c3ZI1VJ1bkHUCwT8NS5iq11a0iOkEmUULeTSIzDbeJXC1FUSanX85rlh4JwyOWen3VvE
	GDMyi+1Po6KnCE3EMIOv50H4LVSYYIc6qyBiq9JTnQTflzpBanHj/jBb9t3DG5yfpbdY
	ouKQ==
X-Gm-Message-State: ALoCoQnMMu1DakQrDQJfzQvxDtKoNBp94cOMuvGKZTfCA2JCrMm7csb3aNPWB/4cLiSHFtJnsRtF
X-Received: by 10.224.28.68 with SMTP id l4mr35540968qac.22.1413817506212;
	Mon, 20 Oct 2014 08:05:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Mon, 20 Oct 2014 08:04:45 -0700 (PDT)
In-Reply-To: <CANyK_8dYLsNqhOcE6ip1_wz1L4XNvun7TdoCtQW9dtgDcDaF+A@mail.gmail.com>
References: <5444D400.90702@windriver.com>
	<CANyK_8dYLsNqhOcE6ip1_wz1L4XNvun7TdoCtQW9dtgDcDaF+A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Oct 2014 16:04:45 +0100
Message-ID: <CAJTo0Lat7Hz4MXC_8O-BjybiKjbp37k=jpjT2U3sAMDyic4mHg@mail.gmail.com>
To: Liu Jian <jian.liu@windriver.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg_svn: update-alternatives fails for "[" and "[[" in busybox
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
X-List-Received-Date: Mon, 20 Oct 2014 15:05:13 -0000
Content-Type: text/plain; charset=UTF-8

On 20 October 2014 10:40, Paul Barker <paul@paulbarker.me.uk> wrote:
> This patch looks to be corrupted, opkg_svn.bb no longer exists in
> oe-core (it's now opkg_0.2.2.bb) and your commit message is very
> confusing as it references a log file and a path which only exists on
> your system.
>
> What version of poky or oe-core are you sending a patch against? And
> have you read the contribution guidelines in
> http://openembedded.org/wiki/Commit_Patch_Message_Guidelines and
> http://openembedded.org/wiki/Styleguide?

Specifically the patch is missing an Upstream-Status tag, and as opkg
is part of the Yocto Project this should be Backport as obviously we'd
fix our own software instead of patching it.

Ross

