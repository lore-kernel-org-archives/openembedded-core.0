Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id C50366041D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 20:10:15 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id dn14so3369155obc.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=9NxL2FXe2uEiUbrm+ozQU2ZO4O0QemDYZuwW6NxGFcg=;
	b=BlL5eestq21gl6Y+bNp1c7Ps7yBkw47OwJFt3ETUH2BKtWW1TbU5yN4Y1j9AtbmP+W
	q0sb38x8fg9QBLCbZ72Ckl8nVlz2VX4dOJDcAo+BgKspFoU/JFgZv97fy3Bk5x156l/4
	WknqsfwWAXertTg+8dfTxul+qKg+3oJ727q3Gcj7kKnpjr4Td92evGhYiHXwgKPV1aTb
	dZor5/0kJoqvTOmVe7YvZ1YHuKL8QyyObJNU1G4MzrePm3D7o/vMMyb2qC4RtZgK1ZA3
	kA384zGR43jml26epKQjhKGsym6Hn8gI4d/rqY2fSiNdvXJ0chIJd/564XD8OfwJ55ia
	05QQ==
MIME-Version: 1.0
X-Received: by 10.182.233.137 with SMTP id tw9mr1432306obc.2.1370463016012;
	Wed, 05 Jun 2013 13:10:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Wed, 5 Jun 2013 13:10:15 -0700 (PDT)
In-Reply-To: <20130605200740.GF10298@denix.org>
References: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
	<51AF67B8.20502@linux.intel.com>
	<CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
	<51AF6E2F.8040309@linux.intel.com>
	<CAP9ODKrxMh3PGGwVHdVFcUL2-Ag4vA2bAKr+3PGKGNDzwMJnpg@mail.gmail.com>
	<51AF7336.8050802@linux.intel.com>
	<CAP71WjxL2g=k5hcgAo70Linsf-Occ-tdh1jM+ppYmghALDsq3w@mail.gmail.com>
	<CAP9ODKqiVaF3njGCLXHhT7n03d-QyESQAdw3S+HF2-JNEazCMw@mail.gmail.com>
	<20130605200740.GF10298@denix.org>
Date: Wed, 5 Jun 2013 17:10:15 -0300
X-Google-Sender-Auth: t4kNiN92EJ4O7uX1bN7U2aLEe18
Message-ID: <CAP9ODKr+SnNDEZJ4ON-fDpyZdjOTdVu+9=trCyEpmvHZa5AiwA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Wed, 05 Jun 2013 20:10:16 -0000
Content-Type: multipart/alternative; boundary=001a11c1c5563f9f4404de6dc944

--001a11c1c5563f9f4404de6dc944
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 5, 2013 at 5:07 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Wed, Jun 05, 2013 at 02:43:07PM -0300, Otavio Salvador wrote:
> > On Wed, Jun 5, 2013 at 2:23 PM, Nicolas Dechesne <
> > nicolas.dechesne@linaro.org> wrote:
> >
> > >
> > >
> > >
> > > On Wed, Jun 5, 2013 at 7:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > >
> > >> On 06/05/2013 10:12 AM, Otavio Salvador wrote:
> > >>
> > >>>
> > >>>
> > >>>
> > >>> On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold <sgw@linux.intel.com
> > >>> <mailto:sgw@linux.intel.com>> wrote:
> > >>>
> > >>>     On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:
> > >>>
> > >>>
> > >>>         On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold <
> sgw@linux.intel.com
> > >>>         <mailto:sgw@linux.intel.com>
> > >>>         <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com>>>
> > >>> wrote:
> > >>>
> > >>>              You could just directly put the nativesdk-libx11 in
> place
> > >>>         of the
> > >>>              variable, no need to have the variable there.
> > >>>
> > >>>
> > >>>         yes, that's what I had initially, but found it was less easy
> to
> > >>>         read...
> > >>>         with X11DEPENDS it's more 'obvious' that there is something
> > >>>         special..
> > >>>         that said, i can make the change if that's really needed.
> > >>>
> > >>>     We do use the X11DEPENDS elsewhere when there are multiple
> > >>>     dependencies, but I also found cases where we just include the
> > >>>     dependency directly in the test. I was trying pick a direction:
> > >>>     single entry no X11DEPENDS, multiple entries use X11DEPENDS.
> > >>>
> > >>>     Comments, flames, ...
> > >>>
> > >>>
> > >>> Yes; I sent this patch in Febuary:
> > >>> http://patchwork.openembedded.**org/patch/44759/<
> http://patchwork.openembedded.org/patch/44759/>
> > >>>
> > >>> Please use this one instead of the recent one.
> > >>>
> > >>>
> > >> Well reading back on that, it looks like I was waiting for an
> > >> EXTRA_OECONF or related change to the autoconf scripts.
> > >>
> > >> Sau!
> > >
> > >
> > > hmm. ok, sorry Otavio, i missed the other patch. I will check on my
> side
> > > too about EXTRA_OECONF.
> > >
> >
> > Nicolas, don't worry. It is normal to end redoing some stuff.
> >
> > Last time I checked it had no support in Qt build system; I am not sure
> if
> > it uses or not the host headers (in case they exist) but it needs testing
> > to be sure.
>
> I can confirm that it does not link against host X11 when built w/o that
> dependency and nativesdk has no x11 libs/headers. As I previously
> mentioned,
> we've been using this fix for over 6 months on several releases built on
> different machines w/o problems...
>

