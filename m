Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5ABB56B368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 10:16:35 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so239918pbb.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 03:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ukuu1PmbxtolkPo8SqvrKfzklGgjY+AYvt1vXoOMAL8=;
	b=TfrqdNEwS+Ef3CYiA5Q9W1kW7VkpA1H/Ypjk5fbqb1tmBX9qpNKJyyMzudZVhExVXD
	dy6ItsgPzwvja7smiGp8zuz7ytEAVrsUubu4k9hRdhDj9zovpBKgSqYmbzleKj9tKbHt
	y3946c8Ta19msY06jibC2FpISspn1Pd7d++Qg7D6m2xuYif2minZmu0N9u8MQile+3YR
	Sd6Hwlbli1aCM8Spp7lDZ3Xhya/vVQ0xW4yNK9OWi7vy/6mihKgOP622IshSrrt7MTVz
	dLwkCAM1JIWsWxSsXYKpgR/ANygbHs46O7jkciW5gtUrWCzq0Esw0d5FZ4x4gp4tJlzQ
	v4BQ==
X-Gm-Message-State: ALoCoQktLIYVnzPF86/3rXKCXpkwqKKa6YQK0zW4wtAHNYRBDcTPoPvnX2y99Naa6Lr5jm3/c5qX
MIME-Version: 1.0
X-Received: by 10.66.27.143 with SMTP id t15mr2031172pag.171.1377080196134;
	Wed, 21 Aug 2013 03:16:36 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 21 Aug 2013 03:16:35 -0700 (PDT)
In-Reply-To: <CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
Date: Wed, 21 Aug 2013 11:16:35 +0100
X-Google-Sender-Auth: 09EqyixOtW-KNkI3ez5HezhCPX8
Message-ID: <CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Wed, 21 Aug 2013 10:16:35 -0000
Content-Type: multipart/alternative; boundary=bcaec52bea19eb232c04e47277f7

--bcaec52bea19eb232c04e47277f7
Content-Type: text/plain; charset=ISO-8859-1

Having had an inconvenient debugging session this morning with the help of
you, ndec, and so forth on IRC, I would propose to get rid of this gtk doc
stub, at least how it is now. It is completely breaking projects causing
regressions compared to denzil. We are pretty much blocked by it altogether
now. Here is the other thread for details:
https://lists.yoctoproject.org/pipermail/poky/2013-August/009184.html

IMHO, there should be a way for end users to get rid of the blocker issue
and regression. So, how about making this optional?


On Wed, Aug 21, 2013 at 11:04 AM, Burton, Ross <ross.burton@intel.com>wrote:

> On 21 August 2013 09:40, Jack Mitchell <ml@communistcode.co.uk> wrote:
>
>> Here is the patch which kicks it all off:
>>
>>
>> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026077.html
>>
>> So, make of this what you will. I've cc'd Ross in to see if he has a
>> specific reason for re-enabling gkt-doc in some packages. Maybe we
>> should turn it into an image feature...?
>>
>
> tl;dr: it's a stub package, you're not building any gtk-doc, and you can't
> turn it on if you wanted to.
>
> There's some confusion in this thread, so I'll try and clear it up.
>
> We need to build gtk-doc (or compatible) because it provides m4 autoconf
> fragments that are needed at configure time by any package that uses
> gtk-doc for documentation.  Previously we were patching recipes one by one
> to disable the rules, but that's prone to failure.  We integrated
> gtk-doc-stub (also used by gnome-os) which has the same external interfaces
> but is entirely stubs, for example:
>
> https://git.gnome.org/browse/gtk-doc-stub/tree/gtk-doc.m4
>
> This way we can actually configure everything that uses gtk-doc without
> needing the full gtk-doc package.
>
> There is a gtk-doc class which adds a dependency on gtk-doc-stub-native
> and then adds --disable-gtk-doc to EXTRA_OECONF.  This is why the explicit
> --disable was removed from connman: it was redundant.
>
> The other advantage of using a central gtk-doc class is that if someone
> did want to build gtk-doc, they would just need to package up the real
> gtk-doc and change the class.
>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--bcaec52bea19eb232c04e47277f7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Having had an inconvenient debugging session this morning =
with the help of you, ndec, and so forth on IRC, I would propose to get rid=
 of this gtk doc stub, at least how it is now. It is completely breaking pr=
ojects causing regressions compared to denzil. We are pretty much blocked b=
y it altogether now. Here is the other thread for details:=A0<a href=3D"htt=
ps://lists.yoctoproject.org/pipermail/poky/2013-August/009184.html">https:/=
/lists.yoctoproject.org/pipermail/poky/2013-August/009184.html</a><div>
<br></div><div>IMHO, there should be a way for end users to get rid of the =
blocker issue and regression. So, how about making this optional?</div></di=
v><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, Aug=
 21, 2013 at 11:04 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</sp=
an> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"im">On 21 Aug=
ust 2013 09:40, Jack Mitchell <span dir=3D"ltr">&lt;<a href=3D"mailto:ml@co=
mmunistcode.co.uk" target=3D"_blank">ml@communistcode.co.uk</a>&gt;</span> =
wrote:<br>
</div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D"i=
m">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div><span style=3D"color:rgb(34,34,34)">Here is the patch=
 which kicks it all off:</span><br>


</div>
<br>
<a href=3D"http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July=
/026077.html" target=3D"_blank">http://lists.linuxtogo.org/pipermail/openem=
bedded-core/2012-July/026077.html</a><br>
<br>
So, make of this what you will. I&#39;ve cc&#39;d Ross in to see if he has =
a<br>
specific reason for re-enabling gkt-doc in some packages. Maybe we<br>
should turn it into an image feature...?<br></blockquote><div><br></div></d=
iv><div>tl;dr: it&#39;s a stub package, you&#39;re not building any gtk-doc=
, and you can&#39;t turn it on if you wanted to.<br></div><div><br></div>
<div>

There&#39;s some confusion in this thread, so I&#39;ll try and clear it up.=
</div><div><br></div><div>We need to build gtk-doc (or compatible) because =
it provides m4 autoconf fragments that are needed at configure time by any =
package that uses gtk-doc for documentation. =A0Previously we were patching=
 recipes one by one to disable the rules, but that&#39;s prone to failure. =
=A0We integrated gtk-doc-stub (also used by gnome-os) which has the same ex=
ternal interfaces but is entirely stubs, for example:</div>


<div><br></div><div><a href=3D"https://git.gnome.org/browse/gtk-doc-stub/tr=
ee/gtk-doc.m4" target=3D"_blank">https://git.gnome.org/browse/gtk-doc-stub/=
tree/gtk-doc.m4</a><br></div><div><br></div><div>This way we can actually c=
onfigure everything that uses gtk-doc without needing the full gtk-doc pack=
age.</div>


<div><br></div><div>There is a gtk-doc class which adds a dependency on gtk=
-doc-stub-native and then adds --disable-gtk-doc to EXTRA_OECONF. =A0This i=
s why the explicit --disable was removed from connman: it was redundant.</d=
iv>


<div><br></div><div>The other advantage of using a central gtk-doc class is=
 that if someone did want to build gtk-doc, they would just need to package=
 up the real gtk-doc and change the class.</div><span class=3D"HOEnZb"><fon=
t color=3D"#888888"><div>
<br></div><div>Ross</div>

</font></span></div></div></div>
<br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--bcaec52bea19eb232c04e47277f7--
