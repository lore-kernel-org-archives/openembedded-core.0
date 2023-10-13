Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E51ACDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:22:11 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.43221.1697214123302791213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 09:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=PEhiz532;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.98] (cpe-173-175-175-24.elp.res.rr.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5358E20B74C0;
	Fri, 13 Oct 2023 09:22:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5358E20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1697214122;
	bh=Z6HzAucAmIzeuuoFIfJsNIiBn3a436Qw3ao+3dkWNUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PEhiz532vSzPVMAfqXhaGw0vZ+zK0Urn04w5wFBYa2Y5oapq9g4L4ztlxwlOe2vhc
	 P+j4Wso64S+Zlcp2gam2P9SQmFN97N30rz1QBKPVOj9i99M6quASfCzu3gfDoS0sAS
	 3oWtIVjDkmsMO0cagnibVnUwgDrUh8kyj/a5JttY=
Content-Type: multipart/alternative;
 boundary="------------rcyl0atu1ymmWW9M998PSRm3"
Message-ID: <0868329b-a9bb-4630-bf65-88acaf35c7a1@linux.microsoft.com>
Date: Fri, 13 Oct 2023 10:21:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] qemux86/qemuarm: Drop kernel version
 overrides
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20231006113641.3248432-1-richard.purdie@linuxfoundation.org>
 <20231006113641.3248432-2-richard.purdie@linuxfoundation.org>
 <8f92775b-e01e-4505-9fba-252ddd1a8315@linux.microsoft.com>
 <474cb08bfb46afd366961f474f7984a9f9836feb.camel@linuxfoundation.org>
 <CADkTA4POKqowjUFMmqTRostqiu6kV0F07jy3oXZrc3YH=sxpaQ@mail.gmail.com>
Content-Language: en-US
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
In-Reply-To: <CADkTA4POKqowjUFMmqTRostqiu6kV0F07jy3oXZrc3YH=sxpaQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 16:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189074

This is a multi-part message in MIME format.
--------------rcyl0atu1ymmWW9M998PSRm3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On 10/11/23 15:54, Bruce Ashfield wrote:
>
>
> On Wed, Oct 11, 2023 at 5:39=E2=80=AFPM Richard Purdie=20
> <richard.purdie@linuxfoundation.org> wrote:
>
>     On Tue, 2023-10-10 at 19:11 -0600, Alejandro Enedino Hernandez
>     Samaniego wrote:
>     >
>     >
>     >
>     >
>     > On 10/6/23 05:36, Richard Purdie wrote:
>     >
>     >
>     > >
>     > > Drop the version overrides for the kernel for the x86 and arm
>     > > machines
>     > > so we can go back to following the distro versions. The
>     reasons for
>     > > these versions is mostly historical at this point as the issues
>     > > were
>     > > resolved.
>     > >
>     > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.o=
rg>
>     > > ---
>     > > =C2=A0meta/conf/machine/include/x86/x86-base.inc | 1 -
>     > > =C2=A0meta/conf/machine/qemuarm.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 4 ----
>     > > =C2=A0meta/conf/machine/qemuarmv5.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 1 -
>     > > =C2=A03 files changed, 6 deletions(-)
>     > >
>     > > diff --git a/meta/conf/machine/include/x86/x86-base.inc
>     > > b/meta/conf/machine/include/x86/x86-base.inc
>     > > index 050c20af70c..fc6c39148db 100644
>     > > --- a/meta/conf/machine/include/x86/x86-base.inc
>     > > +++ b/meta/conf/machine/include/x86/x86-base.inc
>     > > @@ -18,7 +18,6 @@ SERIAL_CONSOLES ?=3D "115200;ttyS0"
>     > > =C2=A0# kernel-related variables
>     > > =C2=A0#
>     > > =C2=A0PREFERRED_PROVIDER_virtual/kernel ??=3D "linux-yocto"
>     > > -PREFERRED_VERSION_linux-yocto ??=3D "6.4%"
>     > >
>     > > =C2=A0#
>     > > =C2=A0# XSERVER subcomponents, used to build the XSERVER variab=
le
>     > > diff --git a/meta/conf/machine/qemuarm.conf
>     > > b/meta/conf/machine/qemuarm.conf
>     > > index 04216cdc2e0..881733eb2da 100644
>     > > --- a/meta/conf/machine/qemuarm.conf
>     > > +++ b/meta/conf/machine/qemuarm.conf
>     > > @@ -28,8 +28,4 @@ QB_ROOTFS_OPT =3D "-drive
>     > > id=3Ddisk0,file=3D@ROOTFS@,if=3Dnone,format=3Draw -device virti=
o
>     > > =C2=A0QB_SERIAL_OPT =3D "-device virtio-serial-device -chardev
>     > > null,id=3Dvirtcon -device virtconsole,chardev=3Dvirtcon"
>     > > =C2=A0QB_TCPSERIAL_OPT =3D "-device virtio-serial-device -chard=
ev
>     > > socket,id=3Dvirtcon,port=3D@PORT@,host=3D127.0.0.1 -device
>     > > virtconsole,chardev=3Dvirtcon"
>     > >
>     > > -# 6.4 causes Xorg to fail to read the virtio framebuffer so st=
ick
>     > > with 6.1 until
>     > > -# that is resolved.
>     > > -PREFERRED_VERSION_linux-yocto ??=3D "6.1%"
>     > > -
>     > > =C2=A0KMACHINE:qemuarm =3D "qemuarma15"
>     > > diff --git a/meta/conf/machine/qemuarmv5.conf
>     > > b/meta/conf/machine/qemuarmv5.conf
>     > > index deb4869c0aa..f0a86f1e4c7 100644
>     > > --- a/meta/conf/machine/qemuarmv5.conf
>     > > +++ b/meta/conf/machine/qemuarmv5.conf
>     > > @@ -16,5 +16,4 @@ QB_GRAPHICS =3D "-device virtio-gpu-pci"
>     > > =C2=A0QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -=
device
>     usb-
>     > > kbd"
>     > > =C2=A0QB_DTB =3D
>     > >
>     "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto',
>     > > '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>     > >
>     > >
>     >
>     > Removing this bit results in the above line causing an
>     > ExpansionError, since
>     > PREFERRED_VERSION_linux-yocto isnt defined anywhere anymore (if n=
ot
>     > using poky.conf)
>     >
>     > What would be the right approach to solve this issue?, Should QB_=
DTB
>     > be depending on such variable?
>
>     4.7 is old enough we can probably just drop the conditional now?
>
>
> Yep, that should be safe. It hasn't changed name or format in quite=20
> some time.
>
> (Although there has been some re-organization in 6.5/6.6 around device=20
> trees, but that shouldn't come into play here).
>
> Bruce
>
>
>     Cheers,
>
>     Richard
>
Great, thanks for the pointers, sending patch.


Alejandro


>
>
>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188973):https://lists.openembedded.org/g/openembedd=
ed-core/message/188973
> Mute This Topic:https://lists.openembedded.org/mt/101795562/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
alhe@linux.microsoft.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------rcyl0atu1ymmWW9M998PSRm3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 10/11/23 15:54, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CADkTA4POKqowjUFMmqTRostqiu6kV0F07jy3oXZrc3YH=3DsxpaQ@mail.gm=
ail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div class=3D"gmail_default" style=3D"font-size:small"><br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 11, 2023 at
            5:39=E2=80=AFPM Richard Purdie &lt;<a
              href=3D"mailto:richard.purdie@linuxfoundation.org"
              moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">ri=
