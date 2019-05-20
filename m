Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 343D47E06E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 17:46:06 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id p2so11746804iol.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 10:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HuYiZbIWwQkN9OdcjVMYVSZcNjERnbLQrIi1EQqarMo=;
	b=BdAgCLQBBrrhfSQsedaj9FbVGKDdurgkmJsGwWgj9dFWzkKCnBR6yih1RUvb1vOf8n
	/PEvYbHGPx9lwfHw2eqULXj5A8ufd3gYj06dHFunoyxiFUFMFqT8FZrsEgPFijYkEIwv
	UZY3dbHE3hDgNeZlWrsPSrptMiLCt0qih9JAzpD2Frdn3vQP0b1VD65qBrZSxPcHV+MM
	pJX1RdXOdgu450B0YVrkQsVTfxNBv5UNVjjzXqwRbGsY4pxd6XLllJCfqhDlWTcX+ZSX
	ZIE1n2xngquTgeRwFrNgrnTjNjuIbl9LRc4ZeboI7AYoaiFU7oKbMH+L2TgKX0pDQ7Ac
	MLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HuYiZbIWwQkN9OdcjVMYVSZcNjERnbLQrIi1EQqarMo=;
	b=HKhvUWXNp2bA1p5kspqwnrI9KKqXBK/1f1GCkhk+rAF66px2setYaotYLlEpQ/UWc6
	y9hEadthYXrePJ1hIk77d6mTdnzkkLqUn9xoWNBE14kBgyvwiL8AJ08/n9SOe++1LjKA
	RED3swJMSc6OfPtl6GK2CQiOVPJeTMdyU7/AXR/drIWi4llm9UxSepu1UaYBUWPNnN6r
	Y5nX5MT8KAnPwtBYGghO+lhTeKzXAAGXmLI/lPNoZ5RRb/5Vx6Nts3EMbp09itVTxT7w
	ayXNjThPFl9AvdH3v9t1BkMkKwVhjvEmw9Mahutgc4ypZiqRNblDuszjFyFbC/2aZwIY
	++7A==
X-Gm-Message-State: APjAAAXH0hf7LZPXW2k4oieVI/Aq+3C14GTayRP3XeLzTExjxG7alZqU
	6vwmHsFfzaLipJ9cJ/MRRr6uQnRQWMdQAlP6HcI=
X-Google-Smtp-Source: APXvYqw6xab5y8s53/p24WEQz/SPf15T0mPnfopvs/5HBC42siJc4hPSTA3KwtV4+Oqys6SVCHaHKhy6FFFCafOIb0A=
X-Received: by 2002:a6b:dc0d:: with SMTP id s13mr14775938ioc.144.1558374368091;
	Mon, 20 May 2019 10:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190520094621.94652-1-kai.kang@windriver.com>
	<20190520094621.94652-2-kai.kang@windriver.com>
In-Reply-To: <20190520094621.94652-2-kai.kang@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 20 May 2019 18:45:55 +0100
Message-ID: <CAO5Uq5TMy73eTwm538936eSY7NtA=aaGGAHX0TZo5xMRFESiYg@mail.gmail.com>
To: kai.kang@windriver.com
Cc: paul.eggleton@linux.intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Mon, 20 May 2019 17:46:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 20, 2019 at 10:47 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Add a configure file for systemd.networkd to configure wired network
> interfaces with dhcp. It works with common network interfaces such eth0
> and eno1.
>
> [YOCTO #13057]
>

I'm really not convinced about this - yes it's initially surprising,
but should base packages have this kind of assumptions/policy baked
into them?


--
Alex Kiernan

