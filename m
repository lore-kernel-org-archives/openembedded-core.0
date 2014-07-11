Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 436287036C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 20:21:25 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id c9so1520751qcz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 13:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mZuU/GFUwz7ml+v4mIbb9lGqrs8fmWaBqoUoPmxOP5A=;
	b=RK1QYRH5gjMj+pHj96VAqEnxnAeRfWkHNjIPJh0p7qaZEpUbZ1CafvSktuaz6Awo83
	DKxGfGENbd2Qgr2MSvmi1zHh67F0DVHhMbpcS7hLvFSNghp1m49X2sqO82kTyloWJCc0
	QcF3UBHUKEYvwMH9PVeGi1XoMj97DfkspwjnXUbsjMXbeBrlJ8ift9skq1VGGsJqaJJn
	4UYYRGBcFfIUz6R3GICxl/7YrXBPgseahLAv5wrzan5nWOs9JvHnBn6FH7T9hxApHNn9
	zWK7lGKMogW6RPaHIPkKIO3zCcgrFhRApMA6AecjiW4jRCgbNANsC1Wi4Sli5x0kncbX
	EiXQ==
X-Gm-Message-State: ALoCoQlET9Oqnb3x9I81pxdZDwDAclzyTXZfdFJj1vPWyuPCQU8XUWUCkTU5eVHAGb2XuEyck517
X-Received: by 10.140.91.164 with SMTP id z33mr1751397qgd.65.1405110086912;
	Fri, 11 Jul 2014 13:21:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Fri, 11 Jul 2014 13:21:06 -0700 (PDT)
In-Reply-To: <0cbfa0da548acdef1a4ab12cb708c699a495dd7f.1405110050.git.peter.seebach@windriver.com>
References: <cover.1405110050.git.peter.seebach@windriver.com>
	<0cbfa0da548acdef1a4ab12cb708c699a495dd7f.1405110050.git.peter.seebach@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Jul 2014 21:21:06 +0100
Message-ID: <CAJTo0Lay1CB_BumWQDDLHrS2i2XkiE99TamO3bwMH86_=P8gFg@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.6.0.bb: uprev to pseudo 1.6
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
X-List-Received-Date: Fri, 11 Jul 2014 20:21:31 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2014 21:22, Peter Seebach <peter.seebach@windriver.com> wrote:
> This uprevs pseudo to 1.6. This merges in all of the existing
> fixes, and also adds partial support for extended attributes,
> including storing arbitrary extended attributes in the database,
> and also interpreting the posix permissions ACLs as chmod
> requests.

The extended attributes code means adding build-dependency on attr.

Which leads onto the discussion as to whether we add attr-native to
the build for pseudo-native, or use ASSUME_PROVIDED and document that
the host needs to provide it.

Ross