chard.purdie@linuxfoundation.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On
            Tue, 2023-10-10 at 19:11 -0600, Alejandro Enedino Hernandez<b=
r>
            Samaniego wrote:<br>
            &gt; =C2=A0<br>
            &gt; <br>
            &gt; =C2=A0<br>
            &gt; =C2=A0<br>
            &gt; On 10/6/23 05:36, Richard Purdie wrote:<br>
            &gt; =C2=A0<br>
            &gt; =C2=A0<br>
            &gt; &gt; =C2=A0<br>
            &gt; &gt; Drop the version overrides for the kernel for the
            x86 and arm<br>
            &gt; &gt; machines<br>
            &gt; &gt; so we can go back to following the distro
            versions. The reasons for<br>
            &gt; &gt; these versions is mostly historical at this point
            as the issues<br>
            &gt; &gt; were<br>
            &gt; &gt; resolved.<br>
            &gt; &gt; <br>
            &gt; &gt; Signed-off-by: Richard Purdie &lt;<a
              href=3D"mailto:richard.purdie@linuxfoundation.org"
              target=3D"_blank" moz-do-not-send=3D"true"
              class=3D"moz-txt-link-freetext">richard.purdie@linuxfoundat=
ion.org</a>&gt;<br>
            &gt; &gt; ---<br>
            &gt; &gt; =C2=A0meta/conf/machine/include/x86/x86-base.inc | =
1 -<br>
            &gt; &gt; =C2=A0meta/conf/machine/qemuarm.conf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4
            ----<br>
            &gt; &gt; =C2=A0meta/conf/machine/qemuarmv5.conf=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
            &gt; &gt; =C2=A03 files changed, 6 deletions(-)<br>
            &gt; &gt; <br>
            &gt; &gt; diff --git
            a/meta/conf/machine/include/x86/x86-base.inc<br>
            &gt; &gt; b/meta/conf/machine/include/x86/x86-base.inc<br>
            &gt; &gt; index 050c20af70c..fc6c39148db 100644<br>
            &gt; &gt; --- a/meta/conf/machine/include/x86/x86-base.inc<br=
>
            &gt; &gt; +++ b/meta/conf/machine/include/x86/x86-base.inc<br=
