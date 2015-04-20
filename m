Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8D24A7390D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 19:31:17 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so69390411igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=b8enJVHExexB8gbglyFtbW8YgjjqJ9lvkkNmdaB3HKU=;
	b=jDx5R3+i3B47/BCduzgYjg4yeqoMSCx2im7z8cXRrd8Z1V/Usc7F1d6be0l1J7LUZU
	eUolgE5K6sZu5pH81MY/qjgWNEKT9j8JNtzTMeWlL+sfL87r9lnp41D5vswWskwqie8F
	oD7kk+9GJZNYTaTctaK3e5it3nuE+V/BOBUFEPnqIYwQgaQEeMqxnbJQPzuyyOne0rHM
	+EWW0VJbOaQ6BKBsz7vuui9nqmi14cagQZxYQPu5am7h4XWvXDkBfAwWFwSVxguJ5vZl
	XL0zXjKb056NgAlGU9ofPhRSCmFh0EhtXtvJpwuZGiszdqxSkGFsT/tDNujIvJPIYnrQ
	gbtA==
MIME-Version: 1.0
X-Received: by 10.43.55.12 with SMTP id vw12mr20341978icb.30.1429558279030;
	Mon, 20 Apr 2015 12:31:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 20 Apr 2015 12:31:18 -0700 (PDT)
In-Reply-To: <1429557428-20033-1-git-send-email-dv@pseudoterminal.org>
References: <1429557428-20033-1-git-send-email-dv@pseudoterminal.org>
Date: Mon, 20 Apr 2015 16:31:18 -0300
X-Google-Sender-Auth: lc1LY7ukwImvxP_cjdMAO0JhahQ
Message-ID: <CAP9ODKoikygfbhSMMHUk9pPHhvbM9vav_ArAZ7gufTm5s0H_SA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: make sure all counter variables are properly unset
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
X-List-Received-Date: Mon, 20 Apr 2015 19:31:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 20, 2015 at 4:17 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> The script does "i == j" checks to retrieve the config <-> type pairs from
> the UBOOT_MACHINE and UBOOT_CONFIG lists. This check however requires both
> j and i to be initially unset. Ensure this by explicitely unsetting i.
>
> This fixes broken u-boot SPL installations with SolidRun machines
> (the SPL wasn't being installed and deployed.)
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Richard, this needs to be applied into master and fido branches.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

