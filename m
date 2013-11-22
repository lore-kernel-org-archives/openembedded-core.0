Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 681196BE67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 13:51:03 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wn1so1304333obc.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 05:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=PSFd9Jx178A27lZdOvrB6sytq3ejP1LEybtJgG+ZD9M=;
	b=RL2Pu56pQNVqCS7o+wDRjuxEXy0LrOvj0Msfu4vrgMfI+2KxxfGapaWkzeTlT5rC9+
	ON4Dq0ChBZD/HilKNd9h8j5hH+h4HVOVBrEFtCf0W9hstE0kshrD4TSZ5qLXzI+m5hY6
	V17QDC3eF49akSShDEHlRAh61kAscbQGhm002aHQAcyOVY5CyUsKIhmgYIfcBaBcRKYy
	OAOz//2gFg44A6L1ZE89z5sfK3Hxvk4JJnix1UvL9Y7kVjO/yaF2bm0f/8lsj8z5umir
	ylU1jtlhBapcn+tkqmYAFz6iGlvVSIojdoSWjPN8uzx1YTyrvISyvPirIGGj2RJJMta+
	JL0A==
MIME-Version: 1.0
X-Received: by 10.60.133.233 with SMTP id pf9mr10916747oeb.46.1385128262564;
	Fri, 22 Nov 2013 05:51:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 22 Nov 2013 05:51:02 -0800 (PST)
In-Reply-To: <1385061961-4697-2-git-send-email-mark.hatle@windriver.com>
References: <1385061961-4697-1-git-send-email-mark.hatle@windriver.com>
	<1385061961-4697-2-git-send-email-mark.hatle@windriver.com>
Date: Fri, 22 Nov 2013 11:51:02 -0200
X-Google-Sender-Auth: QpnI1Pe2xRca2yd_8PcZKHIcwY8
Message-ID: <CAP9ODKrTE6iQJXrKtxR1yBnH9RXNQR1DLc7n6YY1zsG0KawvTA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] syslinux: check for __i386__ and __x86_64__ instead of __SIZEOF_POINTER__
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
X-List-Received-Date: Fri, 22 Nov 2013 13:51:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 21, 2013 at 5:26 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> From: Lei Liu <lei.liu2@windriver.com>
>
> (Note: this patch is being sent for Yocto Project compliance, I don't
>  believe it is generally applicable to oe-core as it's only needed on
>  older host systems.)
>
> GCC version 4.2 and earlier does not define __SIZEOF_POINTER__.
> Check for __i386__ and __x86_64__ instead to make the code compile with
> old compiler.
>
> Signed-off-by: Lei Liu <lei.liu2@windriver.com>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

I don't think it hurt to include it in OE-Core. I'd be in favor of including it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

