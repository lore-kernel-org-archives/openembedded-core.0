Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C64586B8D1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 22:44:25 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id rl12so3533308iec.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 14:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pkDGz85btap59Q1J6HB6yfKeOEesQO64dZqOGtTFvkc=;
	b=uqarXkU6Ub0bT62816iu4GcBrjFRos5X5I+QsnqbewX53zT0NJk+M7SiXNlXFe7Pol
	JJayf8wcTiEMTDDlZ6XHIz4GGnnXiBCsv4IGmJe2ANEuJJDSNCqXBQz24+vy7syPLivr
	bQlQ1Kwt901BnZSZ2NEm4KVzvxu90AuW3+BoKjDZY3sPqQQnleft+bwfNDCEb2xPfpP8
	I/e0HkfsfM/2JetdcuehIVbKAm/Wrk0iiXdzhQ3pdgCKE/dcR48HhQ0RpGqsj4QYNgWJ
	6sFYgVtKUkC9MIUJyiqtoszwnDwirjNrw6Em7APxcJoogF2wOkmdo4OSsGqyC0iQiDna
	AT+w==
X-Received: by 10.50.60.103 with SMTP id g7mr44040264igr.20.1394145860196;
	Thu, 06 Mar 2014 14:44:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Thu, 6 Mar 2014 14:43:49 -0800 (PST)
In-Reply-To: <AC63B68CC9C36B4FBF9FD4FEEFE754AA20DAA367@SJEXCHMB06.corp.ad.broadcom.com>
References: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
	<1393969384.4151.5.camel@e130.pbcl.net>
	<AC63B68CC9C36B4FBF9FD4FEEFE754AA20DAA367@SJEXCHMB06.corp.ad.broadcom.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Mar 2014 14:43:49 -0800
Message-ID: <CAMKF1sqrQ7y=UVUVgBt0nuYM=xTGofwSw2cuha91CN6rQg0TKQ@mail.gmail.com>
To: Andrey Belous <abelous@broadcom.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
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
X-List-Received-Date: Thu, 06 Mar 2014 22:44:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 4, 2014 at 1:55 PM, Andrey Belous <abelous@broadcom.com> wrote:
> Hi Phil,
> I have prebuild uclibc library that I would like to use, without that change I cannot force to use my prebuild library
>

OK so write a uclibc recipe for it and let it provide virtual/libc
and, we can very well have multiple version of recipes, this is no
different. Then use higher DEFAULT_PREFERENCE for your recipe.

> -Andrey
>
> -----Original Message-----
> From: Phil Blundell [mailto:pb@pbcl.net]
> Sent: Tuesday, March 04, 2014 4:43 PM
> To: Andrey Belous
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
>
> On Tue, 2014-03-04 at 15:40 -0500, Andrey Belous wrote:
>> -PREFERRED_PROVIDER_virtual/libc = "uclibc"
>> +PREFERRED_PROVIDER_virtual/libc ?= "uclibc"
>
> Why would you be including tclibc-uclibc.inc if you don't want to use
> uclibc?
>
> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

