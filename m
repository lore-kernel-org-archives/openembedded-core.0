Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6ACBD606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 07:32:24 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id w18so58202442oiw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eOBoN6kB7D+HoEBO5WCKYOEeFzzj8QOpvv5Zz60ciPg=;
	b=Dc2wA/csneoiOKMrIkbPmRK+rUhC5pHwHACkyaeZ2L4syiXjG8ZmU5muF5sH9lWepF
	17USeMpuFs5wve7wx0oRAsKp5BdpmXPK2qldE6avuM+6UQyJo6hVoriie90oE+thEUK9
	jOgEI5HXQ32D6zgvbA0Q3XPVWJDDVxmSw+MmkD1ODnXlNq+1alXiq9nZE4g4OOINzIVQ
	zmTezkzBAiRSJAFvEveI+vL5/9uT5y+5SaRwbRSwwQBN3J8TGd1gHsEzbfZQZof+or6I
	pdb+Kb3lasJCftmMyaJA+0XiN1fwVNdFAwIqFDU/UJ01UHvigl6wH+KLz9iW3pOPOXk2
	vZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eOBoN6kB7D+HoEBO5WCKYOEeFzzj8QOpvv5Zz60ciPg=;
	b=SEjuZiiLTgyMjTl/ba1ohpeLVXGOS4fdfHJ7BU+hB2id7DLh6IkxxIYuHY88BnRIy5
	rI8+IBLyxLtTViFyf77FGgPGxGrfYq2DTdEi7nBKtNr6BuJ6nfxhTdK9mic8hCLSSoat
	0uyAbaMDRhxOK6zWWW0BrNI7eXA7DeEWyoqzw38/WJJ9EU3N2Df4v2IJiKYrjBMSKhW1
	W89tkgV+Z3dTajKPedB3OP/rrNw0AGdWdmTchBW41i+GB4EhsOeZgzNq9UcoZiHPzsAu
	H5cIP9BHfMVf7GMBreOVHnzS0t8bcBAs/5kRAqb8SNtSDaAIoERN0PP5lJSPUlfXUssa
	R2Ww==
X-Gm-Message-State: ALyK8tI8lGQlaP8GxQyLa6IWUrO35D5jTQkSskfNg8XaF2wfTc1ZysN9LJqBN1Z/xKKjuAHFJZumgLBcmW8aipSH
X-Received: by 10.157.32.120 with SMTP id n111mr4230742ota.120.1468395145270; 
	Wed, 13 Jul 2016 00:32:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.199.134 with HTTP; Wed, 13 Jul 2016 00:31:55 -0700 (PDT)
In-Reply-To: <CAMKF1soqaVG8mY-M7Gz77iLzLnp++15K=D56K+vDYPXrtcFp=A@mail.gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
	<CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
	<314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
	<CAHiDW_GzrvqCkkcUMtNQTtgoit9JdJ5Y-pBP2vHsiC67+7JB-Q@mail.gmail.com>
	<CAMKF1soqaVG8mY-M7Gz77iLzLnp++15K=D56K+vDYPXrtcFp=A@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 13 Jul 2016 10:31:55 +0300
Message-ID: <CAHiDW_HuQaBj5eNiODJCnsHZg4cw5XE3Ku1YQnZEcvATfakZ3g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Wed, 13 Jul 2016 07:32:25 -0000
Content-Type: multipart/alternative; boundary=001a113e379206477505377f6398

--001a113e379206477505377f6398
Content-Type: text/plain; charset=UTF-8

On 13 July 2016 at 09:49, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, May 17, 2016 at 12:31 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
> > On 16 May 2016 at 18:50, Khem Raj <raj.khem@gmail.com> wrote:
> >>> As I said, I would work on 1.10.91 as it is close of 1.11 and easy the
> >>> upgrade. But all my patches are based on 1.10 now so it is fine with
> >>> me as well so please send the v2.
> >>
> >> If 1.11 is around the corner then why not work on 1.11 ( pre-release )
> itself
> >
> > There's not much to work on as far as I can tell: 1.11 should be a
> > simple upgrade with trivial patch changes.
> > As I said, I'm totally fine with waiting a couple of weeks until 1.11.
> > On the other hand I haven't seen any reasons to start packaging a
> > pre-release -- why this one if we normally don't do it?
>
> There has been 1.11 release done for quite a while, are you working on
> sending an upgrade for it ?
>


I intend to do that this week, yes.

Jussi

--001a113e379206477505377f6398
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2016 at 09:49, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, May 17, 2016=
 at 12:31 AM, Jussi Kukkonen<br>
&lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a=
>&gt; wrote:<br>
&gt; On 16 May 2016 at 18:50, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; As I said, I would work on 1.10.91 as it is close of 1.11 and =
easy the<br>
&gt;&gt;&gt; upgrade. But all my patches are based on 1.10 now so it is fin=
e with<br>
&gt;&gt;&gt; me as well so please send the v2.<br>
&gt;&gt;<br>
&gt;&gt; If 1.11 is around the corner then why not work on 1.11 ( pre-relea=
se ) itself<br>
&gt;<br>
&gt; There&#39;s not much to work on as far as I can tell: 1.11 should be a=
<br>
&gt; simple upgrade with trivial patch changes.<br>
&gt; As I said, I&#39;m totally fine with waiting a couple of weeks until 1=
.11.<br>
&gt; On the other hand I haven&#39;t seen any reasons to start packaging a<=
br>
&gt; pre-release -- why this one if we normally don&#39;t do it?<br>
<br>
</span>There has been 1.11 release done for quite a while, are you working =
on<br>
sending an upgrade for it ?<br></blockquote><div><br></div><div><br></div><=
div>I intend to do that this week, yes.=C2=A0</div><div>=C2=A0</div><div>Ju=
ssi</div></div></div></div>

--001a113e379206477505377f6398--
