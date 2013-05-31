Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id A015B6098F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 11:15:22 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id wz12so2042469pbc.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 04:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=VGW2jydgqBd+jPDuD6Aa6YaYFDt66lVR7OX2o0GPh1w=;
	b=FwzHX2MMy+PKnpiL2ich+JgFK9gZNc65ajpeebJRvc6ZYVXgdh8VlxDIMxHnIckMWa
	u2ioV31wi2WE8P5xQDrv4zUAytRhGlAecduzMKFLNBqqgt5hGB/MUhTH2SKkfe3VJu7v
	8OpTCg3rAT7yBQzIvMX+lRgBQUdc5ZK4SltQYTdrqrRr2NYSQ6RxXWSuX/2b+vVXWXXw
	f0CmEyAWj5eOgh/t8IOHsVsBOTCi4ZqjZBzT6NtprI16kcs5uvhTir+SlTP3ZW3RogE2
	Bc5LiNJ16SP4iAY7hMW8w7Uky7XzrFjY3INCu0kHAHByDUacBHXpCVOI6DiyVJ47mss7
	omoA==
X-Received: by 10.68.162.163 with SMTP id yb3mr12239562pbb.212.1369998923781; 
	Fri, 31 May 2013 04:15:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Fri, 31 May 2013 04:15:03 -0700 (PDT)
In-Reply-To: <20130531110113.GA23802@jama>
References: <1369997391-28957-1-git-send-email-ross.burton@intel.com>
	<1369997391-28957-2-git-send-email-ross.burton@intel.com>
	<20130531110113.GA23802@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 May 2013 12:15:03 +0100
Message-ID: <CAJTo0LYn2LtoU2AbAs_rfgR1HTLUZTBrAeAOoVqhNG=3bJCbfA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnf6+Sqpo/LwmnNAMeGDoNSISr3fqArszGB8ybizdAijUDoLzHB8+34ZAasnzqRa6mafaQr
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] mesa: update git recipe to 9.1.3 release
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
X-List-Received-Date: Fri, 31 May 2013 11:15:22 -0000
Content-Type: text/plain; charset=UTF-8

On 31 May 2013 12:01, Martin Jansa <martin.jansa@gmail.com> wrote:
> Why '~' and not '+' like other git recipes? Maybe it matches 9.1.3 now
> but with first SRCREV bump or with AUTOREV used '+' would be more
> appropriate.

Yes, ~ would be wrong.  Didn't spot this, thanks.

Ross

