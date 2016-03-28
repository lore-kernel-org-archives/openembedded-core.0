Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 78C0D606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 21:17:41 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id 4so146562470pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 14:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=r8ndCTRnlza7hlnNNnqvLEKe2sXjcu3SQ7fHkJ4HCW0=;
	b=qqj73spCKQq/7KAhE3TmzhxIZnhyXjzbDsxusTNy3InaagVh0afDPo9p4v7FNAi7fd
	6V3O2EdorbE4ruxhhAAhMGePvr5Dgk0LW0GwWzb0U2XkCM23CW9qvxC4mG2eWG+YyuS7
	+bl5lsx/QgYah6SMAyhFwd/cJsdu2J+xS3un1jJIXTjq+DK4wW6hdwbClCzD/oD9EuVe
	8xxypQAx9/tGC5nxKvN26nz2VPyFKxeoly/zRV2qTKc8dIGilwhHZ4oA3cENLa1K19Z1
	p3yUC9pu6lmzH+lpmLxLqJQModgSd6ofPuvFg74f9nStoVLZr+Bgze5fscRIko8eT8de
	/Tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=r8ndCTRnlza7hlnNNnqvLEKe2sXjcu3SQ7fHkJ4HCW0=;
	b=FWZmfcyiubQ4CX83D7EHXJiOZtnhGc1eVGkwPcn7d28KlRgh7Qp3JY2OdriftzNJfd
	1Lcdl9wVjst3kec8tMEg1lmryJF1K+Fs1Ah4FSWEBlVSnUAkg9BE2C9aiYwhiydoHqKC
	8iMI0Z/7zqCfivAH3GP9LZFzaW39iYTA9BzCGMlcToglXDZpNV4bUoYa02cd10QM0F1/
	3RYmUZvlQ8Lp1V+zkR/ehjSW+WFC0Zi4KulYnad5oMwfli9Lv5uyMH8cfDkWuOg+6kwL
	yj2xQfJUK6m6jKF8XlwSeJgXhVGnGhjkPRDqCT9CrTSiTehkxip98vGcLWEUj8nefJFL
	s2jw==
X-Gm-Message-State: AD7BkJL7F4QX93exWYUc7Go9gB2U1XfAjBwLw5D+MsXFuToH7IyEdS8+WwlTTYKUFSVV9A==
X-Received: by 10.98.17.74 with SMTP id z71mr46381683pfi.30.1459199862409;
	Mon, 28 Mar 2016 14:17:42 -0700 (PDT)
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com.
	[209.85.220.48]) by smtp.gmail.com with ESMTPSA id
	g70sm37829148pfj.13.2016.03.28.14.17.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Mar 2016 14:17:41 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f48.google.com with SMTP id fe3so106694354pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 14:17:40 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.65.172 with SMTP id y12mr46183376pas.102.1459199860489;
	Mon, 28 Mar 2016 14:17:40 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 28 Mar 2016 14:17:40 -0700 (PDT)
In-Reply-To: <56F99996.9010803@gmail.com>
References: <56F952F7.2010409@gmail.com>
	<CAP9ODKqPzybLhTyx8wz1xCpb4_4R0cXSsmYXB3dtLwc4scBbCg@mail.gmail.com>
	<56F99996.9010803@gmail.com>
Date: Mon, 28 Mar 2016 18:17:40 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrhWXSrSR5HhWy0gRTzJ896EMuGZb1qJ9VnDV29VJjv7g@mail.gmail.com>
Message-ID: <CAP9ODKrhWXSrSR5HhWy0gRTzJ896EMuGZb1qJ9VnDV29VJjv7g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Aarch64 u-boot with gcc .5x
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
X-List-Received-Date: Mon, 28 Mar 2016 21:17:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 28, 2016 at 5:52 PM, akuster808 <akuster808@gmail.com> wrote:
> On 03/28/2016 11:20 AM, Otavio Salvador wrote:
>> On Mon, Mar 28, 2016 at 12:51 PM, akuster808 <akuster808@gmail.com> wrote:
>>> I have an arm64 odroid c2 board.  If I build u-boot with the current OE
>>> 5.3 gcc it hangs at kernel load time. If I use 4.9 gcc it works fine. A
>>> 5.3 built kernel boots fine with a 4.9 built u-boot.
>>>
>>> The vendor supplied u-boot is hacked up and am leaning it that direction
>>> as the culprit so I am looking for data points.
>>>
>>> Is anyone using a current u-boot with 5.3 gcc on an arm64 machine? if
>>> so, any special tweaks to get that combo to work?
>>
>> I am using one ARM 64 SoC with GCC 5.2 at this moment and it works
>> fine. What U-Boot version is the fork based on?
>
> 2015.01

Please try to use GCC 5.2 and see if it makes any difference. The BSP
I am referring to is currently using it and it is working fine.

The forked version is the same. Of course, it may have changes which
hides or solve the issue but it is a hint anyway.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

