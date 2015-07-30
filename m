Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id BE70A763BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:34:22 +0000 (UTC)
Received: by padck2 with SMTP id ck2so22376754pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 04:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=FkwWOtn9vr/UCfEOJDLSkGXC2KJH9XbiqPJqYOJ59Hw=;
	b=QkGLtOKHJDDQwNhopfOSfzE3p/0kmgfSPyu4Z+iFT1ud9KoE/uURWUGTXbAz4CPFKZ
	V5JT3sEdwRAFXBKqxUQfKsRj80LNgaALALPweT5ddiqa6onCl8qSrHOKJtQKOLGvcleY
	3++OaP7mK6BkAtDsCE8Ygs8CEqmYrY4q7viffSCnAVYE0EtuQ6jpr3ix8+mn8/H21Pu+
	29dpyvOSgCeqJQ9u/cXQOqtGVr/OdfDr/D+lSY6FDjNlz0pgBtfecfQDohBuz0GLkT7B
	Ls12iuSRrD1KqEjtscXwYFY24cpQoqQr1aBh7HGxe0FfPjTRReOv1xepYuRsUUmJi11J
	K2tw==
X-Gm-Message-State: ALoCoQnLr/6RLJy/8isTmMrEOCe2Zy1ER0zDbBlTQApJOYIBnfk+LW7Qsuti0pM858/SN5jM1fzD
X-Received: by 10.66.132.16 with SMTP id oq16mr106604124pab.13.1438256062877; 
	Thu, 30 Jul 2015 04:34:22 -0700 (PDT)
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com.
	[209.85.220.47])
	by smtp.gmail.com with ESMTPSA id j9sm1722938pdl.65.2015.07.30.04.34.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 04:34:21 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pachj5 with SMTP id hj5so22268525pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 04:34:20 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.230.201 with SMTP id ta9mr106034590pac.95.1438256060461; 
	Thu, 30 Jul 2015 04:34:20 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Thu, 30 Jul 2015 04:34:20 -0700 (PDT)
In-Reply-To: <1438244164-sup-163@axis.com>
References: <cover.1438161068.git.liezhi.yang@windriver.com>
	<5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>
	<55B8A89A.6050406@windriver.com> <1438170429-sup-8609@axis.com>
	<CAP9ODKob+TVBpb1jrzVueZT0w2DQpP5X0YBAwy-RFEoh615rHw@mail.gmail.com>
	<1438239812-sup-93@axis.com> <55B9CD93.1000902@windriver.com>
	<1438244164-sup-163@axis.com>
Date: Thu, 30 Jul 2015 08:34:20 -0300
Message-ID: <CAP9ODKo=-GW32HqzO3ewzNi+YYL8U-Gcp8zAx9xKCs+vrYkb5w@mail.gmail.com>
To: Olof Johansson <olof.johansson@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] bitbake.conf: add GITHUB_GIT
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
X-List-Received-Date: Thu, 30 Jul 2015 11:34:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 30, 2015 at 5:32 AM, Olof Johansson <olof.johansson@axis.com> wrote:
> Excerpts from Robert Yang's message of 2015-07-30 09:09:07 +0200:
>> PREMIRRORS is for all the recipes/protocols ?
>
> No, PREMIRRORS is quite expressive, for instance:
>
> PREMIRRORS = " \
>   https?$://downloads.example.org$/.*   http://mirror.example.com/ \n \
> "
>
> This should only premirror downloads.example.com files, fetched via http
> or https. See the bitbake fetcher's uri_replace method in
> bitbake/lib/bb/fetch2/__init__.py for the implementation.

Yes, you can.

But the mirrors scheme allows for, for example, map it for git:// and
https:// protocols without changing the recipes.

I am in favor of consistency here and having a unique var for github helps.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

