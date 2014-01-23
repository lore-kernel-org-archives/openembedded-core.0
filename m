Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id CC6A56DC8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:37:22 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wo20so1951849obc.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 04:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fv3RLtUnX4VbJByYgTg+Rdx6mQXXYcEuc7spelV2eMg=;
	b=epFAUi3tK40JABceRVElUGvkSp/xtrww7Hvy1FBvdZFYmrlx0aQULnKJGLGqrTYRfO
	SYM31qXezUvlEXulsgwAC/1ldtHqmkfvMhRdyFGJU5Ako8UfP99f0sNPEfWrTHj36z4k
	WMFbjJVJ9wpNz3/qmaW8F5EywokuBLAjHlt74XDnpR8HWZG6NWW1wU/BbUQL9lRoa7UE
	jIHNsQwQQ/DmXc1TA/prer21gwD0bIqwbYbtKCMb3+B74/tRHsBCtEsdmnfZMjp4hl6M
	TfbSoL/z4wrawGB3b8DjI86GwKJaF2YYa0wkzkpXJOReeYhT3/lk/PfAcASj3ynDjr5W
	s4FQ==
MIME-Version: 1.0
X-Received: by 10.60.84.199 with SMTP id b7mr439471oez.55.1390480643800; Thu,
	23 Jan 2014 04:37:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 04:37:23 -0800 (PST)
In-Reply-To: <1390479566.17424.99.camel@ted>
References: <1390479566.17424.99.camel@ted>
Date: Thu, 23 Jan 2014 10:37:23 -0200
X-Google-Sender-Auth: fhgdq3oA3OUSEr7Zeh8e3L9rAdY
Message-ID: <CAP9ODKqTjAESi+B56QFCuKpNJ3fxxmO+_Tx1_gWUxt+VyejycA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool-cross/native: Force usage of bash due to sstate inconsistencies
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
X-List-Received-Date: Thu, 23 Jan 2014 12:37:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 10:19 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Scenario:
> a) libtool script is built on system with bash as /bin/sh
> b) machine B installs sstate from build a)
> c) machine B has dash as /bin/sh
>
> In this scenario, the script fails to work properly since its expecting
> /bin/sh to have bash like syntax and it no longer does have it.
>
> This patch forces the configure process to use /bin/bash, not /bin/sh
> and hence allows the scripts to work correctly when used from sstate.
>
> (From OE-Core rev: 2c66aa0fc98b092ebb37baee94e92d1965afd76b)
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Does this work for Fedora, using bash in /usr/bin/bash?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

