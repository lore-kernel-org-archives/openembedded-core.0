Return-Path: <slavasalnikovv@gmail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 71DE574BF3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 09:23:10 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id x27-v6so6867281ywj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jYreLDaiVQfPrhCErQTFcv8lFBIHS1fHktYgTiXqq4Y=;
	b=l2Rua1/ZKYVAjYlLnmn4i7D7QKZafFRBtmxzQ3gUSVexIhEqeB4kY3syRHQ4c1N4L7
	gc4h3sGQ8O/YMfLibAl+42WN7U/WspvbZFDeGEjG+P8KkIoGqIPklRIeE5hiCu4gAXmF
	y9FcRhBY/XjSMkdyU8bGliq7/u/fdLppeKgE8+omQNc3cUN2HVrhuNuhVTwGB8Yl/G1h
	ah4F3fp+PToPHYWFdkVthWMGlxylflCRr3UCQpg2PzdB74fsPk53R/Y1qGiSCDMD0MGZ
	MH1QB3HNZnq8RIchTxTAK4sa+hgv28KUYxVPoUkLo1+S13sKzDkKAZiZNJlz452SZUJc
	CBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jYreLDaiVQfPrhCErQTFcv8lFBIHS1fHktYgTiXqq4Y=;
	b=PS4LU/GQwZMRDoxEH1N6+dNTky2jws6n2jYCObug+wwh3xi7HyJOgeEF4H/2lB0KUI
	CDDYlbf9Z0aE9o6vjlvk5mXKwXh+SmJtcWEaM0FJq/Xmr60sOpF1URqPKe11MDgnAUhh
	cAzjXpAhFjihpkX2bRi3tzlFs/aNIiHJfoh1v11nLMwF8gTvSnCynp/TXUfJ9Atxrk4n
	0a2zVJGmgY9p8YwmaQ8E8A9c/ZaUUac5sRESbkkIFyNhV409FWyi3FL354nmRXHt370W
	RMf9eB+FcNERuVdOp/+RQ84A2uARwKkcIduPdn2Y2KJ+cQQaGyxft41zXSGIz2HRSjWd
	+VXA==
X-Gm-Message-State: ALQs6tAYTVJJ2ajIHVVBrnTOglpUORnCf4vXtJa2y2z+yRKtEAuGVItG
	oBgV8PkKgrTDfW9uvus7zameNEDgIPNrRX31Wkg=
X-Google-Smtp-Source: AB8JxZoYPUWNl1Egphw/VB4wk9LPyoZq3ZBYhz8oAe/aidWRwVvHWmqPoMf3QZnwkaTr0zyPxuWXGWL1T9n2BzmP6fk=
X-Received: by 2002:a81:9f41:: with SMTP id
	w62-v6mr21688389ywg.295.1525771390977; 
	Tue, 08 May 2018 02:23:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.51.88 with HTTP; Tue, 8 May 2018 02:23:10 -0700 (PDT)
In-Reply-To: <CAJ86T=V1X+FRW7fNS3r0UUosH8pUH_QEuzun29=sDuqNzUUBBw@mail.gmail.com>
References: <CACAZDOmB7+7WfZfzt_qxinq48ANmsbm_q0nrmneAuN7gM2pJvQ@mail.gmail.com>
	<dc9619db-2ee9-131a-fe29-614308f0495e@linux.intel.com>
	<CACAZDOk8m5pXrny5etfe-cYNHkRj33w1LX1SfnBKDcW0iq6nuQ@mail.gmail.com>
	<d962987c-6698-365c-6771-bdcf8a156051@windriver.com>
	<CAJ86T=V1X+FRW7fNS3r0UUosH8pUH_QEuzun29=sDuqNzUUBBw@mail.gmail.com>
From: Viacheslav Salnikov <slavasalnikovv@gmail.com>
Date: Tue, 8 May 2018 12:23:10 +0300
Message-ID: <CACAZDOk=Est7f4h6pdz3rEEcc74azF2gX__YeFr9NUBFykOsHw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: cURL recipe: SSL backend
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
X-List-Received-Date: Tue, 08 May 2018 09:23:10 -0000
Content-Type: multipart/alternative; boundary="000000000000c48b41056bae5525"

--000000000000c48b41056bae5525
Content-Type: text/plain; charset="UTF-8"

Mark, the main point of the question about "changing without side-effects"
and not about "how to change one config option to another"

But Andre has already provided information, cheers for that.

Thanks for participation

2018-05-07 23:00 GMT+03:00 Andre McCurdy <armccurdy@gmail.com>:

