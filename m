Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 331BE7F23C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 15:24:07 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id r19so3867869wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 08:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ma84PN1Z+hDcQuESuGn4KzKbwMd6ijRTEwJbFdyrbe8=;
	b=cGrWRJs26+BvLTlxKGydbyVYf+qSBmzNEygiuYC4fEohoDzSLogUGwkpxXAeHUUyTy
	nYlfYBcvlxUeEZmdASJThQpMY7gnzonp6/g2bSjqzaJ5LloxB10ADkji9lBbzvo6kSNt
	xHS+THPvTH80WdtKDnF/e2oFLl4GUKV9ARe2jqHHX2vwxzNFOVUaECSbiq4/LmT2c47y
	Hbjye13qvbM9Arrl8739sMPzvTGfwmeT9rfLwXpLydXrd9TkUF82COtqtPxT5vzeUTQw
	jVNzEw1rzIE+6blazRWPiJIQNbgKe4sRX53ZurjkVQx9UCp7aUGO4vt/uPC/yfZQaN00
	0U3g==
X-Gm-Message-State: APjAAAUELAwVEcmpih5Sfu5kS31RHQ5vwliQDeJu8soPl+Mxj6EaSQRq
	TK+KhqWofrwxcsrcX2AlSX3XxCKA
X-Google-Smtp-Source: APXvYqwFLyzvG4pIA26pruQiV/pl1LkxJPBjFM9jtnJof8nvggdmdk+U2T7b1cdx1otznso4KX8BYw==
X-Received: by 2002:a1c:2b41:: with SMTP id r62mr4068832wmr.47.1569943447659; 
	Tue, 01 Oct 2019 08:24:07 -0700 (PDT)
Received: from 1aq-andre ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	r12sm17257705wrq.88.2019.10.01.08.24.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 08:24:06 -0700 (PDT)
Message-ID: <64a859a3d46a603917a3fbbf606f556d759e0925.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 01 Oct 2019 16:24:06 +0100
In-Reply-To: <20191001150205.2331.21077@do>
References: <20191001095452.37335-1-git@andred.net>
	<20191001150205.2331.21077@do>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHJ1YnkgcmVjaXBlIHVwZGF0ZXMgKHJldjIp?=
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
X-List-Received-Date: Tue, 01 Oct 2019 15:24:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

not sure why this failed. These patches are against current master
which is at revision
a73cbe649af5 ("bitbake: siggen: Remove full path from unitaskhashes keys")

Cheers,
Andre'

On Tue, 2019-10-01 at 15:02 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: ruby recipe updates (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/20256/
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
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 9973f89daf)
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


