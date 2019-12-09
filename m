Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 487BB7FC93
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 16:33:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z7so16825681wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2019 08:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ojnnJDAQsJkFwMD67ueKK310r0jlmm9P+/xpnj8Glzc=;
	b=UedKrFdOfZELjUJ8T/ewLtOv7+mBvrvjcq3mzRODNTER6A2an+fKkNNVsKjBcFWlYN
	IxxnuX4PQ9iBstUsW+NtnrqknFKyaSEn7dESl6ODsBuII2ajbHv/4eSM0+FyG5y2bM8Q
	475o+eAt9urMNDdLaX+sDclsnTzkL3azxfrmu5maYAIQtk7F6DGV8EUVI7dX/AodNAyy
	fGWc6bHGeinLTtydoD1PJjLiQe87NLokmSwJkkuRoyyjMpElK6IZ/pgCljliYnuz5bdS
	U/3k9PYJ7HxO7HRnGI7jvJDb59j/XbfCuPFbtT6/LQFrdldzZCwymGd/uIyFc0FZPhjc
	7ZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ojnnJDAQsJkFwMD67ueKK310r0jlmm9P+/xpnj8Glzc=;
	b=D4e9s2Rtgcan+bKLt5BLbrP083t9PS0bodH1F/85Sv3ZKU7uAgT8kJbF4BqPceo4em
	dK3eRS1XBDD18FrB1kubgt3o1bQcP/UADeqBhm795+hOZZtwmVZ5OUsYU0Dg6kC0sOGl
	XNiBO3bOlpMPZdiG70UOzfWidGj8gyDPmLhhJG0sqAWjpKZsgHxejKIv3ju88XXU75Qx
	UdvnmgZE/uEcJakSa6QYlZdlvjfTInAGlOqeWIc4X3QaH680dWvbvvQu6cu2+IB63Rjh
	8ytzzsKWbTmRRmVaPXxkeAFzrZvPFE085M5MeGRtlq9CO+r64JRvBOkoOHSmx3OZdqAc
	mmTA==
X-Gm-Message-State: APjAAAVoCx9g7g0B7RD3YbsnlysQ/BE8mHBGL0nzWr3pXs7Xf6IDYEW7
	oLkDyJ8I1bzdQ3jc4ZDUbaRkRaRpapg=
X-Google-Smtp-Source: APXvYqx1juV/Mg27dtFr5IOCf4lChJO/lXtlD5O6oxGRY9GZvyIyaeAuGqi8sUjP5RNuM+nH4nZ8Xw==
X-Received: by 2002:adf:eb51:: with SMTP id u17mr3146038wrn.29.1575909193408; 
	Mon, 09 Dec 2019 08:33:13 -0800 (PST)
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
	by smtp.gmail.com with ESMTPSA id v22sm151490wml.11.2019.12.09.08.33.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 08:33:12 -0800 (PST)
Message-ID: <f383cf71c31578ac5e3b5cf07052239a0fa15290.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 09 Dec 2019 16:33:12 +0000
In-Reply-To: <20191205201305.12854-1-luca.boccassi@gmail.com>
References: <20191205201305.12854-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH] util-linux: split uuid in separate recipe to allow bootstrapping
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
X-List-Received-Date: Mon, 09 Dec 2019 16:33:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> On 05/12/2019 20:13, luca.boccassi@gmail.com wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > In the next release util-linux will gain an (optional) build
> > dependency on libcryptsetup. But libcryptsetup build-depends on
> > util-linux for blkid (optional, can be disabled) and uuid
> (mandatory).
> > Split out util-linux-uuid in a different recipe to break the cycle.
> 
> <sigh>
> 
> At least please simply make util-linux-uuid just require util-linux
> and 
> make the configuration changes required (presumably, disabling all
> tools 
> but uuid).
> 
> Ross

Hi Ross,

(please CC me, I am not receiving mails to the list. Thanks!)

I tried that at first, but it was so complex that the recipe turned out
to be bigger than it is right now. And it wasn't even working, there
were tons of conflicts because of who-knows-what it was picking up due
to the dynamic generation.

-- 
Kind regards,
Luca Boccassi


