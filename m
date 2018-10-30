Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A680A79CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 21:13:25 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w5-v6so14202030wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 14:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=njAZOR9FjwSAise2XldctJuiz2DZHKZ89VkWTly8NFo=;
	b=OSykKm4ygy3sBrLtBkRc8LIb0LaEspR6RNuvqymNNAIVa0YkAKuWQ/kY2HRtGJYw2i
	U0t52A2ovPgp5R6ZxsKeaeQ6LsypiB8/9xIOBNyWmsGAP0kAsBpvGhmWZVX849bz4A8t
	RBgxH1N3GMffKSr6cfrPDb5WqtjRncbWeU6WpvYGgSc5kMJ9LqXbKwPcSaiZRxUnkxQm
	PEpi7OKlia9BVE1GkmeZ30ziWN6T6sPLVTxtohCHEc04XQ7vyoiZdqx5L/OelF8VpXr0
	yEUTjyGuMei5qDPAGV1Ab97ccoz0sm0GOBIW0Radp9YakICL5557/ZtQMHg+JlVUr96D
	OL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=njAZOR9FjwSAise2XldctJuiz2DZHKZ89VkWTly8NFo=;
	b=WPb1o+mMHmB/0RLbiH/nUPPpTFEvuRAR0v3i3U7hmm9ZJhnN7h9erq+RqfVS74MgFL
	FPs7R2tGoKg6WJi0VuW/Ps2db6wV3yQjXRjF1jpv4rE0x11cqtgYMtXp7ZZGIeelc3/9
	ekdtmiGhBvbbZmjQEulyrhRtnQ5S3ZhLyPXxMWyDLedhWIIXp9Dl9nYVQhqKGAWdoxkk
	uHxt0VMiOXvFIksY34OoCJar12q6t3t7c8cdYOXAMZR+HCsebd1gvKFHU7AjSKao9c5w
	k8tGVZJcmSNRBxsKTYMxPdRYaJVn7X02t+pXwApZfdVNtNUjnYlGFaYQfQxyhVTY2CGn
	q09Q==
X-Gm-Message-State: AGRZ1gIo6ceSm/xo+rLPyzOq4FJcF5azkULkykE/rJcRPvhVz2P7TDd8
	pgB2nbtsRNaDr1NDOO3s15sPdX+qUCW0GMBB2fk=
X-Google-Smtp-Source: AJdET5ewOcTPkKmDWFJjaLz8f2gVa2YczpCqdlLRQQ0vABxhPnZw3jDErIfpVfATZJra5zAfCqS3RPoQq1YtTR9BxKE=
X-Received: by 2002:a5d:4cc6:: with SMTP id c6-v6mr286424wrt.75.1540934006226; 
	Tue, 30 Oct 2018 14:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <1540870764-17849-1-git-send-email-bruce.ashfield@windriver.com>
	<CAJ86T=VNvLG06TaqUFpjJ6gqrY=H=eGrW5=FH+QxoCt5hbP0Pw@mail.gmail.com>
	<8b1fa587-7104-b842-72a5-7a175e9f137f@windriver.com>
	<CAJ86T=Wwwzjyp5bY1bsjHVD0dgoLCPJgFdTo_M1z0iWywEnkPw@mail.gmail.com>
	<CA+chaQcSu65UQbGQ-4NPZ4UHc-kFGyzRrrEkWG76j1ewMEQVng@mail.gmail.com>
	<ddd324b6-7d63-f5fa-f882-7b595ca93b78@windriver.com>
In-Reply-To: <ddd324b6-7d63-f5fa-f882-7b595ca93b78@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Oct 2018 22:13:18 +0100
Message-ID: <CA+chaQfXH50yrUqN_yTwEizOtwsqfMv9oBWm0nMZrMhtgFMr0g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 30 Oct 2018 21:13:26 -0000
Content-Type: multipart/alternative; boundary="000000000000104217057978a8b5"

--000000000000104217057978a8b5
Content-Type: text/plain; charset="UTF-8"

+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B}
olddefconfig || yes '' | oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}"
oldnoconfig"

It's the 2 apostrophes after "yes", which look like double quotes in the
font used in gmail, sorry.


