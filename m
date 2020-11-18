Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.19222.1605671557374518720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 19:52:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UevuHflw;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id dk16so703255ejb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 19:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nADDPAzJbAOkivQkcV8SsRt4os5v06VkVkYPuaoX0wQ=;
        b=UevuHflwdHSIrLXRoapM7wKzhVQyrVOqi6ow4la7PfoA0Lp91EP1lGMTSoFyfbU+Et
         Ftc0yqGNqkS9ecSRIjtVu33nJpWEwPtcseWNAO/TiMSI6XlSg+PNAKirMzOQASOuMbOK
         Ywh7HCgfx1PMm6xUqBgoIYtscTdEmYE6q6GNn1L0wKLJcnLxKI1JpBclR1/TA5WOT8b8
         nd1NqS3WahWQSDD2lwY4+s/x0Q3l1PqmlfMCfspEWfXXtyTQGNhHveO+xfIKZjZpRFDF
         pASSeICJzXW+zcetS/W/Ric/IjCvyX9O9FNTw3uctmCpa8gImuF/5B92p9NrGnxYK9Rq
         X5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nADDPAzJbAOkivQkcV8SsRt4os5v06VkVkYPuaoX0wQ=;
        b=BgRRJ2usbRo+gtOBDmpm7ldjBdUauZzBnPMF6XqAMEYgFVHiK6KVaFUGl723q6+8AZ
         bBQtzJjM2JrC/H5WJEhm0w72/Fxi/t50MfTUbKNNowDTvW2qJhtR9rHTRIQErmX+gdc6
         Vrn7HZHOQolIFq/C1pJYq91Iu0zKBxUfIIOW1RhfYsZpLlKOm7hHwRvKfQ6U4EH2xLGR
         cHGfCelOW+1apbg91XmPD1KQW1awhsF675KrQTsFT6ifB4C0p+yXUXx7AbxqH6OuB8Ih
         XHS84e0d2mWmIN2kjcufXHgSsHevoML3QdRGM9MveeLGmNuQU5++PFzkTHFv/+QwEujn
         BFuQ==
X-Gm-Message-State: AOAM530ZF6aIRh8Y+mIbJouqOG1OpjAvPdm/ZPR3Ur+IQk/hNca1S5ap
	3zgz7rmzPyxkl/DEzV+hqv1uVjJXsaQyj04EPNE=
X-Google-Smtp-Source: ABdhPJzF/XgUjZ+Prc1W3HN6SkGBUYJoNLFofsdQHbEAYnBl+Rp+LZmfo+H5OBDjMSifvAjSqGltg+46zkjvPyy9Etk=
X-Received: by 2002:a17:907:4335:: with SMTP id ni5mr18435696ejb.459.1605671555626;
 Tue, 17 Nov 2020 19:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20201117140641.19575-1-bruce.ashfield@gmail.com>
 <CAMKF1srGFphXgGN-RfnV35PGqpthR5XeEH87-djvx4_guWVcYg@mail.gmail.com> <16487D7CA1DB90E3.28066@lists.openembedded.org>
In-Reply-To: <16487D7CA1DB90E3.28066@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 17 Nov 2020 22:52:24 -0500
Message-ID: <CADkTA4NcQF_X1dcgNRGiWSnA2KGZ_ZpiKJBF9ocw_g2Sx-Np6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: relocate copy of module.lds to module compilation task
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b2fc4205b4598a82"

--000000000000b2fc4205b4598a82
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2020 at 10:47 PM Bruce Ashfield via lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:

