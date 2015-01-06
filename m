Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id C6731727B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 00:47:28 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 9so10884006ykp.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 16:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=shC8jpqyZXCSHEXimVKFgVrJdBxKY2K+cnJRlJYr5Hk=;
	b=DwF+lv6zGZfg33/KjbGlqx2ztcmN/UranpSk2/gT2OcJbNbcOfMx5Rf0iD2+UZ/7gc
	TxmCFpLphvWq8oVWYDjXWMyDUx6cRVdtR60+TcFfy80k0JIg+DysxMYNeGcj2WeqfI4j
	lkTs//LVQ5/z6W8c6P3AXAhPqVp3awB/Nga41wwURNLl2O4Q2+yRgRG1t8q+wc/QQ0vp
	Cln5SX4TDrqfBN2xyb5gPzN9M0W/oQtmAvJLLzAzqqqedXN5ciO16a3skYT8d/mDUFPV
	yxAw0Dq3ETaOtzIafZAgKcSWce3xM6XXPTcP086xuS3Xl7phJo9uGutXsViV6x+6XcIG
	v0XA==
MIME-Version: 1.0
X-Received: by 10.236.110.36 with SMTP id t24mr30058326yhg.102.1420505249218; 
	Mon, 05 Jan 2015 16:47:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 5 Jan 2015 16:47:29 -0800 (PST)
In-Reply-To: <CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
References: <54AA4536.7030101@topic.nl> <54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
Date: Mon, 5 Jan 2015 22:47:29 -0200
X-Google-Sender-Auth: 66_UdFyCCpLypZow-aM8ecvdxCE
Message-ID: <CAP9ODKrOcd4hBrp4f9TH=iKQ48zCTymcdcZ_ZQaL+v6u7yS6yA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What is expected of a kernel recipe nowadays?
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
X-List-Received-Date: Tue, 06 Jan 2015 00:47:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 5, 2015 at 6:18 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Mon, Jan 5, 2015 at 3:29 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>> I think I found it. The kernel bbclass changes "S" to point elsewhere.
>> Moving the statement
>> S = "${WORKDIR}/git"
>> to after the "inherit kernel" line makes the compile run again.

We handled similar failures with:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/commit/?id=f69b21d39feca9a4d71d53980fc5c9917ba6c5ac

Take a look if it helps.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

