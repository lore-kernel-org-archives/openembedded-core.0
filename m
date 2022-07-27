Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <fb3e160b-4c49-f08a-716d-1ed69ecb3c00@gmail.com>
Date: Wed, 27 Jul 2022 12:45:33 -0400
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic builtins
References: <20220727120036.633822-1-otavio@ossystems.com.br>
 <EC73E18E-0AA2-4655-8A53-EA278A198969@arm.com>
 <CAP9ODKpT6y0qvhryKm_NqTX82dmOytSU34yR_-8fG=WGZ06QNg@mail.gmail.com>
 <PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979@PA4PR08MB7411.eurprd08.prod.outlook.com>
 <CAP9ODKpo9=JeKvdEK+kX5_2gVWv4haSyU1jYgFLGcwPci8qMsQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKpo9=JeKvdEK+kX5_2gVWv4haSyU1jYgFLGcwPci8qMsQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Ross Burton <ross.burton@arm.com>
Cc: "Purdie, Richard" <richard.purdie@linuxfoundation.org>, "otavio@ossystems.com.br" <otavio@ossystems.com.br>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>



On 7/27/22 12:41 PM, Otavio Salvador wrote:
> 
> 
> Em qua., 27 de jul. de 2022 às 13:35, Ross Burton <ross.burton@arm.com 
> <mailto:ross.burton@arm.com>> escreveu:
> 
>     Whoever adds the patch needs to add their S-o-b.
> 
> 
> The patch sanity check should warn about it as it does for the status 
> header. I said, RP can add it.

RP can do, but he can only do so much :) lets try to help him.
Its not something that can be added during applying patch which could be 
done, this needs to change the libusb1 patch and then final patch 
regenerated, its better if it can be done by you and resend a v2.

> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br <http://www.ossystems.com.br> 
> http://code.ossystems.com.br <http://code.ossystems.com.br>
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
> 
> 
> 
> 
