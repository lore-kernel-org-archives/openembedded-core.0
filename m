Return-Path: <andrei@gherzan.ro>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2EBE160E68
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 15:06:47 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id n12so13361066wgh.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2014 07:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=imKGslmOLjfyStDOO4HQ/Z1avzf/YeWpYbtpipmSenU=;
	b=b0/FDsqNulIDnksbFHkHDUzNH8SCf0lXji2MSP1PJq9T6me8XksAYS9XoVoUEdTzoj
	BXM57AuerPrvIgfJ33u0XEmQJ+CAanTP2F+V/wgBz4PPrptnR+gK+5MQ63Dc+1UvjciU
	tbigvhyeX/wBN2rfK93i9gbB7xQQXHqTwHahEStr2fXpWpn9mfRu5mUW3rMYQVwvNgp2
	FfSF17dypXdZDonOOID9HkjjdkIz2MRd9v/ni7o7eCvYxl+9alIPowcaXeQGtC+mZb+U
	P+NlZrMEZDHWmymB6W7dX+i0bitYzV+gUaLxc7ge3wIXxQltzf05iUscTKtUJSoBYBq7
	ySag==
X-Gm-Message-State: ALoCoQkPr1zpt4MlSAd4YLxVOW9GT66gIlxCalEUA4uURefIN7B71YyNl0+N8eixf+iogkf8tNEZ
X-Received: by 10.180.23.99 with SMTP id l3mr2268637wif.26.1388761607765; Fri,
	03 Jan 2014 07:06:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Fri, 3 Jan 2014 07:06:27 -0800 (PST)
X-Originating-IP: [5.13.221.193]
In-Reply-To: <8077054.ZVN9KvzOmn@helios>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<l9pfvj$rqa$1@ger.gmane.org> <20140103112512.GA30264@gmail.com>
	<8077054.ZVN9KvzOmn@helios>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 3 Jan 2014 17:06:27 +0200
Message-ID: <CAK18fxEZNNDK4MOT9+qUwHg5UXcYbqmrAXAHjPSTqiCVnBuRCA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded <openembedded-devel@lists.openembedded.org>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Piglit in Poky
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
X-List-Received-Date: Fri, 03 Jan 2014 15:06:47 -0000
Content-Type: multipart/alternative; boundary=001a11c2ba844f06ba04ef1242b4

--001a11c2ba844f06ba04ef1242b4
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 3, 2014 at 3:26 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> On Friday 03 January 2014 13:25:13 Andrei Gherzan wrote:
> > On Sun, Dec 29, 2013 at 04:44:52PM +0100, Koen Kooi wrote:
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >
> > > Philip Balister schreef op 28-12-13 23:33:
> > > > On 12/28/2013 10:28 AM, Koen Kooi wrote:
> > > >> Paul Eggleton schreef op 28-12-13 12:48:
> > > >>> Hi Koen,
> > > >>>
> > > >>> On Tuesday 24 December 2013 15:22:32 Koen Kooi wrote:
> > > >>>> Burton, Ross schreef op 23-12-13 19:01:
> > > >>>>> We'd like to integrate Piglit (an OpenGL test suite) into Poky
> > > >>>>> so that we can run automated QA on the GL stack.  Piglit is
> > > >>>>> currently residing in meta-oe, but as Poky is a self-contained
> > > >>>>> project we can't just add meta-oe to it:  apart from the size of
> > > >>>>> meta-oe, we can't ensure stability if meta-oe makes incompatible
> > > >>>>> changes that affect Poky.
> > > >>>>>
> > > >>>>> Piglit isn't a stand-alone package, there are the dependencies
> > > >>>>> of waffle, python-mako and python-numpy to consider too.  There
> > > >>>>> are two possibilities I can see:
> > > >>>>>
> > > >>>>> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes
> > > >>>>> only and pushes the boundaries of "core platform".  In a sense
> > > >>>>> this is a repeat of the discussion we had with Midori...  does
> > > >>>>> oe-core contain everything needed to sufficiently exercise the
> > > >>>>> core components it ships or not?
> > > >>>>>
> > > >>>>> 2) Add piglit and deps to meta-yocto.  Probably a new layer
> > > >>>>> called meta-yocto-qa (or similar) because the Yocto Compatible
> > > >>>>> guidelines forbid mixing distribution policy and recipes.
> > > >>>>
> > > >>>> Speaking of layers, can you *please* rename meta-yocto to
> > > >>>> meta-poky? It's what it's actually is and would remove a lot of
> > > >>>> confusion when trying to explain that yocto is not a distro, even
> > > >>>> if the distro layer is called 'meta-yocto'.
> > > >>>
> > > >>> This is a tangent, but a couple of points:
> > > >>>
> > > >>> 1) This rename would not come for free. We'd need to update
> people's
> > > >>> existing bblayers.conf files on the fly, as we did when
> > > >>> meta-yocto-bsp was split out of meta-yocto, and thus bump
> > > >>> LCONF_VERSION; however, doing this only in poky has resulted in
> > > >>> annoying problems when users remove poky from their configurations
> > > >>> (since LCONF_VERSION is out-of-step between Poky and OE-Core,
> leading
> > > >>> to confusing errors in this situation). Thus I think we'd want to
> > > >>> solve this once and for all by bumping the value in OE-Core as well
> > > >>> as Poky.
> > > >>>
> > > >>> 2) If you propose this rename, perhaps you will also consider
> > > >>> renaming meta-oe, since that name within a similarly named
> > > >>> meta-openembedded repository leads to a similar level of
> > > >>> confusion...?
> > > >>
> > > >> I have no problems with renaming that layer since I get confused by
> > > >> this a few times a week myself :)
> > > >
> > > > What would we we rename it to?
> > >
> > > I'm very tempted to suggest 'meta-yocto'
> >
> > I definitely find meta-yocto a better option here. It would save me from
> > some confusion when talking about yocto to other people.
>
> I'm not following; meta-yocto is already called meta-yocto ... ? Maybe you
> didn't realise Koen was joking...
>
>
Misread that. I thought he was talking about poky. Taking back my stupid
statement.



