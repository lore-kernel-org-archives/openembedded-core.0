Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 823D96FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 17:53:44 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id r184so9479688qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=KsGuMwoniND9OekSelmZifyj01jNyirmMBI2bMJ7HVM=;
	b=Yu4ysmc74mGZg7OchsrluGVEBO9cjzcRKv2O40PkTO2jT/2L9cNsQA04VFwitbwGf7
	aY9uwI5lqD22wNPu4tVXpWXVLxqCpNSAmGUcKoVtauON2MkMqN+SAQgDv4kifqYZmNqK
	095Ls4qoEDtqM/UtVRKtt0+g+iJX8zf2+3LHifzaUnUF8I2C0/lAwJfC7EHZQrrOuYRr
	h8g/FLFNkHtjSe10jGZjeS2zwlkulsKv1T3202AWhY9ailcK37bhhx0bIonh+VPnt+ov
	Anu0lzjQ9dOzfsqlpsFQQFSRcwdLpyYfsUXc1EBbzneTrU+XZbVZrx+1urC9BafzRiQT
	vduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=KsGuMwoniND9OekSelmZifyj01jNyirmMBI2bMJ7HVM=;
	b=etsZr+TokguqYIaEqg9RjgXUJePtSX2xdrDu4mDdxYAUWh3C81jonIKo+gtfG+14Cc
	AgNMJ8GUz4n+39jv65pR99hQCf/GxGGPJNbeSKQrGOPyjJmiZ9KBk7+HQ8BNw+3g8VUW
	ih88PMmWqcnRuE6NYSOo3QAPvzacsSY4s1tHFWUHDLrDzQODRXuW5ddkeH3/onhNAgp0
	4Djw1GOtmNRot6agm4sFb205HtVcsRZBuN3JpBrRRcFvtA8Xdud84OPlk97GHZbkoMrH
	KMOoyIeSO1qA+8TF7BPvrO+/+6Ooa+rUxV9b7BUw8VJHKJerclu1vzgqAI2FwU78vvzc
	Bclg==
X-Gm-Message-State: AOPr4FX0IVZpxsV74D2hXYJGr9Sfe2MAifC4EkAYjrNm/R0ZFOF/bPzFWKGTheYdJtNPNneI79zlAMD62ry0rQ==
X-Received: by 10.55.163.16 with SMTP id m16mr5272828qke.75.1460483625091;
	Tue, 12 Apr 2016 10:53:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Tue, 12 Apr 2016 10:53:15 -0700 (PDT)
In-Reply-To: <56E91CC8.9060907@dest-unreach.org>
References: <1458077979-23303-1-git-send-email-raj.khem@gmail.com>
	<56E91CC8.9060907@dest-unreach.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Apr 2016 13:53:15 -0400
Message-ID: <CAMKF1sp7C3zCHQBiJ=i5YYsHcXfkBX74qYXgZxYX-tqcwqrD+A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH] Access c_ispeed and c_ospeed via APIs
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
X-List-Received-Date: Tue, 12 Apr 2016 17:53:45 -0000
Content-Type: text/plain; charset=UTF-8

FYI

---------- Forwarded message ----------
From: Gerhard Rieger <gerhard@dest-unreach.org>
Date: Wed, Mar 16, 2016 at 4:43 AM
Subject: Re: [PATCH] Access c_ispeed and c_ospeed via APIs
To: Khem Raj <raj.khem@gmail.com>


Thank you, I will check this patch!
- Gerhard


Am 15.03.2016 um 22:39 schrieb Khem Raj:
> Use cfsetispeed(), cfsetospeed(), cfgetispeed, and cfgetospeed()
> instead of operating on c_ispeed and c_ospeed termios structure
> members directly because they are not guaranteed to exist on all
> libc implementations
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  xioinitialize.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/xioinitialize.c b/xioinitialize.c
> index 9f50155..632ca4c 100644
> --- a/xioinitialize.c
> +++ b/xioinitialize.c
> @@ -65,10 +65,10 @@ int xioinitialize(void) {
>  #if HAVE_TERMIOS_ISPEED && (ISPEED_OFFSET != -1) && (OSPEED_OFFSET != -1)
>  #if defined(ISPEED_OFFSET) && (ISPEED_OFFSET != -1)
>  #if defined(OSPEED_OFFSET) && (OSPEED_OFFSET != -1)
> -      tdata.termarg.c_ispeed = 0x56789abc;
> -      tdata.termarg.c_ospeed = 0x6789abcd;
> -      assert(tdata.termarg.c_ispeed == tdata.speeds[ISPEED_OFFSET]);
> -      assert(tdata.termarg.c_ospeed == tdata.speeds[OSPEED_OFFSET]);
> +      cfsetispeed(&tdata.termarg, 0x56789abc);
> +      cfsetospeed(&tdata.termarg, 0x6789abcd);
> +      assert(cfgetispeed(&tdata.termarg) == tdata.speeds[ISPEED_OFFSET]);
> +      assert(cfgetospeed(&tdata.termarg) == tdata.speeds[OSPEED_OFFSET]);
>  #endif
>  #endif
>  #endif
>

