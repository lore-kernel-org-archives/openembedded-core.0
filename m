Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id A2D1D6A49A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 12:00:14 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id g12so12960553oah.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 05:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=yPs3LunSNlILK0xLdp9DBgJ4VIDc7gf0aW0G+HVpOYI=;
	b=MrGh/Q1vCBGCFoYH0ETAZGM/p2P44NhrJluyo3WxbgYKEDInFSJnh5SkV/UzlLkkGl
	A3AdjPmuHa3AfXQKOk/c5+pMgyUBC5FFxClR4kSwYJc8Ji68jrgesCSDkKfY27vt5LPs
	I5FS0A/Ste97aaIIOINs5WEHbp5mB9G2ax8rq3YOcySW8s5QK4SPH6OYdZKojDmblG+R
	IeVS6VeO1ppVaTZd3izPgyuBMG1tTMTRioLRIJZPHEiShLOCr+TJgYfTeSZnHg93VIX1
	7/BcpRqcXwk64PAarvk4OPqc3arl0dOa5nrKMBGcHZsw6Tkub/zMwEnbTTnRdbOnIrlU
	TuJg==
X-Received: by 10.182.241.71 with SMTP id wg7mr10239052obc.50.1372161615265;
	Tue, 25 Jun 2013 05:00:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.25.133 with HTTP; Tue, 25 Jun 2013 04:59:55 -0700 (PDT)
In-Reply-To: <CAP71Wjx-uL3CjmxtJwEhZJyDD5p5HWwEEKSEh-0h5aCmCxeGxA@mail.gmail.com>
References: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
	<CAP71WjzvRgqYtJdBVt_epRVZ5bb4aVbPiEq8z4fw-EfEsnVgGg@mail.gmail.com>
	<1402287.LPEgl0HhT9@helios>
	<CAP71WjyCZvkwDuCM0DGJRBaeCySZkeiuhB6GxKGRBfemjHgQRA@mail.gmail.com>
	<CAP71Wjx-uL3CjmxtJwEhZJyDD5p5HWwEEKSEh-0h5aCmCxeGxA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 25 Jun 2013 13:59:55 +0200
Message-ID: <CAP71WjygMhCMdrbrj8uUKeJZuRu1_cjmhE4cLjsuhJ5wJpxnuQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQk/knDqNyHzwmrTIhy79upZMQBXVRBfTOEixuLJ3k3XHMZn5P0aAZeWzkrn3F2T/JcUo8kG
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with Qt5/mesa and eglfs
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
X-List-Received-Date: Tue, 25 Jun 2013 12:00:15 -0000
Content-Type: multipart/alternative; boundary=001a11c2e0f0a71ba204dff945be

--001a11c2e0f0a71ba204dff945be
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 20, 2013 at 8:15 PM, Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

