Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id B387571AC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:04:48 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id f190so4533690ita.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o4fFuIKTezT4WZmrqR0H+LWZpA97+Gy88uUsfd37FjE=;
	b=lN628P50atOcU4GzU3bfU0p4PBMLok1paeNiSQluPP7yUV0cJwyU6z01qDdJ/4KUIe
	bL8lMJID3YvDGoQ/HE5yJvHCWrnV/PRnRIRvh8RybdKsJH9kVlwrPviUj3nac+Rev1BM
	DLERqVKk3rv0lcpLqZcSpVWmLK5mqxvT50st7vMCeYWKDXvJzrM9acKbbEMg590A/eCa
	Zu9ZyWwOpMSkrJqDmoAYHY3ZuMdq6o/EYwWaJn7dftuiNBuwinbCqh4/kcic+CaG5TI4
	LrQq5sYljm9m9AOGARnRaW4FRtQPhfY+PcSmaW/PZF/w1SHZLU7ReZzsMu+9yHW86kbx
	gTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o4fFuIKTezT4WZmrqR0H+LWZpA97+Gy88uUsfd37FjE=;
	b=GfkRS8QeJRNRlYJ5zU2pamB+HPnle+CHazQcfZoJiwBRVcCSf58kGaohYLS311MBDa
	FM9M4awdL6xHpuZksLkHbarM2ZasPBkz4THRLKnrlXjepOcvzB8fGKzUsxRVUxIPfM/C
	2fLQkoo8/voDmzSUERd9T9WaZo93f+QGYwNPLk39qPWBJ50I+SUlj21Dv1S4+QdehtRe
	u9jJ4f5kZUIu7sQNjpWISILFF/SyIBsDH7ld4pzZ9qie+NgRJUmAGyu323GIFOkNgpPc
	liQ0Z0QnQcMda4nW1pIZJs+sRBIT0HgGDnWgf4Qna5OInhgl8w9mhLazOILfJTtsQJoa
	xOsQ==
X-Gm-Message-State: AKGB3mI0cILwRoE5ndlsmVpYL97KF3IyeBhfmvFrzmWEGjkch8k+zTro
	G8b0dHRXFJ40htooJKS1FJkzlnFkc6GDG347eWR3Pw==
X-Google-Smtp-Source: ACJfBovP3e9fRWJC2LyXKuarzhPm5TxODzZ99rliD9GFcDvIi70jU21rk2+gjG4GSYUx1LvNFAlm+lYa8ruX0wfPwrY=
X-Received: by 10.36.93.5 with SMTP id w5mr5171094ita.124.1513721089647; Tue,
	19 Dec 2017 14:04:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Tue, 19 Dec 2017 14:04:29 -0800 (PST)
In-Reply-To: <20171219212050.GP14220@bill-the-cat>
References: <20171219201148.19828-1-sgw@linux.intel.com>
	<20171219205438.GN14220@bill-the-cat>
	<CAJ86T=Vkj_5FEWTheHJrH_N0nucHo9yW0MANMoevgUFwnswQ-w@mail.gmail.com>
	<20171219212050.GP14220@bill-the-cat>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Dec 2017 22:04:29 +0000
Message-ID: <CAJTo0LYRX7xJzvGNJoNWztCAdWZB=pKfFfjKsaPSA9J=WtfEPA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: preserve rootfs if mkext234fs() fails
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
X-List-Received-Date: Tue, 19 Dec 2017 22:04:48 -0000
Content-Type: multipart/alternative; boundary="001a1143f14cd67bc30560b8a7d8"

--001a1143f14cd67bc30560b8a7d8
Content-Type: text/plain; charset="UTF-8"

On 19 December 2017 at 21:20, Tom Rini <trini@konsulko.com> wrote:

