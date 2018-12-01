Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 52A5A6D68F;
	Sat,  1 Dec 2018 15:57:53 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id n21so9295695qtl.6;
	Sat, 01 Dec 2018 07:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u0Dm+dtZwJDbT6X/M2PxFDL1XlCv0JyqX57bvyZ2ELk=;
	b=meZZTIJchz7Oq7GCQESy3SIjUs6TTt66qur+0/64cFFRvE5KIw48d4BE6mtH4FSpUW
	ia7AIfCgWSQAbT50Vzr6i8vW7Tq3xPa/Ace/4vrQDxsGVJCcMOYE7qHFZYzHtYO3lGFD
	keNbi60evsx5N+7kibWKK92mIO+HotJUpVw3hlj+bsZ9zTcNrPGLZMbU6BaBusAbG6LM
	HFB1PZ2BdzKczZ8GCGmINrxrVKlTeJ7Ok4VZp1FrX3DDax5G/UPh6xgFLBw3U0t9Q5CU
	miDNu8YoIlUfrOLAw7zSEcRaQqrQCBmv6oJLgSnF6YIoxdfSHqZQ985lsnfJZyC1oBOa
	x7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u0Dm+dtZwJDbT6X/M2PxFDL1XlCv0JyqX57bvyZ2ELk=;
	b=VrdywTX8waDBQh6IrheKs+PwpJ3RwarXP/Z91haYhQVgIly/RGTMk9bxICPRThN8kB
	PBpqc9DQs34w5Uo4Gdthwev4mLab8APmWq31KxVHVXxv34nV3WGrzOpnJSZTsFhBtjiN
	YcsIZ623T4wwLBjh+xyLn2/eh13hsA0RV47o58wE8mMwFDEcrsNUB68BXb9VSS+uGrG3
	eoms0J2dnrqpfJvRmDuDDoobUqAjAYGQpLlf8HphNldncZiNAz2SGo2xr4XK6xUFgbWe
	ACYNH+idYkXFPTPpIREm7FN4ZpQ9xRI6xQoaHp+e5Ox29v34ZQLE4OC8iV/BLIrH1+RD
	QlUw==
X-Gm-Message-State: AA+aEWb+QYN/1NKbN0hd1dnmC+/o+bJQeNQbXXrJhyDi5XA37PMe1N+M
	GUEXz/6hZkTqanufm1KiKC04kWarYQPmMTCWT1A=
X-Google-Smtp-Source: AFSGD/VmND52PZae/3EBTY+xSON0bxjsRO0uaocWYM3Sjzxdj6VQ1C4JzHml7ZgMpK/K1C/nvemOeSfxbM8P4uXL70A=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr9688993qte.29.1543679874040; 
	Sat, 01 Dec 2018 07:57:54 -0800 (PST)
MIME-Version: 1.0
References: <2403371.OeEdUFaxhe@localhost.localdomain>
	<CAMKF1srJiBZnB42fhoYOvutDe_Pv0sBRq79p=69UWfgt4QRckg@mail.gmail.com>
	<f22e2865-f2be-ecd5-5a13-e69c0a8a6891@balister.org>
	<b2177fe4-6853-99ee-1177-51dfdbb74175@balister.org>
In-Reply-To: <b2177fe4-6853-99ee-1177-51dfdbb74175@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Dec 2018 07:57:43 -0800
Message-ID: <CAMKF1sroFiCKEaHBnMHOEMh6WrRwck9iB=VEuaAn9OFJ70xkSA@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	"Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [oe] Github pull requests
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
X-List-Received-Date: Sat, 01 Dec 2018 15:57:53 -0000
Content-Type: multipart/alternative; boundary="0000000000008a083c057bf7fabc"

--0000000000008a083c057bf7fabc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 1, 2018 at 5:48 AM Philip Balister <philip@balister.org> wrote:

