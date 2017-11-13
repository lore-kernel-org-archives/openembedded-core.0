Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id A32C278695
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 17:15:36 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id g104so2170698otg.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 09:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=8sELtamFvs4Mh/fvQRzxo6LTn30d/vH7Xm7D9TxFkzg=;
	b=GZY0VxvAYaPjViqwZuYvWuIy6GLIPmMxrQDjHpjT0Bul4qcRIFmRweaJHns80WzA8g
	qcVjJrYqToIWNR5N1i18C5IrvMK1aPFYfqZi5EbHOjyQaYONkXjCILuaXOLIFMzA0Uj9
	vqNyh9PE13FeavtPTWA3M8NHP2a962eVFHlHLhVQ9w1AH9fotRZqJCSGTv0Hj/WFZv8d
	s+qtTEQcmLZAVkc+Mq+CRrV4/cRdv0sco4ki+SAcTmTq5+RLmQKc5eyl41NiTfISRneb
	YdAHUI+FHgoW8fcUkk2/StdpSSdtH1uY7DZ6xd1V8UbqCurrbNUkQjGsyUxStaRjcK+z
	c4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=8sELtamFvs4Mh/fvQRzxo6LTn30d/vH7Xm7D9TxFkzg=;
	b=ncVEJdpbd80h1DdqvV3Y9koRSIA2B+FH40Ub35dXoPd/LHRL2Tn7p75gecxROyNoYK
	BrqNF4WREIA8Nk5LIGvfZKaxJSOkl2XKiPxehuqDCw7kpqkcsYMTIcVQ16JQeQyffBUY
	6JICEXXfr87K7TVxLi3HRcnh2BLfft3XEoibKdHLynBzzUbf0XS63e/g2zF8f1/K52gt
	0HbaiMmN5gWwnLNhky+pGY5JRE0cq+IIceKIempj3xTEhXUeRsos/X/M6aJC10z2LR8X
	LSVvlXP9K2XlKnJk9yfFNnGYRTqcu2Yd2pJqwG2Mq5MPCsVJoOxrfvb0IlW//SKnN0tJ
	D6ow==
X-Gm-Message-State: AJaThX5nCFP9n0NPtuBHVjTOtzXAQn30D9s5mpIxh+TbhASIFf4h8Boe
	K7TDY6tdWUlcOXZYcutKSWfyN78B
X-Google-Smtp-Source: AGs4zMakbECvBKVDWqCgazUgdbioeH6rOOr/k0Kkhy/SZ/QdB6vD1IF1U0VitBC5iDJiUCysgfReQw==
X-Received: by 10.157.20.71 with SMTP id h65mr2771508oth.58.1510593337483;
	Mon, 13 Nov 2017 09:15:37 -0800 (PST)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49])
	by smtp.gmail.com with ESMTPSA id u9sm7973566ote.62.2017.11.13.09.15.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 09:15:36 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f49.google.com with SMTP id d65so2316857oig.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 09:15:36 -0800 (PST)
X-Received: by 10.202.72.21 with SMTP id v21mr4490864oia.93.1510593335899;
	Mon, 13 Nov 2017 09:15:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Mon, 13 Nov 2017 09:15:35 -0800 (PST)
In-Reply-To: <20171112163923.19517-1-mac@mcrowe.com>
References: <20171112163923.19517-1-mac@mcrowe.com>
Date: Mon, 13 Nov 2017 15:15:35 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoxmsvO6ZaSNkYX3_-R234vvFoq3Ce6cWKDg_RE2tvMtg@mail.gmail.com>
Message-ID: <CAP9ODKoxmsvO6ZaSNkYX3_-R234vvFoq3Ce6cWKDg_RE2tvMtg@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] cmake: Avoid passing empty prefix to os.path.relpath
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
X-List-Received-Date: Mon, 13 Nov 2017 17:15:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 12, 2017 at 2:39 PM, Mike Crowe <mac@mcrowe.com> wrote:
> With meta-micro, ${prefix} is the empty string. This means that
> CMAKE_INSTALL_BINDIR:PATH and friends end up containing paths starting with
> many instances of "../", presumably due to os.path.relpath attempting to
> find its way to the current directory.
>
> Let's avoid this by ensuring that the root path always ends in a slash. If
> it already ends in a slash then adding another one shouldn't cause any
> problems.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

