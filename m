Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 01E22708AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 05:57:17 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id l13so2303357iga.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 22:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hByHIVdpLJbLT7YvN78DcV91jcl+8x+LkKjzaUdxfTo=;
	b=CBNVWom4KP5hS6k6GWWPE8MghnIKwCRNkTeq6HObeLMSaiubveoYfbq5ZFzy9xiyul
	JVBkuFjTSBnL8Af5HWr+iGjp25v1DYn3ZQx54CsxWCTC8aQQ2p1lTEULv01oYVa+dnH8
	ViEe2QIF0pP/UOnunvP1CLYu92zpMDcko+cwOXUR3+J55CtWJF/SoQtBMQmXRChI7bI6
	WgHQfPiHj/EB/nspOW5Uaid4n+86SmZN+ztecvvcuOGTRMmQj1PjXq1rswWF8JKio/Bl
	gqMlmFL2OLrpx8rgrau3gO1jMIT8ugM+i8Rc8PAohP3SNNzRKQEJQsY57QmMkSjxQ2mW
	DCgw==
X-Received: by 10.42.82.6 with SMTP id b6mr2220064icl.51.1406699839407; Tue,
	29 Jul 2014 22:57:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Tue, 29 Jul 2014 22:56:49 -0700 (PDT)
In-Reply-To: <1406624623-25774-1-git-send-email-ting.liu@freescale.com>
References: <1406624623-25774-1-git-send-email-ting.liu@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jul 2014 22:56:49 -0700
Message-ID: <CAMKF1sqhHngoBV2G7NnGjQTYDY4QRA+hCm8HF3VKxk0K4Qj1sg@mail.gmail.com>
To: ting.liu@freescale.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: set dynamic COLUMNS via resize command
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
X-List-Received-Date: Wed, 30 Jul 2014 05:57:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 2:03 AM,  <ting.liu@freescale.com> wrote:
> By default, COLUMNS is set to 80. If possible, run 'resize' to
> determine what the current dimensions are. This avoids the final
> part of long lines overlap the start of the same line.
>

what apps are showing these issues ?

