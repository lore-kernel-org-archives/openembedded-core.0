Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9C76041D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:33:47 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so454181pbb.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=HGhBFGDWF2+p4XdOMIMbQbY5r8APvViiCu3+DlRq4mg=;
	b=M0A9F6JBo4BVTv+RG5R6Yc/hAmzBL9S31WxznePltOREtpGJcsTmfW237RnVQWMBG2
	VtRdzi6Q05zovLZX35QOXHPfyWqiMgX4rL8Az0sXOeAyc/NWr/0Uvlkudhaeau3afAOE
	GSpKqyoYS5j8bnf511seKR4Apnoz46izq6X5ZW8sPMjg13SbARN9FaM+asnwrSp/wYoD
	yPAfS8xqlIBse2sZDgxRQY8Cvwysll63dCZaR0dH3WyNc4FbKLA71aeuPtyFSl9q0rku
	KFx02VD5IbKxoOkp1x35iyfglbAdcEuw3wBy28wNma4ntsLhi+eqIsB+V0we7VelVrqS
	KESA==
X-Received: by 10.66.224.73 with SMTP id ra9mr8708846pac.163.1369924428647;
	Thu, 30 May 2013 07:33:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Thu, 30 May 2013 07:33:28 -0700 (PDT)
In-Reply-To: <CAF6bG8dzRvvdg6Ztpmz0ZD5aC7o8gkmYBJ=JHOZ2e_TBOfdVPQ@mail.gmail.com>
References: <cover.1369909097.git.cazfi74@gmail.com>
	<CAF6bG8dzRvvdg6Ztpmz0ZD5aC7o8gkmYBJ=JHOZ2e_TBOfdVPQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 May 2013 15:33:28 +0100
Message-ID: <CAJTo0LYWB8nXaMB+HctxKxkZ7zXXL3=oOGjaSf2KYfWrzLvPzA@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
X-Gm-Message-State: ALoCoQmHjGFhttecY5hL0LKOpLBFkjdbHvN0P3BEGqwT/9SO0avS3hTaVeekjODJa7yHbv7q7ydb
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Misc package upgrades
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
X-List-Received-Date: Thu, 30 May 2013 14:33:47 -0000
Content-Type: text/plain; charset=UTF-8

On 30 May 2013 15:27, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 30 May 2013 13:20, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>
>> Marko Lindqvist (4):
>>   atk: update to upstream version 2.8.0
>
>  Ross has better patch in his gtk-3.8 set.

This did however remind me that I didn't yet merge in the extra site
values required by at-spi2 to compile.  I have a contribution for ARM
but there are no values PPC or MIPS yet, so they'll fail to compile
until that is fixed.

Ross