On Tue, Oct 30, 2018 at 7:58 PM Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> On 2018-10-30 2:51 PM, Martin Jansa wrote:
>   Agreed with Andre, also the quotes in new version don't match, which
> > makes me wonder how well this was actually tested.
>
> Where are you seeing the non matching quotes ? The CC="" blocks
> have been there for a while, and haven't caused any issues.
> Other than that, I'm seeing matched "", '' and the entire command
> wrapped in "".
>
> It was tested by running configure, definitely worked here.
>
> The 'yes' in the pipeline is just in case there is some kernel
> somewhere with a patch, and the pipeline could stall. Since it
> is the last option in the compound statement, I definitely wanted
> it to complete.
>
> I can drop the yes, but I'm pretty sure the extra overhead wouldn't
> have harmed anyone.
>
> >
> > Using apostrophes inside quoted string value would make it easier to see
> > that there is extra " after the useless yes call.
>
> I'm still not seeing the extra quote.
>
> Bruce
>
> >
> > On Tue, Oct 30, 2018 at 6:31 PM Andre McCurdy <armccurdy@gmail.com
> > <mailto:armccurdy@gmail.com>> wrote:
> >
> >     On Tue, Oct 30, 2018 at 10:17 AM Bruce Ashfield
> >     <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>>
> >     wrote:
> >      >
> >      > On 10/30/18 1:02 PM, Andre McCurdy wrote:
> >      > > On Mon, Oct 29, 2018 at 8:39 PM Bruce Ashfield
> >      > > <bruce.ashfield@windriver.com
> >     <mailto:bruce.ashfield@windriver.com>> wrote:
> >      > >>
> >      > >> As was warned by commit 312ee68752fa [kconfig: announce
> removal of
> >      > >> oldnoconfig if used], oldnoconfig has been removed from the
> >     4.20 kernel.
> >      > >>
> >      > >> So we switch our default mode to olddefconfig.
> >      > >>
> >      > >> commit fb16d8912 [kconfig: replace 'oldnoconfig' with
> >     'olddefconfig',
> >      > >> and keep the old name as an alias] introduced olddefconfig in
> >     the 3.10
> >      > >> kernel, we shuffle oldnoconfig to the fallback target.
> >      > >>
> >      > >> The fallback mode allows kernels between 3.10 and the
> >     currently listed
> >      > >> oldest kernel of 3.2 to continue to configure.
> >      > >>
> >      > >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com
> >     <mailto:bruce.ashfield@windriver.com>>
> >      > >> ---
> >      > >>
> >      > >> v2: Tweaked to add a fallback mode as suggested by Andre
> McCurdy
> >      > >>
> >      > >> Not for the release, just wanted to get this in the queue for
> >      > >> when master reopens so we'll be ready for 4.20+ kernel versions
> >      > >>
> >      > >> Bruce
> >      > >>
> >      > >>
> >      > >>   meta/classes/kernel.bbclass | 2 +-
> >      > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >      > >>
> >      > >> diff --git a/meta/classes/kernel.bbclass
> >     b/meta/classes/kernel.bbclass
> >      > >> index e04d2fe00434..8fe207165ae8 100644
> >      > >> --- a/meta/classes/kernel.bbclass
> >      > >> +++ b/meta/classes/kernel.bbclass
> >      > >> @@ -492,7 +492,7 @@ sysroot_stage_all () {
> >      > >>          :
> >      > >>   }
> >      > >>
> >      > >> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S}
> >     CC="${KERNEL_CC}" O=${B} oldnoconfig"
> >      > >> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S}
> >     CC="${KERNEL_CC}" O=${B} olddefconfig || yes '' | oe_runmake -C ${S}
> >     O=${B} CC="${KERNEL_CC}" oldnoconfig"
> >      > >
> >      > > There's no "yes" needed with oldnoconfig. The new fallback
> >     should just
> >      > > be the existing default command.
> >      >
> >      > *shrug*
> >      >
> >      > I'll leave this as is, since it works as tested. Feel free to
> >      > send followups.
> >
> >     "make oldnoconfig" without the "yes" has been well tested for the
> past
> >     few OE releases so it's just odd you decided to change it. Why did
> >     you?
> >
> >      > >>   python check_oldest_kernel() {
> >      > >>       oldest_kernel = d.getVar('OLDEST_KERNEL')
> >      > >> --
> >      > >> 2.5.0
> >      > >>
> >      > >> --
> >      > >> _______________________________________________
> >      > >> Openembedded-core mailing list
> >      > >> Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >      > >>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >      >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>
>

--000000000000104217057978a8b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+KERNEL_CONFIG_COMMAND ?=3D &quot;oe_runmake_call -C ${S} =
CC=3D&quot;${KERNEL_CC}&quot; O=3D${B} olddefconfig || yes &#39;&#39; | oe_=
runmake -C ${S} O=3D${B} CC=3D&quot;${KERNEL_CC}&quot; oldnoconfig&quot;=C2=
=A0<div><br></div><div>It&#39;s the 2 apostrophes after &quot;yes&quot;, wh=
ich look like double quotes in the font used in gmail, sorry.</div><div><di=
v>=C2=A0<br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Tue, Oct 30, 2018 at 7:58 PM Bruce Ashfield &lt;<a href=3D"mailto:bru=
ce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On 2018-10-30 2:51 PM, Martin Jansa wro=
te:<br>
=C2=A0 Agreed with Andre, also the quotes in new version don&#39;t match, w=
hich<br>
&gt; makes me wonder how well this was actually tested.<br>
<br>
Where are you seeing the non matching quotes ? The CC=3D&quot;&quot; blocks=
<br>
have been there for a while, and haven&#39;t caused any issues.<br>
Other than that, I&#39;m seeing matched &quot;&quot;, &#39;&#39; and the en=
tire command<br>
wrapped in &quot;&quot;.<br>
<br>
It was tested by running configure, definitely worked here.<br>
<br>
The &#39;yes&#39; in the pipeline is just in case there is some kernel<br>
somewhere with a patch, and the pipeline could stall. Since it<br>
is the last option in the compound statement, I definitely wanted<br>
it to complete.<br>
<br>
I can drop the yes, but I&#39;m pretty sure the extra overhead wouldn&#39;t=
<br>
have harmed anyone.<br>
<br>
&gt; <br>
&gt; Using apostrophes inside quoted string value would make it easier to s=
ee <br>
&gt; that there is extra &quot; after the useless yes call.<br>
<br>
I&#39;m still not seeing the extra quote.<br>
<br>
Bruce<br>
<br>
&gt; <br>
&gt; On Tue, Oct 30, 2018 at 6:31 PM Andre McCurdy &lt;<a href=3D"mailto:ar=
mccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">ar=
mccurdy@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, Oct 30, 2018 at 10:17 AM Bruce Ashfield<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:bruce.ashfield@windriver.com"=
 target=3D"_blank">bruce.ashfield@windriver.com</a> &lt;mailto:<a href=3D"m=
ailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windri=
ver.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On 10/30/18 1:02 PM, Andre McCurdy wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; On Mon, Oct 29, 2018 at 8:39 PM Bruce As=
hfield<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; &lt;<a href=3D"mailto:bruce.ashfield@win=
driver.com" target=3D"_blank">bruce.ashfield@windriver.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:bruce.ashfield@windriv=
er.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;&gt; wrote:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; As was warned by commit 312ee68752fa=
 [kconfig: announce removal of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; oldnoconfig if used], oldnoconfig ha=
s been removed from the<br>
&gt;=C2=A0 =C2=A0 =C2=A04.20 kernel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; So we switch our default mode to old=
defconfig.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; commit fb16d8912 [kconfig: replace &=
#39;oldnoconfig&#39; with<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;olddefconfig&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; and keep the old name as an alias] i=
ntroduced olddefconfig in<br>
&gt;=C2=A0 =C2=A0 =C2=A0the 3.10<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; kernel, we shuffle oldnoconfig to th=
e fallback target.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; The fallback mode allows kernels bet=
ween 3.10 and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0currently listed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; oldest kernel of 3.2 to continue to =
configure.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; Signed-off-by: Bruce Ashfield &lt;<a=
 href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfi=
eld@windriver.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:bruce.ashfield@windriv=
er.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; v2: Tweaked to add a fallback mode a=
s suggested by Andre McCurdy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; Not for the release, just wanted to =
get this in the queue for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; when master reopens so we&#39;ll be =
ready for 4.20+ kernel versions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; Bruce<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;=C2=A0 =C2=A0meta/classes/kernel.bbcl=
ass | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;=C2=A0 =C2=A01 file changed, 1 insert=
ion(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; diff --git a/meta/classes/kernel.bbc=
lass<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/classes/kernel.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; index e04d2fe00434..8fe207165ae8 100=
644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; --- a/meta/classes/kernel.bbclass<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; +++ b/meta/classes/kernel.bbclass<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; @@ -492,7 +492,7 @@ sysroot_stage_al=
l () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; -KERNEL_CONFIG_COMMAND ?=3D &quot;oe=
_runmake_call -C ${S}<br>
&gt;=C2=A0 =C2=A0 =C2=A0CC=3D&quot;${KERNEL_CC}&quot; O=3D${B} oldnoconfig&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; +KERNEL_CONFIG_COMMAND ?=3D &quot;oe=
_runmake_call -C ${S}<br>
&gt;=C2=A0 =C2=A0 =C2=A0CC=3D&quot;${KERNEL_CC}&quot; O=3D${B} olddefconfig=
 || yes &#39;&#39; | oe_runmake -C ${S}<br>
&gt;=C2=A0 =C2=A0 =C2=A0O=3D${B} CC=3D&quot;${KERNEL_CC}&quot; oldnoconfig&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; There&#39;s no &quot;yes&quot; needed wi=
th oldnoconfig. The new fallback<br>
&gt;=C2=A0 =C2=A0 =C2=A0should just<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; be the existing default command.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; *shrug*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;ll leave this as is, since it works as =
tested. Feel free to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; send followups.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;make oldnoconfig&quot; without the &quot;yes&=
quot; has been well tested for the past<br>
&gt;=C2=A0 =C2=A0 =C2=A0few OE releases so it&#39;s just odd you decided to=
 change it. Why did<br>
&gt;=C2=A0 =C2=A0 =C2=A0you?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;=C2=A0 =C2=A0python check_oldest_kern=
el() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oldest_ker=
nel =3D d.getVar(&#39;OLDEST_KERNEL&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; 2.5.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; ____________________________________=
___________<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@=
lists.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembed=
ded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-core@list=
s.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;&gt; <a href=3D"http://lists.openembedded=
.org/mailman/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blan=
k">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0_______________________________________________<br>
&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.openembed=
ded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-core@list=
s.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.=
org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists=
.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt; <br>
<br>
</blockquote></div>

--000000000000104217057978a8b5--
