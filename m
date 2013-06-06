Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 102086A8B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 16:28:07 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id n12so2429350oag.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 09:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=E6JKaRi0mDTZ0CFWq5tdj6DGKz0cJOmYcikVSQPQ3oo=;
	b=et1nzgLlOW9BCsiL15B5VKwLVuG9B6pGoqOjrnHk6cu9T8Zf3kTfXxBhQaec/FTq4U
	reCu/BJrvS5JeLl9oL58cNIkVqGTpeVLVEFq4TcoDIGuvlsPY1PW2mew7KWq1W9jY0Bo
	VJeSmSmLyiJ9eaQhiW/bKIZ7JWvgESXeDEdaGnjmM1ZM0+R05cV3V0I+ue/Umg8PrKrC
	v222qk9Gl6JZfWlCDOWkdMkLNNRttadI+AGtE2H8bqTMhjzw40/UOx3izjEihjSQ0Z3o
	lPDNPXOy6eQ4HLgQ451PL+K5+MdqVuAaFLZtD/DSkt/fuiLoc7osIj2HCs9humYQf78Z
	KF2Q==
MIME-Version: 1.0
X-Received: by 10.60.94.70 with SMTP id da6mr18733719oeb.63.1370536088704;
	Thu, 06 Jun 2013 09:28:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Thu, 6 Jun 2013 09:28:08 -0700 (PDT)
In-Reply-To: <1370533615.6864.4.camel@ted>
References: <CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
	<51AF6E2F.8040309@linux.intel.com>
	<CAP9ODKrxMh3PGGwVHdVFcUL2-Ag4vA2bAKr+3PGKGNDzwMJnpg@mail.gmail.com>
	<51AF7336.8050802@linux.intel.com>
	<CAP71WjxL2g=k5hcgAo70Linsf-Occ-tdh1jM+ppYmghALDsq3w@mail.gmail.com>
	<CAP9ODKqiVaF3njGCLXHhT7n03d-QyESQAdw3S+HF2-JNEazCMw@mail.gmail.com>
	<20130605200740.GF10298@denix.org>
	<CAP9ODKr+SnNDEZJ4ON-fDpyZdjOTdVu+9=trCyEpmvHZa5AiwA@mail.gmail.com>
	<51AFA565.3040607@linux.intel.com>
	<CAP9ODKrzy+L9mptVFwNT5VvsxQt42igrQbE2m=yTzAw2Me3txg@mail.gmail.com>
	<20130605205801.GI10298@denix.org> <1370533615.6864.4.camel@ted>
Date: Thu, 6 Jun 2013 13:28:08 -0300
X-Google-Sender-Auth: PkczQxV84eOFh37UF47TlsQ7Yc0
Message-ID: <CAP9ODKqvsiYsJ5FsLtn9mhtfnc0idTuEeOrUjwWXz4dzW6LPiQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH dylan, master] Fix meta-toolchain-qte SDK build for x11-less DISTRO
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
X-List-Received-Date: Thu, 06 Jun 2013 16:28:08 -0000
Content-Type: multipart/alternative; boundary=089e012287c0b86f6804de7ecc04