> On Tue, Dec 19, 2017 at 01:19:09PM -0800, Andre McCurdy wrote:
> > On Tue, Dec 19, 2017 at 12:54 PM, Tom Rini <trini@konsulko.com> wrote:
> > > On Tue, Dec 19, 2017 at 12:11:48PM -0800, Saul Wold wrote:
> > >> We have seen more failures, but have not been able to directly
> reproduce
> > >> it maybe svaing the rootfs and it contains some content that is
> tripping
> > >> up the e2fsprogs mkfs.ext4 populate_rootfs() function
> > >>
> > >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > >> ---
> > >>  meta/classes/image_types.bbclass | 7 ++++++-
> > >>  1 file changed, 6 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> > >> index 9188bed4197..6b4f39ed274 100644
> > >> --- a/meta/classes/image_types.bbclass
> > >> +++ b/meta/classes/image_types.bbclass
> > >> @@ -86,9 +86,14 @@ oe_mkext234fs () {
> > >>       bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_
> NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
> > >>       dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_
> NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
> > >>       bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
> > >> -     bbdebug 1 "Actual Partion size: `ls -s
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
> > >> +     bbdebug 1 "Actual Partion size: `ls -l
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
> > >>       bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd
> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d
> ${IMAGE_ROOTFS}"
> > >>       mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype
> -d ${IMAGE_ROOTFS}
> > >> +     if [ $? -ne 0 ]; then
> > >> +             tmp_saved_rootfs=`mktemp -d -p /tmp saved_rootfs.XXXXX`
> > >> +             cp -r ${IMAGE_ROOTFS} $tmp_saved_rootfs
> > >> +     fi
> > >
> > > Wouldn't it be better to just fail on error here, rather than dump
> stuff
> > > to /tmp ?
> >
> > It already does fail with an error. Saving the state is temporary
> > additional debug to help understand why.
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=12304
>
> So the problem is with the autobuilder where everything else gets blown
> away.  That's fine, this is an autobuilder specific work-around, not a
> general purpose patch and shouldn't be in mainline, would be my point.
>

I suspect this will just hang in master-next and never merge into master.

Ross

--001a1143f14cd67bc30560b8a7d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 December 2017 at 21:20, Tom Rini <span dir=3D"ltr">&=
lt;<a href=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.c=
om</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h=
5">On Tue, Dec 19, 2017 at 01:19:09PM -0800, Andre McCurdy wrote:<br>
&gt; On Tue, Dec 19, 2017 at 12:54 PM, Tom Rini &lt;<a href=3D"mailto:trini=
@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br>
&gt; &gt; On Tue, Dec 19, 2017 at 12:11:48PM -0800, Saul Wold wrote:<br>
&gt; &gt;&gt; We have seen more failures, but have not been able to directl=
y reproduce<br>
&gt; &gt;&gt; it maybe svaing the rootfs and it contains some content that =
is tripping<br>
&gt; &gt;&gt; up the e2fsprogs mkfs.ext4 populate_rootfs() function<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.inte=
l.com">sgw@linux.intel.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 meta/classes/image_types.<wbr>bbclass | 7 ++++++-<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/classes/image_types.<wbr>bbclass b/meta/cla=
sses/image_types.<wbr>bbclass<br>
&gt; &gt;&gt; index 9188bed4197..6b4f39ed274 100644<br>
&gt; &gt;&gt; --- a/meta/classes/image_types.<wbr>bbclass<br>
&gt; &gt;&gt; +++ b/meta/classes/image_types.<wbr>bbclass<br>
&gt; &gt;&gt; @@ -86,9 +86,14 @@ oe_mkext234fs () {<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bbdebug 1 Executing &quot;dd if=3D/=
dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_<wbr>NAME}${IMAGE_NAME_SUFFIX}.$<wbr>=
fstype seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024&quot;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dd if=3D/dev/zero of=3D${IMGDEPLOYD=
IR}/${IMAGE_<wbr>NAME}${IMAGE_NAME_SUFFIX}.$<wbr>fstype seek=3D$ROOTFS_SIZE=
 count=3D$COUNT bs=3D1024<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bbdebug 1 &quot;Actual Rootfs size:=
=C2=A0 `du -s ${IMAGE_ROOTFS}`&quot;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0bbdebug 1 &quot;Actual Partion size: `ls=
 -s ${IMGDEPLOYDIR}/${IMAGE_NAME}$<wbr>{IMAGE_NAME_SUFFIX}.$fstype`&quot;<b=
r>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0bbdebug 1 &quot;Actual Partion size: `ls=
 -l ${IMGDEPLOYDIR}/${IMAGE_NAME}$<wbr>{IMAGE_NAME_SUFFIX}.$fstype`&quot;<b=
r>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bbdebug 1 Executing &quot;mkfs.$fst=
ype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}$<wbr>{IMAGE_NAME_SUFFI=
X}.$fstype -d ${IMAGE_ROOTFS}&quot;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs.$fstype -F $extra_imagecmd ${I=
MGDEPLOYDIR}/${IMAGE_NAME}$<wbr>{IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOT=
FS}<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_saved_ro=
otfs=3D`mktemp -d -p /tmp saved_rootfs.XXXXX`<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${IMAG=
E_ROOTFS} $tmp_saved_rootfs<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt;<br>
&gt; &gt; Wouldn&#39;t it be better to just fail on error here, rather than=
 dump stuff<br>
&gt; &gt; to /tmp ?<br>
&gt;<br>
&gt; It already does fail with an error. Saving the state is temporary<br>
&gt; additional debug to help understand why.<br>
&gt;<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12304" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org=
/show_bug.cgi?id=3D12304</a><br>
<br>
</div></div>So the problem is with the autobuilder where everything else ge=
ts blown<br>
away.=C2=A0 That&#39;s fine, this is an autobuilder specific work-around, n=
ot a<br>
general purpose patch and shouldn&#39;t be in mainline, would be my point.<=
br></blockquote><div><br></div><div>I suspect this will just hang in master=
-next and never merge into master.</div><div><br></div><div>Ross=C2=A0</div=
></div></div></div>

--001a1143f14cd67bc30560b8a7d8--
