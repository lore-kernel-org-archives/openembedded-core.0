Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 217D86011F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 21:17:46 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b14so143582243wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 13:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0zySUrXqjqsO5kCROvRfSXZd2BFomm/5kxA2xey+b1k=;
	b=hdz4j4z0OgxeMbK7kQMtliOBdrgP6Ny0C8Hf8qYTRP8KSQ84ApIJMzUPvNFaiCNR7g
	XD0YmLjcpgN4p/h+TAVuU23Eqe5K1he1HipCjCONJ09oZ2i8Zz252ADBCermmUK9pVWe
	4oif4lZx+QYcghxNj5SAFvxIulyzksMYv+/ChS4OuzRDFlG5af0WsFDzt9xWYMfiD9sc
	omaW5zJCKoNH0llKm2Qz9tvINc51E5fzFb+cKuBYPwazNct+pW2cajCOart7CTSTshon
	FsyA0uFr6z4ax9myx12S6wbvutNTiUT4W6w3dLIsG/i2t69+23Yqwpkh5Af/SwOl/0VZ
	kPtA==
MIME-Version: 1.0
X-Received: by 10.28.195.138 with SMTP id t132mr18409482wmf.61.1452201467086; 
	Thu, 07 Jan 2016 13:17:47 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 7 Jan 2016 13:17:47 -0800 (PST)
In-Reply-To: <20160107210943.GH2512@jama>
References: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
	<1452199993-3885-2-git-send-email-armccurdy@gmail.com>
	<20160107210943.GH2512@jama>
Date: Thu, 7 Jan 2016 13:17:47 -0800
Message-ID: <CAJ86T=V71XZfoY54VgBJP2=Ec6ycpi2YSF6FcR6tTuow4eBaVg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] qemu.bbclass: duplicate armv7a over-ride for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 21:17:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 7, 2016 at 1:09 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jan 07, 2016 at 12:53:10PM -0800, Andre McCurdy wrote:
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/classes/qemu.bbclass | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
>> index 315c17f..4ec7657 100644
>> --- a/meta/classes/qemu.bbclass
>> +++ b/meta/classes/qemu.bbclass
>> @@ -43,6 +43,7 @@ QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
>>  QEMU_EXTRAOPTIONS_iwmmxt    = " -cpu pxa270-c5"
>>  QEMU_EXTRAOPTIONS_armv6     = " -cpu arm1136"
>>  QEMU_EXTRAOPTIONS_armv7a    = " -cpu cortex-a8"
>> +QEMU_EXTRAOPTIONS_armv7ve   = " -cpu cortex-a8"
>
> would it make sense to use cortex-a15 here? It's supported at least in qemu-2.5.0

Yes, I think you're right. If qemu configured for cortex-a8 is going
to barf on armv7ve integer division instructions then we should enable
an armv7ve cpu such as cortex-a15.

To avoid unnecessary diversity, should we then also use cortex-a15 for armv7a ?

>>  QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
>>  QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
>>  QEMU_EXTRAOPTIONS_ppce5500 = " -cpu e5500"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

