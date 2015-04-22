Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5F96E268
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 02:24:52 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so259561882pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 19:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=AZbVwDd3gZDljH5J2NLWLkiqJbemIQG6+pWcOIGJvC8=;
	b=mxR/T7BzUfsUi18qM/RuiGrq5gsLr0S3Ax5vDuofti7xk2VCAez7RKXBiyfHsbOIJ+
	h8XhBdwijlwDdQ37+Xj8rpUT1h3CCpqJplG2llNiBVLfj1/EXLfyQ4RgOvVWPf0eH5nZ
	WlsBv1vy5RvPPe2e/H3mcBk/F26Qn3pmxVMS/NOI3TigrzBw+qXP0EjyvHxV6uWULrOo
	kvYpQqTyYoRenSnssyg5m+mGY56KT6dnYgEV91t8QuRlunKFLZWQfATDpWKS0L3UvnEG
	eVKpzRMgCm4insy51/pZm6X6G8scyBpv7GRa7a+jm4anOp6klXO4SJlaKjbRalpufmWR
	epMA==
X-Received: by 10.70.0.46 with SMTP id 14mr5935122pdb.61.1429669494141;
	Tue, 21 Apr 2015 19:24:54 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:7c97:9ba6:29ea:d43f?
	([2601:9:3580:84c:7c97:9ba6:29ea:d43f])
	by mx.google.com with ESMTPSA id nn6sm3332135pdb.79.2015.04.21.19.24.53
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 Apr 2015 19:24:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <d43affadb4b82b309b05f78efaecb7cb056e3502.1429669271.git.liezhi.yang@windriver.com>
Date: Tue, 21 Apr 2015 19:24:52 -0700
Message-Id: <0B9D4FD8-56E6-44B4-96E8-E283B6F12E98@gmail.com>
References: <cover.1429669271.git.liezhi.yang@windriver.com>
	<d43affadb4b82b309b05f78efaecb7cb056e3502.1429669271.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libunwind: don't use gold for mips
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
X-List-Received-Date: Wed, 22 Apr 2015 02:24:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> On Apr 21, 2015, at 7:22 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> 
> +# gold doesn't work for mips
> +LDFLAGS_mips_append = ""
> +LDFLAGS_mips64_append = ""
> +LDFLAGS_mips64n32_append = ""
> 

how about little-endian variants ?

