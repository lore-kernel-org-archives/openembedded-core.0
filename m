Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A71E177F66
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 May 2017 22:30:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id k15so13646123wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 May 2017 15:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ZCUNcPV59vl3jOub/kJz8J+eTsF3UwLoVWXV7SwRg1g=;
	b=BSO5g6oWWJXvV2uqm3HpQTMmVjGtcq6aOyFJH1fu6SBJhlfbi+j4rVFxLmX6SafgRH
	lPvafnxkmrugF/XTY1ARrPNJ5jk1pQgM3RLeXkVJI7wDc4T76GyskGSImfm1HH+8b+eM
	vAnDcerB7Z4Kdtd1a1Q9HMD7tf73tr4dd0hjU7/jePP00YgGzRByUL722XWZ5Ru8I9SZ
	4lvhifQ4S3CKs1j4UUPGaYHu21hwMWR9rI+HFgxilrp/0NGfc8qXGHmgDqmntiN50Fq/
	a4e+nSQxl+3DnBpqg0wJl5DUtKlRu2R8BZ5Z/1ERGNIET4l3kMfM9WsQdxBg9y1a0cro
	Zejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ZCUNcPV59vl3jOub/kJz8J+eTsF3UwLoVWXV7SwRg1g=;
	b=K9NFk+Jh5g5UQvybsuCZpsKGzbF3tki78vkkTcuPx8noGds3+Fgoj0Xv6ptZVSJ45w
	eoAakyuHiOyzeEuAIklX/SFDRw9iqUcVawoqgIAUawpBcXf3MpTgIhd+IHnEBbaTxIgD
	gUlhS8jyZdmb0vEsPs0igBNVtREOLKvib3/ZP1TlzrT2sU2BlzxJn0BGd6lTcmSmQpgh
	IA8qlaz9vwYRi46wZRQrCj+w4j83KKBg+DxtwSntYzh3h9alB5cGc4cZKvra9L/xjuO7
	UfgzkIirpckUqZmheyxwhRt996WZPtOWpVAR9pR0wQkddaOfKr6kx1cb4mJobnDbMwbL
	xWcg==
X-Gm-Message-State: AODbwcCf3wRoUCXDsCEeJ3HRiFGDQUxbzCjACKpGUVgYoeyIS1i4ZDhr
	3lgj6uhB4aPRomBP400=
X-Received: by 10.28.29.17 with SMTP id d17mr8767437wmd.90.1496010660194;
	Sun, 28 May 2017 15:31:00 -0700 (PDT)
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com.
	[74.125.82.45])
	by smtp.gmail.com with ESMTPSA id b8sm8399801wrb.7.2017.05.28.15.30.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 May 2017 15:30:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f45.google.com with SMTP id b84so35008748wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 May 2017 15:30:58 -0700 (PDT)
X-Received: by 10.28.4.203 with SMTP id 194mr8579818wme.118.1496010658471;
	Sun, 28 May 2017 15:30:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Sun, 28 May 2017 15:30:57 -0700 (PDT)
In-Reply-To: <20170528065940.16603-1-romain.perier@collabora.com>
References: <20170528065940.16603-1-romain.perier@collabora.com>
Date: Sun, 28 May 2017 19:30:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKremvtL4xsZUft8L3hKUZksp94Hpc3nFKgVbKKLe8hjtg@mail.gmail.com>
Message-ID: <CAP9ODKremvtL4xsZUft8L3hKUZksp94Hpc3nFKgVbKKLe8hjtg@mail.gmail.com>
To: Romain Perier <romain.perier@collabora.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] busybox: make SYSLOGD optionnal
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
X-List-Received-Date: Sun, 28 May 2017 22:30:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 28, 2017 at 3:59 AM, Romain Perier
<romain.perier@collabora.com> wrote:
> Some distros might choose another syslogd provider like rsyslogd.
> update-alternative will update the link from syslogd to the right
> provider. However the syslogd feature is still present and enabled
> in busybox.
>
> This commit adds a new configuration fragment to make syslogd
> optionnal in busybox.
>
> Signed-off-by: Romain Perier <romain.perier@collabora.com>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

This is a good addition; once this is merged on master I would like to
propose to backport it to pyro as it does not change the current
behaviour but allows for better finer-grained configuration.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

