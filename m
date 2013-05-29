Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 31E4760811
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 22:57:00 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id 16so2179692obc.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Gr2iZHCNDzOXjCR+CUzHphGoiwjvfGFMQtUSzcuaABM=;
	b=c0eSSNmDSmnIPqYVWM+++ACoS+Qt5/WQJWsq1FJlNc765/TBw/z898DIajnoqVZ0Ay
	3vDlxwahWkH9k7rFTTZoVF0ocdKxfMXCgN3mFVHo2ctu9SRhRnvmPr+Si/HfnrkkrLXK
	VDk6UGttnv5jd0dGjg9VpHBns4JO1BolFvMFQ2znZhqI+sX0xz3CCAynF+2frVmSqf9c
	RNxTJkfsRwOa7WnO1j6FOBiwf+T4XdEmJ9ts6XDR29e3SVTdUt9wprWqawh9tJ4BUDGN
	7rJTUZyC67M0JfSkTNMClTaxEbvFiRzuF+khCm70d4zm7O55JAKy3StgIfaStPBwTg3d
	fFCQ==
MIME-Version: 1.0
X-Received: by 10.182.39.226 with SMTP id s2mr2991286obk.46.1369868220657;
	Wed, 29 May 2013 15:57:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Wed, 29 May 2013 15:57:00 -0700 (PDT)
In-Reply-To: <51A67348.9020709@windriver.com>
References: <1369835496-20815-1-git-send-email-mark.hatle@windriver.com>
	<20130529143740.GL3192@jama> <1369838840.14887.220.camel@ted>
	<CAP9ODKp1Tu3HXXz-4qOBQa1oY_r338keLFvvP6rZRf+aTyHtxQ@mail.gmail.com>
	<1369862668.14887.236.camel@ted> <51A67348.9020709@windriver.com>
Date: Wed, 29 May 2013 19:57:00 -0300
X-Google-Sender-Auth: ytWUqwNFfI7c-uRh5dbt7so-IVQ
Message-ID: <CAP9ODKrxz0FF=nvkRViPcWMy89LioH80b2jf8L6dGLC56wReAQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Wed, 29 May 2013 22:57:01 -0000
Content-Type: multipart/alternative; boundary=001a11c2faecaece9404dde34cf9

--001a11c2faecaece9404dde34cf9
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 29, 2013 at 6:29 PM, Mark Hatle <mark.hatle@windriver.com>wrote:

> On 5/29/13 4:24 PM, Richard Purdie wrote:
>
>> On Wed, 2013-05-29 at 14:00 -0300, Otavio Salvador wrote:
>>
>>> On Wed, May 29, 2013 at 11:47 AM, Richard Purdie
>>> <richard.purdie@**linuxfoundation.org<richard.purdie@linuxfoundation.org>>
>>> wrote:
>>>          On Wed, 2013-05-29 at 16:37 +0200, Martin Jansa wrote:
>>>          > On Wed, May 29, 2013 at 08:51:36AM -0500, Mark Hatle wrote:
>>>          > > Background:
>>>          > >
>>>          > > At the recent TSC meeting we were discussing ways of
>>>          removing the PRINC
>>>          > > in favor of the PR server, which should now be standard.
>>>           The first step
>>>          > > in this process is coming up with a simple patch that
>>>          declared PRINC as
>>>          > > deprecated.  If this type of patch is successful, the
>>>          block of code could
>>>          > > be replaced with a bb.error eventually.
>>>          > >
>>>          > > It is not expected that this patch will go in by itself,
>>>          but instead
>>>          > > should be coordinated with changes to the recipes in
>>>          common layers such
>>>          > > as openembedded-core, meta-openembedded/meta-* and other
>>>          community layers.
>>>          >
>>>          > This doesn't say what's the process of getting all PR
>>>          increments
>>>          > applied.
>>>          >
>>>          > Should we send list of recipes and required PR increments
>>>          per layer (and
>>>          > someone will sum these increments and create actual PR bump
>>>          from it). Or
>>>          > will we take turns and send actual PR bump patches per layer
>>>          and someone
>>>          > will define order of layers to go in (so that we prevent
>>>          many conflicts
>>>          > while merging)?
>>>
>>>
>>>          This is something we need to figure out. The realistic process
>>>          is
>>>          probably do this layer by layer. If we can batch some up
>>>          together that
>>>          would obviously be better...
>>>
>>
>>  If this is the case, to ensure we have the PR in sync we should have
>>> it PRINC as a bb.error; this will cause some pain but will avoid
>>> PRServer picking the layer PRINC and losing it in next build. Or does
>>> PRServer handle this gracefully?
>>>
>>
>> I proposed this but other TSC members didn't like the approach and would
>> prefer a grace/warning period, maybe spanning until after the next
>> release.
>>
>> I can see the arguments both ways...
>>
>
> I prefer the warning for one release approach.  What I'm afraid will
> happen is oe-core is released in the Fall, and a group of users migrates to
> it from the last release and suddenly all of their layers break.  These are
> the people who do not keep up with day to day development.
>
> With the warning, they won't be immediately blocked -- but will be
> sufficiently annoyed (and warned) that they need to fix something or it
> will break.


The problem is the following:

