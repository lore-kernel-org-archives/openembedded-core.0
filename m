Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4B27D61A47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:46:56 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id n10so8078649oag.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 06:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=WZbj6pm6WLkKWjpEbf+WNvh34AEkRLt+BJm5xKoDUjQ=;
	b=AvOsFq2ioEhHbzpmdRJcXifUuZgQ6sGrgqqD28rwbO588RSI1JNtJXDlLED/BFCkJa
	+ouM4Ds26GmA7M7hi2T1VlNOJkrpYau9FdFVrcI63EL/HKg2IT6WAq8t5yUb8sh+1DLw
	4v/IeRz9S4ONV+IpcgihrfP9sPKGLYF4/mu3otGOnIBHZKXp1u/agbwSXBDwHvqP0GQ8
	eipPyisrjoop0ob+UQsuODKE0YMR8zuY8CBPkbjjMhocmhGy63tUXenv2vrzci1LkX97
	tjvtAWaaHgOBd1xL/BBxS4p7rlhzFEXHSgEavkBH8dXftZk+ETuW2zYl0KqMFbjxvPN+
	lzEw==
X-Received: by 10.182.79.165 with SMTP id k5mr1532656obx.31.1371736016759;
	Thu, 20 Jun 2013 06:46:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Thu, 20 Jun 2013 06:46:36 -0700 (PDT)
In-Reply-To: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
References: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jun 2013 09:46:36 -0400
Message-ID: <CAP71WjzvRgqYtJdBVt_epRVZ5bb4aVbPiEq8z4fw-EfEsnVgGg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQljgyblVA3azL1L0rV37OLSt0eJWPEFZUc7NOSMWFkmFlSj23ino/pnLTv+zR/ki1+2l6wQ
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
X-List-Received-Date: Thu, 20 Jun 2013 13:46:56 -0000
Content-Type: multipart/alternative; boundary=089e01293f8601465304df962e93

--089e01293f8601465304df962e93
Content-Type: text/plain; charset=ISO-8859-1

resending on proper mailling list, +cc Paul as it's dylan related.


On Thu, Jun 20, 2013 at 9:15 AM, Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> hi there,
>
> i am trying to build Qt5/meta-qt5 with dylan branch in a non X11 distro,
> and i got failures during the Qt5 configure step (when auto-detecting EGL
> feature). Looking into the issue, the good news is that it seems to be
> fixed in oe-core/master with:
>
> d7033f4 mesa: upgrade to 9.1.3
>
> thanks to this :
>
>     Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build
> correctly in
>     a non-X11 environment.
>
>     Drop dont-fail-if-libX11-isnt-installed.patch and
>     fix-egl-compilation-without-x11-headers.patch as they were backports.
>
>
> Would you guys consider 'backporting' this patch onto dylan a viable
> thing? I will make the backport, but it would be nice if you can confirm
> that it can be merged in dylan.
>
> thanks
>
> nico
>

--089e01293f8601465304df962e93
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">resending on proper mailling list, +cc Paul as it&#39;s dy=
lan related.<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quot=
e">On Thu, Jun 20, 2013 at 9:15 AM, Nicolas Dechesne <span dir=3D"ltr">&lt;=
<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.de=
chesne@linaro.org</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">hi there,<div><br></div><di=
v>i am trying to build Qt5/meta-qt5 with dylan branch in a non X11 distro, =
and i got failures during the Qt5 configure step (when auto-detecting EGL f=
eature). Looking into the issue, the good news is that it seems to be fixed=
 in oe-core/master with:</div>



<div><br></div><div><div>d7033f4 mesa: upgrade to 9.1.3</div><div><br></div=
><div>thanks to this :</div><div><br></div><div><div>=A0 =A0 Add EGL-Mutate=
-NativeDisplayType-depending-on-config.patch to build correctly in</div>
<div>=A0 =A0 a non-X11 environment.</div><div>=A0 =A0=A0</div><div>=A0 =A0 =
Drop dont-fail-if-libX11-isnt-installed.patch and</div><div>=A0 =A0 fix-egl=
-compilation-without-x11-headers.patch as they were backports.</div><div>=
=A0</div><div><br>



</div><div>Would you guys consider &#39;backporting&#39; this patch onto dy=
lan a viable thing? I will make the backport, but it would be nice if you c=
an confirm that it can be merged in dylan.</div><div><br></div>
<div>thanks</div><div><br></div><div>nico</div></div></div></div>
</blockquote></div><br></div></div>

--089e01293f8601465304df962e93--
