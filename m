Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCCA747D4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 14:07:44 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id i3so3595631wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LwUm1AYsWzgyQ75DJ4vcjpdQz9Wh6l24J5Io8fV3t2A=;
	b=jWvoY1sJt13tAc+RhxDv2th6k7E708VthT5zV6ZvGhkYULUgBWU/YvXL3ytg8d+2wD
	hAa7b0m9Fduj5sko5++leY7MZSp5kVHeK5leJocnkuy00VwkzPJCw8oBZr/KpEWYDp2t
	o64/QlnKa7QRMUSTc8HP9OurUOfWeC6l5oHYYVlVihTQda40xt6Dn3ZNylSgWQkVX05v
	RAWEwawR0sVpL7w/eVysw3zdyksDtGLo0hwHQGWvRVBBQhNkvRS47EhTZyroCGcd3SPi
	aDAh5n0KSYWFO3uCdsv8XOL4o3d1ILpOIn6e4sm1zYrSkNdrmmHL5B9ggVz9/dWnJPgR
	pkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LwUm1AYsWzgyQ75DJ4vcjpdQz9Wh6l24J5Io8fV3t2A=;
	b=FoiouTYZAbKd/hgvzWJ5UszEYcvupnB0sNxq0SPINDJyeb4Kjz7HVQg+T8zH5970a0
	z8xTuwTb0ZKxqjpoD1ACX/7vFq5tBOvv7rI7JkX/4P5tGF2sUAeoyccfvHNbJbq8RAl/
	trYjkzgKgyHiODJWkBEqrmiCtmNKNaLQQETpNEWAtOByzZ/vVxjnHZz19427PztFd7Wt
	uzaQOpwvlFyhJFCaqWnqEk9PtlM78N9Tgj1g9oTeNXI3N4Oc8OXtBULmYxkputu6wAu0
	G+eli925Ne2bh+sYgX9/0Gs6uzhcizC5ttK4VmQg2QW2UnJWQcyhKll2hbNbUK7McRkT
	f/dA==
X-Gm-Message-State: ALQs6tDGTWeGNMeUl27v4roa0RisxhyNv9NSau67NNUIZ5hm87+6xYmz
	j+IkkKkPp8XbeYUABF6AXBx+2dEFS/Lc1tHNOz4=
X-Google-Smtp-Source: AIpwx49/FpMYGNlKJXwB0R1hlLFH83l97P+lP+WkuRKt7rdoY0gbjOPSBY3Hb+KFxZFcNvuKQKofB0eVOLTM60Hc4zA=
X-Received: by 10.28.15.15 with SMTP id 15mr10841749wmp.60.1523023665593; Fri,
	06 Apr 2018 07:07:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Fri, 6 Apr 2018 07:07:45 -0700 (PDT)
In-Reply-To: <CAJ86T=XmqNbTF+qXWhG5xFHNBUnRCaDx5DKeTQ_Y+wfqhgbiyg@mail.gmail.com>
References: <cover.1522936224.git.akuster808@gmail.com>
	<CAJ86T=XmqNbTF+qXWhG5xFHNBUnRCaDx5DKeTQ_Y+wfqhgbiyg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 6 Apr 2018 16:07:45 +0200
Message-ID: <CA+chaQf17H2+HKJ6V=+tGnL7xkH_ocPRj7j_hBWSG5e2AKV31w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/38] Morty Next pull request
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
X-List-Received-Date: Fri, 06 Apr 2018 14:07:45 -0000
Content-Type: multipart/alternative; boundary="001a1145aa229282d305692e9441"

--001a1145aa229282d305692e9441
Content-Type: text/plain; charset="UTF-8"

> Is it safe to backport to morty, which doesn't have RSS?

It doesn't work well for me, all the builds are now failing with:

ERROR: glibc-2.24-r0 do_stash_locale_setscene: The recipe glibc is trying
to install files into a shared area when those files already exist. Those
files and their manifest location are:
   TMPDIR/sysroots-components/aarch64/glibc-stash-locale/SUPPORTED
 Matched in b''
   TMPDIR/
sysroots-components/aarch64/glibc-stash-locale/lib/libnss_nisplus.so.2
 Matched in b''
   TMPDIR/sysroots-components/aarch64/glibc-stash-locale/lib/ld-2.24.so
 Matched in b''
...



