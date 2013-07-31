Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1396A4AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 15:18:55 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id m1so1757162oag.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=AgRChnNDTeX+Y+U2jFdcUYh5VpVtjVwPLDdfJIh6FPQ=;
	b=pMqJ7empoDXFoB/VCLOvsxkaoyBVntsin9XbAxtFCmZ2Cv1J7MQgFncuoSFqEi5bhk
	gDn1ulYCnFyBU3NfOsQTkTceRG1GJRjXJTfLfsSfG+GY4VK6O1QdbWePiQX/freqrWKL
	kb3kU/X/PAroTDN585G0oE/wMq81HSSW6blsgMX8zxcRYyTNX9eAdL798ge+97LMfFOs
	e/9ngQ+3C9WEgErD+tOA8o/a26MolmnRgymXXTlrRE8uUQaUzNXXnNChA34jFfFCrQVA
	lk8oZvoGndl/LR8h1uc1elb5O6h1n0HntqG7hNLbwTTP22t9hLHwiPGwFu6wIAdT09kl
	kcBQ==
MIME-Version: 1.0
X-Received: by 10.60.145.241 with SMTP id sx17mr856527oeb.57.1375283935226;
	Wed, 31 Jul 2013 08:18:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 31 Jul 2013 08:18:55 -0700 (PDT)
In-Reply-To: <1375271223.8017.52.camel@phil-desktop.brightsign>
References: <1375233090-5072-1-git-send-email-otavio@ossystems.com.br>
	<1375271223.8017.52.camel@phil-desktop.brightsign>
Date: Wed, 31 Jul 2013 12:18:55 -0300
X-Google-Sender-Auth: kJuqAwkQ0xqPe2eDsUcqwQVyars
Message-ID: <CAP9ODKofjzCPQyVV55ykVfi93LHNFCSbCOTgSqyni=6afdbRXA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <pb@pbcl.net>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 31 Jul 2013 15:18:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 31, 2013 at 8:47 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-07-30 at 22:11 -0300, Otavio Salvador wrote:
>> +    l = d.createCopy()
>> +    l.finalize()
>
> Doesn't this mean you're now going to get the overrides applied twice?
> It seems as though making a copy here kind of defeats the point of
> calling finalize() in the first place.

I sent a v3 which fixes the issue.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

