Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0B39E6FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 00:08:49 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id f2so70866993vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 16:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iIs8dfHJhFdDNykEPagV/3llaeY83LERx/izBztFA88=;
	b=AJhrVtF95lXRsBANiHrZHfKuu+G/jqfz7LjXIjeAH5+1DsbsWMfY6TLc6rU/PJ3tw8
	q5LCahibABGhp7A+Hyx/FbC8/WJdvMCgG9/8s3569iZMnu1MA8/COssrEb9EcDOZVn7Y
	x4Q+3JvNAXyUyGj2QAso96h0UNlbPdOQ2flaAfqti4nj1DFx1Kb56TT+Or/eT7J57Bvk
	rg3LKNWonJVuJDJ23bQcabGdGrRVxxbDYTDxxIuVZlX5zlKlWBr5lREIBE/jI3sbMYIb
	oOgTiHwjar75tSZJVXgg6OQRZ/8Kxex7ERZO9y56uhIK+lExcH7ZcMeWh2Kg/oPbecDX
	5iOg==
MIME-Version: 1.0
X-Received: by 10.31.174.142 with SMTP id x136mr14440572vke.11.1450742930096; 
	Mon, 21 Dec 2015 16:08:50 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Mon, 21 Dec 2015 16:08:50 -0800 (PST)
In-Reply-To: <5677E4E3.6010607@linux.intel.com>
References: <cover.1450471022.git.bruce.ashfield@windriver.com>
	<0aa694bda5500aef7d326fa880c77b726c8c2779.1450471022.git.bruce.ashfield@windriver.com>
	<CAP9ODKqJyZq29L7=mFzCVo2=oAX3O8WtyiJ498inW5d2fJrBBQ@mail.gmail.com>
	<CADkTA4OLTmiDHTwHec+Pnyhs_p-kLZp=yD2k4GOpc-LB-7sEUA@mail.gmail.com>
	<CAP9ODKoENbVi-ALn-2PWdW9pv1BfGbyejBQrf7md3bH3FnJFCQ@mail.gmail.com>
	<5677E4E3.6010607@linux.intel.com>
Date: Mon, 21 Dec 2015 19:08:50 -0500
Message-ID: <CADkTA4MCdk29-wANKfCziyquHuzmHEno1vmXoJaopuia-=QfyQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] lttng-modules: fix build issue against kernel 4.4
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
X-List-Received-Date: Tue, 22 Dec 2015 00:08:50 -0000
Content-Type: multipart/alternative; boundary=001a11438eb20248ca05277169a0

--001a11438eb20248ca05277169a0
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 21, 2015 at 6:39 AM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 12/21/2015 01:27 PM, Otavio Salvador wrote:
>
> Commit logs are suppose to have the information useful to understand
>> the reason of the change. Latest hides all behind it and does not
>> communicate anything. I don't think expect people to read the code to
>> know you bumped (and to which) revision is right.
>>
>
> Having the exact upstream commit id - a bunch of random numbers and
> letters - in the commit message does not make the commit message any more
> useful, readable, or searchable. You can't even click on that id to open a
> gitweb webpage with the upstream patch (having that kind of link *would* be
> useful though).
>
> The change to the recipe is short, and no one should be overwhelmed by
> looking at it if they need the commit id.
>


We are of like minds on those points. It is more important to say why a
change
was required, which is all that I look for in anything that I maintain.

That, and I'm always concerned that if someone contributes a patch that
fixes
a real problem, or is part of a larger feature, and all they get are
nit-pick comments
about more minor elements, it is a barrier to entry. Hence, why I'll also
just
fix commit messages on the way into my queues if they need a tweak.

But I digress. I'll see if this passes autobuilder sanity, and if there's a
chance,
I'll add a date to the log (but of course the commit also carries that
info).

Cheers,

Bruce


>
> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11438eb20248ca05277169a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Dec 21, 2015 at 6:39 AM, Alexander Kanavin <span dir=3D"ltr">&l=
t;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">al=
exander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On 12/21/2015 01:27 PM, Otavio Salvador wrot=
e:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Commit logs are suppose to have the information useful to understand<br>
the reason of the change. Latest hides all behind it and does not<br>
communicate anything. I don&#39;t think expect people to read the code to<b=
r>
know you bumped (and to which) revision is right.<br>
</blockquote>
<br></span>
Having the exact upstream commit id - a bunch of random numbers and letters=
 - in the commit message does not make the commit message any more useful, =
readable, or searchable. You can&#39;t even click on that id to open a gitw=
eb webpage with the upstream patch (having that kind of link *would* be use=
ful though).<br>
<br>
The change to the recipe is short, and no one should be overwhelmed by look=
ing at it if they need the commit id.<br></blockquote><div><br></div><div><=
br></div><div>We are of like minds on those points. It is more important to=
 say why a change</div><div>was required, which is all that I look for in a=
nything that I maintain.</div><div><br></div><div>That, and I&#39;m always =
concerned that if someone contributes a patch that fixes</div><div>a real p=
roblem, or is part of a larger feature, and all they get are nit-pick comme=
nts</div><div>about more minor elements, it is a barrier to entry. Hence, w=
hy I&#39;ll also just</div><div>fix commit messages on the way into my queu=
es if they need a tweak.</div><div><br></div><div>But I digress. I&#39;ll s=
ee if this passes autobuilder sanity, and if there&#39;s a chance,</div><di=
v>I&#39;ll add a date to the log (but of course the commit also carries tha=
t info).</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Alex<div class=3D"HOEnZb"><div class=3D"h5"><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11438eb20248ca05277169a0--