On Thu, Apr 5, 2018 at 11:41 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Apr 5, 2018 at 6:53 AM, Armin Kuster <akuster808@gmail.com> wrote:
> > Please consider these changes for Morty. Clean AB build
> >
> > This included sdk locale and host glibc 2.27 fixes.
> >
> > The following changes since commit 34b26ec18450a3bc72f7b8a0f2df0b
> faae1140dd:
> >
> >   linux-firmware: Add reference to iwlwifi-8000C firmware (2018-03-19
> 15:58:33 +0000)
> >
> > are available in the git repository at:
> >
> >   git://git.yoctoproject.org/poky-contrib stable/morty-next
> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
> stable/morty-next
> >
> > Richard Purdie (4):
> >   lib/oe/package_manager/sdk: Ensure do_populate_sdk_ext and
> >     do_populate_sdk repos don't conflict
> >   glibc: Separate locale files to their own sstate task
>
> This commit comes with the comment:
>
>     Putting the locale and script files into the sysroot for use by their
>     specific recipes used to be a simple way to share the files. With RSS,
>     we don't want to copy these into many different recipes so put these
>     files in their own sstate task.
>
> Is it safe to backport to morty, which doesn't have RSS?
>
> >   image/packagegroup/populate_sdk: Drop do_populate_sysroot task
> >     properly
> >   glibc-package: Avoid race sstate races with do_stash_locale
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1145aa229282d305692e9441
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;=C2=A0<span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">Is it safe to ba=
ckport to morty, which doesn&#39;t have RSS?</span></div><div><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline"><br></span></div>It doesn&#39;t work well for me, all the b=
uilds are now failing with:<div><br></div><div><div>ERROR: glibc-2.24-r0 do=
_stash_locale_setscene: The recipe glibc is trying to install files into a =
shared area when those files already exist. Those files and their manifest =
location are:</div><div>=C2=A0 =C2=A0TMPDIR/sysroots-components/aarch64/gli=
bc-stash-locale/SUPPORTED</div><div>=C2=A0Matched in b&#39;&#39;</div><div>=
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">=C2=A0 =C2=A0TMPDIR/</span>sysroots-components/aa=
rch64/glibc-stash-locale/lib/libnss_nisplus.so.2</div><div>=C2=A0Matched in=
 b&#39;&#39;</div><div><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">=C2=A0 =C2=A0TMPDIR/</span=
>sysroots-components/aarch64/glibc-stash-locale/lib/<a href=3D"http://ld-2.=
24.so">ld-2.24.so</a></div><div>=C2=A0Matched in b&#39;&#39;</div></div><di=
v>...<br></div><div><br></div><div><br></div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Thu, Apr 5, 2018 at 11:41 PM, Andre Mc=
Curdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=
=3D"_blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Thu, Apr 5, 2018 at 6:53 AM, Armin Kuster=
 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; w=
rote:<br>
&gt; Please consider these changes for Morty. Clean AB build<br>
&gt;<br>
&gt; This included sdk locale and host glibc 2.27 fixes.<br>
&gt;<br>
&gt; The following changes since commit 34b26ec18450a3bc72f7b8a0f2df0b<wbr>=
faae1140dd:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0linux-firmware: Add reference to iwlwifi-8000C firmware (2=
018-03-19 15:58:33 +0000)<br>
&gt;<br>
&gt; are available in the git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.yoctoproject.org/poky-contrib"=
 rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/<wbr>poky-contri=
b</a> stable/morty-next<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contr=
ib/log/?h=3Dstable/morty-next" rel=3D"noreferrer" target=3D"_blank">http://=
git.yoctoproject.org/<wbr>cgit.cgi/poky-contrib/log/?h=3D<wbr>stable/morty-=
next</a><br>
&gt;<br>
</span><span class=3D"">&gt; Richard Purdie (4):<br>
&gt;=C2=A0 =C2=A0lib/oe/package_manager/sdk: Ensure do_populate_sdk_ext and=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0do_populate_sdk repos don&#39;t conflict<br>
&gt;=C2=A0 =C2=A0glibc: Separate locale files to their own sstate task<br>
<br>
</span>This commit comes with the comment:<br>
<br>
=C2=A0 =C2=A0 Putting the locale and script files into the sysroot for use =
by their<br>
=C2=A0 =C2=A0 specific recipes used to be a simple way to share the files. =
With RSS,<br>
=C2=A0 =C2=A0 we don&#39;t want to copy these into many different recipes s=
o put these<br>
=C2=A0 =C2=A0 files in their own sstate task.<br>
<br>
Is it safe to backport to morty, which doesn&#39;t have RSS?<br>
<span class=3D"im HOEnZb"><br>
&gt;=C2=A0 =C2=A0image/packagegroup/populate_<wbr>sdk: Drop do_populate_sys=
root task<br>
&gt;=C2=A0 =C2=A0 =C2=A0properly<br>
&gt;=C2=A0 =C2=A0glibc-package: Avoid race sstate races with do_stash_local=
e<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1145aa229282d305692e9441--
