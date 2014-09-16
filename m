Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id CC6FA6AFB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 09:53:35 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id i17so5608309qcy.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 02:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=60hdKjAVHZFqcVYTUR3jyErjEAHzA3gQ7xHqUZ/iPSI=;
	b=LaWo0qTZ6NqQx54TzKLJopX5LcNwgj2zSeWgEoB4mRsm0/XmwkBom2dvQGo5181Rry
	yaoUzjz+AENrK68E/II9foucN7Lu90wUQNdyQ43d52TPGn6RHOl6KxSpdmKf3UyPM88Z
	B/+vGFMFG7GHl50bh8ozBc8z2u/sii8H9fKJ7bhwRYl+hgK3T07bPhxEla9URBQ4WeoI
	pEEbuFQ6TvZ/ipuLU1pTbSDNiOVFyySA/V/IicV+4FjnX7WGxwphxr4MSZVhSeKOl/v5
	WGLcRnFkqE/2GslFzyWDJc5lL8cwlsoFAxBroWuyUqDcrWXiEphCDVyvoehseI8mcc1m
	xlTQ==
X-Gm-Message-State: ALoCoQneoWqhiltEUjnFMJYIECKiQqJHZfMkm6Bu4PxiKagB2CbeNdWlwoNaB1MJfSAa+PHrQle1
X-Received: by 10.140.27.139 with SMTP id 11mr5349542qgx.59.1410861215974;
	Tue, 16 Sep 2014 02:53:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 16 Sep 2014 02:53:15 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AABD4F3AF2@ALA-MBA.corp.ad.wrs.com>
References: <1410776160-23885-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0La5gLNDcuwj3TawqphFg2N-a74=nDH_DL7u-crY09KPSw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AABD4F3AF2@ALA-MBA.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Sep 2014 10:53:15 +0100
Message-ID: <CAJTo0LbBu4aZmU8GvFrUJEfTCx49eisCWBPRtqF5pfnXc_iWgA@mail.gmail.com>
To: "Huang, Jie (Wind River)" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Fix ARM assembly when building __PIC__
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
X-List-Received-Date: Tue, 16 Sep 2014 09:53:43 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2014 02:33, Huang, Jie (Wind River)
<jackie.huang@windriver.com> wrote:
> I had added the status and signed-off, could you re-check?

Yep, sorry about that. Skimmed the patch header and missed it.

Ross

