Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id A3B9C738EC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:49:34 +0000 (UTC)
Received: by lamx15 with SMTP id x15so37165996lam.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 04:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gfvtjP3vJlPDlZ+mARtEkv+6EaeyVyx2O9iAvGEYsIQ=;
	b=oV6SR0EcrR2uyJ8MzNIFXzYlHGpJ6G9epf7+0rJoO/H+JRylhi7jG/wdvxrpGZkHp/
	uPW44tBVsSkbnX8duL+628WmjQQUeNrfkTOpp4kbkudac8SaDhnImESFh/auMtlJGvJF
	zQhePZnwtU/uHhxX2BO4qcM4YfEhFjZI8a+npHYYzfVD/5rf53coXm6lyBP5VOBSPCCU
	fXfKIjMWRPN5iEZ0+L+1eYrrXRXMTSBRhqninVpd8FKDCnqDfvPJnjBa9FTxMJl2Fb6z
	xfrrqUSc72NN6M25phQfHxfAZ4RNxsmI8XzQPg4DGO84Z5jTzBGkb8xFaNx/d3tMjwAs
	ZRpw==
MIME-Version: 1.0
X-Received: by 10.112.173.41 with SMTP id bh9mr54007050lbc.107.1426506574763; 
	Mon, 16 Mar 2015 04:49:34 -0700 (PDT)
Received: by 10.152.146.4 with HTTP; Mon, 16 Mar 2015 04:49:34 -0700 (PDT)
In-Reply-To: <CAJTo0La-P0daO2k0UWFjcYgHwjMGHnqrsj6gid=6-0oFZEe9Vw@mail.gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<CAJTo0La-P0daO2k0UWFjcYgHwjMGHnqrsj6gid=6-0oFZEe9Vw@mail.gmail.com>
Date: Mon, 16 Mar 2015 12:49:34 +0100
Message-ID: <CAC1BbcQU=b3FH7QqanMTu6c5PYYQ3ftJ_pVgYy6Z_tpbDRhYqA@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 11:49:35 -0000
Content-Type: text/plain; charset=UTF-8

On 16 March 2015 at 12:47, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 March 2015 at 10:53, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> wrote:
>>
>> +PR = "r1"
>
>
> No need to bump PR, remove this line please.

yea, i'm not changing anything from installed binaries perspective, right?

