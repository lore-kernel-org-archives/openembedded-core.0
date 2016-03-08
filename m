Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id A9A2073196
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 00:55:02 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id tt10so132945pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 16:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=IFxWWgNddOPl5mQSuTkzCK2GBlFdBpHSFFqIz32xHdM=;
	b=YKtFbJ8v5xH2gMea2/1F7uouZxjjNwk8PX0sdiZCYTQ/4kowdiB0hWEWsYUcz/Q55d
	y714CMX9A2whbKPvEMRwTZBs7oStbgXKTDcwwsI1bJrylHaPgE8Hqm9sL9ijSaJK8m0b
	7RqOP8WSq2IvK1VX9zoMdKXJGEbNmg2Tqu1nkS+oyjbpOJ4JbOnYjExR0u9Pesdj6jNT
	+hqa98gARAyGnKVfCcBX4xBF3TiTRrdzmeC5C/BLnWk9fFtWe3WyR4yiD5wXHW6Z3wef
	FQcO1d8gYqc8VkdwLub0QRwFeWJsK3xmhitdz5JKxUK+rET6NkbFI8J23YdTi0b4AD6V
	1Org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=IFxWWgNddOPl5mQSuTkzCK2GBlFdBpHSFFqIz32xHdM=;
	b=fACnmqVun+mxyZy6RAEx4Op7kPy9GjGj0RU0hitKLwlCDXLFvDLrka/gsjPWXfd+Ko
	/nQ9KqLyeIUNV4OyRq45r+P63S8kicLLJG5MXFDQuHI1jQRPqtDKWRgs90i/7JNZe6io
	ZC5G3wAEjkFq5OZJ3F83MAz79vODIc2qOiZx4atnK0PsxwSr7PfdwRblkq8KSz54JLcz
	XSi3fsDMhtgoZGej4wQ56yFwymGa0nr04tMZjd/9QFWJUOeIjLMsBv37OArId153xBSM
	+scAUgI43D2E98gOkt/l4snAhkax/liDnq2ofg6+oqFAsob9qE0C8Ay0jUiIjVxITnRQ
	feKw==
X-Gm-Message-State: AD7BkJJwlQ0D8vOsyldN5gS2xlNgzxTgq69yA9zNnkJgBscerxW4xqG7S7VW5eOjDzYv7w==
X-Received: by 10.66.121.97 with SMTP id lj1mr37474254pab.51.1457398502726;
	Mon, 07 Mar 2016 16:55:02 -0800 (PST)
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com.
	[209.85.192.176]) by smtp.gmail.com with ESMTPSA id
	s197sm229335pfs.62.2016.03.07.16.55.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Mar 2016 16:55:00 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f176.google.com with SMTP id 63so163951pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 16:55:00 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.80.10 with SMTP id e10mr37433767pfb.141.1457398500306;
	Mon, 07 Mar 2016 16:55:00 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Mon, 7 Mar 2016 16:55:00 -0800 (PST)
In-Reply-To: <1457361291-14009-2-git-send-email-daniel.dragomir@windriver.com>
References: <1457361291-14009-1-git-send-email-daniel.dragomir@windriver.com>
	<1457361291-14009-2-git-send-email-daniel.dragomir@windriver.com>
Date: Mon, 7 Mar 2016 21:55:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq7M5kMuaQGeoUSssTEvhsnK-j-LqLeKQ6AqXJVoaeViQ@mail.gmail.com>
Message-ID: <CAP9ODKq7M5kMuaQGeoUSssTEvhsnK-j-LqLeKQ6AqXJVoaeViQ@mail.gmail.com>
To: Daniel Dragomir <daniel.dragomir@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master] Add tune for 32-bit ARMv8-a
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
X-List-Received-Date: Tue, 08 Mar 2016 00:55:02 -0000
Content-Type: text/plain; charset=UTF-8

Hello Daniel,

On Mon, Mar 7, 2016 at 11:34 AM, Daniel Dragomir
<daniel.dragomir@windriver.com> wrote:
> This patch adds tunes for 32-bit armv8 platforms. The user can select
> the vector floating-point instruction set: vfpv4 or fp-armv8
> and the thumb, neon, crc and crypto extensions.
>
> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>

First I would like to thank you for working on this. This is very
helpful and a good step in extending the ARMv8 platform support in
OE-Core.

I think you should also change the arch-arm64.inc file to use the
armv8a.inc file. So it is more consistent.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