>  > Related to meta-oe, even if that would be a smaller problem, I think
> > meta-openembedded is a better name for that layer too.
>
> That doesn't solve the problem I was talking about, namely that there's
> little
> distinction between meta-openembedded the repository (that contains a
> number
> of layers) and meta-oe which is one of those layers. These are two
> different
> things and the similar naming makes it hard to always know which one people
> are talking about.


In that case the collection of layers should be meta-openembedded and the
meta-oe layer something like meta-openembedded-common or whatever.

-- 
*ag*

--001a11c2ba844f06ba04ef1242b4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Jan 3, 2014 at 3:26 PM, Paul Eggleton <span dir=3D"ltr">&lt=
;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eg=
gleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On F=
riday 03 January 2014 13:25:13 Andrei Gherzan wrote:<br>
&gt; On Sun, Dec 29, 2013 at 04:44:52PM +0100, Koen Kooi wrote:<br>
&gt; &gt; -----BEGIN PGP SIGNED MESSAGE-----<br>
&gt; &gt; Hash: SHA1<br>
&gt; &gt;<br>
&gt; &gt; Philip Balister schreef op 28-12-13 23:33:<br>
&gt; &gt; &gt; On 12/28/2013 10:28 AM, Koen Kooi wrote:<br>
&gt; &gt; &gt;&gt; Paul Eggleton schreef op 28-12-13 12:48:<br>
&gt; &gt; &gt;&gt;&gt; Hi Koen,<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; On Tuesday 24 December 2013 15:22:32 Koen Kooi wrote=
:<br>
&gt; &gt; &gt;&gt;&gt;&gt; Burton, Ross schreef op 23-12-13 19:01:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; We&#39;d like to integrate Piglit (an OpenGL=
 test suite) into Poky<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; so that we can run automated QA on the GL st=
ack. =A0Piglit is<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; currently residing in meta-oe, but as Poky i=
s a self-contained<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; project we can&#39;t just add meta-oe to it:=
 =A0apart from the size of<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; meta-oe, we can&#39;t ensure stability if me=
ta-oe makes incompatible<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; changes that affect Poky.<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; Piglit isn&#39;t a stand-alone package, ther=
e are the dependencies<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; of waffle, python-mako and python-numpy to c=
onsider too. =A0There<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; are two possibilities I can see:<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; 1) Move piglit and deps to oe-core. =A0Pigli=
t is for QA purposes<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; only and pushes the boundaries of &quot;core=
 platform&quot;. =A0In a sense<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; this is a repeat of the discussion we had wi=
