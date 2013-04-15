Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URluq-0003dK-DQ
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 18:06:15 +0200
Received: by mail-ve0-f180.google.com with SMTP id pb11so612943veb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=hVZYWhc6a+pHhqtw8eLpsi9PZhc/iwRxtY+jsVzo2ns=;
	b=EH0TNrjIUhU9fzOvawomRFqb8hRESDEANZ0B6i+WVE5FM1kFiALn/xw0xFMmoFSpCw
	di0JIBkdmxiJI75T7d5CjWbBMih4F0mgRA379qP/bIyZte/R6KzRNRgcyC4cTx8qOM8h
	6/VV0W6vKv50nTcSxrGWsAMObIk9bhpjjY9BEMns/EKHqf5POMCL25IYzbSMIqoGPfmq
	EDdvosYoNuhyt5nSInLcvETDUOliaXJIDHzHyKb0qvD/M8AEfahH4VLtXhl8P6vCg0SB
	f/oFsb1OnzyeocBEJLWpVKqYC+/bdUvzIgsq2mdfvt1wuA/NENhJv6/84vD5TyMULbBi
	VLwQ==
X-Received: by 10.58.90.66 with SMTP id bu2mr16516176veb.29.1366040911039;
	Mon, 15 Apr 2013 08:48:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 08:48:09 -0700 (PDT)
In-Reply-To: <20130414164848.GG2475@jama>
References: <20130329103919.019B350446@opal> <20130414164848.GG2475@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 16:48:09 +0100
Message-ID: <CAJTo0La1xtXvufCej0XVWAoO=vet-CPqTCPCULTrw1nobx+q6Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQlOhWY615wfRwFU4yf4zueInm6BjFlAIlY8N9l9mhF25KVH+QxUs8z5SONxX1X/xgJVrCP+
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Marko Lindqvist : coreutils: update to upstream version 8.21
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
X-List-Received-Date: Mon, 15 Apr 2013 16:06:16 -0000
Content-Type: text/plain; charset=UTF-8

On 14 April 2013 17:48, Martin Jansa <martin.jansa@gmail.com> wrote:
> coreutils-8.15 and newer build realpath which conflicts with busybox's
> u-a.
>
> Please add u-a settings for that in coreutils to fix upgrade path:
>
> Configuring busybox.
> ln: /usr/bin/realpath: File exists
> ....
> update-alternatives: Error: not linking //usr/bin/realpath to /bin/busybox since //usr/bin/realpath exists and is not a link

Patch just sent.

Ross