OE-Core adds warning;
Layer1 submit the PR bump request and drop the internal PRINC
Layer1 gets PRINC removal commited
User1 updates Layer1 (and OE-Core didn't yet apply the PR bump)

PR goes backwards.

Now the inverse:

OE-Core adds warning;
Layer1 submit the PR bump request and drop the internal PRINC
OE-Core commits PR bump
User1 updates Layer1 (and OE-Core didn't yet apply the PR bump)

PR goes forward as PRINC didn't yet been removed so when Layer1 is updated
again, it will go backwards

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c2faecaece9404dde34cf9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, May 29, 2013 at 6:29 PM, Mark Hatle <span dir=3D"ltr">&lt;<=
a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@win=
driver.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D""><div class=3D"h5">On 5/29/13 4:24 PM, Rich=
ard Purdie wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
On Wed, 2013-05-29 at 14:00 -0300, Otavio Salvador wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
On Wed, May 29, 2013 at 11:47 AM, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@<u></u>linuxfoundation.org</a>&gt; wrote:<br>
=A0 =A0 =A0 =A0 =A0On Wed, 2013-05-29 at 16:37 +0200, Martin Jansa wrote:<b=
r>
=A0 =A0 =A0 =A0 =A0&gt; On Wed, May 29, 2013 at 08:51:36AM -0500, Mark Hatl=
e wrote:<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt; Background:<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt;<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt; At the recent TSC meeting we were discussing w=
ays of<br>
=A0 =A0 =A0 =A0 =A0removing the PRINC<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt; in favor of the PR server, which should now be=
 standard.<br>
=A0 =A0 =A0 =A0 =A0 The first step<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt; in this process is coming up with a simple pat=
ch that<br>
=A0 =A0 =A0 =A0 =A0declared PRINC as<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt; deprecated. =A0If this type of patch is succes=
sful, the<br>
=A0 =A0 =A0 =A0 =A0block of code could<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt; be replaced with a bb.error eventually.<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt;<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt; It is not expected that this patch will go in =
by itself,<br>
=A0 =A0 =A0 =A0 =A0but instead<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt; should be coordinated with changes to the reci=
pes in<br>
=A0 =A0 =A0 =A0 =A0common layers such<br>
=A0 =A0 =A0 =A0 =A0&gt; &gt; as openembedded-core, meta-openembedded/meta-*=
 and other<br>
=A0 =A0 =A0 =A0 =A0community layers.<br>
=A0 =A0 =A0 =A0 =A0&gt;<br>
=A0 =A0 =A0 =A0 =A0&gt; This doesn&#39;t say what&#39;s the process of gett=
ing all PR<br>
=A0 =A0 =A0 =A0 =A0increments<br>
=A0 =A0 =A0 =A0 =A0&gt; applied.<br>
=A0 =A0 =A0 =A0 =A0&gt;<br>
=A0 =A0 =A0 =A0 =A0&gt; Should we send list of recipes and required PR incr=
ements<br>
=A0 =A0 =A0 =A0 =A0per layer (and<br>
=A0 =A0 =A0 =A0 =A0&gt; someone will sum these increments and create actual=
 PR bump<br>
=A0 =A0 =A0 =A0 =A0from it). Or<br>
=A0 =A0 =A0 =A0 =A0&gt; will we take turns and send actual PR bump patches =
per layer<br>
=A0 =A0 =A0 =A0 =A0and someone<br>
=A0 =A0 =A0 =A0 =A0&gt; will define order of layers to go in (so that we pr=
event<br>
=A0 =A0 =A0 =A0 =A0many conflicts<br>
=A0 =A0 =A0 =A0 =A0&gt; while merging)?<br>
<br>
<br>
=A0 =A0 =A0 =A0 =A0This is something we need to figure out. The realistic p=
rocess<br>
=A0 =A0 =A0 =A0 =A0is<br>
=A0 =A0 =A0 =A0 =A0probably do this layer by layer. If we can batch some up=
<br>
=A0 =A0 =A0 =A0 =A0together that<br>
=A0 =A0 =A0 =A0 =A0would obviously be better...<br>
</blockquote>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
If this is the case, to ensure we have the PR in sync we should have<br>
it PRINC as a bb.error; this will cause some pain but will avoid<br>
PRServer picking the layer PRINC and losing it in next build. Or does<br>
PRServer handle this gracefully?<br>
</blockquote>
<br>
I proposed this but other TSC members didn&#39;t like the approach and woul=
d<br>
prefer a grace/warning period, maybe spanning until after the next<br>
release.<br>
<br>
I can see the arguments both ways...<br>
</blockquote>
<br></div></div>
I prefer the warning for one release approach. =A0What I&#39;m afraid will =
happen is oe-core is released in the Fall, and a group of users migrates to=
 it from the last release and suddenly all of their layers break. =A0These =
are the people who do not keep up with day to day development.<br>

<br>
With the warning, they won&#39;t be immediately blocked -- but will be suff=
iciently annoyed (and warned) that they need to fix something or it will br=
eak.</blockquote><div><br></div><div style>The problem is the following:</d=
iv>
<div style><br></div><div style>OE-Core adds warning;</div><div style>Layer=
1 submit the PR bump request and drop the internal PRINC</div><div style>La=
yer1 gets PRINC removal commited</div><div style>User1 updates Layer1 (and =
OE-Core didn&#39;t yet apply the PR bump)</div>
<div style><br></div><div style>PR goes backwards.</div><div style><br></di=
v><div style>Now the inverse:</div><div style><br></div><div>OE-Core adds w=
arning;</div><div>Layer1 submit the PR bump request and drop the internal P=
RINC</div>
<div style>OE-Core commits PR bump</div><div>User1 updates Layer1 (and OE-C=
ore didn&#39;t yet apply the PR bump)</div><div style><br></div><div style>=
PR goes forward as PRINC didn&#39;t yet been removed so when Layer1 is upda=
ted again, it will go backwards</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--001a11c2faecaece9404dde34cf9--