In this case the patch can be merged 'as is'.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c1c5563f9f4404de6dc944
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jun 5, 2013 at 5:07 PM, Denys Dmytriyenko <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On W=
ed, Jun 05, 2013 at 02:43:07PM -0300, Otavio Salvador wrote:<br>
&gt; On Wed, Jun 5, 2013 at 2:23 PM, Nicolas Dechesne &lt;<br>
&gt; <a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro=
.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Jun 5, 2013 at 7:19 PM, Saul Wold &lt;<a href=3D"mailto:s=
gw@linux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On 06/05/2013 10:12 AM, Otavio Salvador wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold &lt;<a href=3D"=
mailto:sgw@linux.intel.com">sgw@linux.intel.com</a><br>
&gt; &gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; =A0 =A0 On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:<b=
r>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold=
 &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a><br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.in=
tel.com">sgw@linux.intel.com</a>&gt;<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.in=
tel.com">sgw@linux.intel.com</a> &lt;mailto:<a href=3D"mailto:sgw@linux.int=
el.com">sgw@linux.intel.com</a>&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0You could just directly put th=
e nativesdk-libx11 in place<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 of the<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0variable, no need to have the =
variable there.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 yes, that&#39;s what I had initially, but=
 found it was less easy to<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 read...<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 with X11DEPENDS it&#39;s more &#39;obviou=
s&#39; that there is something<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 special..<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 that said, i can make the change if that&=
#39;s really needed.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; =A0 =A0 We do use the X11DEPENDS elsewhere when there are=
 multiple<br>
&gt; &gt;&gt;&gt; =A0 =A0 dependencies, but I also found cases where we jus=
t include the<br>
&gt; &gt;&gt;&gt; =A0 =A0 dependency directly in the test. I was trying pic=
k a direction:<br>
&gt; &gt;&gt;&gt; =A0 =A0 single entry no X11DEPENDS, multiple entries use =
X11DEPENDS.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; =A0 =A0 Comments, flames, ...<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Yes; I sent this patch in Febuary:<br>
</div></div>&gt; &gt;&gt;&gt; <a href=3D"http://patchwork.openembedded." ta=
rget=3D"_blank">http://patchwork.openembedded.</a>**org/patch/44759/&lt;<a =
href=3D"http://patchwork.openembedded.org/patch/44759/" target=3D"_blank">h=
ttp://patchwork.openembedded.org/patch/44759/</a>&gt;<br>

<div class=3D"im">&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Please use this one instead of the recent one.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; Well reading back on that, it looks like I was waiting for an=
<br>
&gt; &gt;&gt; EXTRA_OECONF or related change to the autoconf scripts.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Sau!<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; hmm. ok, sorry Otavio, i missed the other patch. I will check on =
my side<br>
&gt; &gt; too about EXTRA_OECONF.<br>
&gt; &gt;<br>
&gt;<br>
&gt; Nicolas, don&#39;t worry. It is normal to end redoing some stuff.<br>
&gt;<br>
&gt; Last time I checked it had no support in Qt build system; I am not sur=
e if<br>
&gt; it uses or not the host headers (in case they exist) but it needs test=
ing<br>
&gt; to be sure.<br>
<br>
</div>I can confirm that it does not link against host X11 when built w/o t=
hat<br>
dependency and nativesdk has no x11 libs/headers. As I previously mentioned=
,<br>
we&#39;ve been using this fix for over 6 months on several releases built o=
n<br>
different machines w/o problems...<br></blockquote><div><br></div><div styl=
e>In this case the patch can be merged &#39;as is&#39;.=A0</div></div><div>=
<br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>Mobile: +55 (53) =
9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--001a11c1c5563f9f4404de6dc944--
