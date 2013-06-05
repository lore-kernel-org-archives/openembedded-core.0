Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA24601AF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 20:56:31 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id j6so1569092oag.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 13:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=wS/35bL4SpN8pMFN3Iie+5rBCBlM9ey3seX/TB5aOsM=;
	b=eMIrFs7FbuF8ns4UBTBzd2+5dxKvhNscw4vvbCy0o13yLdZoJT2B1FllgEMb1msrPT
	NG7hbXdSn9KzKcOhrhsUUKIXIC6v45V9GYRB+KALnbsGcaqDuLyJRJzhQzcnX0LRHDAz
	qRYuZE/s7pjD4oDEwQzDKjQQPvg498Q2pBBlGhFPBUbeJHgIXp4ghtLSb8fYclrY92p7
	Vlkjoqp05Q+B1GOw41k+z1/7fVG/+SVkV2ZgM/K1LC3MiTpUxmxQv/WcMkVoHBlYg1OH
	gpcY5gkqU7VP03afwOYBKIvzZIVt+wPXkT+weMGLAA6dnJjUD3aUjxExgtDi/6/DnQmr
	Z2aA==
MIME-Version: 1.0
X-Received: by 10.60.41.66 with SMTP id d2mr16416466oel.12.1370465791426; Wed,
	05 Jun 2013 13:56:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Wed, 5 Jun 2013 13:56:31 -0700 (PDT)
In-Reply-To: <51AFA565.3040607@linux.intel.com>
References: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
	<51AF67B8.20502@linux.intel.com>
	<CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
	<51AF6E2F.8040309@linux.intel.com>
	<CAP9ODKrxMh3PGGwVHdVFcUL2-Ag4vA2bAKr+3PGKGNDzwMJnpg@mail.gmail.com>
	<51AF7336.8050802@linux.intel.com>
	<CAP71WjxL2g=k5hcgAo70Linsf-Occ-tdh1jM+ppYmghALDsq3w@mail.gmail.com>
	<CAP9ODKqiVaF3njGCLXHhT7n03d-QyESQAdw3S+HF2-JNEazCMw@mail.gmail.com>
	<20130605200740.GF10298@denix.org>
	<CAP9ODKr+SnNDEZJ4ON-fDpyZdjOTdVu+9=trCyEpmvHZa5AiwA@mail.gmail.com>
	<51AFA565.3040607@linux.intel.com>
Date: Wed, 5 Jun 2013 17:56:31 -0300
X-Google-Sender-Auth: OGp_2w0UdAp7pC3Ik7FJ0kBgKkw
Message-ID: <CAP9ODKrzy+L9mptVFwNT5VvsxQt42igrQbE2m=yTzAw2Me3txg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Wed, 05 Jun 2013 20:56:31 -0000
Content-Type: multipart/alternative; boundary=089e0149c800ad19d004de6e6e01

