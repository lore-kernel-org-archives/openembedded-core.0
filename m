Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 36DE061EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 12:19:57 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id g12so3253213oah.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 05:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=BusXlJMXfKSXL4KWUmEyP1V0PO+7jp7cvS6bXyKhCJY=;
	b=bflJJ8x/kzMKOiqI22VtwLKtfOzztPKTnIhEW+Pz7PrBORaFdjT2yv3gDvtWTCHft1
	x+61ex+YTg6PbwZlrZFyVROZw8xDbhcruqWDRK2v535pwRQk0HV1C8fU8/dSXkaUX9gK
	V3r7dv6ycAQ7/12IMcXlWFtsFf3xhV2dBeR5rp3uXwa9PAfrw7k47vt8srqE1S9WWbjN
	USCcyCZHZ4Ph4SZCpA7IuQDsje+PQPgpT27n30+o3muDqoI83+48jZ0hxpGSnC3uDgq4
	q9uuB1O6mCyv8ncdveFLeOwUZWtDf7YuVQcy035hnxaeeR3u5ORc+NoWQ/y4Bst91/Z2
	kf+Q==
X-Received: by 10.60.80.103 with SMTP id q7mr20964169oex.135.1370607597704;
	Fri, 07 Jun 2013 05:19:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Fri, 7 Jun 2013 05:19:37 -0700 (PDT)
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
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 7 Jun 2013 14:19:37 +0200
Message-ID: <CAP71Wjw2VaWBjkq70SNj+_-nkynOW88uWKYX6ZrzkzkkrykYcA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQkE9An3VHS6LHI6dTOz8tF9shusfpox4H+Op3402c6boZR14f/SKgjTYozYpomZTjFPsJlh
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 07 Jun 2013 12:19:57 -0000
Content-Type: multipart/alternative; boundary=089e011828b4fd04e804de8f72b4

--089e011828b4fd04e804de8f72b4
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 6, 2013 at 5:46 PM, Richard Purdie <
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

I think the -embedded flag in the configure option is what makes a QT build
Embedded vs X11, at least based on [1].

what's disturbing to me is that we use the -embedded flag in
nativesdk-qt4-toos recipe whether we build meta-toolchain-qt or
meta-toolchain-qte, since both ends up with RDEPENDS on
nativesdk-qt4-tools, and we have the -embedded flag here in EXTRA_OECONF,
see [2].

what does that actually imply? unfortunately i am not enough familiar with
that, and I don't get it, but it looks like it could be a problem. are the
generated QT SDK tested in X11 and QTe configuration?

we can clearly see in [3] and [4] that we play with the -embedded flag when
building the target qt4 recipe, though.

[1] http://qt-project.org/doc/qt-4.8/qt-embedded-install.html
[2]
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-qt/qt4/qt4-native.inc#n38
[3]
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-qt/qt4/qt4-embedded.inc#n13
[4]
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb#n8


> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e011828b4fd04e804de8f72b4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jun 6, 2013 at 5:46 PM, Richard Purdie <span dir=3D"ltr">&l=
t;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">r=
ichard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D""><div class=3D"h5">On Wed, 2013-06-05 at 16=
:58 -0400, Denys Dmytriyenko wrote:<br>


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
.<br></blockquote><div><br></div><div style>I think the -embedded flag in t=
he configure option is what makes a QT build Embedded vs X11, at least base=
d on [1].</div>

<div style><br></div><div style>what&#39;s disturbing to me is that we use =
the -embedded flag in nativesdk-qt4-toos recipe whether we build meta-toolc=
hain-qt or meta-toolchain-qte, since both ends up with RDEPENDS on nativesd=
k-qt4-tools, and we have the -embedded flag here in EXTRA_OECONF, see [2].=
=A0</div>

<div style><br></div><div style>what does that actually imply? unfortunatel=
y i am not enough familiar with that, and I don&#39;t get it, but it looks =
like it could be a problem. are the generated QT SDK tested in X11 and QTe =
configuration?=A0</div>

<div style><br></div><div style>we can clearly see in [3] and [4] that we p=
lay with the -embedded flag when building the target qt4 recipe, though.</d=
iv><div style><br></div><div style>[1]=A0<a href=3D"http://qt-project.org/d=
oc/qt-4.8/qt-embedded-install.html">http://qt-project.org/doc/qt-4.8/qt-emb=
edded-install.html</a>=A0</div>

<div style>[2]=A0<a href=3D"http://cgit.openembedded.org/openembedded-core/=
tree/meta/recipes-qt/qt4/qt4-native.inc#n38">http://cgit.openembedded.org/o=
penembedded-core/tree/meta/recipes-qt/qt4/qt4-native.inc#n38</a></div><div =
style>

[3]=A0<a href=3D"http://cgit.openembedded.org/openembedded-core/tree/meta/r=
ecipes-qt/qt4/qt4-embedded.inc#n13">http://cgit.openembedded.org/openembedd=
ed-core/tree/meta/recipes-qt/qt4/qt4-embedded.inc#n13</a></div><div style>
[4]=A0<a href=3D"http://cgit.openembedded.org/openembedded-core/tree/meta/r=
ecipes-qt/qt4/qt4-x11-free_4.8.4.bb#n8">http://cgit.openembedded.org/openem=
bedded-core/tree/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb#n8</a></div>
<div style><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D""><div class=3D"h5"><br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div></div>

--089e011828b4fd04e804de8f72b4--
