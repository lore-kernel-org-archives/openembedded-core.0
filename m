Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.3493.1615774562919474018
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 19:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mMPSDBNz;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.54, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f54.google.com with SMTP id r15-20020a05600c35cfb029010e639ca09eso19338568wmq.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 19:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ocOAuNeLkioH/yE5pCq+w2eZPa+u9uhuDf/ZqmhD4Rk=;
        b=mMPSDBNzUKLc9ItSRKe/6frvzHqd8yc8xGwxT53EWk1qu9nAX+KyfvpPKXAXnM+G0K
         iC88TEFh3Li1nucucH69R5CN9+ZS78/eijrNaPF+YZxaEoLu7djY4+A4h9DJUBmfqucn
         K23wy6qibSFMXlNwhMoZmQ5pWT2GgwsMfqBIAjAE3gBdRVuH5np7qfDz1+Q/tq839UQL
         OUTtbozN9HZBlAp+e++ficha2GUbAzXPOkrSrn5VtRkaSjnUhvoWK5OPEcwaWdJIHxZD
         WxgecrqfMxCFeJiAdivuo9Mj6ptTuKI93Pbe8cIjRIk6a4Z8G+bnWY6JTHvleQSHuhpn
         EGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ocOAuNeLkioH/yE5pCq+w2eZPa+u9uhuDf/ZqmhD4Rk=;
        b=X1KDhmEjorHv4cQVgV/72H1QKYjKPXt8dy3jTY1SyIpEguuk6oVERJ5Ivrux8ulYuY
         v0loOg4pkmlMeCPyyvTZX00MwxL+37mioWQpwWEKC6A+UnD71A4ohs9GHTRfG3QnIgUV
         xtXX8gDQbrTLPiQi68kZJmXWPp3JnbY32W7iU4uaqMqIllwa7cA388T5b+VQDmxrjrJH
         bq+hFkdvlHFS5MrYqjIrTIXosImqGfgNNpl8NjjvWfh80x/eqhHpnCMZCnNhK1R1DR0u
         Ppf95ue3yOrVefxqg6dW5xj1XhU+krWDebFJfTxFh13z92rUofy0GmV/Ly9tEh4sthIs
         tKJg==
X-Gm-Message-State: AOAM532Mb1Gv3PXaFV7HKGnOZetCwUWeIIJS1bU95gygeMuGcLIg6BnW
	/pFQ0JjYddXes74F6GahChT9Ozl2kEIhtCgX4hNkiQ==
X-Google-Smtp-Source: ABdhPJy7iijv0ZsSvvDXFjqGQAukWJH+YmhBjUI4nnbA2tth1+IcVsrCoDEen6gvGLyqBR9Z65nMG/gZQ7FuXdqEzOk=
X-Received: by 2002:a1c:1f04:: with SMTP id f4mr24110964wmf.12.1615774561152;
 Sun, 14 Mar 2021 19:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615452338.git.liezhi.yang@windriver.com>
 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
 <20210311090200.33p3mptsfwusspwa@jama> <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
 <fba65a47-7d0c-e0b4-3ea8-aad55b66bd62@windriver.com> <20210312111708.zgj3qjikjcekj4y6@jama>
 <20210315001603.GJ4892@denix.org> <429191805a150822726954fccc1f1ff8028bce0e.camel@linuxfoundation.org>
In-Reply-To: <429191805a150822726954fccc1f1ff8028bce0e.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sun, 14 Mar 2021 16:15:48 -1000
Message-ID: <CAOSpxdb61RUWP3UFpcYuvxK-LeCCQz9hn6VSnu7jhKOW5pX+vQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>, Martin Jansa <Martin.Jansa@gmail.com>, 
	Robert Yang <liezhi.yang@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anibal Limon <anibal.limon@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c13dcf05bd89d4ae"

