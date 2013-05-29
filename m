Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4C24B6081A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 22:58:24 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id wo10so1371807obc.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=PkXNt9HcNp3it3Ul9B1nMvuVIBKKIHtWNJQxuxleAnw=;
	b=oCt5xaU3GRIfKjvchG/k3MNk9ra+gdJ+WcLxxeONV2Mwzq1N3XTVZt+z1naCNnsnM4
	yeoPKNXxTG9pld+Lxpc8SjHleN7AbYw1IHeFgxyijEpD24phnPKzfjB7WilVFAwwecaM
	2KyjfbmjjYFyKnmT3BT07O0J0F7lO5CC2c3dbqEGettMoEm34K0oBilR36wN+zeE2jh2
	RNx+287JMchgDBk2QZadzhaJLlbKk9+2Dp+WNfLBRwe88rbogyOXRSR5x4hifqOVeKK+
	90RpZBCx6Zr7x8peX4SqZTp50WKDuO3i+iMZyVajNL2poFdy94+PIbbcXGwP/jqhEjcL
	v87g==
MIME-Version: 1.0
X-Received: by 10.60.94.70 with SMTP id da6mr2990009oeb.63.1369868304954; Wed,
	29 May 2013 15:58:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Wed, 29 May 2013 15:58:24 -0700 (PDT)
In-Reply-To: <CAF6bG8dmfuM_mH3dhBaiM=0y2NkA0pXtehzfJnGJ9cKma+8dJg@mail.gmail.com>
References: <cover.1369576071.git.cazfi74@gmail.com>
	<CAJTo0LYaM+1fB7h7cK0jQ3QcDio_79+y4eZ7_cpYxBTwiqoR4A@mail.gmail.com>
	<CAF6bG8dmfuM_mH3dhBaiM=0y2NkA0pXtehzfJnGJ9cKma+8dJg@mail.gmail.com>
Date: Wed, 29 May 2013 19:58:24 -0300
X-Google-Sender-Auth: gZyg9Kgf1MiiRywWfhQFleBV3lU
Message-ID: <CAP9ODKpRZC6=K2jrtxoSk4aBgHU313DQmok7LTEGDfheUQyoLA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Marko Lindqvist <cazfi74@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] RFC: Add recipe of gtk3 version of vte alongside gtk2 one.
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
X-List-Received-Date: Wed, 29 May 2013 22:58:24 -0000
Content-Type: multipart/alternative; boundary=089e012287c0b509bb04dde351e5

--089e012287c0b509bb04dde351e5
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 29, 2013 at 7:14 PM, Marko Lindqvist <cazfi74@gmail.com> wrote:

> On 29 May 2013 13:14, Burton, Ross <ross.burton@intel.com> wrote:
>
>> On 26 May 2013 15:03, Marko Lindqvist <cazfi74@gmail.com> wrote:
>> > Last gtk2-compatible version of vte is 0.28.2 currently present on OE
>> core.
>> > Later versions depend on gtk3.
>>
>> vte supports both gtk2 and gtk3.
>>
>
>  0.30.0 NEWS states that "dropped support for gtk2". While this sounds
> like upstream 0.28.2 would work with either gtk2 or gtk3, OE recipe depends
> on "gtk+", which is always gtk2?
>
>
>> > Since gtk3 exist in OE core, it would make
>> > sense to be able to build version of vte (and other similar packages)
>> > that does not depend on gtk2. Otherwise we end with systems that must
>> > contain both gtk2 (to be used by some programs) and gtk3 (to be used by
>> > other programs).
>> > This patch just adds new recipe for latest vte version, 0.34.5,
>> alongside
>> > with 0.28.2 version.
>> > How should priorities be set? "1" for gtk2-version, so it gets selected
>> despite gtk3-version being newer?
>>
>> Because they are *not* drop-in replacements, how about naming the gtk3
>> vte vte3_3.34.5.bb?
>>
>
>  I think calling it vte3 would be confusing at best, when vte itself is
> not version 3.x. How about "vte-gtk3"?
>

So I would say to rename vte to vte-gtk2 at same time and make it provide
vte for now.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e012287c0b509bb04dde351e5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, May 29, 2013 at 7:14 PM, Marko Lindqvist <span dir=3D"ltr">=
&lt;<a href=3D"mailto:cazfi74@gmail.com" target=3D"_blank">cazfi74@gmail.co=
m</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"im">On 29 May=
 2013 13:14, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burt=
on@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:=
<br>
</div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D"i=
m">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On 26 May 2013 15:03, Marko Lindqvist &=
lt;<a href=3D"mailto:cazfi74@gmail.com" target=3D"_blank">cazfi74@gmail.com=
</a>&gt; wrote:<br>


&gt; Last gtk2-compatible version of vte is 0.28.2 currently present on OE =
core.<br>
&gt; Later versions depend on gtk3.<br>
<br>
</div>vte supports both gtk2 and gtk3.<br></blockquote><div><br></div></div=
><div>=A00.30.0 NEWS states that &quot;dropped support for gtk2&quot;. Whil=
e this sounds like upstream 0.28.2 would work with either gtk2 or gtk3, OE =
recipe depends on &quot;gtk+&quot;, which is always gtk2?<br>

</div><div class=3D"im"><div>=A0<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv>
&gt; Since gtk3 exist in OE core, it would make<br>
&gt; sense to be able to build version of vte (and other similar packages)<=
br>
&gt; that does not depend on gtk2. Otherwise we end with systems that must<=
br>
&gt; contain both gtk2 (to be used by some programs) and gtk3 (to be used b=
y<br>
&gt; other programs).<br>
&gt; This patch just adds new recipe for latest vte version, 0.34.5, alongs=
ide<br>
&gt; with 0.28.2 version.<br>
&gt; How should priorities be set? &quot;1&quot; for gtk2-version, so it ge=
ts selected despite gtk3-version being newer?<br>
<br>
</div>Because they are *not* drop-in replacements, how about naming the gtk=
3<br>
vte <a href=3D"http://vte3_3.34.5.bb" target=3D"_blank">vte3_3.34.5.bb</a>?=
<br></blockquote><div><br></div></div><div>=A0I think calling it vte3 would=
 be confusing at best, when vte itself is not version 3.x. How about &quot;=
vte-gtk3&quot;?</div>
</div></div></div></blockquote><div><br></div><div style>So I would say to =
rename vte to vte-gtk2 at same time and make it provide vte for now.=A0</di=
v></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>Mobile: +55 (53) =
9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--089e012287c0b509bb04dde351e5--
