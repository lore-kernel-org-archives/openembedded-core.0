Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 93E1E6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 10:14:10 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id r2so62999397oih.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EzSWiMzyipQ0oh7K9ZMv9saH9pid9ZITO4AY1V2lDKk=;
	b=YWkY8QcI2EzFFnyJM48S0paPOQazGEufjL0R+9hV/NxA0C0Hq8nXXnDncjQ45tGW8v
	63ZGeW45XEt1gaxMy97S2eSPtExd/MmnK8YmjtQF1y+OpRGarzuA2pslujyFtnDaH1Zw
	C0llc68KY6ubNOtPFTvc04I8ASNOAPoQXrI6olrU++NUED10NLaHOIrv5Itc8gKJJ02u
	SFsYWvHn8sMGQ1XS71aK3mJUI2V04Gbd7DPD4Kl/beUrRjr4dbpKOj5MAD1FLt2+t6Zx
	ooL0/Y7QBcNnbsLfUajBRmlhcTgFepBihlukVgTF54+43El3SucnOHce5pUuiqYWJR+R
	G7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EzSWiMzyipQ0oh7K9ZMv9saH9pid9ZITO4AY1V2lDKk=;
	b=ihmLcBEImFm+oD2/2zB1L65NFk3zCRy4a0jhrBvJBL4I8Xo+ZbsHJY3WWV50Ix34IP
	Vt1ioNdJUIffuuzz6lIq3PyDW4QV3J6S/SwXwOyIJXPX/z43+Tf7VEuUxaxu6KFAo1m6
	SX3hc7WB5sglfl+wm183xnP5RwpQuiyn5uDWRvoYl+RhgeL5+UG4pctPGcEpcmMF2aXv
	aVgs5cDOZlFg6NC/jhB1n8H9n/wS5LcTYUbtENZlZLJtYkeYH/iLPkMD/RBRTkS1o/Wb
	Qa/iarRhpjvAz58jEGr3M6A1uqWy2MOArNzMQJCOVFQTJJNGk2eMlSV2Sy6NCaYhZkPB
	4gtQ==
X-Gm-Message-State: ALyK8tKah9095/JB3spFSHKR3j62vhztviq74gKanunOXD12YiUbq28Xhiz6ON+P1agzYnrWnEns6bYuUdbOnxi9
X-Received: by 10.202.82.73 with SMTP id g70mr5873139oib.125.1466676850988;
	Thu, 23 Jun 2016 03:14:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Thu, 23 Jun 2016 03:13:41 -0700 (PDT)
In-Reply-To: <CAJTo0LZmcuyPQEi3K8XxctBaC_MHTjnWpqgbT2koLirX62bHOA@mail.gmail.com>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
	<03eac8deaa244de132c505a9db7d411fc363f782.1466595928.git.jussi.kukkonen@intel.com>
	<CAJTo0LZmcuyPQEi3K8XxctBaC_MHTjnWpqgbT2koLirX62bHOA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 23 Jun 2016 13:13:41 +0300
Message-ID: <CAHiDW_HSP2iAwYjbkJdFTwUkO9tnP13Cu1Oa-6FK-T+G6zM0Cw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/10] vte: don't build test app
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
X-List-Received-Date: Thu, 23 Jun 2016 10:14:11 -0000
Content-Type: multipart/alternative; boundary=001a113d8716b42acc0535ef5003

--001a113d8716b42acc0535ef5003
Content-Type: text/plain; charset=UTF-8

On 22 June 2016 at 17:35, Burton, Ross <ross.burton@intel.com> wrote:

> The patch should explain why we're disabling the test application.
>
> If we don't build the test app then the "vte" package is pretty pointless:
>
> libvte:
>         /usr/lib/libvte-2.91.so.0
>         /usr/lib/libvte-2.91.so.0.4400.1
> vte:
>         /etc/profile.d/vte.sh
>         /usr/lib/girepository-1.0/Vte-2.91.typelib
>
> The typelib should be with the library, and that sh fragment is fairly
> pointless.  Should libvte and vte be merged (ie package the library into
> $PN and let the renamer do its job)?
>

Yes, that seems like the right move -- I actually thought vte package was
empty already but on double checking found the same files you did... I'll
resend this patch with changes you suggested .