> On 11/30/2018 07:06 AM, Philip Balister wrote:
> > On 11/29/2018 09:31 PM, Khem Raj wrote:
> >> On Thu, Nov 29, 2018 at 5:26 PM Paul Eggleton <paul.eggleton@intel.com=
>
> wrote:
> >>>
> >>> Hi folks
> >>>
> >>> Someone pointed out that there are quite a few pull requests on githu=
b
> under
> >>> https://github.com/openembedded/. I know we don't accept these, but
> it seems
> >>> to me we ought to clean up the ones that are there in order to avoid
> people
> >>> thinking that they might be (and probably comment on the ones where w=
e
> haven't
> >>> done so or the submitter hasn't sent them to the mailing list
> already). I'll
> >>> volunteer to clean them up, but I don't currently have access - can
> someone
> >>> grant that to me?
> >>
> >> I think that will be good. I have taken care of meta-oe ones but I can
> not
> >> close them
> >
> > Do we need to adjust github privileges so you can close them? Let's cha=
t
> > next week and see what we can do to make this easier.
>
> Does this help?
>
> http://nopullrequests.appspot.com



Only if we can add clear instructions there on how to send patches

Many oe distros use gh mirrors for those repos
And users might think it=E2=80=99s following gh workflow disabling pulls mi=
ght be
confusing

> <http://nopullrequests.appspot.com/>

<http://nopullrequests.appspot.com/>
>
> Philip
>
>
>
>
> >
> > Philip
> >
> >
> >>
> >>>
> >>> Thanks,
> >>> Paul
> >>>
> >>> --
> >>> Paul Eggleton
> >>> Intel Open Source Technology Centre
> >>>
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--0000000000008a083c057bf7fabc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat,=
 Dec 1, 2018 at 5:48 AM Philip Balister &lt;<a href=3D"mailto:philip@balist=
er.org">philip@balister.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On 11/30/2018 07:06 AM, Philip Balister wrote:<br>
&gt; On 11/29/2018 09:31 PM, Khem Raj wrote:<br>
&gt;&gt; On Thu, Nov 29, 2018 at 5:26 PM Paul Eggleton &lt;<a href=3D"mailt=
o:paul.eggleton@intel.com" target=3D"_blank">paul.eggleton@intel.com</a>&gt=
; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hi folks<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Someone pointed out that there are quite a few pull requests o=
n github under<br>
&gt;&gt;&gt; <a href=3D"https://github.com/openembedded/" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openembedded/</a>. I know we don&#39=
;t accept these, but it seems<br>
&gt;&gt;&gt; to me we ought to clean up the ones that are there in order to=
 avoid people<br>
&gt;&gt;&gt; thinking that they might be (and probably comment on the ones =
where we haven&#39;t<br>
&gt;&gt;&gt; done so or the submitter hasn&#39;t sent them to the mailing l=
ist already). I&#39;ll<br>
&gt;&gt;&gt; volunteer to clean them up, but I don&#39;t currently have acc=
ess - can someone<br>
&gt;&gt;&gt; grant that to me?<br>
&gt;&gt;<br>
&gt;&gt; I think that will be good. I have taken care of meta-oe ones but I=
 can not<br>
&gt;&gt; close them<br>
&gt; <br>
&gt; Do we need to adjust github privileges so you can close them? Let&#39;=
s chat<br>
&gt; next week and see what we can do to make this easier.<br>
<br>
Does this help?<br>
<br>
<a href=3D"http://nopullrequests.appspot.com/" rel=3D"noreferrer" target=3D=
"_blank">http://nopullrequests.appspot.com</a></blockquote><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Only if we can ad=
d clear instructions there on how to send patches=C2=A0</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Many oe distros use gh mirrors for those re=
pos=C2=A0</div><div dir=3D"auto">And users might think it=E2=80=99s followi=
ng gh workflow disabling pulls might be confusing=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><a href=3D"http://nopullrequests.appspot.com/" rel=3D"nore=
ferrer" target=3D"_blank"></a></blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
a href=3D"http://nopullrequests.appspot.com/" rel=3D"noreferrer" target=3D"=
_blank"></a><br>
<br>
Philip<br>
<br>
<br>
<br>
<br>
&gt; <br>
&gt; Philip<br>
&gt; <br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; Paul<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Paul Eggleton<br>
&gt;&gt;&gt; Intel Open Source Technology Centre<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt; Openembedded-devel mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-devel@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-devel@lists.openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-devel" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-devel</a><br>
</blockquote></div></div>

--0000000000008a083c057bf7fabc--