>
>
> On Tue, Nov 17, 2020 at 9:20 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> Hi Bruce
>>
>> On Tue, Nov 17, 2020 at 6:06 AM Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>> >
>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >
>> > There were two copies of this patch floating around, and the merged
>> > variant has the copy in the wrong place.
>> >
>> > module.lds is only created during modules_prepare, and that target is
>> > not invoked during our main build of the kernel. We aren't about to
>> > change the kernel build (there's no need), so we move the copy into
>> > the compile_kernelmodules task. After that runs, we have module.lds
>> > availble to copy.
>> >
>> > This has been tested against clean kernel + out of tree module
>> > builds, and the dependencies are correct that the file is copied
>> > before the out of tree module build starts.
>> >
>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > ---
>> >
>> > This is just a fixup to the patch [kernel: provide module.lds for out of
>> > tree builds in v5.10+], which v1 merged instead of v2.
>> >
>> > Build tested locally.
>> >
>> >  meta/classes/kernel.bbclass | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> > index ccd74e61e8..af4c891de4 100644
>> > --- a/meta/classes/kernel.bbclass
>> > +++ b/meta/classes/kernel.bbclass
>> > @@ -391,6 +391,7 @@ do_compile_kernelmodules() {
>> >                 # other kernel modules and will look at this
>> >                 # file to do symbol lookups
>> >                 cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
>> > +               [ -e ${B}/scripts/module.lds ] && install -Dm 0644
>> ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
>>
>> This change fails the task if file does not exist
>>
>> make: Leaving directory
>>
>> '/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-raspberrypi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/linux-raspberrypi4_64-standard-build'
>> WARNING:
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-raspberrypi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/temp/run.do_compile_kernelmodules.1515902:175
>> exit 1 from '[ -e
>>
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-raspberrypi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/linux-raspberrypi4_64-standard-build/scripts/module.lds
>> ]'
>> WARNING: Backtrace (BB generated script):
>>         #1: main,
>>
>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-raspberrypi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/temp/run.do_compile_kernelmodules.1515902,
>> line 175
>>
>> however if I change the above fragment to
>>
>>
>> if [ -f ${B}/scripts/module.lds ]; then
>>   install -Dm 0644 ${B}/scripts/module.lds
>> ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
>> fi
>>
>> it works well.
>>
>> and note I have used -f instead of -e since that appropriate check but
>> it does not matter if we use -e or -f it fails in same
>> way with the check you proposed.
>>
>
> That's really strange.
>
> I tested this against a clean oe-core with kernel versions from 5.4
> through 5.10.
>
> What kernel and version are you building ?
>

ahah. I can figure that out from your log.

I'll send a v2 once I've retested against that config, as well as my other
ones.

Bruce



>
> Bruce
>
>
>
>> >         else
>> >                 bbnote "no modules to compile"
>> >         fi
>> > @@ -494,7 +495,6 @@ do_shared_workdir () {
>> >         # Copy files required for module builds
>> >         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>> >         [ -e Module.symvers ] && cp Module.symvers $kerneldir/
>> > -       [ -e scripts/module.lds ] && install -Dm 0644
>> scripts/module.lds $kerneldir/scripts/module.lds
>> >         cp .config $kerneldir/
>> >         mkdir -p $kerneldir/include/config
>> >         cp include/config/kernel.release
>> $kerneldir/include/config/kernel.release
>> > --
>> > 2.19.1
>> >
>> >
>> >
>> >
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b2fc4205b4598a82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 10:47 PM Bruce Ashfield via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;b=
ruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"fo=
nt-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 9:20 PM Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bru=
ce<br>
<br>
On Tue, Nov 17, 2020 at 6:06 AM Bruce Ashfield &lt;<a href=3D"mailto:bruce=
.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; There were two copies of this patch floating around, and the merged<b=
r>
&gt; variant has the copy in the wrong place.<br>
&gt;<br>
&gt; module.lds is only created during modules_prepare, and that target is=
<br>
&gt; not invoked during our main build of the kernel. We aren&#39;t about =
to<br>
&gt; change the kernel build (there&#39;s no need), so we move the copy in=
to<br>
&gt; the compile_kernelmodules task. After that runs, we have module.lds<b=
r>
&gt; availble to copy.<br>
&gt;<br>
&gt; This has been tested against clean kernel + out of tree module<br>
&gt; builds, and the dependencies are correct that the file is copied<br>
&gt; before the out of tree module build starts.<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; This is just a fixup to the patch [kernel: provide module.lds for out=
 of<br>
&gt; tree builds in v5.10+], which v1 merged instead of v2.<br>
&gt;<br>
&gt; Build tested locally.<br>
&gt;<br>
&gt;=C2=A0 meta/classes/kernel.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclas=
s<br>
&gt; index ccd74e61e8..af4c891de4 100644<br>
&gt; --- a/meta/classes/kernel.bbclass<br>
&gt; +++ b/meta/classes/kernel.bbclass<br>
&gt; @@ -391,6 +391,7 @@ do_compile_kernelmodules() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# other =
kernel modules and will look at this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# file t=
o do symbol lookups<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${B}/=
Module.symvers ${STAGING_KERNEL_BUILDDIR}/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e ${B}/scr=
ipts/module.lds ] &amp;&amp; install -Dm 0644 ${B}/scripts/module.lds ${STA=
GING_KERNEL_BUILDDIR}/scripts/module.lds<br>
<br>
This change fails the task if file does not exist<br>
<br>
make: Leaving directory<br>
&#39;/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-rasp=
berrypi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/linux-raspberrypi4_64-=
standard-build&#39;<br>
WARNING: /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-=
raspberrypi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/temp/run.do_compil=
e_kernelmodules.1515902:175<br>
exit 1 from &#39;[ -e<br>
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-raspberry=
pi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/linux-raspberrypi4_64-stand=
ard-build/scripts/module.lds<br>
]&#39;<br>
WARNING: Backtrace (BB generated script):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #1: main,<br>
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/linux-raspberry=
pi/1_5.4.72+gitAUTOINC+5d52d9eea9_154de7bbd5-r0/temp/run.do_compile_kernelm=
odules.1515902,<br>
line 175<br>
<br>
however if I change the above fragment to<br>
<br>
<br>
if [ -f ${B}/scripts/module.lds ]; then<br>
=C2=A0 install -Dm 0644 ${B}/scripts/module.lds<br>
${STAGING_KERNEL_BUILDDIR}/scripts/module.lds<br>
fi<br>
<br>
it works well.<br>
<br>
and note I have used -f instead of -e since that appropriate check but<br>
it does not matter if we use -e or -f it fails in same<br>
way with the check you proposed.<br></blockquote><div><br></div><div><div =
style=3D"font-size:small">That&#39;s really strange.</div><div style=3D"fon=
t-size:small"><br></div><div style=3D"font-size:small">I tested this agains=
t a clean oe-core with kernel versions from 5.4 through 5.10.</div><div sty=
le=3D"font-size:small"><br></div><div style=3D"font-size:small">What kernel=
 and version are you building ?</div></div></div></div></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">ahah. I=
 can figure that out from your log.</div><div class=3D"gmail_default" style=
=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">I&#39;ll send a v2 once I&#39;ve retested against that config, =
as well as my other ones.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=
=3D"font-size:small"><br></div><div style=3D"font-size:small">Bruce</div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &=
quot;no modules to compile&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; @@ -494,7 +495,6 @@ do_shared_workdir () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Copy files required for module bui=
lds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp System.map $kerneldir/System.map-=
${KERNEL_VERSION}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e Module.symvers ] &amp;&amp; cp =
Module.symvers $kerneldir/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e scripts/module.lds ] &amp;&amp; inst=
all -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp .config $kerneldir/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $kerneldir/include/config<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp include/config/kernel.release $ke=
rneldir/include/config/kernel.release<br>
&gt; --<br>
&gt; 2.19.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
">- Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<b=
r><br></div></div>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000b2fc4205b4598a82--