--000000000000c13dcf05bd89d4ae
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 14, 2021, 2:18 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2021-03-14 at 20:16 -0400, Denys Dmytriyenko wrote:
> > On Fri, Mar 12, 2021 at 12:17:08PM +0100, Martin Jansa wrote:
> > > On Fri, Mar 12, 2021 at 03:59:20PM +0800, Robert Yang wrote:
> > > > Hi RP,
> > > >
> > > > On 3/11/21 10:38 PM, Richard Purdie wrote:
> > > > > On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:
> > > > > > On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
> > > > > > > This can fix a do_package error when compile with
> meta-secure-core layer:
> > > > > > >
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-secure-core/
> > > > > > >
> > > > > > > $ bitbake kernel-initramfs
> > > > > > > [snip]
> > > > > > > WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
> > > > > > >
> build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-secure-core-image-initramfs.packagedata
> > > > > > > not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch
> x86_64_x86_64-nativesdk (variant '')?
> > > > > > > [snip]
> > > > > > >
> > > > > > > This is because kernel-initramfs wants to pack an initramfs
> image into
> > > > > > > kernel-initramfs.rpm which adds a dependency in
> kernel-initramfs.bb to do this:
> > > > > > >
> > > > > > > d.appendVarFlag('do_install', 'depends', '
> ${INITRAMFS_IMAGE}:do_image_complete')
> > > > > > >
> > > > > > > This causes kernel-initramfs' do_package depends on
> > > > > > > ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we
> will get the
> > > > > > > error. Delete do_packagedata as other do_package relelated
> tasks for the image
> > > > > > > recipe will fix the error.
> > > > > > >
> > > > > > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > > > >
> > > > > > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > >
> > > > > > I went a bit further and inheritted nopackages, but RP mentioned
> that it
> > > > > > might be removing too much. Nothing failed with nopackages over
> night,
> > > > > > but still this smaller version will be safer as this needs to
> got to
> > > > > > gatesgarth and dunfell as well now.
> > > > >
> > > > > This has side effects and there was a reason this wasn't done
> originally. The
> > > > > trouble is that nobody is testing for that, just wanting to fix
> the problem
> > > > > they see. To prove this isn't straightforward, I tested this
> locally, comparing
> > > > > task-depends.dot from "bitbake core-image-sato -g" before and
> after this patch.
> > > >
> > > > If we want to avoid disconnecting them, it seems that a better way
> is fixing
> > > > this in the recipes which has this problem? For example, I got this
> error in
> > > > secure-core-image-initramfs.bb, then we can add "deltask
> do_packagedata" in the
> > > > recipe to fix the problem.
> > >
> > > That's what I did in initramfs-android-image (which was triggering this
> > > for me as reported on ML)
> > >
> https://github.com/shr-distribution/meta-smartphone/commit/732dd29325d882a9b3414764ad4c7a254dae3f03
> >
> > The issue of doing this in each and every possible initramfs image
> recipe is
> > that it does not scale. For example, this code in the original patch is
> very
> > common:
> >
> > d.appendVarFlag('do_install', 'depends', '
> ${INITRAMFS_IMAGE}:do_image_complete')
> >
> > And INITRAMFS_IMAGE can be set anywhere - in machine config, distro
> config or
> > even by end user in local.conf
> >
> >
> > > > @Martin maybe we shouldn't backport this patch to gatesgarth or
> dunfell since
> > > > it may suprise the users.
> > >
> > > Unfortunately
> > >
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=e0c1db170fdd6c1d78fdfce017feae26c96fac29
> > > was already backported to both gatesgarth and dunfell.
> >
> > Yeah, it's unfortunate. Our LTS maintainer is too good! :)
> > Seriously though, not sure why changing warning to error was even
> considered
> > for backporting to LTS! Making things stricter doesn't usually fall
> under
> > "bugfix" category...
>
> FWIW I'm leaning to merging a deltask to image.bbclass in master and
> suggesting we revert this and live with the warning in older branches...
>


Agreed, I'll add a revert to my next set of patches.

Steve



> The deltask will probably break things but I'm starting to think that
> is the lesser of several issues. Its not appropriate for the stable
> branches though.
>
> Cheers,
>
> Richard
>
>
>
>

--000000000000c13dcf05bd89d4ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Mar 14, 2021, 2:18 PM Richard Purdie &lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfounda=
tion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 202=
1-03-14 at 20:16 -0400, Denys Dmytriyenko wrote:<br>
&gt; On Fri, Mar 12, 2021 at 12:17:08PM +0100, Martin Jansa wrote:<br>
&gt; &gt; On Fri, Mar 12, 2021 at 03:59:20PM +0800, Robert Yang wrote:<br>
&gt; &gt; &gt; Hi RP,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On 3/11/21 10:38 PM, Richard Purdie wrote:<br>
&gt; &gt; &gt; &gt; On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:<=
br>
&gt; &gt; &gt; &gt; &gt; On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Y=
ang wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; This can fix a do_package error when compile =
with meta-secure-core layer:<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"http://layers.openembedded.org/lay=
erindex/branch/master/layer/meta-secure-core/" rel=3D"noreferrer noreferrer=
" target=3D"_blank">http://layers.openembedded.org/layerindex/branch/master=
/layer/meta-secure-core/</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; $ bitbake kernel-initramfs<br>
&gt; &gt; &gt; &gt; &gt; &gt; [snip]<br>
&gt; &gt; &gt; &gt; &gt; &gt; WARNING:kernel-initramfs-1.0-r0 do_package: M=
anifest<br>
&gt; &gt; &gt; &gt; &gt; &gt; build/tmp-glibc/sstate-control/manifest-x86_6=
4_x86_64-nativesdk-secure-core-image-initramfs.packagedata<br>
&gt; &gt; &gt; &gt; &gt; &gt; not found in intel_x86_64 corei7-64 core2-64 =
x86_64 allarch x86_64_x86_64-nativesdk (variant &#39;&#39;)?<br>
&gt; &gt; &gt; &gt; &gt; &gt; [snip]<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; This is because kernel-initramfs wants to pac=
k an initramfs image into<br>
&gt; &gt; &gt; &gt; &gt; &gt; kernel-initramfs.rpm which adds a dependency =
in <a href=3D"http://kernel-initramfs.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">kernel-initramfs.bb</a> to do this:<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; d.appendVarFlag(&#39;do_install&#39;, &#39;de=
pends&#39;, &#39; ${INITRAMFS_IMAGE}:do_image_complete&#39;)<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; This causes kernel-initramfs&#39; do_package =
depends on<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${INITRAMFS_IMAGE}:do_image_complete&#39;s do=
_packagedata, then we will get the<br>
&gt; &gt; &gt; &gt; &gt; &gt; error. Delete do_packagedata as other do_pack=
age relelated tasks for the image<br>
&gt; &gt; &gt; &gt; &gt; &gt; recipe will fix the error.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Robert Yang &lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank" rel=3D"noreferrer">liezhi.=
yang@windriver.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Acked-by: Martin Jansa &lt;<a href=3D"mailto:Marti=
n.Jansa@gmail.com" target=3D"_blank" rel=3D"noreferrer">Martin.Jansa@gmail.=
com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; I went a bit further and inheritted nopackages, bu=
t RP mentioned that it<br>
&gt; &gt; &gt; &gt; &gt; might be removing too much. Nothing failed with no=
packages over night,<br>
&gt; &gt; &gt; &gt; &gt; but still this smaller version will be safer as th=
is needs to got to<br>
&gt; &gt; &gt; &gt; &gt; gatesgarth and dunfell as well now.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; This has side effects and there was a reason this wasn&=
#39;t done originally.=C2=A0The<br>
&gt; &gt; &gt; &gt; trouble is that nobody is testing for that, just wantin=
g to fix the problem<br>
&gt; &gt; &gt; &gt; they see. To prove this isn&#39;t straightforward, I te=
sted this locally, comparing<br>
&gt; &gt; &gt; &gt; task-depends.dot from &quot;bitbake core-image-sato -g&=
quot; before and after this patch.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; If we want to avoid disconnecting them, it seems that a bett=
er way is fixing<br>
&gt; &gt; &gt; this in the recipes which has this problem? For example, I g=
ot this error in<br>
&gt; &gt; &gt; <a href=3D"http://secure-core-image-initramfs.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">secure-core-image-initramfs.bb</a>, t=
hen we can add &quot;deltask do_packagedata&quot; in the<br>
&gt; &gt; &gt; recipe to fix the problem.<br>
&gt; &gt; <br>
&gt; &gt; That&#39;s what I did in initramfs-android-image (which was trigg=
ering this<br>
&gt; &gt; for me as reported on ML)<br>
&gt; &gt; <a href=3D"https://github.com/shr-distribution/meta-smartphone/co=
mmit/732dd29325d882a9b3414764ad4c7a254dae3f03" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://github.com/shr-distribution/meta-smartphone/com=
mit/732dd29325d882a9b3414764ad4c7a254dae3f03</a><br>
&gt; <br>
&gt; The issue of doing this in each and every possible initramfs image rec=
ipe is <br>
&gt; that it does not scale. For example, this code in the original patch i=
s very <br>
&gt; common:<br>
&gt; <br>
&gt; d.appendVarFlag(&#39;do_install&#39;, &#39;depends&#39;, &#39; ${INITR=
AMFS_IMAGE}:do_image_complete&#39;)<br>
&gt; <br>
&gt; And INITRAMFS_IMAGE can be set anywhere - in machine config, distro co=
nfig or <br>
&gt; even by end user in local.conf<br>
&gt; <br>
&gt; <br>
&gt; &gt; &gt; @Martin maybe we shouldn&#39;t backport this patch to gatesg=
arth or dunfell since<br>
&gt; &gt; &gt; it may suprise the users.<br>
&gt; &gt; <br>
&gt; &gt; Unfortunately<br>
&gt; &gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/=
?h=3Ddunfell&amp;id=3De0c1db170fdd6c1d78fdfce017feae26c96fac29" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://git.openembedded.org/openembed=
ded-core/commit/?h=3Ddunfell&amp;id=3De0c1db170fdd6c1d78fdfce017feae26c96fa=
c29</a><br>
&gt; &gt; was already backported to both gatesgarth and dunfell.<br>
&gt; <br>
&gt; Yeah, it&#39;s unfortunate. Our LTS maintainer is too good! :)<br>
&gt; Seriously though, not sure why changing warning to error was even cons=
idered <br>
&gt; for backporting to LTS! Making things stricter doesn&#39;t usually fal=
l under <br>
&gt; &quot;bugfix&quot; category...<br>
<br>
FWIW I&#39;m leaning to merging a deltask to image.bbclass in master and<br=
>
suggesting we revert this and live with the warning in older branches...<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Agreed, I&#39;ll add a revert to my next set of pa=
tches.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Steve</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
The deltask will probably break things but I&#39;m starting to think that<b=
r>
is the lesser of several issues. Its not appropriate for the stable<br>
branches though.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000c13dcf05bd89d4ae--
