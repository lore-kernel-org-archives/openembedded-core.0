Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id DE05E65CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 21:11:39 +0000 (UTC)
Received: by iody8 with SMTP id y8so199421677iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 13:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=73AWrwqSKijP0U+4i8xrM3Ks+wH09CnmRfHbwNOiShg=;
	b=ZX84zZoXUda+lnA9+uASVqgRFEJocXMLyNyD1wYl43vUhQ3aLq6nSQWcl9rPeF6IGY
	+nLfkTeVqLCb4PR4/blEjam4gREI2Gver/beJI35VkqbtJh4H8SdJvKkSSChchkH/ChC
	s8e8QO9YXaQKt1lGhO4XF7gWcxB7gn7xz4brqWfgURPc3hUIQ87IX/0xcwKQMpXbSwUZ
	fpxAz6YyemiTfoVqevIO2SP/shex/oC8LOGBCDJgeCR9yBv+rNHgIQzJvdttGwv4YViQ
	fifl3xXXQotEIpKQjf52glEnf9He1AOYKmIRG/psg2GX6FZ9HR7wdCDhi9+4Z69gQpys
	20JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=73AWrwqSKijP0U+4i8xrM3Ks+wH09CnmRfHbwNOiShg=;
	b=WnZ+3LJfxSGTL6ba7hUrdMbEuiWQeQtCl2l7Sv1Ze5FRZzNaVq+HM1oo6UtjlN+4hf
	w/p9TPEXKI/h0/d7r6kqcZGutJZuBARTQUW/li0RUgo0Do8OB9CfAq6xguqxpqjfvruY
	dPSHUACX6Rxg6ZBt/r1PzQR+n90LHUhz/jQbErw4GXBx/3fY2m5RnXXt448bbaowTuLn
	s5vWCnI3fu532aM+bRW5QyV0xetW/+YkutyUSDqneauXbNHtI51H+cZl+QCQGmeDarG2
	WABrbZttNCUH9OglKXAA+bHySJ2vXndzw8kkuYm2o0j+kfFlNtBgBwohOiZ9sZSDiuVl
	fBug==
X-Gm-Message-State: ALoCoQmk6gZY8gDF4adZ9+TbIMJdsp6zhhtpWgF7gPx3zj6wJM/lkJelJWQHe2BxjgaJU9H0JLWk
X-Received: by 10.107.8.69 with SMTP id 66mr627192ioi.34.1447103499654;
	Mon, 09 Nov 2015 13:11:39 -0800 (PST)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com.
	[209.85.223.182])
	by smtp.gmail.com with ESMTPSA id h64sm192121ioh.41.2015.11.09.13.11.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 13:11:38 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh3 with SMTP id h3so32348731iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 13:11:37 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.151.131 with SMTP id z125mr501965iod.192.1447103497693; 
	Mon, 09 Nov 2015 13:11:37 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Mon, 9 Nov 2015 13:11:37 -0800 (PST)
In-Reply-To: <20151109202937.GH8499@bill-the-cat>
References: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
	<20151109202937.GH8499@bill-the-cat>
Date: Mon, 9 Nov 2015 19:11:37 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoZR+w+CmPv0gcpJfDf=QqkFNgPOmAX22YJ5RrjAHfkAg@mail.gmail.com>
Message-ID: <CAP9ODKoZR+w+CmPv0gcpJfDf=QqkFNgPOmAX22YJ5RrjAHfkAg@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Mon, 09 Nov 2015 21:11:41 -0000
Content-Type: text/plain; charset=UTF-8

Hello Tom,

On Mon, Nov 9, 2015 at 6:29 PM, Tom Rini <trini@konsulko.com> wrote:
> On Tue, Oct 27, 2015 at 02:05:40PM -0200, Otavio Salvador wrote:
>
>> The U-Boot 2015.10 has been released at October 20th 2015. This also
>> removes the GCC workaround, for the inline behavior, as this version
>> properlu supports the GCC 5.2 as compiler.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Sorry for being late on this.  Please make sure to cherry-pick at least
> c139b5ff0999ec3d44a02ebdb623a92e5782e53e from upstream (or a number of
> boards won't boot Linux) and possibly even
> fb3db635757f68e68ab3e943396c34886529b88e /
> 2bb5b638791d0f4f7d2f0e5c276e70a1034805ce /
> 347ea94e2a954ab70f64a3f43d9b374cf4640f26 which are some important MIPS
> fixes.

I queued those here for the next patch version however it seems noone
has yet cooked a proper fix for the ppc issue. Are you aware of anyone
working on it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