> On Mon, May 7, 2018 at 7:17 AM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> > On 5/7/18 8:16 AM, Viacheslav Salnikov wrote:
> >> Alright, good point.
> >>
> >> But what if I need to use openssl instead of gnutls on Target? Can it
> be changed
> >> without side effects?
>
> The behaviour of curl when built with gnutls -vs- openssl in OE is not
> the same. There are things (maybe related to certificates?) which work
> fine with openssl but don't work with gnutls. Unfortunately I don't
> have many more details than that - all the OE distros I use have
> switched to using openssl, so going back to figure out what's wrong
> with gnutls has never been a high priority. If you switch you should
> test carefully, but from my experience openssl works better.
>
> > This is why the package config settins are present in the curl recipe.
> You can
> > adjust the setting to use whatever TLS engine you want in your
> distribution or
> > project configuration.
> >
> > PACKAGECONFIG_pn-curl = "ipv6 proxy ssl threaded-resolver zlib"
>
> This will work, but a more robust approach may be to use _append and
> _remove to change PACKAGECONFIG options (rather than over-riding with
> an absolute set of options, which may become out of sync with the
> defaults in the main recipe). e.g.
>
>   PACKAGECONFIG_remove_pn-curl = "gnutls"
>   PACKAGECONFIG_append_pn-curl = " ssl"
>
> > or any other combination of available options..
> >
> > --Mark
> >
> >> Regards,
> >>
> >> 2018-05-07 15:59 GMT+03:00 Alexander Kanavin <alexander.kanavin@linux.
> intel.com
> >> <mailto:alexander.kanavin@linux.intel.com>>:
> >>
> >>     On 05/07/2018 03:51 PM, Viacheslav Salnikov wrote:
> >>
> >>         cULR is built with GNUTLS for Target but OpenSSL is used for
> native and SDK.
> >>
> >>         So my question is: why GNUTLS is used only for target? Is it
> necessary
> >>         for some good reason? Documentation for cURL has no explicit
> answer for
> >>         that.
> >>
> >>         Could somebody help me to find the answer?
> >>
> >>
> >>     I think enabling gnutls on the native side would add a ton of
> dependencies
> >>     to build, and so openssl (which is more self-contained) is selected
> there.
> >>
> >>     Alex
> >>
> >>
> >>
> >>
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c48b41056bae5525
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Mark, the main point of the question about &quot=
;changing without side-effects&quot; and not about &quot;how to change one =
config option to another&quot;<br><br></div>But Andre has already provided =
information, cheers for that.<br><br></div>Thanks for participation<br></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-05-07 23:0=
0 GMT+03:00 Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy=
@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</span>:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><span class=3D"">On Mon, May 7, 2018 at 7:17 AM, M=
ark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@windri=
ver.com</a>&gt; wrote:<br>
&gt; On 5/7/18 8:16 AM, Viacheslav Salnikov wrote:<br>
&gt;&gt; Alright, good point.<br>
&gt;&gt;<br>
&gt;&gt; But what if I need to use openssl instead of gnutls on Target? Can=
 it be changed<br>
&gt;&gt; without side effects?<br>
<br>
</span>The behaviour of curl when built with gnutls -vs- openssl in OE is n=
ot<br>
the same. There are things (maybe related to certificates?) which work<br>
fine with openssl but don&#39;t work with gnutls. Unfortunately I don&#39;t=
<br>
have many more details than that - all the OE distros I use have<br>
switched to using openssl, so going back to figure out what&#39;s wrong<br>
with gnutls has never been a high priority. If you switch you should<br>
test carefully, but from my experience openssl works better.<br>
<span class=3D""><br>
&gt; This is why the package config settins are present in the curl recipe.=
=C2=A0 You can<br>
&gt; adjust the setting to use whatever TLS engine you want in your distrib=
ution or<br>
&gt; project configuration.<br>
&gt;<br>
&gt; PACKAGECONFIG_pn-curl =3D &quot;ipv6 proxy ssl threaded-resolver zlib&=
quot;<br>
<br>
</span>This will work, but a more robust approach may be to use _append and=
<br>
_remove to change PACKAGECONFIG options (rather than over-riding with<br>
an absolute set of options, which may become out of sync with the<br>
defaults in the main recipe). e.g.<br>
<br>
=C2=A0 PACKAGECONFIG_remove_pn-curl =3D &quot;gnutls&quot;<br>
=C2=A0 PACKAGECONFIG_append_pn-curl =3D &quot; ssl&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; or any other combination of available options..<br>
&gt;<br>
&gt; --Mark<br>
&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt;<br>
&gt;&gt; 2018-05-07 15:59 GMT+03:00 Alexander Kanavin &lt;<a href=3D"mailto=
:alexander.kanavin@linux.intel.com">alexander.kanavin@linux.<wbr>intel.com<=
/a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:alexander.kanavin@linux.intel.com">al=
exander.kanavin@<wbr>linux.intel.com</a>&gt;&gt;:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0On 05/07/2018 03:51 PM, Viacheslav Salnikov wro=
te:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cULR is built with GNUTLS for Tar=
get but OpenSSL is used for native and SDK.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0So my question is: why GNUTLS is =
used only for target? Is it necessary<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for some good reason? Documentati=
on for cURL has no explicit answer for<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Could somebody help me to find th=
e answer?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0I think enabling gnutls on the native side woul=
d add a ton of dependencies<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0to build, and so openssl (which is more self-co=
ntained) is selected there.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Alex<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--000000000000c48b41056bae5525--
