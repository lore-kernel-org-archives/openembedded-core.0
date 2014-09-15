Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7F05460144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:26:24 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i8so3767621qcq.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1AS20b+G87n9RD2C6J26NBvLjrSMsOp4wRkZSQWjebc=;
	b=PXOnUk+EXKPu2cUwBrIl1PaLIf/LhYrhf7Y462H8exAqjqFga5vISivuak2iOQaqLd
	KTNVpyjlkHAC4nI+LKtZl7/S7LMirzGs0kowoJm61II5Dqc8LpUGMeWrSCFLRLCi6U6P
	jHXBU3XCpnyIn4wsKyxxWLV+UjsW/6NCiurVEwjc+XwMVeXJo44A3ve5Bu5o3n3G1rh2
	B2XU60Vvkq4tJLjpGxTYF6KdzNqF0uJN2ME7foNvgTi2QLkWeaOWWxtWScuSqb0oc4J2
	L1HucLu82KkZFnS0wluQEojfsE/JnGFrU6jSe5fClFsBuMXz4z5CNddPLx1yCBAZz+wt
	hIgA==
X-Gm-Message-State: ALoCoQnU4X4r7QcGzLT4lUzQ09XgXBlXuQPY5CwhjlAXrqS/AoJhz3qrYACgkvPUS8NPcfl9ZN5R
X-Received: by 10.224.64.201 with SMTP id f9mr37658372qai.64.1410791183323;
	Mon, 15 Sep 2014 07:26:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 07:26:03 -0700 (PDT)
In-Reply-To: <1410771696-6165-1-git-send-email-rongqing.li@windriver.com>
References: <1410771696-6165-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 15:26:03 +0100
Message-ID: <CAJTo0La22B0oQXuWPU_aHrzJEFzGTHfNQ1okn869oMhWKYJ3NA@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rsync: Add PACKAGECONFIG for acl/attr
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
X-List-Received-Date: Mon, 15 Sep 2014 14:26:28 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 10:01,  <rongqing.li@windriver.com> wrote:
> +PACKAGECONFIG ?= "acl attr"

Note that this should be ??=.  I've fixed this when merging to my
branch so no need to re-send.

Ross