The reason for disabling was that we aren't using the test application for
anything: matchbox-terminal serves the same purpose.

Jussi


Ross
>
> On 22 June 2016 at 12:52, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> ---
>>  meta/recipes-support/vte/vte_0.44.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/vte/vte_0.44.1.bb
>> b/meta/recipes-support/vte/vte_0.44.1.bb
>> index ecbf58a..f3baa1e 100644
>> --- a/meta/recipes-support/vte/vte_0.44.1.bb
>> +++ b/meta/recipes-support/vte/vte_0.44.1.bb
>> @@ -18,7 +18,7 @@ PACKAGECONFIG[gnutls] =
>> "--with-gnutls,--without-gnutls,gnutls"
>>  CFLAGS += "-D_GNU_SOURCE"
>>
>>  # Enable vala only if gobject-introspection is enabled
>> -EXTRA_OECONF = "--enable-vala=auto"
>> +EXTRA_OECONF = "--enable-vala=auto --disable-test-application"
>>
>>  # libtool adds "-nostdlib" when g++ is used. This breaks PIE builds.
>>  # Use libtool-cross (which has a hack to prevent that) instead.
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>

--001a113d8716b42acc0535ef5003
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
2 June 2016 at 17:35, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:=
ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>The patch=
 should explain why we&#39;re disabling the test application.</div><div><br=
></div>If we don&#39;t build the test app then the &quot;vte&quot; package =
is pretty pointless:<div><br></div><div><div>libvte:</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /usr/lib/libvte-2.91.so.0</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /usr/lib/libvte-2.91.so.0.4400.1</div><div>vte:</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /etc/profile.d/vte.sh</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /usr/lib/girepository-1.0/Vte-2.91.typelib</div></div><div><br></div><d=
iv>The typelib should be with the library, and that sh fragment is fairly p=
ointless.=C2=A0 Should libvte and vte be merged (ie package the library int=
o $PN and let the renamer do its job)?</div></div></blockquote><div><br></d=
iv><div>Yes, that seems like the right move -- I actually thought vte packa=
ge was empty already but on double checking found the same files you did...=
 I&#39;ll resend this patch with changes you suggested .</div><div><br></di=
v><div>The reason for disabling was that we aren&#39;t using the test appli=
cation for anything: matchbox-terminal serves the same purpose.</div><div>=
=C2=A0</div><div>Jussi</div><div><br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div>Ross</div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote"><div><div class=3D"h5">On 22 June 2016 a=
t 12:52, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukko=
nen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;</span> wr=
ote:<br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">S=
igned-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com=
" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.44.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.44.1.bb</a> b/meta/recipes-support/=
vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"noreferrer" target=3D"_blank">v=
te_0.44.1.bb</a><br>
index ecbf58a..f3baa1e 100644<br>
--- a/meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.44.1.bb</a><br>
+++ b/meta/recipes-support/vte/<a href=3D"http://vte_0.44.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.44.1.bb</a><br>
@@ -18,7 +18,7 @@ PACKAGECONFIG[gnutls] =3D &quot;--with-gnutls,--without-g=
nutls,gnutls&quot;<br>
=C2=A0CFLAGS +=3D &quot;-D_GNU_SOURCE&quot;<br>
<br>
=C2=A0# Enable vala only if gobject-introspection is enabled<br>
-EXTRA_OECONF =3D &quot;--enable-vala=3Dauto&quot;<br>
+EXTRA_OECONF =3D &quot;--enable-vala=3Dauto --disable-test-application&quo=
t;<br>
<br>
=C2=A0# libtool adds &quot;-nostdlib&quot; when g++ is used. This breaks PI=
E builds.<br>
=C2=A0# Use libtool-cross (which has a hack to prevent that) instead.<br>
</div></div><span><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>
<p>---------------------------------------------------------------------<br=
>
Intel Corporation (UK) Limited<br>
Registered No. 1134945 (England)<br>
Registered Office: Pipers Way, Swindon SN3 1RJ<br>
VAT No: 860 2173 47</p>

<p>This e-mail and any attachments may contain confidential material for<br=
>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</p></blockquote=
></div><br></div></div>

--001a113d8716b42acc0535ef5003--
