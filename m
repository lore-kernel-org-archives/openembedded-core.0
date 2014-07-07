Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id D03D370392
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 15:37:52 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id o8so4013748qcw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 08:37:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yVs+Q0hgXvG6LhdtDyiU7klSKZFqF6mIszNTFYbfc1Y=;
	b=mVXa4wMXr8acjROrC4Lajg2IDbGMN/n4uSEfgFVGbrPUjO0G4xIeva0xR5oam3D3rQ
	eiUP3QtT/vv8MdRsLT0JmecuKRvxJt8E0nDtEctHaSSkV8rTDa+8bmQj6LN3l6JQj5vA
	8Yb04UT+dSD7B+pX694QlxWF/8f8bWIYQrvg8raQHEcfJEV5BUG3rywWLKD05CGUl9ks
	K3UMXLTS7+Wnw23pVIY4bVl5j6E7vqarHzi/2TfqrgPzRiBTu2BvdXIkEprBJIZo2I9v
	wNJAJO4sOvHFbkP7kkqZhl7NHMHaQxdQ6/A2YWaAeyo+se/kbI1HHNo037rhKglFQYEl
	mVow==
X-Gm-Message-State: ALoCoQnfaLCgk3iFRjg/MyFDtBRqNBhehmZbyseFsir3lOW6daIa0HFwcNvhe5uz0FI36v1Krqc7
X-Received: by 10.140.81.209 with SMTP id f75mr41007228qgd.60.1404747473441;
	Mon, 07 Jul 2014 08:37:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Mon, 7 Jul 2014 08:37:33 -0700 (PDT)
In-Reply-To: <1404540334-13377-1-git-send-email-ming.liu@windriver.com>
References: <1404540334-13377-1-git-send-email-ming.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jul 2014 16:37:33 +0100
Message-ID: <CAJTo0LZFwAg=yXX4g-5Gza=JB0trbB4McFjEWrT49_z-A-2ptA@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] libcroco: disable /usr/bin/croco-6.0-config
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
X-List-Received-Date: Mon, 07 Jul 2014 15:38:00 -0000
Content-Type: text/plain; charset=UTF-8

On 5 July 2014 07:05, Ming Liu <ming.liu@windriver.com> wrote:
> librsvg is the only recipe depending on libcroco, which doesn't refer to
> croco-6.0-config any more, so we inherit binconfig-disabled here to
> disable it.

Signed-off-by: Ross Burton <ross.burton@intel.com>

