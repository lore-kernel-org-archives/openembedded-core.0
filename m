Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4486B7CF19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 15:02:50 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y197so507529wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 08:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=sae102AqT+5Z8lTPGa5IqUQ0kW9Hlt+/0AMOOgLscEs=;
	b=f8bW1G5XCMUMTUl1G8LesBLn/9oGGAk2hef0sNInRa8FyXsr8vMm3Oc/B6uWJtjorg
	Jpeep4sUI9YnTpFHB0WdKfThloltmimSYgzsT4Y4CcACfg5usty+qOLd/VuZ75H6Tx5E
	Lru81gnYpdmUUq3QUwFyvvQpP1O6FxyzVo6fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=sae102AqT+5Z8lTPGa5IqUQ0kW9Hlt+/0AMOOgLscEs=;
	b=aXE9vxgaYMY87RiXkH6ENmFgnFEHhIO+BTjXUbDH4qZ28JeqmiPHARmohz4AUQuZI0
	ykbjqna/dUGxI+IRUmo9qUqOiTg7RcdADuj00hXUX6rzSFMldenvwzkuUOB6Y7hRTg7i
	gPEeUmRzbfhYCYInI5ak2iKQ4dylnSd5UlPgm+NYcQT/yoLZAJ0L0AihclGtZjLAFV9o
	zd9FuRCzXKhCEtE/YeEoYCIQHZF27ynqm0IsgfJVgUuSu9gFdg6vaR2uCEC3dU9RkJ0M
	5iRqKELRcaSFNQG6mZl3QntyogP2+DR3OseffzPeXemw81pmJEZxsyCYo84YMxEqKHRO
	tHFw==
X-Gm-Message-State: APjAAAUTByhd4Ke3Krl6Ip6gW6ueNCcsZZOEb1y9mmGxRyBq7f6IdvPl
	3cDgsjjMC10tUtvS8waU/il3wGcVyMI=
X-Google-Smtp-Source: APXvYqwlOtFBL+PVc2rmyrfhs3XjzmWZS2569CMAeXMTwXi8pezJt4Tm0D8/X2IEttDWURKUQGwDKQ==
X-Received: by 2002:a1c:c8:: with SMTP id 191mr2687127wma.44.1556031771028;
	Tue, 23 Apr 2019 08:02:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id b9sm22253391wmc.9.2019.04.23.08.02.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Apr 2019 08:02:50 -0700 (PDT)
Message-ID: <6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 16:02:49 +0100
In-Reply-To: <1555869425-7613-2-git-send-email-trini@konsulko.com>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] vim: Update to 8.1.1198
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
X-List-Received-Date: Tue, 23 Apr 2019 15:02:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-04-21 at 13:57 -0400, Tom Rini wrote:
> This brings us to the current version of vim.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-
> tiny_8.1.1198.bb} | 0
>  meta/recipes-support/vim/{vim_8.1.1017.bb =>
> vim_8.1.1198.bb}           | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-
> tiny_8.1.1198.bb} (100%)
>  rename meta/recipes-support/vim/{vim_8.1.1017.bb => vim_8.1.1198.bb}
> (98%)

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527

Cheers,

Richard


