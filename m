Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web08.321.1607114901319589991
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h8NGF/Rt;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id f71so781499vka.12
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HgU1i2trsqXlM7M0Q5tU/t70V8LPxT0y9Vr0WzhebO0=;
        b=h8NGF/RtMNJpxkWo5+KKYSFOHjVTv7Ua5zgCUVcALchvvw3sYodRCEEZk0xgvez8RI
         YIF1LDprNj4xmoEgc4U4ct25HQ1rdrIpWZHrPk85KMDlhcZwyRxJipPwz4BI6yS6duIi
         z0loi5aDJV7f9BzolyjivpD8BKQqyBIDylJcTiURb0IJ37asZxHCJ0CGtexR/OGrPMnT
         6QcZdkyu/9I4XoNZla4WlPi90j6YW/Oc8dnmG/If0UD7NfHDcTq2bRoCQScyNZAXCyri
         sFG6Q3yBuxx4d/DeFJBDMYfhcZ/EXWsDXBstSARTUCShr8JTQsYcKXR+7g/+KCEgEVlY
         3fPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HgU1i2trsqXlM7M0Q5tU/t70V8LPxT0y9Vr0WzhebO0=;
        b=XyUjiQpKheUMSgMuGV5T5GQZFYJ+lzOylYmrxLk3l9NyEU+Qk9ypVB15KaT8VKvouP
         6/VF9xVCV4Hjs4uGS8YoceX58Os+TEdrefOOMdOVJrI350dM6TVAHEpUim5/wz5JpZ4U
         1YrV+IasD4SlqKUjeXZwPunz95YXr9ICOOO86gEcAg5wqtUyjAfpJxq/Gzabjk3iqaSe
         1L41EdWQ4MXSoQvzFNwOAVBmHfCXuxuq4vA0gyreHcaEcV+9EA8MxT4FnWK5oGNivFZG
         MfVMxzu+NbHOQOMcAcvMiPkHJ5K/vp9y0fSjIjFIJG+065xCVi6PQgeRYe0gbFLp7pys
         +e/A==
X-Gm-Message-State: AOAM531/CHGhy0C08UUwz1EraxtLxsOsznZLHK+6GSvBG/VcY3KS9nhE
	IX/F50C9tKRM51Aqt8CVY8dE8gIMqgheg5eiy6E=
X-Google-Smtp-Source: ABdhPJyRENRRf7h7e05gIpWW1gBrhnCH/tAMRa6nxjrWe7rwgW8oGgfSTlq8TLjtTzAgphlKUvvL1SI1hp11eGpA19I=
X-Received: by 2002:a1f:6089:: with SMTP id u131mr6074813vkb.0.1607114900409;
 Fri, 04 Dec 2020 12:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20201204200737.7072-1-alex.kanavin@gmail.com> <20201204200737.7072-23-alex.kanavin@gmail.com>
 <1310333798.6725.1607114389130.JavaMail.zimbra@efficios.com>
In-Reply-To: <1310333798.6725.1607114389130.JavaMail.zimbra@efficios.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 4 Dec 2020 21:48:08 +0100
Message-ID: <CANNYZj92PzV-5DXm1RGqz2eh4hcFVWtJ11XeACKTrk0GCY4Hag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/23] ptest-packagelists.inc: exclude lttng-tools-ptest
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c0958405b5a99830"

--000000000000c0958405b5a99830
Content-Type: text/plain; charset="UTF-8"

This is the patch that disables the sporadically failing stuff:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-the-tools-live-tests.patch

And this is the bug I had filed upstream:
https://bugs.lttng.org/issues/1217

As no movement occurred on that bug since Jan, I am not keen on filing
additional bugs, but you can see the additional, currently occuring
failures here:
https://autobuilder.yocto.io/pub/non-release/20201204-4/testresults/qemux86-64-ptest/lttng-tools.log

Alex


On Fri, 4 Dec 2020 at 21:39, Jonathan Rajotte-Julien <
jonathan.rajotte-julien@efficios.com> wrote:

> Hi,
>
> Upstream here.
>
> Always happy to give input as long as we are put in the loop.
> Also bugs/sporadic test failure can be reported on our mailing list [1]
> and bug tracker[2].
>
> [1] https://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev
> [2] https://bugs.lttng.org/
>
> We understand that the burden can be quite high for a project such as
> lttng given we end up doing weird
> testing due to the nature of our work and that we are human ;).
> Still we are always interested in getting info about "sporadic" failures.
>
> To be clear, we are not against this patch. We understand the burden
> associated with testing lttng.
>
> Cheers
>
> ----- Original Message -----
> > From: "Alexander Kanavin" <alex.kanavin@gmail.com>
> > To: "openembedded-core" <openembedded-core@lists.openembedded.org>
> > Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
> > Sent: Friday, December 4, 2020 3:07:36 PM
> > Subject: [OE-core] [PATCH 23/23] ptest-packagelists.inc: exclude
> lttng-tools-ptest
>
> > These tests have been failing for a long time (and even more failing
> > tests are already patched out); no one in YP has the
> > expertise to fix the issues, so until upstream steps in, let's take
> > them out, and try to reach the goal of hard ptest failures so that
> > ptest regressions are caught as they happen.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> > meta/conf/distro/include/ptest-packagelists.inc | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > b/meta/conf/distro/include/ptest-packagelists.inc
> > index ce13368c2e..90272a70af 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -60,6 +60,7 @@ PTESTS_FAST_remove_mips64 = "qemu-ptest"
> > #    bash-ptest \ # Test outcomes are non-deterministic by design
> > #    ifupdown-ptest \ # Tested separately in
> > lib/oeqa/selftest/cases/imagefeatures.py
> > #    mdadm-ptest \ # Tests rely on non-deterministic sleep() amounts
> > +#    lttng-tools-ptest \ # multiple sporadic failures, lack of
> expertise in the
> > project to look into them
> > #"
> >
> > PTESTS_SLOW = "\
> > @@ -73,7 +74,6 @@ PTESTS_SLOW = "\
> >     gstreamer1.0-ptest \
> >     libevent-ptest \
> >     libinput-ptest \
> > -    lttng-tools-ptest \
> >     openssh-ptest \
> >     openssl-ptest \
> >     perl-ptest \
> > --
> > 2.29.2
> >
> >
> >
> > 
>

