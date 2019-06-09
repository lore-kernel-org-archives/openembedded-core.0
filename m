Return-Path: <alex.kiernan@gmail.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF107E507
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 17:40:09 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id r135so9902116ith.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 10:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gUEBShewfm27h9bfQFgfP7dUfx/evkPVMVXacRyHL/I=;
	b=M26iQqbQAesJy1TT+VbKZnZ7yVO/7FSoiGHPCDNHQoudTykCHlQEhFK/dJxSKT2sTl
	hkcJLZb3aDozqwCYkIejTmlfhVwA3X8nI/WIujZMy1mrqp3hWiib4/xofUvGNAPO47cn
	zo1Uxn+IHwBPE7brNyqqKJx9Za0FtQqpOKYuV7bPAnKQtEaHBJK3cdxCYYi5AzgjmFHy
	SoEp9q9CFOskIsyiNMg0bfgS5uWdSYf8+1prHZ0Yq93wPOsq+VlyuujHEk7jGfjmOua4
	4DKtMgqVEIOGkXoqhMHNrMA5difNS3ADp1UKBcV3irdEESHiijWRzQ30qHfbKGc8UgUS
	IzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gUEBShewfm27h9bfQFgfP7dUfx/evkPVMVXacRyHL/I=;
	b=EmQxtfCLrBSs0FAkAY3i5YhjmIof7ACTAjBFw/5BdUDOSkaUGEweoPF5fZmPYqOZhf
	RrikLivpnx13EREvG5YaeflxXPsd8hi+NxB9bdeEs8muxfC70JHlgPw5rQSKx+VnoCll
	cSIXBmWoiLM22nLLDfaOaSBKvNsOq0LgsUgXd7SVTxspxKiHuGhsGnTZ2G+FRf760kKJ
	gx/UINBHxQouaraZG5RjGvdcgbYJrBnrJbuxVvaV5smPaCW/aez4I4mopTo/hxj9Bk5C
	WmAZNAQQrJ5pE5z1k9eU1dS2dF50/pawmkL2AvgHwLjGH0k7JACk+pbRhgBDn6TdUNZm
	Y5WA==
X-Gm-Message-State: APjAAAVsNXbXzAdP/aWcShsU62JDyNmHAk3/ITD92rNx8oha8jf/dM7V
	Zn8mVsYqeTeSEfpe8K0rRg1kT4oxU4yhoBFmvYY=
X-Google-Smtp-Source: APXvYqzmt3dt4t7o6+FT7vfT8tsA3v+H+cPyxt3xZ2/RhSWfDlq075ybPHj6JhuZsIm9qyssd83k9T9KdiRg1cSG7Kc=
X-Received: by 2002:a24:5c05:: with SMTP id q5mr11846199itb.110.1560102009923; 
	Sun, 09 Jun 2019 10:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560091882.git.akuster808@gmail.com>
	<682c4119e95056d68513772261425bdc66e1fd2e.1560091882.git.akuster808@gmail.com>
In-Reply-To: <682c4119e95056d68513772261425bdc66e1fd2e.1560091882.git.akuster808@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 9 Jun 2019 18:39:58 +0100
Message-ID: <CAO5Uq5Tmr66vMpn-FnKZerBVhN5uwoKvFuJ31v8x40bEFYf1oA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Warrior-next 24/27] openssl: Upgrade 1.1.1b -> 1.1.1c
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
X-List-Received-Date: Sun, 09 Jun 2019 17:40:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 9, 2019 at 4:50 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> From: Adrian Bunk <bunk@stusta.de>
>
> Backported patch removed.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---

I've just created:

https://github.com/openssl/openssl/issues/9119

Which appears to be a regression for DNS over TLS when systemd-resolve
is built against openssl 1.1.1c.

-- 
Alex Kiernan

