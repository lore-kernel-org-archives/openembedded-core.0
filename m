Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id D6EB7731C6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 02:24:35 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id h190so5622172ith.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2016 19:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=+5eRkVE8HxfuIbzByRSQ7Snt1RoZ5bvtH4arCCOlNdc=;
	b=hBZ0mM17CrhJj0y4ui4NDgXU7Ku+AYZM0pkXbUHmGjda3ckECHiTsZjjNQpgVfWuRi
	75ZyAU1MFrzJIyUi5p/bl7qLubxwxUNuL/M6lUWyZGmde8U4NOWKg3UFn3+kTot5JDnH
	sOw2u9JvfBt/wVeA/IwghWZcA54zz88NcBYa+3W/+qXz5YN+h6idjBsQsW6v4O6GNOzI
	+lZ77Y+DpbKOLEptQumU4I8wVZ9y/mPXuUnQtTjhDa413p7QRjHjQ98vc6UpEDPHQiLG
	uKuL7PgQjsUtwdZPlXdVeinhxRECn07hS962Sii+y9ezskDkweKhgRvqM0sIjeH1VJIQ
	0AsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=+5eRkVE8HxfuIbzByRSQ7Snt1RoZ5bvtH4arCCOlNdc=;
	b=w0qg221GmmtpnPsu7SxNrmu0RY/7ElNKK6MY90Pw8NB0M5IHua7+QEnQbAQBwViM64
	kMB9WzeJ+Nz66KNBBW07mGwZpE1y5Xdhh8EDTPqEGy1Asoy+BbfP0QT9CyMqDQakN7Bf
	pBb8Lth7VrHFBEJho7OjsdsHaP2FSnnuQYYjbz0a8NR5RVIWK/F8mifkGMLUs0La924e
	b7WDxh/kURot9bnSV9mURfaxEc9kMuTL/m9RYG6gmN6gjJxRUu7ej/Tlz8qVwy9RXxji
	wemmFHJkI6t/zxOnuTREndsyKhqfr+ijzPYYjrE6zWPsnYgnjetOPrxOTNRqQbZcG3W6
	VFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=+5eRkVE8HxfuIbzByRSQ7Snt1RoZ5bvtH4arCCOlNdc=;
	b=aU3vEnEEuOZspmPLgk+MLVZSCYw0+EuhCYMJ2b50NiiDVtGunwENGW+sWL4y62LYR2
	NJmWwU8O/AcNmJ1ZEoP95xoUgS7yz38Cqb1ksCUVt9arY4T6fnkXniZ0N7qTmG5BM2ZT
	Nkkt4W35IDkg5r3hBemlqZEcEZyK9C6lBrNw/6948wPYPrnNCUMftMMuwm0/4AwjRcnr
	wEX6ohCcarIvG34vspYO7lutF5cTpRT6K7YdcqwMaWycnms4RyTSdBqK6q1XnGOZYrX5
	YE42s1JtqOK/GD6aWfq9knOJNzSUxydmRUY7ncii/AoSXHDpCfpkmWha/lYbP1JXzq5n
	T6iA==
X-Gm-Message-State: ALyK8tKATI1hj7/nUz8T8P4QskAblW9P4aSL5/zysmyDjzV/2rn2RKqW/zK303EgtwGxKwPeCBtl4+mlPxWSxQ==
X-Received: by 10.36.23.206 with SMTP id 197mr4466484ith.15.1465352675518;
	Tue, 07 Jun 2016 19:24:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Tue, 7 Jun 2016 19:24:16 -0700 (PDT)
In-Reply-To: <10776768.uSdOil2dlO@peggleto-mobl.ger.corp.intel.com>
References: <20160605214429.63811-1-kad@kad.name>
	<10776768.uSdOil2dlO@peggleto-mobl.ger.corp.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 7 Jun 2016 19:24:16 -0700
X-Google-Sender-Auth: Ob8Z8FJ3o4JVSpoqizZjtA_FrLY
Message-ID: <CABcZANnRhUx8asDn1HAZgKF9CEoagBvjxCbxgQZu6rZyCiurDw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-pkgdata-util: new option to provide full info for binary package(s)
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
X-List-Received-Date: Wed, 08 Jun 2016 02:24:37 -0000
Content-Type: multipart/alternative; boundary=001a11437ffab1f30d0534bb019c

--001a11437ffab1f30d0534bb019c
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 7, 2016 at 2:06 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> > +    for pkg in packages:
> > +        items.append(("%s %s%s%s %s %s%s%s %s" % (
> > +            pkg,
> > +            mappings[pkg]['PKGE'] + ":" if mappings[pkg]['PKGE'] else
> "",
> > +            mappings[pkg]['PKGV'],
> > +            "-" + mappings[pkg]['PKGR'] if mappings[pkg]['PKGR'] else
> "",
> > +            mappings[pkg]['PN'],
> > +            mappings[pkg]['PE'] + ":" if mappings[pkg]['PE'] else "",
> > +            mappings[pkg]['PV'],
> > +            "-" + mappings[pkg]['PR'] if mappings[pkg]['PR'] else "",
> > +            mappings[pkg]['PKGSIZE']
> > +        )).strip()
> > +        )
>
> This seems like a bit of an ugly construction. If it were me writing it I
> would probably break it down using variables rather than trying to do it
> all
> on one line. That said it's not bad enough to block it, if nobody else
> feels
> strongly about it then you're in the clear.


I'd agree, that's not particularly readable, both due to the long single
line and overuse of the inline if.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11437ffab1f30d0534bb019c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jun 7, 2016 at 2:06 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
><div class=3D"">&gt; +=C2=A0 =C2=A0 for pkg in packages:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 items.append((&quot;%s %s%s%s %s %s%s%s %=
s&quot; % (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PKGE&#39=
;] + &quot;:&quot; if mappings[pkg][&#39;PKGE&#39;] else &quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PKGV&#39=
;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-&quot; + mappings[pk=
g][&#39;PKGR&#39;] if mappings[pkg][&#39;PKGR&#39;] else &quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PN&#39;]=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PE&#39;]=
 + &quot;:&quot; if mappings[pkg][&#39;PE&#39;] else &quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PV&#39;]=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-&quot; + mappings[pk=
g][&#39;PR&#39;] if mappings[pkg][&#39;PR&#39;] else &quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mappings[pkg][&#39;PKGSIZE&=
#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )).strip()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
<br>
</div></div>This seems like a bit of an ugly construction. If it were me wr=
iting it I<br>
would probably break it down using variables rather than trying to do it al=
l<br>
on one line. That said it&#39;s not bad enough to block it, if nobody else =
feels<br>
strongly about it then you&#39;re in the clear.</blockquote></div><br>I&#39=
;d agree, that&#39;s not particularly readable, both due to the long single=
 line and overuse of the inline if.<br>-- <br><div class=3D"gmail_signature=
" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at kergo=
th dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - T=
slib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11437ffab1f30d0534bb019c--