--000000000000c0958405b5a99830
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is the patch that disables the sporadically fail=
ing stuff:</div><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/p=
oky/tree/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disabl=
e-the-tools-live-tests.patch">http://git.yoctoproject.org/cgit/cgit.cgi/pok=
y/tree/meta/recipes-kernel/lttng/lttng-tools/0001-tests-regression-disable-=
the-tools-live-tests.patch</a></div><div><br></div><div>And this is the bug=
 I had filed upstream:</div><div><a href=3D"https://bugs.lttng.org/issues/1=
217">https://bugs.lttng.org/issues/1217</a></div><div><br></div><div>As no =
movement occurred on that bug since Jan, I am not keen on filing additional=
 bugs, but you can see the additional, currently occuring failures here:</d=
iv><div><a href=3D"https://autobuilder.yocto.io/pub/non-release/20201204-4/=
testresults/qemux86-64-ptest/lttng-tools.log">https://autobuilder.yocto.io/=
pub/non-release/20201204-4/testresults/qemux86-64-ptest/lttng-tools.log</a>=
</div><div><br></div><div>Alex<br></div><div><br></div></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 4 Dec 2020 =
at 21:39, Jonathan Rajotte-Julien &lt;<a href=3D"mailto:jonathan.rajotte-ju=
lien@efficios.com">jonathan.rajotte-julien@efficios.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Upstream here.<br>
<br>
Always happy to give input as long as we are put in the loop. <br>
Also bugs/sporadic test failure can be reported on our mailing list [1] an=
d bug tracker[2].<br>
<br>
[1] <a href=3D"https://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.lttng.org/cgi-bin/mailm=
an/listinfo/lttng-dev</a><br>
[2] <a href=3D"https://bugs.lttng.org/" rel=3D"noreferrer" target=3D"_blan=
k">https://bugs.lttng.org/</a><br>
<br>
We understand that the burden can be quite high for a project such as lttn=
g given we end up doing weird <br>
testing due to the nature of our work and that we are human ;).<br>
Still we are always interested in getting info about &quot;sporadic&quot; =
failures.<br>
<br>
To be clear, we are not against this patch. We understand the burden assoc=
iated with testing lttng.<br>
<br>
Cheers<br>
<br>
----- Original Message -----<br>
&gt; From: &quot;Alexander Kanavin&quot; &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; To: &quot;openembedded-core&quot; &lt;<a href=3D"mailto:openembedded-=
core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.open=
embedded.org</a>&gt;<br>
&gt; Cc: &quot;Alexander Kanavin&quot; &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Sent: Friday, December 4, 2020 3:07:36 PM<br>
&gt; Subject: [OE-core] [PATCH 23/23] ptest-packagelists.inc: exclude lttn=
g-tools-ptest<br>
<br>
&gt; These tests have been failing for a long time (and even more failing<=
br>
&gt; tests are already patched out); no one in YP has the<br>
&gt; expertise to fix the issues, so until upstream steps in, let&#39;s ta=
ke<br>
&gt; them out, and try to reach the goal of hard ptest failures so that<br=
>
&gt; ptest regressions are caught as they happen.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/conf/distro/include/ptest-packagelists.inc | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; index ce13368c2e..90272a70af 100644<br>
&gt; --- a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; +++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; @@ -60,6 +60,7 @@ PTESTS_FAST_remove_mips64 =3D &quot;qemu-ptest&quot=
;<br>
&gt; #=C2=A0 =C2=A0 bash-ptest \ # Test outcomes are non-deterministic by =
design<br>
&gt; #=C2=A0 =C2=A0 ifupdown-ptest \ # Tested separately in<br>
&gt; lib/oeqa/selftest/cases/imagefeatures.py<br>
&gt; #=C2=A0 =C2=A0 mdadm-ptest \ # Tests rely on non-deterministic sleep(=
) amounts<br>
&gt; +#=C2=A0 =C2=A0 lttng-tools-ptest \ # multiple sporadic failures, lac=
k of expertise in the<br>
&gt; project to look into them<br>
&gt; #&quot;<br>
&gt; <br>
&gt; PTESTS_SLOW =3D &quot;\<br>
&gt; @@ -73,7 +74,6 @@ PTESTS_SLOW =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0gstreamer1.0-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0libevent-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0libinput-ptest \<br>
&gt; -=C2=A0 =C2=A0 lttng-tools-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0openssh-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0openssl-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0perl-ptest \<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000c0958405b5a99830--
