Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA8F780F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:46:39 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id l13so30766012lfl.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=crsXPMYhKEDxzBwyd3X4YlBrXWPcnrAPkc7dyw8hXvs=;
	b=pkHZdsj6Ry5MOqD+mUuCv8HhrOHegfCylsgzmJR3GD2f5S6DEA3OHsXF0uhNx+Bl0f
	suUx5FSCgbZh+2JT0WGsE6YlQsp9jTlvxTudYDzkatJME3TlzvP6if61wEnw2LZB491x
	iDWS8A4tOAc8+ksRMsPra8v17EtJPJNd3iimdM6NA9axu+HXti7sBjEHbT4afNVp6RHX
	8VXXuWZRTwSy4YCAwGq00R/UWl7FDjnG6QQri8sywLrD2NCQR0ZCB0P2YxKSx7ix21Ek
	tgP0T54T6t5udwjvp5Ov30KEBos9MQhiNXt5Ax0FkEj1KgH0f/vGAoVQ2XVEbQPBFoSn
	ixkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=crsXPMYhKEDxzBwyd3X4YlBrXWPcnrAPkc7dyw8hXvs=;
	b=GeS/0J1GTvI6fkpSMHgnJyJx+Lb894mCv0T0cja7DJrXAqCT0VDYYOXaCZEE4vdLPc
	9rMTOwkqWEw2nkZP48SuyHPhMYKZQF2KdPSpBsF4/JLAQW0pN3vorPCW4SrxlMavIVd2
	7ByZsgCECza2D1CD7RtR9YiuBXgFl7UL824FHiEB6ZaDIFhXNclH5jXA1CoWHShabEbs
	bBkCe7VUbugWxCbxVNKgvySLY6CD5ND9FvSjdzZH8cqicFHe+/hKRCossO89bElib4QX
	FTx54FW55PuXdAC+F81mfwpYa/3qcbgNIOcyUCyla6NVrw3ii0zvUXiC0b/H0fs1oCXa
	Q5vw==
X-Gm-Message-State: AKS2vOzFehOJtD/OHdgNvDRM1w3bcVvqL1UenN4Op+0lRk2OZHN8rqii
	9PFt4zCgQ/rl4bI4LXv6aOhM73/Dqw==
X-Received: by 10.80.180.188 with SMTP id w57mr6194066edd.42.1498225600536;
	Fri, 23 Jun 2017 06:46:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Fri, 23 Jun 2017 06:46:10 -0700 (PDT)
In-Reply-To: <1498225221.24449.128.camel@linuxfoundation.org>
References: <a63a60dd-1000-0bf3-8fc1-5517b88e222d@free-electrons.com>
	<1498225221.24449.128.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jun 2017 06:46:10 -0700
Message-ID: <CAMKF1soMmyFoLUHyVpMPVYaQ+4avErAr7RqapArUzJrOE8wXcg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	=?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@free-electrons.com>,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ARC arch support: uClibc status ?
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
X-List-Received-Date: Fri, 23 Jun 2017 13:46:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 23, 2017 at 6:40 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Hi,
>
> On Fri, 2017-06-23 at 15:23 +0200, Mylene Josserand wrote:
>> We are currently adding to Yocto project the Synopsys ARC CPU
>> architecture, which is only available with uClibc library.
>>
>> We currently have a layer which adds the support of this
>> architecture
>> and uClibc support as it is, now, removed from OE-core.
>>
>> Many configurations/fixes are needed in OpenEmbedded-core's recipes
>> to
>> build successfully with this C library (library's dependencies,
>> autotools configuration, etc).
>>
>> We wanted to send patches to fix them but it seems that all uClibc's
>> references are now removed from OE-core, even in recipes:
>>
>> https://patchwork.openembedded.org/patch/140943/
>> https://patches.openembedded.org/patch/140906/
>>
>> What is the status of it? Remove entirely uClibc from OE-core?
>> Could you give us advice on how to handle uClibc?  Should we create
>> a
>> "meta-uclibc" layer which adds support of it + bbappend for all the
>> OE-core's recipes that currently fail because of uClibc's
>> misconfiguration?
>>
>> I guess that there is no plan to add uClibc's configuration in OE-
>> core's
>> recipes (even without uClibc itself), right?
>
> We dropped uclibc from OE-Core around a year ago in favour of musl
> since it seems to work for all the use cases we've been aware of from
> our users and nobody was willing to maintain it.
>
> Since then the uclibc overrides and other pieces in core have bitrotted
> to the point it was clear nobody was actively using or maintaining
> them. I therefore proposed some patches removing them, those were
> agreed by several developers and no objections were seen. We therefore
> cleaned up the remaining pieces.
>
> I believe that we have enhanced the extension mechanisms within the
> core such that a meta-uclibc layer would be possible now, even for the
> site files and insane.bbclass mappings and so on. It would need to add
> some of the extensions removed from the core and then it should be
> buildable again.
>
> If you can't make anything work from the layer let us know and we can
> try and figure out a way to solve that. I don't think the uclibc pieces
> would be coming back into OE-Core any time soon though as whilst it
> does have some niche markets left (e.g. arc), I can't see it being
> widely used by the majority of OE users/arches.
>
> (As an aside I haven't looked at it at all but does musl support arc?)
>

I dont see arc support in upstream musl, It could good if it was there
since that could unleash whole OE on arc architecture. We can do
successful world builds on musl much like glibc now a days.

> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

