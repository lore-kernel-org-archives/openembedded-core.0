Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 89CF071B27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 20:36:06 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 142so12945139wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 13:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=YmKQqfCBjFzbj3qnYmWjH+AFbWljxiVeZ5jiG+gA2m0=;
	b=uNrJX+6I/MDZIbjkLRz1IwfCOwsOMHw4ZvlVq6/0NiwNMcg+4hFrQa9FUnBSIeXfzL
	PK4tE26KnrwBd+e+9eNtT7TaDdmX+ZNRaxVE4N21i4Wc3IBUDPhakYCAz3mE+Wxr0V9x
	gwEJvD5Ax22zxykoL8Jn5t7B+wdGnm49+bp32lp2bxNB+HdmLgQHQcSD0Q0fQsX42ZE6
	DsIxOYe9GQlhhdTmn7fMINhgnJPvO2xgNnboRjDQNttYoOwFxKiBLwWIG7Jy342kwxJP
	4MbDjh08RIQmgdoFnWd6CtFd9tAh0E58yV0sTsZSuonc64MgwRerEt5V2UgyrLStRRCR
	yafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=YmKQqfCBjFzbj3qnYmWjH+AFbWljxiVeZ5jiG+gA2m0=;
	b=A8GmO4ts+mr35NUpO9FJG5mF8tlVl9TBmrZwyaDS7aMu2/kHSfDzlT78P7C2IfWe1l
	qw0A+M4zh1z8ugtsyQJHWCbvD1TuubT8DywYjQ1/xg9VEol/ZVVoLswl7t6/WjGZyeuD
	PkKXhENkm9hRw2eepzvHTlaFeaZC6BscJviCZYIYhC1cy+KtaH4dDGbz/CSdlxCA1umw
	7Q8OnUoUTqXR3S+p0lvtmWXnF5/1vCO+kgm4yEU07ydKerdZfa5YccnWkmWvYrflmwHP
	QfRuKpMbReQTYySw4OK4U5w/dZvYYMy9alWAtz1cOPLMfLGWshmLDu9WYej40+xAGJhI
	GlpQ==
X-Gm-Message-State: AODbwcDDBoDQmmDK/vYTdbABgVK0bVe19x4F4BUymujYEWYErXWLsIfo
	ugD7SKH2L9nDd+aTUGI8jb1BybZZwQ==
X-Received: by 10.80.134.208 with SMTP id 16mr5649549edu.67.1494448567226;
	Wed, 10 May 2017 13:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
	<6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
	<811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
	<abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
In-Reply-To: <abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 May 2017 20:35:55 +0000
Message-ID: <CAMKF1sqvc3YsrMNxkyv1ZHXF82Uy1hYRUL4sduaayYcf1Le5_g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Wed, 10 May 2017 20:36:06 -0000
Content-Type: multipart/alternative; boundary=f403045c1898fc17d5054f316b4b

--f403045c1898fc17d5054f316b4b
Content-Type: text/plain; charset=UTF-8

On Wed, May 10, 2017 at 12:34 PM Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 05/10/2017 09:56 PM, Gary Thomas wrote:
> > Why not do this in a "softer" way - make the new 1.1 package have the
> > obscured name (and not be preferred by default)?  That way existing
> > uses of the older 1.0 package can continue but users can migrate to
> > 1.1 as they see fit?
>
> I have an answer which you might not particularly like. But here goes:
>
> What will actually happen is that no one will do anything to port their
> stuff until it's time to remove 1.0 because upstream has EOLd it. And
> then there'll still be complaints that more time is needed for the
> transition. I'd like to gently push people to plan this transition
> already now - and it's as gentle as it can be: if you pull from master
> and your things no longer build, make one simple change and they will.
> It's part and parcel of being on the bleeding edge, or rebasing to the
> new yocto release: not everything works exactly as before, and most
> components are newer and different and not always fully compatible.



It is a cross distro item really we should find out what other Linux
distributions are doing about it moving forward unless major distros also
have same policy there won't be much momentum this would gain among the
packages ecosystems this could also help in sharing the porting burden

>
>
> The other reason is that it's more work for me: I would have to update
> everything in oe-core to use the new recipe, instead of fixing just a
> few recipes that need to stay with 1.0. And then again the same thing
> will happen when 1.2 is out.
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c1898fc17d5054f316b4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Wed, May 10, 2017 at 12:34 PM A=
lexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">a=
lexander.kanavin@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 05/10/2017 09:56 PM, Gary Thomas wrote:<br>
&gt; Why not do this in a &quot;softer&quot; way - make the new 1.1 package=
 have the<br>
&gt; obscured name (and not be preferred by default)?=C2=A0 That way existi=
ng<br>
&gt; uses of the older 1.0 package can continue but users can migrate to<br=
>
&gt; 1.1 as they see fit?<br>
<br>
I have an answer which you might not particularly like. But here goes:<br>
<br>
What will actually happen is that no one will do anything to port their<br>
stuff until it&#39;s time to remove 1.0 because upstream has EOLd it. And<b=
r>
then there&#39;ll still be complaints that more time is needed for the<br>
transition. I&#39;d like to gently push people to plan this transition<br>
already now - and it&#39;s as gentle as it can be: if you pull from master<=
br>
and your things no longer build, make one simple change and they will.<br>
It&#39;s part and parcel of being on the bleeding edge, or rebasing to the<=
br>
new yocto release: not everything works exactly as before, and most<br>
components are newer and different and not always fully compatible.</blockq=
uote><div><br></div><div><br></div><div>It is a cross distro item really we=
 should find out what other Linux distributions are doing about it moving f=
orward unless major distros also have same policy there won&#39;t be much m=
omentum this would gain among the packages ecosystems this could also help =
in sharing the porting burden=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br=
>
<br>
The other reason is that it&#39;s more work for me: I would have to update<=
br>
everything in oe-core to use the new recipe, instead of fixing just a<br>
few recipes that need to stay with 1.0. And then again the same thing<br>
will happen when 1.2 is out.<br>
<br>
Alex<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--f403045c1898fc17d5054f316b4b--
