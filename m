Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id C4BCB601A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 15:08:34 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 79so4756200ykr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 08:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ko6Hi1u6+JXWiAI1vxQlRz1nTsVuqGrUf70SpCY+FP4=;
	b=NF4Rh46oBN2urZWhCl1HWJ/pPo48w9YVpdCNNPS1rKJ81UiBhvE7E/cWXBrNBqUnJC
	djl/e2rVTUYD2JZf7QusIdH+mj3kZwgJV1pnNujIYpDzIowi74kfSOdA4/QXGSOKgUhU
	cxbYUC1DtWvg2zKKasNiNvmyUnsTOY4lQI+l+EMly70Cvv8zkKUKyNoR8WBnrZtzfYVW
	n0ruUmoNnyyJ9+oH/Fo91ZKEd343wACQ47TPf3EzJ3pyGlEgcODBnLMPUg0behn2oyD+
	GXyeoWms+/fWGxZIjdiTHMd/dhlugZxvqdxMSofESHh8jhUatHZK1FqTYQ/uiH48Coov
	2Igg==
MIME-Version: 1.0
X-Received: by 10.236.25.105 with SMTP id y69mr57053375yhy.33.1404140915140;
	Mon, 30 Jun 2014 08:08:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.233.65 with HTTP; Mon, 30 Jun 2014 08:08:35 -0700 (PDT)
In-Reply-To: <53B17CF5.9020008@connected-labs.com>
References: <1404137924-14085-1-git-send-email-scerveau@connected-labs.com>
	<53B17224.4050602@connected-labs.com>
	<1404139876.6362.13.camel@ted>
	<53B17CF5.9020008@connected-labs.com>
Date: Mon, 30 Jun 2014 12:08:35 -0300
X-Google-Sender-Auth: gaQpARX2ptKnZMk2UTebO0SJOpk
Message-ID: <CAP9ODKpXm4ZT-4Dye-bY1gMnaznnQmS3FJ_u0_n8VX8tW0BQZA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Stephane Cerveau <scerveau@connected-labs.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH] e2fsprogs: Fix populate-extfs.sh
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
X-List-Received-Date: Mon, 30 Jun 2014 15:08:36 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 30, 2014 at 12:06 PM, Stephane Cerveau
<scerveau@connected-labs.com> wrote:
> Sorry i have been fooled by the poky web interface :(
> Anyway the bug is real on dora branch.

Which branch did you test it?

You shouldn't say for backport something you didn't test.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

