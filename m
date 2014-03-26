Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id B76106B1FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 16:18:28 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id z6so2272070yhz.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=bCEn165/Sh+xRvJPva41YuSKPeWjW3jB2NToiZYnG0Y=;
	b=tRlxTmACZxu8kTkH0sDkvssGJOI48ECnfA8G8GCADkuHNTAUVW/gPBOCjlT9eX5KKq
	3gOrU8zvAd1g1RDVFN8z2s81Vxz/SRs/f6qess7Wuo7+z5IyyS+fZE9L2oH/MqPorJr4
	Kc6yZdz+OkYwv3e0NJZN8iEpEmkX0s58g2k+zfCy+B4ZuC5S70lGEz1kWZ0ybW4AEec1
	nfg3QIfuyMBULnjucR5+QrRejAUYHAhPlgrkACL23PNAz+wYrOdtJzVtxOPZ2R1iPxac
	bMSHvSLVsL1td2cuhb1JiKDW93+wViIuTTAXCTxlKMIzRpDtacyklo7lYpHWSbT/YE/P
	3qrw==
MIME-Version: 1.0
X-Received: by 10.236.129.227 with SMTP id h63mr2228837yhi.148.1395850708691; 
	Wed, 26 Mar 2014 09:18:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 26 Mar 2014 09:18:28 -0700 (PDT)
In-Reply-To: <20140326153524.GC3709@jama>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<20140326145102.GB3709@jama>
	<CAP9ODKqkyfGzQROW=QZig2zvh-KrcyRFeKn9FtPndPUXWNDTUw@mail.gmail.com>
	<20140326153524.GC3709@jama>
Date: Wed, 26 Mar 2014 13:18:28 -0300
X-Google-Sender-Auth: kgbl_i1X4erFMqoxF52SCmQ5Bbo
Message-ID: <CAP9ODKoLp2rHpQQx4C0jm9GoWiuvQy6tsGznPuwgq9Aswfq4MQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] Change all bluez4 references to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 16:18:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Martin,

On Wed, Mar 26, 2014 at 12:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Mar 26, 2014 at 12:07:13PM -0300, Otavio Salvador wrote:
>> On Wed, Mar 26, 2014 at 11:51 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Wed, Mar 26, 2014 at 09:27:54AM -0500, Lauren Post wrote:
>> >> This group of patches support the change of hardcoded bluez4 to
>> >> virtual/bluez so that the upgrade to bluez5 is easier.
>> >>
>> >> This group of patches must be applied together.  Bluez4 is still
>> >> default provider but it will be easier to override and provide bluez5
>> >> support in future.
>> >>
>> >> Note there is one related patch for openobex in meta-oe.
>> >
>> > virtual/* still doesn't work correctly in runtime variables, use
>> > VIRTUAL-RUNTIME_bluez variable.
>> ...
>>
>> Those patches are for /depends/. Did I miss any runtime dependency here?
>
> yes, in 11/11 4/11 2/11 and 1/11

Oh; I missed those indeed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

