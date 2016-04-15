Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCC0605BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 22:26:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y144so9410989wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=uqArB/e1la8AQ++G9IRNz2giJuqXRDbXWntwjgWj2UY=;
	b=npDuhU6ezIbRBMEuwtTQrnCl0xggoM0F+2BzivNQ/0Phq06P7a888sO9u4N4cxz8MZ
	UimdTgCK/TLlGqrxewcTtrfejsz9dsMFDxrgJboqtvc2axgt/hfjITxbMi6pBja+B7CM
	aLj/01vr6hkz12U3DjKP90/PPhrQtTw3vfDv8cVLEf9AfnPpAoFe+oFCUi3PpPKI1hZ1
	WWQqgkTT6E/Fp/+mqgIpmFWZV34ZJfkRJVhA5Cx84otDGPUq+JzIfGDrTOQ7F/VIRUg9
	W3hGibbuwxxkaKpjxGOcf3/7cRErrsQSCr5hgkAZ7Zxtf06alP/0vKBwcRt3N48Dg8Xz
	LxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=uqArB/e1la8AQ++G9IRNz2giJuqXRDbXWntwjgWj2UY=;
	b=IVxtJkkIYMpJdtTbtLLfBEZKpaqJ/RBPzCvPu1UAf114HqtmKniT0HFFWsH7U5wil0
	kmvq6+3kS/EsLkEmjN0MzNgUE9hkDt7EJo+i3MAO8fZiAwKJWyoY23kDWsG4YYfGT33H
	jF6iA+tJMCcCTTbFfzq/G/3GY8ThSo9Z25qa6VU3EBofoQyITT3l4oqxYFyAP6KjcIPH
	rwpqvnspLYnvjL1GcSKgLwM5PCBvr0G8UI5GJF3bzEtr2WR/+LS6uLs7pdGIZEJ5V2Br
	nNHDHL8asvwcPtPuF2I4zTY3rMMgcLgo+pzsjGZQSgSI+UTowwoB8aGSNLTqCngXqMB2
	xAVg==
X-Gm-Message-State: AOPr4FXzosiWVSihaqYOcgnl/DE7jEHVm7KI+Gt8XwMo0ySLHZ/QSaDaij03Wnds9Mx1orGC9OrTT13x8Ks/KA==
MIME-Version: 1.0
X-Received: by 10.194.57.168 with SMTP id j8mr23856103wjq.43.1460759200048;
	Fri, 15 Apr 2016 15:26:40 -0700 (PDT)
Received: by 10.194.235.3 with HTTP; Fri, 15 Apr 2016 15:26:39 -0700 (PDT)
In-Reply-To: <1460701188.9308.203.camel@linuxfoundation.org>
References: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
	<1459447989-25263-4-git-send-email-armccurdy@gmail.com>
	<1460701188.9308.203.camel@linuxfoundation.org>
Date: Fri, 15 Apr 2016 15:26:39 -0700
Message-ID: <CAJ86T=W9XXiv_Eca4h_WuR4yOGHER7DK4U7P9Au2Cyr7MNn2Rw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] base.bbclass: include PV in 'incompatible license but whitelisted' debug
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
X-List-Received-Date: Fri, 15 Apr 2016 22:26:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 14, 2016 at 11:19 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2016-03-31 at 11:13 -0700, Andre McCurdy wrote:
>> Referencing PN only is ambiguous if multiple versions of a recipe are
>> present.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/classes/base.bbclass | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index 67b3370..d91e059 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -537,7 +537,8 @@ python () {
>>                      raise bb.parse.SkipPackage("incompatible with
>> license %s" % license)
>>              elif pn in whitelist:
>>                  if pn in incompatwl:
>> -                    bb.note("INCLUDING " + pn + " as buildable
>> despite INCOMPATIBLE_LICENSE because it has been whitelisted")
>> +                    p = d.getVar('P', True)
>> +                    bb.note("INCLUDING " + p + " as buildable
>> despite INCOMPATIBLE_LICENSE because it has been whitelisted")
>>
>>      needsrcrev = False
>>      srcuri = d.getVar('SRC_URI', True)
>
> FWIW, looking into this has been on my todo list. I've now merged a
> patch and events generated from recipes during parsing are now
> automatically prefixed with the recipe filename (we might not know
> PN/PV at that point).
>
> Hopefully that means we can simplify some of these messages rather than
> meaning we have to ensure every one contains PN/PV.

Thanks. The bitbake change seems to work fine. It creates some very
long lines though, as expected.

I'll be away next week, but I'll look into simplifying some of the
messages when I get back (if no one beats me to it).

> Cheers,
>
> Richard

