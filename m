Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SaSom-00019t-VN
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 16:27:09 +0200
Received: by eaal1 with SMTP id l1so540604eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2012 07:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=QnCTsVrQkHC/7/dNASpUhYav3jj92skOJw5I3zzwAhY=;
	b=cEWr9hrFi7rGnbLQnFY86pU7tT0/rJojpX3GJbF6QR/aAXEbI1SW2wCAme5PL68GQq
	3PKYj+SOGlbDV69GRUbUUz4Jf1FjAsxThRtpaenjx4xlc21WmDqnbnr3NSaZCG0PJxpg
	nTXo1inejG1txCQzEsQmYrbvhnEqjso2szkaxxbiurftO6ztSHwO0f0oatFCc47mFQ3F
	VWvIiXiVbCs0NM2wcZ6MftOnk6B6yV2/HIn1+pSnpXql2pvTSGENZt5XFzjR8RqBNoLh
	vILm5Rd/CgP7jftBRuv7b4rYJqgnAT1x22faw5RQQrrV5UwYmhql0IGye6IFA7VtwOAn
	8zkQ==
Received: by 10.14.100.194 with SMTP id z42mr1763282eef.146.1338560207860;
	Fri, 01 Jun 2012 07:16:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Fri, 1 Jun 2012 07:16:17 -0700 (PDT)
In-Reply-To: <CAOHjBZtLxfsE6mMn3tQneJaTmAktGxbwGtsWqEbQ+vKJyLe_=g@mail.gmail.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
	<CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
	<CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
	<CAMKF1so8aA=s7wfo9k9wGNSwyuGYXmd5Ec9x=5Bp0YJbaiJoFA@mail.gmail.com>
	<CAOHjBZvZmXugpmxypMamZbm1LYdOqTAp4Z+1CBPn1DyohjO3Yw@mail.gmail.com>
	<4FC7818E.3030704@mlbassoc.com>
	<CAOHjBZsD06ABMP5VRRcmXd-8jiF7VDD=UJUrswPJyGDqObPV2Q@mail.gmail.com>
	<CAMKF1soREavpCfcGKqZM_hQwNVXydjzKg3qHRjTzJbP9Y-N5hg@mail.gmail.com>
	<CAOHjBZtLxfsE6mMn3tQneJaTmAktGxbwGtsWqEbQ+vKJyLe_=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jun 2012 07:16:17 -0700
Message-ID: <CAMKF1spJ68Dv414SL4c42ntSL_wBbUVrZRNNUJw29tvFh5HTRQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: target rpm build failure
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
X-List-Received-Date: Fri, 01 Jun 2012 14:27:09 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 1, 2012 at 7:07 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Many thanks Khem,
>
> I've applied your patches to my local repository.
> Unfortunately the uclibc setup I'm using doesn't provide support for mcheck,
> so I'm falling in the same error.

hmm strange. Are you using OE-Core provided uclibc or something else ?
I could compile rpm successfully after I used the patch
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=44ecbebf17d18471becaccd37733e6b0e806c80d

> However I have in mind also to build the glibc version of the whole image
> and so here I will haven't problem building rpm.
>
> But regarding glibc support I can see there is eglibc support and not glibc.
> I'm not deep informed about differencies, in oe-classis I had glibc and in
> oe-core it seems not supported.
> Please can you make light to this point?
> I need glibc also, how can I obtain it?

well there are no differences as far as ABI is concerned. eglibc has
additional bit to help cross building
and testing rest it is glibc only. You should be fine using eglibc
version provided by OE-Core and it should interoperate well
with glibc based system

>
> Best Regards,
> Giuseppe
>
> 2012/6/1 Khem Raj <raj.khem@gmail.com>
>>
>> On Thu, May 31, 2012 at 7:47 AM, Giuseppe Condorelli
>> <giuseppe.condorelli@gmail.com> wrote:
>> > Have new suggestions?
>>
>> I found a bit of time and fixed rpm compilation on uclibc. Its only
>> compiling though I don't know if it will run on target. Try it out.
>> The patch is here
>>
>>
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=3b7ab8bbaca0c7ce122e897a11370dd215b0eddd
>>
>> This should get you going. Please test it out and I would prefer if you
>> can
>> also try it out on target and see if it really runs too.
>>
>> -Khem
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


