Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tarek.elsherbiny@gmail.com>) id 1TEc3x-0004fK-Qo
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 10:24:46 +0200
Received: by qcad10 with SMTP id d10so1602394qca.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2012 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=afr4iCib5RGGYYXH3EW4Edpeybimavc2OJPRr5p2L7s=;
	b=AsPCUuexFwjvhZfPDQxykSwFCxmdKawCO6Av+uGu23kKXi93MHj8i78PMcCJcg3iIo
	LIiWqSb0N+pMFjUZtxhRTA+3ZfIHFwBZZpQIvKtZU843WRg/ZRkB+9SGg5yILbCjc9ml
	I/Pvr1Bvc0gT9bDnCWmEdHxZysXWzvQjciPKfYsplbNFc2MTMFECGGiiHOiqtx9P95pe
	i7PNY5yDHZWpWLRXnnzW8+vjHzNtlp9KyWJ9Ek3oASqxBER3PqeFMSlMEUEYfMQ68Q/g
	fGpH+riI5yZs6kedC9e9ckkc2wXNzADPKmk/LJGueznN4wV8cIfworPlqiFVO/tg08NQ
	4GtA==
MIME-Version: 1.0
Received: by 10.224.138.143 with SMTP id a15mr2954994qau.64.1348128723154;
	Thu, 20 Sep 2012 01:12:03 -0700 (PDT)
Received: by 10.224.174.19 with HTTP; Thu, 20 Sep 2012 01:12:03 -0700 (PDT)
In-Reply-To: <177B8C55-470B-4E98-B51E-ED11F2F3B091@familyhonor.net>
References: <CAB3sqtaZSMuxaFkeaXtAuFAwcE2=JuXJTE56J-F-=pKvZddpjg@mail.gmail.com>
	<CAMKF1sr8_PN8p0H+35JqUAyKyDLFTij4etP47VEb613pOi11Tw@mail.gmail.com>
	<CAB3sqtb1fBxg0u=1RWL5m5aY1LLeBZwRe-Qb5eVf+R=UjjYBHg@mail.gmail.com>
	<177B8C55-470B-4E98-B51E-ED11F2F3B091@familyhonor.net>
Date: Thu, 20 Sep 2012 09:12:03 +0100
Message-ID: <CAB3sqtamNO=LnfNVwwQA09LUD36c5MjkMvQi5uUOGgqA1VobCw@mail.gmail.com>
From: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
To: Brian Lloyd <blloyd@familyhonor.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: SVN checkout ERROR: Function failed: Fetcher failure for URL:
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 08:24:46 -0000
Content-Type: multipart/alternative; boundary=20cf3074d77ca7b84b04ca1dadf3

--20cf3074d77ca7b84b04ca1dadf3
Content-Type: text/plain; charset=ISO-8859-1

svn.local.repo has address 192.168.113.20
this is our local svn repository.


On Wed, Sep 19, 2012 at 6:59 PM, Brian Lloyd <blloyd@familyhonor.net> wrote:

> This may be a dumb question, but what does svn.local.repo resolve to?
>
> Brian A Lloyd
>
> On Sep 19, 2012, at 12:54 PM, Tarek El-Sherbiny <
> tarek.elsherbiny@gmail.com> wrote:
>
> I've tried with both protocol=http and without the argument at all. Still
> not fetching!
>
> On Wed, Sep 19, 2012 at 6:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wed, Sep 19, 2012 at 9:48 AM, Tarek El-Sherbiny
>> <tarek.elsherbiny@gmail.com> wrote:
>> >
>> > I would like to check out from our local SVN repository. This is the URI
>> > line I'm using in the recipe:
>> >
>> >  SRC_URI =
>> >
>> "svn://svn.local.repo/svn/dev_repos/Generation3_app;module=trunk;proto=http"
>>
>> use protocol=http above and make sure that your server exports over
>> http otherwise drop the argument
>>
>> >
>> > When I try the same command bitbake is using on the command line it
>> works
>> > fine. But bitbake is not fetching the package.
>> >
>> > Is there a special parameter that I need to modify for SVN to work?
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--20cf3074d77ca7b84b04ca1dadf3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

svn.local.repo=A0has address 192.168.113.20<div>this is our local svn=A0rep=
ository.</div><div><br></div><div><br><div class=3D"gmail_quote">On Wed, Se=
p 19, 2012 at 6:59 PM, Brian Lloyd <span dir=3D"ltr">&lt;<a href=3D"mailto:=
blloyd@familyhonor.net" target=3D"_blank">blloyd@familyhonor.net</a>&gt;</s=
pan> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF"><div>This may be a =
dumb question, but what does svn.local.repo resolve to?<br><br>Brian A Lloy=
d</div>
<div><div class=3D"h5"><div><br>On Sep 19, 2012, at 12:54 PM, Tarek El-Sher=
biny &lt;<a href=3D"mailto:tarek.elsherbiny@gmail.com" target=3D"_blank">ta=
rek.elsherbiny@gmail.com</a>&gt; wrote:<br><br></div><div></div><blockquote=
 type=3D"cite">
<div>I&#39;ve tried with both protocol=3Dhttp and without the argument at a=
ll. Still not fetching!<br><br><div class=3D"gmail_quote">On Wed, Sep 19, 2=
012 at 6:41 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On Wed, Sep 19, 2012 at 9:48 AM, Tarek =
El-Sherbiny<br>
&lt;<a href=3D"mailto:tarek.elsherbiny@gmail.com" target=3D"_blank">tarek.e=
lsherbiny@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I would like to check out from our local SVN repository. This is the U=
RI<br>
&gt; line I&#39;m using in the recipe:<br>
&gt;<br>
&gt; =A0SRC_URI =3D<br>
&gt; &quot;svn://svn.local.repo/svn/dev_repos/Generation3_app;module=3Dtrun=
k;proto=3Dhttp&quot;<br>
<br>
</div>use protocol=3Dhttp above and make sure that your server exports over=
<br>
http otherwise drop the argument<br>
<div><div><br>
&gt;<br>
&gt; When I try the same command bitbake is using on the command line it wo=
rks<br>
&gt; fine. But bitbake is not fetching the package.<br>
&gt;<br>
&gt; Is there a special parameter that I need to modify for SVN to work?<br=
>
</div></div></blockquote></div><br>
</div></blockquote></div></div><blockquote type=3D"cite"><div><span>_______=
________________________________________</span><br><span>Openembedded-core =
mailing list</span><br><span><a href=3D"mailto:Openembedded-core@lists.open=
embedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a=
></span><br>
<span><a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openem=
bedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/l=
istinfo/openembedded-core</a></span><br></div></blockquote></div></blockquo=
te>
</div><br></div>

--20cf3074d77ca7b84b04ca1dadf3--
