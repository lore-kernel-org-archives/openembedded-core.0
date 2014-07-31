Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6B89570884
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 15:42:30 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id at20so3984632iec.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RTUKBsPk6HmcYRcnbOzUJQGL543AAhWqUIijyIcXtnI=;
	b=hz8sOgAH9vqlNqa5eOXgPrfMZuIqSiQc/qDG8EDU5IEkFo/3txMAy5+i8P/n8/aWYX
	TciFl9Knm8KzQA3jWVn6YowcI8ITw8aOaDD/nZ0zqGYR1UxHXIK3TXeuk2jPr/3fNBbY
	jcLnYBUlO5CT5bsAnSUvJe/hdF5KjKjCtFnNF9dfvRs6W/VeIo1GPKDW8CEHXX+liCwl
	QVNz94qn9dNTNHI4ywLIlAtiKZPS2nIwB2lxYZMyT9GrBqWmRVP70EmbzBBArjND4taA
	Ip/nH1pVBJpxZXsoaBtqT/MK2plECZyUAkg8Nkwapgn2/KOt2EMB/D/W14z/d8Czc6Cn
	94lQ==
X-Received: by 10.42.90.74 with SMTP id j10mr16306972icm.29.1406821351442;
	Thu, 31 Jul 2014 08:42:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Thu, 31 Jul 2014 08:42:01 -0700 (PDT)
In-Reply-To: <1406818740-17681-1-git-send-email-sujith.h@gmail.com>
References: <1406818740-17681-1-git-send-email-sujith.h@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Jul 2014 08:42:01 -0700
Message-ID: <CAMKF1sqJGzLrLBpXpb7H6g8WgYZFbn6h-9=bZ1V1K_ox066Lcg@mail.gmail.com>
To: Sujith H <sujith.h@gmail.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] netbase: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Thu, 31 Jul 2014 15:42:30 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 31, 2014 at 7:59 AM, Sujith H <sujith.h@gmail.com> wrote:
> +       echo 127.0.1.1 "             "${MACHINE} >> ${D}${sysconfdir}/hosts

recipe will become MACHNE specific. Can this be done via post
processing funcs instead ?

