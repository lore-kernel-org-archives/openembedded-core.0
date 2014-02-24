Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4312C617AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:26:17 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id f73so5335643yha.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=HaF6UvmavN7bDDejxQLOA8CGCVlTujn3xnPronW1Q5A=;
	b=JDSla/QInKNxXln8mmUlf4BQtJuGYyuBeOouBfl8sO2bBMPJMt8yje9kkcrf+NnnPK
	5UR085VMqTwbJUVLcXwWSaYmBQLXsSac92Cj24+Q0k1X8eUC2mrJMyrYX10X7L9qKs/9
	sa+6seDdO7H/iyA0WXrsm4MoAtuceWy53fCy7LZ7Y82cCjMK9e0jQG02A3CWUcXV2QC0
	DEn3B7Nb0CxLyDAnijg+fx4slw2SYPXv/1ydB5KgY7AnAr294CnDDFdMdKLLydbRewaI
	MpJuvzDR//IupvhHBYKzLruMQylH/3jCJYz8B17hGVT3r/jr6r393uMdb6QyZOVhmcqf
	ul1Q==
MIME-Version: 1.0
X-Received: by 10.236.16.83 with SMTP id g59mr9539612yhg.14.1393255578525;
	Mon, 24 Feb 2014 07:26:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Mon, 24 Feb 2014 07:26:18 -0800 (PST)
In-Reply-To: <CAOMwXhOC+2Sod+TgSA-pt+BF5gnSJVNSRA_FQ+zNTLH7=BZdow@mail.gmail.com>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
	<CAP9ODKq2krk5HaemVsDqGcNowbCwaQeGpHrxWxM0rqBo09z3gw@mail.gmail.com>
	<CAOMwXhOC+2Sod+TgSA-pt+BF5gnSJVNSRA_FQ+zNTLH7=BZdow@mail.gmail.com>
Date: Mon, 24 Feb 2014 12:26:18 -0300
X-Google-Sender-Auth: fMmK3sam7uzUn1Li0DpJXLvaS9A
Message-ID: <CAP9ODKrq4zmkgQaEq3u1+T78H9KFfBkQSb4dDm=DMdzoFVHO-g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: No versioning for existing images
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
X-List-Received-Date: Mon, 24 Feb 2014 15:26:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Laszlo,

On Mon, Feb 24, 2014 at 12:22 PM, Laszlo Papp <lpapp@kde.org> wrote:
> On Mon, Feb 24, 2014 at 3:12 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> Hello,
>>
>> On Mon, Feb 24, 2014 at 9:01 AM, Laszlo Papp <lpapp@kde.org> wrote:
>>> I was wondering why existing images would not have version numbers
>>> attached. Say, we have a core-image-minimal image, but from the
>>> recipe, it is not possible which image version it is.
>>>
>>> Perhaps, it is just my ignorance and lack of understand, but for the
>>> moment, it seems to be an important information for e.g. distribution
>>> vendors and image creators to have an image version and the
>>> corresponding packages and versions attached to that particular
>>> version.
>>>
>>> It is easier to do a software upgrade then if you wish to do that
>>> based on the information of a certain image variant. I mean, it will
>>> lead to more manageable and reproducable images.
>>>
>>> It is possible that I am not aware of something important, so please
>>> enlighten me. It would be nice to see how other OE users do a system
>>> upgrade.
>>>
>>> For instance, the MeeGo Nokia phone had a software version information
>>> in the settings, and that is something I would personally consider as
>>> the image version, but again, there might be better ways. Please share
>>> good practices in here., or alternatively, feel free to point me to
>>> any documentation, examples, etc.
>>
>> You can have a product-version recipe which populates it based on the
>> information you need (write it in a file in /etc and change PV as
>> need). That way you can even track this using buildhistory. We do it
>> for several products and it works quite well.
>>
>> All the need structure for it to work is avaiblue, just make the
>> recipes in your product layer.
>
> Is your layer available in the open for further study? If not, can you
> give a minimal example?
>
> I personally feel separate recipe for a version number a bit too much
> for this. I would prefer a variable for it, like "PRODUCT_VERSION" or
> so. I think, that would be gratifying.

Sorry but not public; I discribed what you need. I am sorry but I
don't have the bandwidth to make an example for you.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

