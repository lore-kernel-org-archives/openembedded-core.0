Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 626BF6D3A7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 17:21:11 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id w10so20328879pde.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2013 09:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XjXsGGYG3Tgf/8RFA8wyrFlBFsgvoLKDBSs2s3RDSUM=;
	b=XafnapjEeKZAKzEqYoUz20juVeVO20rpGiAYbg4J25iq2pDbHSncyuTH6Hg+60P93P
	xxL5RBK66CX2f1BC4aMvQIJPs1KbVDji8brFerM1bmM3xpv4A2OLbY3d/Eqf+YRNudm9
	vXHFm0HVB/hG90hGPxu0Cm6/6QDvkxeq6SdaXAQheAciY3FsdjgqItI9jeLrLlOJ2KqH
	Xac77nPf87MP6ZaDwVz8JxczsRoylG2WIa5pVCTX0lHPdKgpVIH+S7/KQFEm3k8D+IT5
	g2NnoeGycDLPorl0oDDrnDorGIYwCdnrkfxckAtoz4mfPU/GFAdxJBvy2hUfdo7TqRbD
	w/bA==
MIME-Version: 1.0
X-Received: by 10.68.236.133 with SMTP id uu5mr12044658pbc.153.1386091270831; 
	Tue, 03 Dec 2013 09:21:10 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Tue, 3 Dec 2013 09:21:10 -0800 (PST)
In-Reply-To: <20131203165509.GC11291@mail.zedat.fu-berlin.de>
References: <20131203160858.GB11291@mail.zedat.fu-berlin.de>
	<529E0A3D.50809@balister.org>
	<20131203165509.GC11291@mail.zedat.fu-berlin.de>
Date: Tue, 3 Dec 2013 12:21:10 -0500
Message-ID: <CADkTA4MGqDjpeAHE4gVWVgSv51uauteHtUbcsErLCMOj3eBz2Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Status for "Sponsored by" git tags
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
X-List-Received-Date: Tue, 03 Dec 2013 17:21:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 3, 2013 at 11:55 AM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> On Tue, Dec 03, 2013 at 11:43:41AM -0500, Philip Balister wrote:
>> On 12/03/2013 11:08 AM, Henning Heinold wrote:
>> > Hi,
>> >
>> > how is the status about using "Sponsored by" git tags. Do we want something
>> > like that in openemebdded or not?
>>
>> What are SPonsored by tags?
>>
>> Philip
>>
>
> Hi Philip,
>
> Sponsored By tags are used by freebsd and some other projects to show which company
> sponsored the commit

Urk. Of the top of my head .. that just looks nasty. Signed-off-by:
already indicates
a company name, so going further than that is overkill IMHO.

Bruce
.
>
> For example
>
> https://github.com/freebsd/freebsd-head/commit/da88cadfb7e76ffa35440f16fef51a03935b7775
>
> Bye Henning
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