>
> On Thu, Jun 20, 2013 at 11:46 AM, Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
>
>> On Thu, Jun 20, 2013 at 11:42 AM, Paul Eggleton <
>> paul.eggleton@linux.intel.com> wrote:
>>
>>> I wasn't watching closely but my impression is there were a large number
>>> of
>>> changes associated with the mesa upgrade. Is the upgrade itself
>>> necessary for
>>> the fix?
>>>
>>
>> no, i don't think so. I think we might be able to just update the patches
>> that deal with the X11/no X11 support. but i haven't tested that yet. i
>> just did a quick test by cherry picking the complete commit (e.g. mesa
>> upgrade) to verify that it's actually fixing my problem. now that i know it
>> does, i will try to just upgrade the patches without the mesa upgrade and
>> report how it goes.
>
>
> ok, i was able to backport the mesa patch from 9.1.3 to 9.0.2
> (EGL-Mutate-NativeDisplayType-depending-on-config.patch) , the backport was
> more or less trivial. and then i did this in dylan branch:
>
> --- a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> +++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> @@ -2,7 +2,7 @@ SRC_URI = "
> ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
>             file://0002-cross-compile.patch \
>             file://cross-glsl.patch \
>             file://dont-fail-if-libX11-isnt-installed.patch \
> -           file://fix-egl-compilation-without-x11-headers.patch \
> +           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
>             "
>
> and it does fix the build issue i had (mesa/qt5/non X11 distro).
>
> should that be merged into dylan (since it's merged in master already) or
> do we need to wait for the 'final' patch in upstream to be ready?
>


Paul, Martin, what do you think about this? i have the (trivial) dylan
backport ready. Do you think it's the right time to get it merged?



>
> thanks
>
>
>

--001a11c2e0f0a71ba204dff945be
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jun 20, 2013 at 8:15 PM, Nicolas Dechesne <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div><div class=3D"h5"><br><div class=3D"gmail_quote">On Thu, Jun 20, 2013 =
at 11:46 AM, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D"mailto:nicol=
as.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&g=
t;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div><div class=3D"gmail_quote">On Thu, Jun 20, 2013 at 11=
:42 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton=
@linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</=
span> wrote:<br>



<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div style=3D"overflow:hidden">I wasn&#39;t watching close=
ly but my impression is there were a large number of<br>




changes associated with the mesa upgrade. Is the upgrade itself necessary f=
or<br>
the fix?</div></blockquote></div><br></div>no, i don&#39;t think so. I thin=
k we might be able to just update the patches that deal with the X11/no X11=
 support. but i haven&#39;t tested that yet. i just did a quick test by che=
rry picking the complete commit (e.g. mesa upgrade) to verify that it&#39;s=
 actually fixing my problem. now that i know it does, i will try to just up=
grade the patches without the mesa upgrade and report how it goes.</blockqu=
ote>


</div><br></div></div>ok, i was able to backport the mesa patch from 9.1.3 =
to 9.0.2 (EGL-Mutate-NativeDisplayType-depending-on-config.patch) , the bac=
kport was more or less trivial. and then i did this in dylan branch:</div>

<div class=3D"gmail_extra">
<br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">--- a/meta/=
recipes-graphics/mesa/mesa-9.0.2.inc</div><div class=3D"gmail_extra">+++ b/=
meta/recipes-graphics/mesa/mesa-9.0.2.inc</div><div class=3D"gmail_extra">@=
@ -2,7 +2,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.org/pub/m=
esa/$%7BPV%7D/MesaLib-$%7BPV%7D.tar.bz2" target=3D"_blank">ftp://ftp.freede=
sktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2</a> \</div>


<div class=3D"gmail_extra">=A0 =A0 =A0 =A0 =A0 =A0 file://0002-cross-compil=
e.patch \</div><div class=3D"gmail_extra">=A0 =A0 =A0 =A0 =A0 =A0 file://cr=
oss-glsl.patch \</div><div class=3D"gmail_extra">=A0 =A0 =A0 =A0 =A0 =A0 fi=
le://dont-fail-if-libX11-isnt-installed.patch \</div>


<div class=3D"gmail_extra">- =A0 =A0 =A0 =A0 =A0 file://fix-egl-compilation=
-without-x11-headers.patch \</div><div class=3D"gmail_extra">+ =A0 =A0 =A0 =
=A0 =A0 file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \</di=
v><div class=3D"gmail_extra">


=A0 =A0 =A0 =A0 =A0 =A0 &quot;</div><div><br></div><div>and it does fix the=
 build issue i had (mesa/qt5/non X11 distro).=A0</div><div><br></div><div>s=
hould that be merged into dylan (since it&#39;s merged in master already) o=
r do we need to wait for the &#39;final&#39; patch in upstream to be ready?=
</div>

</div></div></blockquote><div><br></div><div style><br></div><div style>Pau=
l, Martin, what do you think about this? i have the (trivial) dylan backpor=
t ready. Do you think it&#39;s the right time to get it merged?</div><div s=
tyle>

<br></div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_extra">
<div><br></div><div>thanks</div><div><br></div></div><div class=3D"gmail_ex=
tra"><br></div></div>
</blockquote></div><br></div></div>

--001a11c2e0f0a71ba204dff945be--
