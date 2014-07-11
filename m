Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id B6A2565C8D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 11:46:08 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id m5so760492qaj.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 04:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Q2d0JmlKLLY5K+7MomKq+SuCmQn5KVYHWfUDC8V72SY=;
	b=FsAr1NCYfM2q62+TiWVeIEkQf2Os3akOEhH4CLojv7C0/Xqeb73OjHEV3UXUs7ypjf
	p6Ueg50RgbQK1fQ9gffYcfyRTB/8TNtNZkkGpupn44VWpLGPL8V2y/DTqfsfS/WMTdUJ
	uuikqyPr3xPLOycSqR2NdrGoE4e/BnPsU5wa8cyyKxwqbKKkv5P/kKPVcyKNCv3DD/2T
	r9ZOYemh0gO1Htrc2uThTukDAcHvSiAcKz9/hMw/2OaH6cqsVC62yVkl5J7Twp216cp5
	EHjCJ34ST3UnwtrQhmL2wrq8UVTp4tLDZMfMqOVcVav01eM0/G81VnEJd55Gq0NffhSb
	SfYA==
X-Gm-Message-State: ALoCoQmu7QJDZp/ZpfxwY8VUkcavAKGdehrwA1N9hFRBxxqhmR70YHwWMYmL4sle7WLv/9fm4y/D
MIME-Version: 1.0
X-Received: by 10.140.81.209 with SMTP id f75mr80777315qgd.60.1405079169321;
	Fri, 11 Jul 2014 04:46:09 -0700 (PDT)
Received: by 10.140.86.99 with HTTP; Fri, 11 Jul 2014 04:46:09 -0700 (PDT)
In-Reply-To: <20140711102537.GF2433@jama>
References: <cover.1404987090.git.jackie.huang@windriver.com>
	<3a19aa87a9f5d562cd1c5615d89486a46adea9da.1404987090.git.jackie.huang@windriver.com>
	<20140711102013.GE2433@jama> <20140711102537.GF2433@jama>
Date: Fri, 11 Jul 2014 12:46:09 +0100
Message-ID: <CAJTo0LaEhugeO61kbzZDXwRM+=GmWUzhhVxi9WE==HsAeqeYOQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] postfix: add new recipe
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
X-List-Received-Date: Fri, 11 Jul 2014 11:46:13 -0000
Content-Type: multipart/alternative; boundary=001a11c13aa2c4f96b04fde97c05

--001a11c13aa2c4f96b04fde97c05
Content-Type: text/plain; charset=UTF-8

Meta-networking seems the obvious home to me.

Ross

On Friday, 11 July 2014, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Jul 11, 2014 at 12:20:13PM +0200, Martin Jansa wrote:
> > On Thu, Jul 10, 2014 at 09:57:56PM -0400, jackie.huang@windriver.com
> <javascript:;> wrote:
> > > From: Jackie Huang <jackie.huang@windriver.com <javascript:;>>
> > >
> > > Postfix is Wietse Venema's mail server that started life at IBM
> > > research as an alternative to the widely-used Sendmail program.
> > >
> > > Postfix attempts to be fast, easy to administer, and secure.
> > > The outside has a definite Sendmail-ish flavor, but the inside
> > > is completely different.
> >
> > Why is it sent to oe-core and meta-oe at the same time?
> >
>
> I'm sorry, I should have finished reading whole backlog before
> not-sending this.
>
> I agree with other reviewers it's better in meta-oe (maybe
> meta-networking?)
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com <javascript:;>
>

--001a11c13aa2c4f96b04fde97c05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Meta-networking seems the obvious home to me.<div><br></div><div>Ross<span>=
</span><br><br>On Friday, 11 July 2014, Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
On Fri, Jul 11, 2014 at 12:20:13PM +0200, Martin Jansa wrote:<br>
&gt; On Thu, Jul 10, 2014 at 09:57:56PM -0400, <a href=3D"javascript:;" onc=
lick=3D"_e(event, &#39;cvml&#39;, &#39;jackie.huang@windriver.com&#39;)">ja=
ckie.huang@windriver.com</a> wrote:<br>
&gt; &gt; From: Jackie Huang &lt;<a href=3D"javascript:;" onclick=3D"_e(eve=
nt, &#39;cvml&#39;, &#39;jackie.huang@windriver.com&#39;)">jackie.huang@win=
driver.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Postfix is Wietse Venema&#39;s mail server that started life at I=
BM<br>
&gt; &gt; research as an alternative to the widely-used Sendmail program.<b=
r>
&gt; &gt;<br>
&gt; &gt; Postfix attempts to be fast, easy to administer, and secure.<br>
&gt; &gt; The outside has a definite Sendmail-ish flavor, but the inside<br=
>
&gt; &gt; is completely different.<br>
&gt;<br>
&gt; Why is it sent to oe-core and meta-oe at the same time?<br>
&gt;<br>
<br>
I&#39;m sorry, I should have finished reading whole backlog before<br>
not-sending this.<br>
<br>
I agree with other reviewers it&#39;s better in meta-oe (maybe<br>
meta-networking?)<br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa =C2=A0 =C2=A0 jabber: <a href=3D"javascript:;" =
onclick=3D"_e(event, &#39;cvml&#39;, &#39;Martin.Jansa@gmail.com&#39;)">Mar=
tin.Jansa@gmail.com</a><br>
</blockquote></div>

--001a11c13aa2c4f96b04fde97c05--
