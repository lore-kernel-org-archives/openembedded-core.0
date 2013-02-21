Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U8QfK-0001Nr-H3
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 08:34:03 +0100
Received: by mail-ea0-f172.google.com with SMTP id f13so3796645eaa.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 23:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-type
	:content-transfer-encoding;
	bh=Ty4gq68EUVlRxJwAXMmIyEzWP+veGhmT2W1IsVhbxRY=;
	b=dqA2dg3TaHwjwmmgmQ1Sby6fStr6Ikg4qENG3h5YJUT/qAyJjeT+5C6aF8DImVKq0J
	Xa1Kj6zMdl0WjavcK44hNzlf52EbHMt+3l33NKCGnes5OSC2HmD4HntiacmPLM9JGQyL
	2ucOIY+FRFnZBbuAJXjzg5qZSPys3u4KfJfItFDkENuAj0FiD6CRAMo/vQnz1/raSf3g
	RhK9LmFJveYsPzZixQllrU2qVm5Hnu6i7zRF1PjdZXav6RwlmOAC0RG7elqYDgvxb8Wy
	2kt5HU5UnxCZSRvCAuGAlGHxtY2SBiOZsETK2sbb37Gs7hAR6kDjYCsCgjJmXKKzr7NP
	MBHQ==
X-Received: by 10.14.207.73 with SMTP id m49mr77968775eeo.24.1361431070873;
	Wed, 20 Feb 2013 23:17:50 -0800 (PST)
Received: from [46.75.29.213] (046075029213.atmpu0009.highway.a1.net.
	[46.75.29.213])
	by mx.google.com with ESMTPS id q5sm113319366eeo.17.2013.02.20.23.17.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 23:17:49 -0800 (PST)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Date: Thu, 21 Feb 2013 08:20:09 +0100
Message-ID: <13cfb9f9663.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <512586FE.8010100@windriver.com>
References: <cover.1361338900.git.Qi.Chen@windriver.com>
	<fc06c499d04a1cf82c2d426c17cd2331a6bf718d.1361338900.git.Qi.Chen@windriver.com>
	<CAC1BbcTWjtDiLeDa3970HAL5Za+9iA7sqfs6XsDqahEC4A49gg@mail.gmail.com>
	<512586FE.8010100@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.2 (build:
	2100209)
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 5/5] populate-volatile.sh: remove trailing whitespaces
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2013 07:34:04 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 21 February 2013 03:31:26 ChenQi <Qi.Chen@windriver.com> wrote:

> >>          test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> 
> /etc/volatile.cache.build
> > Don't you need ${ROOT_DIR}/etc/volatile.cache.build here (and
> > everywhere else if there are other cases), too?
> >
> >
> Actually no.
>
> The cache is only enabled when ROOT_DIR is "/".
> That is, the cache is disabled if populate-volatile.sh is run at rootfs
> time.

Thanks for the explanation.
Cheers,


Sent with AquaMail for Android
http://www.aqua-mail.com