th Midori... =A0does<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; oe-core contain everything needed to suffici=
ently exercise the<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; core components it ships or not?<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; 2) Add piglit and deps to meta-yocto. =A0Pro=
bably a new layer<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; called meta-yocto-qa (or similar) because th=
e Yocto Compatible<br>
&gt; &gt; &gt;&gt;&gt;&gt;&gt; guidelines forbid mixing distribution policy=
 and recipes.<br>
&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;&gt; Speaking of layers, can you *please* rename meta=
-yocto to<br>
&gt; &gt; &gt;&gt;&gt;&gt; meta-poky? It&#39;s what it&#39;s actually is an=
d would remove a lot of<br>
&gt; &gt; &gt;&gt;&gt;&gt; confusion when trying to explain that yocto is n=
ot a distro, even<br>
&gt; &gt; &gt;&gt;&gt;&gt; if the distro layer is called &#39;meta-yocto&#3=
9;.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; This is a tangent, but a couple of points:<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; 1) This rename would not come for free. We&#39;d nee=
d to update people&#39;s<br>
&gt; &gt; &gt;&gt;&gt; existing bblayers.conf files on the fly, as we did w=
hen<br>
&gt; &gt; &gt;&gt;&gt; meta-yocto-bsp was split out of meta-yocto, and thus=
 bump<br>
&gt; &gt; &gt;&gt;&gt; LCONF_VERSION; however, doing this only in poky has =
resulted in<br>
&gt; &gt; &gt;&gt;&gt; annoying problems when users remove poky from their =
configurations<br>
&gt; &gt; &gt;&gt;&gt; (since LCONF_VERSION is out-of-step between Poky and=
 OE-Core, leading<br>
&gt; &gt; &gt;&gt;&gt; to confusing errors in this situation). Thus I think=
 we&#39;d want to<br>
&gt; &gt; &gt;&gt;&gt; solve this once and for all by bumping the value in =
OE-Core as well<br>
&gt; &gt; &gt;&gt;&gt; as Poky.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; 2) If you propose this rename, perhaps you will also=
 consider<br>
&gt; &gt; &gt;&gt;&gt; renaming meta-oe, since that name within a similarly=
 named<br>
&gt; &gt; &gt;&gt;&gt; meta-openembedded repository leads to a similar leve=
l of<br>
&gt; &gt; &gt;&gt;&gt; confusion...?<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; I have no problems with renaming that layer since I get =
confused by<br>
&gt; &gt; &gt;&gt; this a few times a week myself :)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What would we we rename it to?<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m very tempted to suggest &#39;meta-yocto&#39;<br>
&gt;<br>
&gt; I definitely find meta-yocto a better option here. It would save me fr=
om<br>
&gt; some confusion when talking about yocto to other people.<br>
<br>
</div></div>I&#39;m not following; meta-yocto is already called meta-yocto =
... ? Maybe you<br>
didn&#39;t realise Koen was joking...<br>
<div class=3D"im"><br></div></blockquote><div><br></div><div>Misread that. =
I thought he was talking about poky. Taking back my stupid statement.</div>=
<div><br></div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"im">
&gt; Related to meta-oe, even if that would be a smaller problem, I think<b=
r>
&gt; meta-openembedded is a better name for that layer too.<br>
<br>
</div>That doesn&#39;t solve the problem I was talking about, namely that t=
here&#39;s little<br>
distinction between meta-openembedded the repository (that contains a numbe=
r<br>
of layers) and meta-oe which is one of those layers. These are two differen=
t<br>
things and the similar naming makes it hard to always know which one people=
<br>
are talking about.</blockquote><div><br></div><div>In that case the collect=
ion of layers should be meta-openembedded and the meta-oe layer something l=
ike meta-openembedded-common or whatever.=A0</div><div><br></div></div>--=
=A0</div>

<div class=3D"gmail_extra"><b style=3D"color:rgb(51,51,51);font-family:Aria=
l;text-align:center">ag</b>
</div></div>

--001a11c2ba844f06ba04ef1242b4--