--089e0149c800ad19d004de6e6e01
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 5, 2013 at 5:53 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 06/05/2013 01:10 PM, Otavio Salvador wrote:
>
>>
>>
>>
>> On Wed, Jun 5, 2013 at 5:07 PM, Denys Dmytriyenko <denis@denix.org
>> <mailto:denis@denix.org>> wrote:
>>
>>     On Wed, Jun 05, 2013 at 02:43:07PM -0300, Otavio Salvador wrote:
>>      > On Wed, Jun 5, 2013 at 2:23 PM, Nicolas Dechesne <
>>      > nicolas.dechesne@linaro.org <mailto:nicolas.dechesne@**linaro.org<nicolas.dechesne@linaro.org>
>> >>
>>
>>     wrote:
>>      >
>>      > >
>>      > >
>>      > >
>>      > > On Wed, Jun 5, 2013 at 7:19 PM, Saul Wold <sgw@linux.intel.com
>>     <mailto:sgw@linux.intel.com>> wrote:
>>      > >
>>      > >> On 06/05/2013 10:12 AM, Otavio Salvador wrote:
>>      > >>
>>      > >>>
>>      > >>>
>>      > >>>
>>      > >>> On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold
>>     <sgw@linux.intel.com <mailto:sgw@linux.intel.com>
>>      > >>> <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com>>>
>> wrote:
>>      > >>>
>>      > >>>     On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:
>>      > >>>
>>      > >>>
>>      > >>>         On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold
>>     <sgw@linux.intel.com <mailto:sgw@linux.intel.com>
>>      > >>>         <mailto:sgw@linux.intel.com <mailto:
>> sgw@linux.intel.com>>
>>      > >>>         <mailto:sgw@linux.intel.com
>>     <mailto:sgw@linux.intel.com> <mailto:sgw@linux.intel.com
>>     <mailto:sgw@linux.intel.com>>>**>
>>      > >>> wrote:
>>      > >>>
>>      > >>>              You could just directly put the nativesdk-libx11
>>     in place
>>      > >>>         of the
>>      > >>>              variable, no need to have the variable there.
>>      > >>>
>>      > >>>
>>      > >>>         yes, that's what I had initially, but found it was
>>     less easy to
>>      > >>>         read...
>>      > >>>         with X11DEPENDS it's more 'obvious' that there is
>>     something
>>      > >>>         special..
>>      > >>>         that said, i can make the change if that's really
>> needed.
>>      > >>>
>>      > >>>     We do use the X11DEPENDS elsewhere when there are multiple
>>      > >>>     dependencies, but I also found cases where we just
>>     include the
>>      > >>>     dependency directly in the test. I was trying pick a
>>     direction:
>>      > >>>     single entry no X11DEPENDS, multiple entries use
>> X11DEPENDS.
>>      > >>>
>>      > >>>     Comments, flames, ...
>>      > >>>
>>      > >>>
>>      > >>> Yes; I sent this patch in Febuary:
>>      > >>>
>>     http://patchwork.openembedded.****org/patch/44759/<http://**
>> patchwork.openembedded.org/**patch/44759/<http://patchwork.openembedded.org/patch/44759/>
>> >
>>      > >>>
>>      > >>> Please use this one instead of the recent one.
>>      > >>>
>>      > >>>
>>      > >> Well reading back on that, it looks like I was waiting for an
>>      > >> EXTRA_OECONF or related change to the autoconf scripts.
>>      > >>
>>      > >> Sau!
>>      > >
>>      > >
>>      > > hmm. ok, sorry Otavio, i missed the other patch. I will check
>>     on my side
>>      > > too about EXTRA_OECONF.
>>      > >
>>      >
>>      > Nicolas, don't worry. It is normal to end redoing some stuff.
>>      >
>>      > Last time I checked it had no support in Qt build system; I am
>>     not sure if
>>      > it uses or not the host headers (in case they exist) but it needs
>>     testing
>>      > to be sure.
>>
>>     I can confirm that it does not link against host X11 when built w/o
>> that
>>     dependency and nativesdk has no x11 libs/headers. As I previously
>>     mentioned,
>>     we've been using this fix for over 6 months on several releases built
>> on
>>     different machines w/o problems...
>>
>>
>> In this case the patch can be merged 'as is'.
>>
>>
> I am still concerned about a floating dependency here, imagine the
> following:
>
> Build the toolchain with X11 enabled, nativesdk-libx11 is build, now
> rebuild with X11 disabled, the dependency is gone, but the libraries and
> headers still exist in the sysroot and thus the configure will still enable
> x11 in qte, bad things happen.
>

I expect different distro features to have different build dirs. No?


> We need to have a disable flag to autotools.
>

The qmake based system does not provide this; so to support it, it will
need to be a hack ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e0149c800ad19d004de6e6e01
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jun 5, 2013 at 5:53 PM, Saul Wold <span dir=3D"ltr">&lt;<a =
href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 06/05/2013 01:10 PM, Ot=
avio Salvador wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
<br>
<br>
On Wed, Jun 5, 2013 at 5:07 PM, Denys Dmytriyenko &lt;<a href=3D"mailto:den=
is@denix.org" target=3D"_blank">denis@denix.org</a><br></div><div class=3D"=
im">
&lt;mailto:<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix=
.org</a>&gt;&gt; wrote:<br>
<br>
=A0 =A0 On Wed, Jun 05, 2013 at 02:43:07PM -0300, Otavio Salvador wrote:<br=
>
=A0 =A0 =A0&gt; On Wed, Jun 5, 2013 at 2:23 PM, Nicolas Dechesne &lt;<br></=
div>
=A0 =A0 =A0&gt; <a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_b=
lank">nicolas.dechesne@linaro.org</a> &lt;mailto:<a href=3D"mailto:nicolas.=
dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@<u></u>linaro.org</=
a>&gt;&gt;<div class=3D"im">
<br>
=A0 =A0 wrote:<br>
=A0 =A0 =A0&gt;<br>
=A0 =A0 =A0&gt; &gt;<br>
=A0 =A0 =A0&gt; &gt;<br>
=A0 =A0 =A0&gt; &gt;<br>
=A0 =A0 =A0&gt; &gt; On Wed, Jun 5, 2013 at 7:19 PM, Saul Wold &lt;<a href=
=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a><b=
r></div><div class=3D"im">
=A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank"=
>sgw@linux.intel.com</a>&gt;&gt; wrote:<br>
=A0 =A0 =A0&gt; &gt;<br>
=A0 =A0 =A0&gt; &gt;&gt; On 06/05/2013 10:12 AM, Otavio Salvador wrote:<br>
=A0 =A0 =A0&gt; &gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold<br>
=A0 =A0 &lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@li=
nux.intel.com</a> &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=
=3D"_blank">sgw@linux.intel.com</a>&gt;<br></div><div><div class=3D"h5">
=A0 =A0 =A0&gt; &gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:sgw@linux.intel.c=
om" target=3D"_blank">sgw@linux.intel.com</a> &lt;mailto:<a href=3D"mailto:=
sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;&gt;&gt; =
wrote:<br>

=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 On 06/05/2013 09:32 AM, Nicolas Deches=
ne wrote:<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 On Wed, Jun 5, 2013 at 6:30 PM=
, Saul Wold<br>
=A0 =A0 &lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@li=
nux.intel.com</a> &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=
=3D"_blank">sgw@linux.intel.com</a>&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 &lt;mailto:<a href=3D"mailto:s=
gw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a> &lt;mailto:<a=
 href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com<=
/a>&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 &lt;mailto:<a href=3D"mailto:s=
gw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a><br>
=A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank"=
>sgw@linux.intel.com</a>&gt; &lt;mailto:<a href=3D"mailto:sgw@linux.intel.c=
om" target=3D"_blank">sgw@linux.intel.com</a><br>
=A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank"=
>sgw@linux.intel.com</a>&gt;&gt;&gt;<u></u>&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; wrote:<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0You could just dire=
ctly put the nativesdk-libx11<br>
=A0 =A0 in place<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 of the<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0variable, no need t=
o have the variable there.<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 yes, that&#39;s what I had ini=
tially, but found it was<br>
=A0 =A0 less easy to<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 read...<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 with X11DEPENDS it&#39;s more =
&#39;obvious&#39; that there is<br>
=A0 =A0 something<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 special..<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 that said, i can make the chan=
ge if that&#39;s really needed.<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 We do use the X11DEPENDS elsewhere whe=
n there are multiple<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 dependencies, but I also found cases w=
here we just<br>
=A0 =A0 include the<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 dependency directly in the test. I was=
 trying pick a<br>
=A0 =A0 direction:<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 single entry no X11DEPENDS, multiple e=
ntries use X11DEPENDS.<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; =A0 =A0 Comments, flames, ...<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; Yes; I sent this patch in Febuary:<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 <a href=3D"http://patchwork.openembedded." target=3D"_blank">http:/=
/patchwork.openembedded.</a><u></u>**org/patch/44759/&lt;<a href=3D"http://=
patchwork.openembedded.org/patch/44759/" target=3D"_blank">http://<u></u>pa=
tchwork.openembedded.org/<u></u>patch/44759/</a>&gt;<br>

=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt; Please use this one instead of the recent one.=
<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt; Well reading back on that, it looks like I was wai=
ting for an<br>
=A0 =A0 =A0&gt; &gt;&gt; EXTRA_OECONF or related change to the autoconf scr=
ipts.<br>
=A0 =A0 =A0&gt; &gt;&gt;<br>
=A0 =A0 =A0&gt; &gt;&gt; Sau!<br>
=A0 =A0 =A0&gt; &gt;<br>
=A0 =A0 =A0&gt; &gt;<br>
=A0 =A0 =A0&gt; &gt; hmm. ok, sorry Otavio, i missed the other patch. I wil=
l check<br>
=A0 =A0 on my side<br>
=A0 =A0 =A0&gt; &gt; too about EXTRA_OECONF.<br>
=A0 =A0 =A0&gt; &gt;<br>
=A0 =A0 =A0&gt;<br>
=A0 =A0 =A0&gt; Nicolas, don&#39;t worry. It is normal to end redoing some =
stuff.<br>
=A0 =A0 =A0&gt;<br>
=A0 =A0 =A0&gt; Last time I checked it had no support in Qt build system; I=
 am<br>
=A0 =A0 not sure if<br>
=A0 =A0 =A0&gt; it uses or not the host headers (in case they exist) but it=
 needs<br>
=A0 =A0 testing<br>
=A0 =A0 =A0&gt; to be sure.<br>
<br>
=A0 =A0 I can confirm that it does not link against host X11 when built w/o=
 that<br>
=A0 =A0 dependency and nativesdk has no x11 libs/headers. As I previously<b=
r>
=A0 =A0 mentioned,<br>
=A0 =A0 we&#39;ve been using this fix for over 6 months on several releases=
 built on<br>
=A0 =A0 different machines w/o problems...<br>
<br>
<br>
In this case the patch can be merged &#39;as is&#39;.<br>
<br>
</div></div></blockquote>
<br>
I am still concerned about a floating dependency here, imagine the followin=
g:<br>
<br>
Build the toolchain with X11 enabled, nativesdk-libx11 is build, now rebuil=
d with X11 disabled, the dependency is gone, but the libraries and headers =
still exist in the sysroot and thus the configure will still enable x11 in =
qte, bad things happen.<br>
</blockquote><div><br></div><div style>I expect different distro features t=
o have different build dirs. No?</div><div>=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">

We need to have a disable flag to autotools.<br></blockquote><div><br></div=
><div style>The qmake based system does not provide this; so to support it,=
 it will need to be a hack ...</div></div><div><br></div>-- <br>Otavio Salv=
ador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<b=
r>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>Mobile: +55 (53) =
9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--089e0149c800ad19d004de6e6e01--