--089e012287c0b86f6804de7ecc04
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 6, 2013 at 12:46 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2013-06-05 at 16:58 -0400, Denys Dmytriyenko wrote:
> > On Wed, Jun 05, 2013 at 05:56:31PM -0300, Otavio Salvador wrote:
> > > On Wed, Jun 5, 2013 at 5:53 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > >
> > > > On 06/05/2013 01:10 PM, Otavio Salvador wrote:
> > > >
> > > >>
> > > >>
> > > >>
> > > >> On Wed, Jun 5, 2013 at 5:07 PM, Denys Dmytriyenko <denis@denix.org
> > > >> <mailto:denis@denix.org>> wrote:
> > > >>
> > > >>     On Wed, Jun 05, 2013 at 02:43:07PM -0300, Otavio Salvador wrote:
> > > >>      > On Wed, Jun 5, 2013 at 2:23 PM, Nicolas Dechesne <
> > > >>      > nicolas.dechesne@linaro.org <mailto:nicolas.dechesne@**
> linaro.org<nicolas.dechesne@linaro.org>
> > > >> >>
> > > >>
> > > >>     wrote:
> > > >>      >
> > > >>      > >
> > > >>      > >
> > > >>      > >
> > > >>      > > On Wed, Jun 5, 2013 at 7:19 PM, Saul Wold <
> sgw@linux.intel.com
> > > >>     <mailto:sgw@linux.intel.com>> wrote:
> > > >>      > >
> > > >>      > >> On 06/05/2013 10:12 AM, Otavio Salvador wrote:
> > > >>      > >>
> > > >>      > >>>
> > > >>      > >>>
> > > >>      > >>>
> > > >>      > >>> On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold
> > > >>     <sgw@linux.intel.com <mailto:sgw@linux.intel.com>
> > > >>      > >>> <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com
> >>>
> > > >> wrote:
> > > >>      > >>>
> > > >>      > >>>     On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:
> > > >>      > >>>
> > > >>      > >>>
> > > >>      > >>>         On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold
> > > >>     <sgw@linux.intel.com <mailto:sgw@linux.intel.com>
> > > >>      > >>>         <mailto:sgw@linux.intel.com <mailto:
> > > >> sgw@linux.intel.com>>
> > > >>      > >>>         <mailto:sgw@linux.intel.com
> > > >>     <mailto:sgw@linux.intel.com> <mailto:sgw@linux.intel.com
> > > >>     <mailto:sgw@linux.intel.com>>>**>
> > > >>      > >>> wrote:
> > > >>      > >>>
> > > >>      > >>>              You could just directly put the
> nativesdk-libx11
> > > >>     in place
> > > >>      > >>>         of the
> > > >>      > >>>              variable, no need to have the variable
> there.
> > > >>      > >>>
> > > >>      > >>>
> > > >>      > >>>         yes, that's what I had initially, but found it
> was
> > > >>     less easy to
> > > >>      > >>>         read...
> > > >>      > >>>         with X11DEPENDS it's more 'obvious' that there is
> > > >>     something
> > > >>      > >>>         special..
> > > >>      > >>>         that said, i can make the change if that's really
> > > >> needed.
> > > >>      > >>>
> > > >>      > >>>     We do use the X11DEPENDS elsewhere when there are
> multiple
> > > >>      > >>>     dependencies, but I also found cases where we just
> > > >>     include the
> > > >>      > >>>     dependency directly in the test. I was trying pick a
> > > >>     direction:
> > > >>      > >>>     single entry no X11DEPENDS, multiple entries use
> > > >> X11DEPENDS.
> > > >>      > >>>
> > > >>      > >>>     Comments, flames, ...
> > > >>      > >>>
> > > >>      > >>>
> > > >>      > >>> Yes; I sent this patch in Febuary:
> > > >>      > >>>
> > > >>     http://patchwork.openembedded.****org/patch/44759/<http://**
> > > >> patchwork.openembedded.org/**patch/44759/<
> http://patchwork.openembedded.org/patch/44759/>
> > > >> >
> > > >>      > >>>
> > > >>      > >>> Please use this one instead of the recent one.
> > > >>      > >>>
> > > >>      > >>>
> > > >>      > >> Well reading back on that, it looks like I was waiting
> for an
> > > >>      > >> EXTRA_OECONF or related change to the autoconf scripts.
> > > >>      > >>
> > > >>      > >> Sau!
> > > >>      > >
> > > >>      > >
> > > >>      > > hmm. ok, sorry Otavio, i missed the other patch. I will
> check
> > > >>     on my side
> > > >>      > > too about EXTRA_OECONF.
> > > >>      > >
> > > >>      >
> > > >>      > Nicolas, don't worry. It is normal to end redoing some stuff.
> > > >>      >
> > > >>      > Last time I checked it had no support in Qt build system; I
> am
> > > >>     not sure if
> > > >>      > it uses or not the host headers (in case they exist) but it
> needs
> > > >>     testing
> > > >>      > to be sure.
> > > >>
> > > >>     I can confirm that it does not link against host X11 when built
> w/o
> > > >> that
> > > >>     dependency and nativesdk has no x11 libs/headers. As I
> previously
> > > >>     mentioned,
> > > >>     we've been using this fix for over 6 months on several releases
> built
> > > >> on
> > > >>     different machines w/o problems...
> > > >>
> > > >>
> > > >> In this case the patch can be merged 'as is'.
> > > >>
> > > >>
> > > > I am still concerned about a floating dependency here, imagine the
> > > > following:
> > > >
> > > > Build the toolchain with X11 enabled, nativesdk-libx11 is build, now
> > > > rebuild with X11 disabled, the dependency is gone, but the libraries
> and
> > > > headers still exist in the sysroot and thus the configure will still
> enable
> > > > x11 in qte, bad things happen.
> > > >
> > >
> > > I expect different distro features to have different build dirs. No?
> > >
> > >
> > > > We need to have a disable flag to autotools.
> > > >
> > >
> > > The qmake based system does not provide this; so to support it, it will
> > > need to be a hack ...
> >
> > I agree with Otavio here - seems like you are after a rare corner case
> here...
>
> We need determinism in the builds. Yes in this case it might be hard to
> achieve but I do think we need to achieve it.
>
> So this patch isn't going in until we can avoid this option magically
> floating, sorry. I've said this before and I've not changed my mind.
>

It is completely deterministic that it is *broken* for every one not using
a DISTRO with X11; this is deterministic enough for me to justify it go in.
As most of people didn't complain about this before, it is clear most use
*x11* feature and thus this won't affect them.

I see no point in delay it; complete determinism is better - sure - but a
broken Qt toolchain for x11less systems does not improve it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e012287c0b86f6804de7ecc04
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jun 6, 2013 at 12:46 PM, Richard Purdie <span dir=3D"ltr">&=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">=
richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On W=
ed, 2013-06-05 at 16:58 -0400, Denys Dmytriyenko wrote:<br>
&gt; On Wed, Jun 05, 2013 at 05:56:31PM -0300, Otavio Salvador wrote:<br>
&gt; &gt; On Wed, Jun 5, 2013 at 5:53 PM, Saul Wold &lt;<a href=3D"mailto:s=
gw@linux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; On 06/05/2013 01:10 PM, Otavio Salvador wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; On Wed, Jun 5, 2013 at 5:07 PM, Denys Dmytriyenko &lt;<a=
 href=3D"mailto:denis@denix.org">denis@denix.org</a><br>
&gt; &gt; &gt;&gt; &lt;mailto:<a href=3D"mailto:denis@denix.org">denis@deni=
x.org</a>&gt;&gt; wrote:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 On Wed, Jun 05, 2013 at 02:43:07PM -0300, Otavio=
 Salvador wrote:<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; On Wed, Jun 5, 2013 at 2:23 PM, Nicolas =
Dechesne &lt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; <a href=3D"mailto:nicolas.dechesne@linar=
o.org">nicolas.dechesne@linaro.org</a> &lt;mailto:<a href=3D"mailto:nicolas=
.dechesne@">nicolas.dechesne@</a>**<a href=3D"http://linaro.org" target=3D"=
_blank">linaro.org</a>&lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">ni=
colas.dechesne@linaro.org</a>&gt;<br>

&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 wrote:<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt; On Wed, Jun 5, 2013 at 7:19 PM, Sau=
l Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a><b=
r>
&gt; &gt; &gt;&gt; =A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com=
">sgw@linux.intel.com</a>&gt;&gt; wrote:<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt; On 06/05/2013 10:12 AM, Otavio =
Salvador wrote:<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; On Wed, Jun 5, 2013 at 1:58=
 PM, Saul Wold<br>
&gt; &gt; &gt;&gt; =A0 =A0 &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@l=
inux.intel.com</a> &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com">sgw@li=
nux.intel.com</a>&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; &lt;mailto:<a href=3D"mailt=
o:sgw@linux.intel.com">sgw@linux.intel.com</a> &lt;mailto:<a href=3D"mailto=
:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; wrote:<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 On 06/05/2013 09:32=
 AM, Nicolas Dechesne wrote:<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 On Wed, Jun=
 5, 2013 at 6:30 PM, Saul Wold<br>
&gt; &gt; &gt;&gt; =A0 =A0 &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@l=
inux.intel.com</a> &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com">sgw@li=
nux.intel.com</a>&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 &lt;mailto:=
<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a> &lt;mailto:<=
br>
&gt; &gt; &gt;&gt; <a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.c=
om</a>&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 &lt;mailto:=
<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a><br>
&gt; &gt; &gt;&gt; =A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com=
">sgw@linux.intel.com</a>&gt; &lt;mailto:<a href=3D"mailto:sgw@linux.intel.=
com">sgw@linux.intel.com</a><br>
&gt; &gt; &gt;&gt; =A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com=
">sgw@linux.intel.com</a>&gt;&gt;&gt;**&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; wrote:<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0=
You could just directly put the nativesdk-libx11<br>
&gt; &gt; &gt;&gt; =A0 =A0 in place<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 of the<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0=
variable, no need to have the variable there.<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 yes, that&#=
39;s what I had initially, but found it was<br>
&gt; &gt; &gt;&gt; =A0 =A0 less easy to<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 read...<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 with X11DEP=
ENDS it&#39;s more &#39;obvious&#39; that there is<br>
&gt; &gt; &gt;&gt; =A0 =A0 something<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 special..<b=
r>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 that said, =
i can make the change if that&#39;s really<br>
&gt; &gt; &gt;&gt; needed.<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 We do use the X11DE=
PENDS elsewhere when there are multiple<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 dependencies, but I=
 also found cases where we just<br>
&gt; &gt; &gt;&gt; =A0 =A0 include the<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 dependency directly=
 in the test. I was trying pick a<br>
&gt; &gt; &gt;&gt; =A0 =A0 direction:<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 single entry no X11=
DEPENDS, multiple entries use<br>
&gt; &gt; &gt;&gt; X11DEPENDS.<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 Comments, flames, .=
..<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; Yes; I sent this patch in F=
ebuary:<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 <a href=3D"http://patchwork.openembedded." targe=
t=3D"_blank">http://patchwork.openembedded.</a>****org/patch/44759/&lt;http=
://**<br>
&gt; &gt; &gt;&gt; <a href=3D"http://patchwork.openembedded.org/**patch/447=
59/" target=3D"_blank">patchwork.openembedded.org/**patch/44759/</a>&lt;<a =
href=3D"http://patchwork.openembedded.org/patch/44759/" target=3D"_blank">h=
ttp://patchwork.openembedded.org/patch/44759/</a>&gt;<br>

&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt; Please use this one instead=
 of the recent one.<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt; Well reading back on that, it l=
ooks like I was waiting for an<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt; EXTRA_OECONF or related change =
to the autoconf scripts.<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;&gt; Sau!<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt; hmm. ok, sorry Otavio, i missed the=
 other patch. I will check<br>
&gt; &gt; &gt;&gt; =A0 =A0 on my side<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt; too about EXTRA_OECONF.<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; &gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; Nicolas, don&#39;t worry. It is normal t=
o end redoing some stuff.<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; Last time I checked it had no support in=
 Qt build system; I am<br>
&gt; &gt; &gt;&gt; =A0 =A0 not sure if<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; it uses or not the host headers (in case=
 they exist) but it needs<br>
&gt; &gt; &gt;&gt; =A0 =A0 testing<br>
&gt; &gt; &gt;&gt; =A0 =A0 =A0&gt; to be sure.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; =A0 =A0 I can confirm that it does not link against host=
 X11 when built w/o<br>
&gt; &gt; &gt;&gt; that<br>
&gt; &gt; &gt;&gt; =A0 =A0 dependency and nativesdk has no x11 libs/headers=
. As I previously<br>
&gt; &gt; &gt;&gt; =A0 =A0 mentioned,<br>
&gt; &gt; &gt;&gt; =A0 =A0 we&#39;ve been using this fix for over 6 months =
on several releases built<br>
&gt; &gt; &gt;&gt; on<br>
&gt; &gt; &gt;&gt; =A0 =A0 different machines w/o problems...<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; In this case the patch can be merged &#39;as is&#39;.<br=
>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; I am still concerned about a floating dependency here, imagi=
ne the<br>
&gt; &gt; &gt; following:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Build the toolchain with X11 enabled, nativesdk-libx11 is bu=
ild, now<br>
&gt; &gt; &gt; rebuild with X11 disabled, the dependency is gone, but the l=
ibraries and<br>
&gt; &gt; &gt; headers still exist in the sysroot and thus the configure wi=
ll still enable<br>
&gt; &gt; &gt; x11 in qte, bad things happen.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I expect different distro features to have different build dirs. =
No?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; We need to have a disable flag to autotools.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; The qmake based system does not provide this; so to support it, i=
t will<br>
&gt; &gt; need to be a hack ...<br>
&gt;<br>
&gt; I agree with Otavio here - seems like you are after a rare corner case=
 here...<br>
<br>
</div></div>We need determinism in the builds. Yes in this case it might be=
 hard to<br>
achieve but I do think we need to achieve it.<br>
<br>
So this patch isn&#39;t going in until we can avoid this option magically<b=
r>
floating, sorry. I&#39;ve said this before and I&#39;ve not changed my mind=
.<br></blockquote><div><br></div><div style>It is completely=A0deterministi=
c that it is *broken* for every one not using a DISTRO with X11; this is de=
terministic enough for me to justify it go in. As most of people didn&#39;t=
 complain about this before, it is clear most use *x11* feature and thus th=
is won&#39;t affect them.</div>
<div style><br></div><div style>I see no point in delay it; complete determ=
inism is better - sure - but a broken Qt toolchain for x11less systems does=
 not improve it.=A0</div><div>=A0</div></div>-- <br>Otavio Salvador =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>Mobile: +55 (53) =
9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--089e012287c0b86f6804de7ecc04--
