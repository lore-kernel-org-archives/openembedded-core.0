Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1F59E79CC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 18:51:47 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w5-v6so13803901wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CiT5p0mImWLiO979Byb9kElX+ik7CkYV7ADD3KLl9VQ=;
	b=F3uc+89NPVWCsv/lFl5NozY4lEdsYvFbYVD5YPRoJlVrmy/9yxeByBKJJ8UZAOYDrS
	z9kDdcKmIhn+dWxHYv6Tf2Ajm10dACprHlM+Axbj2PNXLN3DrplmYdYC1W0FCuVoqm8k
	1N5HadkPumUzNZFzv9MZTJwWqtEgl4NKjzxJET05+buj3gVPxwTCWEWLuNO4A7VQHo3p
	dfOSdVEGzL9Z7Y8QhwusFMHfz37q3+CSyE4tGmznIDPJOo7O+ozCfetES/ZP4mESAS6Z
	ubHIEbuqXgCys7M3tPCQHzFLxaeUKhpQ4nZdKXPZMOkKcWyC658HSLardDHYaKFeQQA8
	UGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CiT5p0mImWLiO979Byb9kElX+ik7CkYV7ADD3KLl9VQ=;
	b=lgEaufMsTwjofEUeskhkeuOhILXINrAk37SMOA1bvUgL2/OMEv+5PABpfiUGkQb6Ge
	eLIektxM/kpmvdMo7PS7LGMIiBsKOT4jEBZSA/rMcFKAooclIr4HjtaNV33XwS9ZIuFG
	WUlnQ+RXT8UnHog8hC+YZznNfFVbEaROXupJf+ZIm00m7R6GC86UMn+rGk8YdM48RXF0
	WUCpN97NKsA9jrwnX8IOBPLixF/oJwaFRFPmbpi3NVgWFl+K+5NDKs9OrucXgi424SqX
	KrqoU2MrawtU6ZtMtmb/PL3lXBimvBVKV4OVlvY1WqjwKZAe3JmnIU+ZJdXd5Vc2M9OS
	9HAg==
X-Gm-Message-State: AGRZ1gKoo5ZQYLoGqVn+2y8CRNeVeYoPkbqLhbkJ7qb3cPAIL9elU0wQ
	dzlBL+zbXMpdXfTQwrKysUMEVocc3Ny99zKj1dY=
X-Google-Smtp-Source: AJdET5csqQZgBrz2E5TAkNOUZOsMfmqgXo/f+u2yZAxe353p9Up+aoOzUed2PgJNx+t0Ml+RM732BeYglplHpHNM9R8=
X-Received: by 2002:a5d:6ac1:: with SMTP id u1-v6mr43889wrw.175.1540925508588; 
	Tue, 30 Oct 2018 11:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <1540870764-17849-1-git-send-email-bruce.ashfield@windriver.com>
	<CAJ86T=VNvLG06TaqUFpjJ6gqrY=H=eGrW5=FH+QxoCt5hbP0Pw@mail.gmail.com>
	<8b1fa587-7104-b842-72a5-7a175e9f137f@windriver.com>
	<CAJ86T=Wwwzjyp5bY1bsjHVD0dgoLCPJgFdTo_M1z0iWywEnkPw@mail.gmail.com>
In-Reply-To: <CAJ86T=Wwwzjyp5bY1bsjHVD0dgoLCPJgFdTo_M1z0iWywEnkPw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Oct 2018 19:51:41 +0100
Message-ID: <CA+chaQcSu65UQbGQ-4NPZ4UHc-kFGyzRrrEkWG76j1ewMEQVng@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2][master-next] kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
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
X-List-Received-Date: Tue, 30 Oct 2018 18:51:48 -0000
Content-Type: multipart/alternative; boundary="000000000000909c95057976ad5e"

--000000000000909c95057976ad5e
Content-Type: text/plain; charset="UTF-8"

Agreed with Andre, also the quotes in new version don't match, which makes
me wonder how well this was actually tested.

Using apostrophes inside quoted string value would make it easier to see
that there is extra " after the useless yes call.

