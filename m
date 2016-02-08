Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7A77065CC2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:50:10 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s5so62760460qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Dkk5qZ2YIsBrTI7vNAcXpNoAYuvbu16AxR4qZ0qSQR0=;
	b=LImkNkX4KY6rSI1BXihUcn5xbhPFoxBxmdJ+OBkxSl2lXEvgAIxp9XAruXu2TGvMEK
	wlo9A6cjm+AeFbwiyjTZmHXjM4ah1EgRu3MVg/Alr2xGEImcgNe9q9gxF9CIGnPVx03c
	cqBnvAIf5jkRSNz9aiUUmfROglujakHsEYzmXpIXYFVbjgWEmbn40NoqrPLVBBD31LVa
	2Lo1P3DzCO7EQvZZSl3ATAex9BVWCV5iQiTlzD5ghKHCERh56DZubQNZAJDpUgjSc8nc
	HDlQZVjj0wPK0RMcjsAbl9nkHnRwSrIgmigpsqlayk1DVZWqwYfdclgXxCdGacexC3cx
	raRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Dkk5qZ2YIsBrTI7vNAcXpNoAYuvbu16AxR4qZ0qSQR0=;
	b=lwgPo5eyEdCbVm7lz0Pec2hb2JU+4v5O0bLyO5V3Bt3lSMrTNxMHluRandPX3w5Yod
	UxdDZ2vN4ThqVNCHl8pPzxS5hsjXkyFKwZZ195gncxttUY0rv2/C94p0Xf5mVhv/cSTl
	hOz4/TF6vbNa6Ttp3UagfeL+8PH2Tw6lzer+DgFaTAsu69ag+o8uXt63ZdzMa9RsojaU
	IXNKb6twCCUsVGPj5dhJ6N39UJ5oYVNkPY76b3M/o7dQqKTPre9iWWXLl7LfvLSpbE8q
	UI/QhNYj4PMRm6TgyB+veBnDos/9rCFBdF1599uZesgDYH5NSivMlD1IB8Im15ZslYeh
	Nlmw==
X-Gm-Message-State: AG10YOQxMAXlesOImT3q0vHKKDtW/3L8qY24dQqQ9pr3y3u45hL5z5J7S1e5isuyBPah5/KNJb5vSA+948uXrg==
X-Received: by 10.55.75.203 with SMTP id y194mr37139861qka.2.1454961010893;
	Mon, 08 Feb 2016 11:50:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 8 Feb 2016 11:49:41 -0800 (PST)
In-Reply-To: <1454960141-18350-1-git-send-email-armccurdy@gmail.com>
References: <1454960141-18350-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Feb 2016 11:49:41 -0800
Message-ID: <CAMKF1sp6Xnti2YnV==4Hx36LghOcUYC5=XKChj0FRR4_Zprohg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] gdb: MIPS plus musl build fix + minor cleanup
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
X-List-Received-Date: Mon, 08 Feb 2016 19:50:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 11:35 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Andre McCurdy (2):
>   gdb: build fix for MIPS + musl libc
>   gdb: drop unnecessary CC_FOR_BUILD etc exports
>

looks ok conditionally I have pulled it into my tree.
https://github.com/kraj/openembedded-core/tree/kraj/master

>  meta/recipes-devtools/gdb/gdb-common.inc           |  7 +----
>  meta/recipes-devtools/gdb/gdb.inc                  |  1 +
>  .../gdb/gdb/0001-use-asm-sgidefs.h.patch           | 35 ++++++++++++++++++++++
>  3 files changed, 37 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

