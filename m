Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SDfpx-0008VB-RQ
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 19:42:09 +0200
Received: by wgbdr12 with SMTP id dr12so720453wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 10:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=EyiH6Oqrpf0Y0t2wwidIviswodVTdtjsksyIJmHjYhw=;
	b=bf5fWnNzYuugAFqc0bHwtjIfxqrVeg6vRT0Mpweyo7wRzmanuMQx+/ReSE+veKDxg4
	szsULHq3YQ5U2RUIMS5BU3phGz00LwdiWQkWLseOLahSHnIm0PUJGky/zLyZHGZYBhx2
	h0TjqidRNRzt6ZWlVMNrUYqHOOg5RkIKFYQbTJuQY3LEZhO3i1KGcsr+Nl73VGWmtRzz
	OmumFRIBo+GeOftXjh5wMRIJoL22YgxOD6qOOy89qgSgvs0dbDDwSLgP/MGDRxAKnSeT
	Z8ULUvsNxQsdie/YvdEDgEr/LEit8HNqFSCk1Byo662gBdAHdyiYTRUmquGwmVy7llqF
	TL/A==
MIME-Version: 1.0
Received: by 10.180.102.129 with SMTP id fo1mr214379wib.6.1333128785105; Fri,
	30 Mar 2012 10:33:05 -0700 (PDT)
Received: by 10.216.38.135 with HTTP; Fri, 30 Mar 2012 10:33:05 -0700 (PDT)
In-Reply-To: <20120330181752.080630b5@eb-e6520>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<20120330105006.00955b5d@eb-e6520> <1333120364.18082.77.camel@ted>
	<20120330172440.54592fce@eb-e6520> <1333123344.18082.94.camel@ted>
	<20120330181752.080630b5@eb-e6520>
Date: Fri, 30 Mar 2012 13:33:05 -0400
Message-ID: <CADkTA4MULo7zgZH9MoDJyzvPvkebBT_pmP-C1==pprTZ0YirVw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 17:42:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 12:17 PM, Eric B=E9nard <eric@eukrea.com> wrote:
> Le Fri, 30 Mar 2012 17:02:24 +0100,
> Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :
>> The linux-yocto kernel recipe heavily uses the SCM to do things so
>> whilst it does have a higher download cost, it as adds value and is
>> ultimately a maintainers choice too.
>>
> OK now that I've given a closer look at the linux-yocto recipes &
> bbclass I understand better why you need it in that recipe and that
> this recipe is heavily based on git's features.

There are alternatives that I'm going to be exploring going forward,
just nothing
that we can bring in during the stabilization cycle. The recipes manipulate=
 git
and use it to construct what you build, they don't absolutely require a ful=
l
git history, so there are some potential savings to be had.

It just obviously limits flexibility if a derived recipe wants to merge bra=
nches
and histories to construct what is built. So having a simple/shallow histor=
y for
basic builds while not breaking more complex cases probably hits the sweet
spot.

Cheers,

Bruce

>
>> So whilst I hear what you're saying, I don't think we can change
>> anything other than the PREMIRROR...
>>
> then maybe for the new users testing OE, having PREMIRRORs set in the
> default configuration would be a great thing so that they don't believe
> OE is a big slow beast just because they have to wait hours for git or
> svn to fetch sources.
>
> Eric
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