On Tue, Oct 30, 2018 at 6:31 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Oct 30, 2018 at 10:17 AM Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
> >
> > On 10/30/18 1:02 PM, Andre McCurdy wrote:
> > > On Mon, Oct 29, 2018 at 8:39 PM Bruce Ashfield
> > > <bruce.ashfield@windriver.com> wrote:
> > >>
> > >> As was warned by commit 312ee68752fa [kconfig: announce removal of
> > >> oldnoconfig if used], oldnoconfig has been removed from the 4.20
> kernel.
> > >>
> > >> So we switch our default mode to olddefconfig.
> > >>
> > >> commit fb16d8912 [kconfig: replace 'oldnoconfig' with 'olddefconfig',
> > >> and keep the old name as an alias] introduced olddefconfig in the 3.10
> > >> kernel, we shuffle oldnoconfig to the fallback target.
> > >>
> > >> The fallback mode allows kernels between 3.10 and the currently listed
> > >> oldest kernel of 3.2 to continue to configure.
> > >>
> > >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > >> ---
> > >>
> > >> v2: Tweaked to add a fallback mode as suggested by Andre McCurdy
> > >>
> > >> Not for the release, just wanted to get this in the queue for
> > >> when master reopens so we'll be ready for 4.20+ kernel versions
> > >>
> > >> Bruce
> > >>
> > >>
> > >>   meta/classes/kernel.bbclass | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > >> index e04d2fe00434..8fe207165ae8 100644
> > >> --- a/meta/classes/kernel.bbclass
> > >> +++ b/meta/classes/kernel.bbclass
> > >> @@ -492,7 +492,7 @@ sysroot_stage_all () {
> > >>          :
> > >>   }
> > >>
> > >> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}"
> O=${B} oldnoconfig"
> > >> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}"
> O=${B} olddefconfig || yes '' | oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}"
> oldnoconfig"
> > >
> > > There's no "yes" needed with oldnoconfig. The new fallback should just
> > > be the existing default command.
> >
> > *shrug*
> >
> > I'll leave this as is, since it works as tested. Feel free to
> > send followups.
>
> "make oldnoconfig" without the "yes" has been well tested for the past
> few OE releases so it's just odd you decided to change it. Why did
> you?
>
> > >>   python check_oldest_kernel() {
> > >>       oldest_kernel = d.getVar('OLDEST_KERNEL')
> > >> --
> > >> 2.5.0
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000909c95057976ad5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Agreed with Andre, also the quotes in new version don&#39;=
t match, which makes me wonder how well this was actually tested.<div><br><=
/div><div>Using apostrophes inside quoted string value would make it easier=
 to see that there is extra &quot; after the useless yes call.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Oct 30, 2018 at 6:31=
 PM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Oct 30=
, 2018 at 10:17 AM Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce=
.ashfield@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 10/30/18 1:02 PM, Andre McCurdy wrote:<br>
&gt; &gt; On Mon, Oct 29, 2018 at 8:39 PM Bruce Ashfield<br>
&gt; &gt; &lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_bl=
ank">bruce.ashfield@windriver.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; As was warned by commit 312ee68752fa [kconfig: announce remov=
al of<br>
&gt; &gt;&gt; oldnoconfig if used], oldnoconfig has been removed from the 4=
.20 kernel.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; So we switch our default mode to olddefconfig.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; commit fb16d8912 [kconfig: replace &#39;oldnoconfig&#39; with=
 &#39;olddefconfig&#39;,<br>
&gt; &gt;&gt; and keep the old name as an alias] introduced olddefconfig in=
 the 3.10<br>
&gt; &gt;&gt; kernel, we shuffle oldnoconfig to the fallback target.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The fallback mode allows kernels between 3.10 and the current=
ly listed<br>
&gt; &gt;&gt; oldest kernel of 3.2 to continue to configure.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;=
<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; v2: Tweaked to add a fallback mode as suggested by Andre McCu=
rdy<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Not for the release, just wanted to get this in the queue for=
<br>
&gt; &gt;&gt; when master reopens so we&#39;ll be ready for 4.20+ kernel ve=
rsions<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0meta/classes/kernel.bbclass | 2 +-<br>
&gt; &gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/classes/kernel.bbclass b/meta/classes/kerne=
l.bbclass<br>
&gt; &gt;&gt; index e04d2fe00434..8fe207165ae8 100644<br>
&gt; &gt;&gt; --- a/meta/classes/kernel.bbclass<br>
&gt; &gt;&gt; +++ b/meta/classes/kernel.bbclass<br>
&gt; &gt;&gt; @@ -492,7 +492,7 @@ sysroot_stage_all () {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :<br>
&gt; &gt;&gt;=C2=A0 =C2=A0}<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -KERNEL_CONFIG_COMMAND ?=3D &quot;oe_runmake_call -C ${S} CC=
=3D&quot;${KERNEL_CC}&quot; O=3D${B} oldnoconfig&quot;<br>
&gt; &gt;&gt; +KERNEL_CONFIG_COMMAND ?=3D &quot;oe_runmake_call -C ${S} CC=
=3D&quot;${KERNEL_CC}&quot; O=3D${B} olddefconfig || yes &#39;&#39; | oe_ru=
nmake -C ${S} O=3D${B} CC=3D&quot;${KERNEL_CC}&quot; oldnoconfig&quot;<br>
&gt; &gt;<br>
&gt; &gt; There&#39;s no &quot;yes&quot; needed with oldnoconfig. The new f=
allback should just<br>
&gt; &gt; be the existing default command.<br>
&gt;<br>
&gt; *shrug*<br>
&gt;<br>
&gt; I&#39;ll leave this as is, since it works as tested. Feel free to<br>
&gt; send followups.<br>
<br>
&quot;make oldnoconfig&quot; without the &quot;yes&quot; has been well test=
ed for the past<br>
few OE releases so it&#39;s just odd you decided to change it. Why did<br>
you?<br>
<br>
&gt; &gt;&gt;=C2=A0 =C2=A0python check_oldest_kernel() {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oldest_kernel =3D d.getVar(&#39;OLD=
EST_KERNEL&#39;)<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.5.0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; _______________________________________________<br>
&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000909c95057976ad5e--
