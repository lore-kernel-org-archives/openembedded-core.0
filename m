Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QCEqQ-0000dF-NE
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Apr 2011 19:36:10 +0200
Received: by fxm19 with SMTP id 19so4110147fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2011 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=3LDlHQ+gAi1p15UymEz2sgJhBdccVex7orDadWsynEg=;
	b=J5DZ7zqBJ1WlhdUPHZ8PmmOmlooU1c3WKLHqZYCwhISI4OrasqirgOP/Z8F+0PF//U
	9zYn9lTv5VDyoHaclvVNZ0OIAbDPbWJ6HmKIE6N92sPuwF6cIu4nLv9HVFTfkZ74IP3r
	PEmdBCDn8gA/MGN1E3Eo7/uLPpLd+960kTsJs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=FAF2tQexuDzy3HXMPknv5XyQA5WhNxmk1a7IVGWoacv1Qg6mZqnNGjcbinec+0LQUF
	pajgA8w3QNhCdMj8hrDdG9zVftrtVMqN28XqZie6FZe4KcH4zVMr/5FdyE312ZUqqqCT
	PJVYJoOKpJYnUi5OnesVxRDrFS16nibWAHK6I=
Received: by 10.223.79.79 with SMTP id o15mr1124420fak.16.1303234427156; Tue,
	19 Apr 2011 10:33:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.115.82 with HTTP; Tue, 19 Apr 2011 10:33:16 -0700 (PDT)
In-Reply-To: <1303225305.5518.219.camel@rex>
References: <BANLkTini7EDvr-GoW1AP3aaQWjv6tYjOLQ@mail.gmail.com>
	<1303225305.5518.219.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Apr 2011 10:33:16 -0700
Message-ID: <BANLkTi=shye_RULY2_AZuz9Kca8+N_qNxQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc 4.6 recipes naming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2011 17:36:10 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 19, 2011 at 8:01 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Hi Khem,
>
> On Mon, 2011-04-18 at 12:18 -0700, Khem Raj wrote:
>> I have gcc 4.6 under progress here. As we know the current release is
>> 4.6.0. I have been calling the recipes
>> to omit the minor release number so the recipes are called
>> <recipes>_4.6.bb based on my experiences
>> with gcc releases over the years.
>>
>> Since the minor releases are bug fix releases and when next bug fix
>> release happens the total diff
>> of changes from 4.6.0 to 4.6.1 are also released as a single diff
>> which can be applied on top of existing
>> 4.6.0 tar file to reach 4.6.1
>>
>> This makes the upgrade easier for minor releases. I decided not to
>> track the release branch since
>> that complicates the gcc download as in classic oe
>>
>> So for upgrades we can either just take the diff from 4.6.0 to 4.6.1
>> and apply on top of 4.6.0 or
>> decide to use the new 4.6.1 tar both would be ok as we decide that later.
>
> I think this is just going to confuse people to be honest. I'm happy to
> stick to the 4.6.0 naming, then move to 4.6.1 and so forth over time.
> People expect to see the .X number else they just get confused about
> which patch revision we're at.
>
> What I'm thinking we will do differently to OE is not to have every
> point release available but try and stick to the latest. The exception
> would be when there is a problem in the point release version which we
> don't have a fix for.

usually later minor release will always be better (since they are bugfixes only)
so chances are less that we will regress

>
> Does that sound reasonable?
>

Yes having just one minor release at a time makes it easier certainly.
I was trying to make it easy to push updates and we could avoid some
git operations and logs would be straighter too since recipes would live
longer otherwise we will be git mv'ing them every 6 months when release happens.

If we need to reflect the minor number we could use PR fields too just a thought

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