>
            &gt; &gt; @@ -18,7 +18,6 @@ SERIAL_CONSOLES ?=3D
            "115200;ttyS0"<br>
            &gt; &gt; =C2=A0# kernel-related variables<br>
            &gt; &gt; =C2=A0#<br>
            &gt; &gt; =C2=A0PREFERRED_PROVIDER_virtual/kernel ??=3D
            "linux-yocto"<br>
            &gt; &gt; -PREFERRED_VERSION_linux-yocto ??=3D "6.4%"<br>
            &gt; &gt; =C2=A0<br>
            &gt; &gt; =C2=A0#<br>
            &gt; &gt; =C2=A0# XSERVER subcomponents, used to build the
            XSERVER variable<br>
            &gt; &gt; diff --git a/meta/conf/machine/qemuarm.conf<br>
            &gt; &gt; b/meta/conf/machine/qemuarm.conf<br>
            &gt; &gt; index 04216cdc2e0..881733eb2da 100644<br>
            &gt; &gt; --- a/meta/conf/machine/qemuarm.conf<br>
            &gt; &gt; +++ b/meta/conf/machine/qemuarm.conf<br>
            &gt; &gt; @@ -28,8 +28,4 @@ QB_ROOTFS_OPT =3D "-drive<br>
            &gt; &gt; id=3Ddisk0,file=3D@ROOTFS@,if=3Dnone,format=3Draw -=
device
            virtio<br>
            &gt; &gt; =C2=A0QB_SERIAL_OPT =3D "-device virtio-serial-devi=
ce
            -chardev<br>
            &gt; &gt; null,id=3Dvirtcon -device
            virtconsole,chardev=3Dvirtcon"<br>
            &gt; &gt; =C2=A0QB_TCPSERIAL_OPT =3D "-device virtio-serial-d=
evice
            -chardev<br>
            &gt; &gt; socket,id=3Dvirtcon,<a class=3D"moz-txt-link-abbrev=
iated" href=3D"mailto:port=3D@PORT@,host=3D127.0.0.1">port=3D@PORT@,host=3D=
127.0.0.1</a>
            -device<br>
            &gt; &gt; virtconsole,chardev=3Dvirtcon"<br>
            &gt; &gt; =C2=A0<br>
            &gt; &gt; -# 6.4 causes Xorg to fail to read the virtio
            framebuffer so stick<br>
            &gt; &gt; with 6.1 until<br>
            &gt; &gt; -# that is resolved.<br>
            &gt; &gt; -PREFERRED_VERSION_linux-yocto ??=3D "6.1%"<br>
            &gt; &gt; -<br>
            &gt; &gt; =C2=A0KMACHINE:qemuarm =3D "qemuarma15"<br>
            &gt; &gt; diff --git a/meta/conf/machine/qemuarmv5.conf<br>
            &gt; &gt; b/meta/conf/machine/qemuarmv5.conf<br>
            &gt; &gt; index deb4869c0aa..f0a86f1e4c7 100644<br>
            &gt; &gt; --- a/meta/conf/machine/qemuarmv5.conf<br>
            &gt; &gt; +++ b/meta/conf/machine/qemuarmv5.conf<br>
            &gt; &gt; @@ -16,5 +16,4 @@ QB_GRAPHICS =3D "-device
            virtio-gpu-pci"<br>
            &gt; &gt; =C2=A0QB_OPT_APPEND =3D "-device qemu-xhci -device
            usb-tablet -device usb-<br>
            &gt; &gt; kbd"<br>
            &gt; &gt; =C2=A0QB_DTB =3D<br>
            &gt; &gt;
            "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-y=
octo',<br>
            &gt; &gt; '4.7', '', 'zImage-versatile-pb.dtb', d)}"<br>
            &gt; &gt; =C2=A0<br>
            &gt; &gt; =C2=A0<br>
            &gt; =C2=A0<br>
            &gt; Removing this bit results in the above line causing an<b=
r>
            &gt; ExpansionError, since<br>
            &gt; PREFERRED_VERSION_linux-yocto isnt defined anywhere
            anymore (if not<br>
            &gt; using poky.conf)<br>
            &gt; <br>
            &gt; What would be the right approach to solve this issue?,
            Should QB_DTB<br>
            &gt; be depending on such variable?<br>
            <br>
            4.7 is old enough we can probably just drop the conditional
            now?<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">Yep, t=
hat
              should be safe. It hasn't changed name or format in quite
              some time.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">(Altho=
ugh
              there has been some re-organization in 6.5/6.6 around
              device trees, but that shouldn't come into play here).</div=
>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div>
            <br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
            <br>
            Cheers,<br>
            <br>
            Richard<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p>Great, thanks for the pointers, sending patch.</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:CADkTA4POKqowjUFMmqTRostqiu6kV0F07jy3oXZrc3YH=3DsxpaQ@mail.gm=
ail.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote"
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
            <br>
            <br>
            <br>
          </blockquote>
        </div>
        <br clear=3D"all">
        <div><br>
        </div>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follo=
w
          the NULL pointer, for chaos and madness await thee at its end<b=
r>
          - "Use the force Harry" - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#188973): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/188973">https:/=
/lists.openembedded.org/g/openembedded-core/message/188973</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/101795562/4354175">https://lists.openembedded.org/mt=
/101795562/4354175</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------rcyl0atu1ymmWW9M998PSRm3--

