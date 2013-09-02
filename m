Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id CED876BF89
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 14:02:08 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id db10so3250052veb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 07:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v9qs8b4TGMxvMeExSzwnwvbMf0TolfmM3zsOJmTYCyQ=;
	b=man4qHecFlZrZ5xXX45hzUQsVPrB/lpbIOC/bAXAA7HEv+z3NmTeZW39h7J+yKXzXL
	Xc6zClYjMRG0aYjbTiraZGsaaXD6AYHBCqUbmDE/RRpc/ss5zKYdTc/wKRQfSi5kDEXP
	8sObAlRmQDcSS9F1ADmq4hO2TghP7WEPnj0Wm+zQE4UeIugIM/ImIDSkc01265Yqo0WE
	rhXzhaYv8Syz0BYOj5TSzd+H/vo/bhP/yD+bXp70yUDAN/k4ZCBWNb9EGwICWJ/PP6yj
	MYi/XrXk+nlnz2sqWeKsMd9pCxAjlcr0M/rlYp0T38cgwXjxQ3lY4pztH/uxMI5tRHHn
	04MA==
X-Gm-Message-State: ALoCoQn4r9+ap5zYNKj7DiqhHiehDKeJlVO7ozlnynkCy00TF5ADSTvvu8FCs5hCn4nZokY5obE4
X-Received: by 10.58.208.130 with SMTP id me2mr23362969vec.13.1378130527972;
	Mon, 02 Sep 2013 07:02:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 2 Sep 2013 07:01:47 -0700 (PDT)
In-Reply-To: <e6abe1f4e6a41cf4ac4070971b6ec1757d79b9ab.1377792006.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<e6abe1f4e6a41cf4ac4070971b6ec1757d79b9ab.1377792006.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Sep 2013 15:01:47 +0100
Message-ID: <CAJTo0LY-D_swkE8SrR1mi4An9u1Uyk5c=1f9zVG1Y6ya45=JcA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 06/20] libmatchbox: Add PACKAGECONFIG for png
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
X-List-Received-Date: Mon, 02 Sep 2013 14:02:09 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2013 17:02, Martin Jansa <martin.jansa@gmail.com> wrote:
> * with png disabled it also fails, because of missing csetjmp include
>   | mbpixbuf.c:128:3: error: unknown type name 'jmp_buf'
>   |    jmp_buf setjmp_buffer; /* for return to caller */

FWIW, I've just fixed this in libmatchbox.

Ross

