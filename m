Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D5DC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 15:28:42 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web10.13466.1642692522280888808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XUpPr0j/;
 spf=pass (domain: gmail.com, ip: 209.85.221.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id v192so3823953vkv.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e4USrXA2bZEEPy/k61fIALqCSVXXhnB4PwG7DmzfdpA=;
        b=XUpPr0j/730dxe6j/YjSerrEZeVyC+pPDd40NQOFg7tkbqTJ5NZ+d6k2j3IRQY4IBT
         h2ABxjBzv5RNjttojLdXy47n5+HUFI1qVof3IKiIZjVMc6cw/OijsoHDh5dyNSAvbBae
         LlA0we7LKzMd1mYwY/Dwe4CACrlYwedSRp9FlRQdV7UBwpnLUfL9UalbxssJazfTpt1A
         XSUgjnCWjHA5Hp5EgANHgnGcxxNXS1IkK1m8YHVnO2VPeChgjN2C55uHe0iV4r5wPQLY
         uBEmrOIIlb+3MlFulv+Q5DDhsB5vbAabgi0clxQFHcbRndlk6z8yjO4x09ORq9HK5eqV
         OJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e4USrXA2bZEEPy/k61fIALqCSVXXhnB4PwG7DmzfdpA=;
        b=QRRKn5T14q18iKbskbqpAEvrwFlk/oChWaFarE1GigEP6Zjt1pSE4HhJHV6hz2iwyO
         rhJ3UpJh5vCVPrlk3RJuFP/nxDjFXryyredpCUWzAmwqKfBfAFfdSBiZT6/t2MJ0yRo7
         omzDzIpRgKk/wqNyQIv70bevagf8tiCLxSVRI94gg/uiyMSxe/TAbK+gLug6IdEwiKtg
         PNfLrxcMrwDSMz6qN0uoOzFWvSRxP7SN70clzGgObu3ORaMgd9Nj4o5Yrj8s2NnoUxNR
         U2D6cmkkbJ/W1jrl8o+V6m6Yz4uXF6leZPdGNI4WwObkEC9H5+/TZF1F4kzGJyA+eige
         +J3w==
X-Gm-Message-State: AOAM530WtQV8vWgFi0au5dudSBVR3oYYt415nRsvgkDlXJ9gXK9daWCC
	S4GHIXb9nNEkWEL8GI0KtXoX4UmU+XA6MxFUd5o=
X-Google-Smtp-Source: 
 ABdhPJzKlFIk195EJUoKWrg3D6oOIJr9c8ngfTFuo84aC6mUs7cVg6honBrMCicacbYn6JgpBKUWJ8hKxFuXTT1//Nk=
X-Received: by 2002:a1f:30c1:: with SMTP id
 w184mr14845385vkw.20.1642692521361;
 Thu, 20 Jan 2022 07:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20220120152146.1912559-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20220120152146.1912559-1-michael.opdenacker@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jan 2022 16:28:30 +0100
Message-ID: 
 <CANNYZj-wjwmKuu_FxoktmP84TFUJU4yi9JJ4bZ1N23VP+83n6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: automatically turn on "kvm" on x86
 CPUs with VT
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000036051805d60528b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 15:28:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160770

--00000000000036051805d60528b8
Content-Type: text/plain; charset="UTF-8"

I think this should cover aarch64 on aarch64 too :) And presence of (and
ability to open) /dev/kvm is probably a better check than looking through
cpuinfo?

Alex

On Thu, 20 Jan 2022 at 16:21, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> This automatically turns on the "kvm" option when emulating
> an x86 system on x86 CPUs with VT capability.
>
> On an Intel i7-5600U CPU at 2.60GHz, using the "kvm"
> option is at least 4x faster, booting "core-image-minimal" for qemux86-64.
> The performance difference can even be bigger for larger systems.
>
> Rather than changing the documentation to remind users
> to use this option, that's easier to enable this option by
> default on suitable systems.
>
> A "noautokvm" option is added to disable this default,
> and keep the previous behavior.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  scripts/runqemu | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 4e05c1bb15..b500ba2afa 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -78,8 +78,9 @@ of the following environment variables (in any order):
>      serialstdio - enable a serial console on the console (regardless of
> graphics mode)
>      slirp - enable user networking, no root privileges is required
>      snapshot - don't write changes to back to images
> -    kvm - enable KVM when running x86/x86_64 (VT-capable CPU required)
> +    kvm - enable KVM. Enabled by default when running x86/x86_64 with a
> VT-capable CPU
>      kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable
> CPU required)
> +    noautokvm - don't enable KVM automatically on x86/x86_64 with a
> VT-capable CPU
>      publicvnc - enable a VNC server open to all hosts
>      audio - enable audio
>      [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
> @@ -170,6 +171,7 @@ class BaseConfig(object):
>          self.fstype = ''
>          self.kvm_enabled = False
>          self.vhost_enabled = False
> +        self.noautokvm = False
>          self.slirp_enabled = False
>          self.net_bridge = None
>          self.nfs_instance = 0
> @@ -506,6 +508,8 @@ class BaseConfig(object):
>                  self.kvm_enabled = True
>              elif arg == 'kvm-vhost':
>                  self.vhost_enabled = True
> +            elif arg == 'noautokvm':
> +                self.noautokvm = True
>              elif arg == 'slirp':
>                  self.slirp_enabled = True
>              elif arg.startswith('bridge='):
> @@ -550,8 +554,18 @@ class BaseConfig(object):
>              if s:
>                  self.set("DEPLOY_DIR_IMAGE", s.group(1))
>
> +    def kvm_cap_x86(self):
> +        with open('/proc/cpuinfo', 'r') as f:
> +            return re.search('vmx|svm', "".join(f.readlines()))
> +
>      def check_kvm(self):
> -        """Check kvm and kvm-host"""
> +        """Check kvm and kvm-vhost"""
> +       # Turn on KVM by default emulating x86 on x86 CPUs with VT
> +       # Can be disabled with the "noautokvm" option
> +        if self.qemu_system.endswith(('i386', 'x86_64')) and not
> self.noautokvm:
> +            if self.kvm_cap_x86():
> +                self.kvm_enabled = True
> +
>          if not (self.kvm_enabled or self.vhost_enabled):
>              self.qemu_opt_script += ' %s %s %s' %
> (self.get('QB_MACHINE'), self.get('QB_CPU'), self.get('QB_SMP'))
>              return
> @@ -565,9 +579,7 @@ class BaseConfig(object):
>          dev_kvm = '/dev/kvm'
>          dev_vhost = '/dev/vhost-net'
>          if self.qemu_system.endswith(('i386', 'x86_64')):
> -            with open('/proc/cpuinfo', 'r') as f:
> -                kvm_cap = re.search('vmx|svm', "".join(f.readlines()))
> -            if not kvm_cap:
> +            if not self.kvm_cap_x86():
>                  logger.error("You are trying to enable KVM on a cpu
> without VT support.")
>                  logger.error("Remove kvm from the command-line, or
> refer:")
>                  raise RunQemuError(yocto_kvm_wiki)
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160769):
> https://lists.openembedded.org/g/openembedded-core/message/160769
> Mute This Topic: https://lists.openembedded.org/mt/88560844/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000036051805d60528b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think this should cover aarch64 on aarch64 too :) A=
nd presence of (and ability to open) /dev/kvm is probably a better check th=
an looking through cpuinfo?<br></div><div><br></div><div>Alex<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, 20 Jan 2022 at 16:21, Michael Opdenacker &lt;<a href=3D"mailto:michael.=
opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">This automatically tu=
rns on the &quot;kvm&quot; option when emulating<br>
an x86 system on x86 CPUs with VT capability.<br>
<br>
On an Intel i7-5600U CPU at 2.60GHz, using the &quot;kvm&quot;<br>
option is at least 4x faster, booting &quot;core-image-minimal&quot; for qe=
mux86-64.<br>
The performance difference can even be bigger for larger systems.<br>
<br>
Rather than changing the documentation to remind users<br>
to use this option, that&#39;s easier to enable this option by<br>
default on suitable systems.<br>
<br>
A &quot;noautokvm&quot; option is added to disable this default,<br>
and keep the previous behavior.<br>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@=
bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 22 +++++++++++++++++-----<br>
=C2=A01 file changed, 17 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 4e05c1bb15..b500ba2afa 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -78,8 +78,9 @@ of the following environment variables (in any order):<br=
>
=C2=A0 =C2=A0 =C2=A0serialstdio - enable a serial console on the console (r=
egardless of graphics mode)<br>
=C2=A0 =C2=A0 =C2=A0slirp - enable user networking, no root privileges is r=
equired<br>
=C2=A0 =C2=A0 =C2=A0snapshot - don&#39;t write changes to back to images<br=
>
-=C2=A0 =C2=A0 kvm - enable KVM when running x86/x86_64 (VT-capable CPU req=
uired)<br>
+=C2=A0 =C2=A0 kvm - enable KVM. Enabled by default when running x86/x86_64=
 with a VT-capable CPU<br>
=C2=A0 =C2=A0 =C2=A0kvm-vhost - enable KVM with vhost when running x86/x86_=
64 (VT-capable CPU required)<br>
+=C2=A0 =C2=A0 noautokvm - don&#39;t enable KVM automatically on x86/x86_64=
 with a VT-capable CPU<br>
=C2=A0 =C2=A0 =C2=A0publicvnc - enable a VNC server open to all hosts<br>
=C2=A0 =C2=A0 =C2=A0audio - enable audio<br>
=C2=A0 =C2=A0 =C2=A0[*/]ovmf* - OVMF firmware file or base name for booting=
 with UEFI<br>
@@ -170,6 +171,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.fstype =3D &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kvm_enabled =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vhost_enabled =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.noautokvm =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.slirp_enabled =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.net_bridge =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.nfs_instance =3D 0<br>
@@ -506,6 +508,8 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kvm_enab=
led =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;kvm-vh=
ost&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vhost_en=
abled =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &#39;noautokvm&#=
39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.noautokvm =3D=
 True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;slirp&=
#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.slirp_en=
abled =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif arg.startswith(&#39;br=
idge=3D&#39;):<br>
@@ -550,8 +554,18 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set(&quo=
t;DEPLOY_DIR_IMAGE&quot;, s.group(1))<br>
<br>
+=C2=A0 =C2=A0 def kvm_cap_x86(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(&#39;/proc/cpuinfo&#39;, &#39;r&#39;=
) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return re.search(&#39;vmx|svm&#3=
9;, &quot;&quot;.join(f.readlines()))<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def check_kvm(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Check kvm and kvm-host&quot;=
&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Check kvm and kvm-vhost&quot=
;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Turn on KVM by default emulating x86 on x86 C=
PUs with VT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Can be disabled with the &quot;noautokvm&quot=
; option<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.qemu_system.endswith((&#39;i386&#39;, =
&#39;x86_64&#39;)) and not self.noautokvm:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.kvm_cap_x86():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.kvm_enabled =
=3D True<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not (self.kvm_enabled or self.vhost_en=
abled):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.qemu_opt_script +=3D &=
#39; %s %s %s&#39; % (self.get(&#39;QB_MACHINE&#39;), self.get(&#39;QB_CPU&=
#39;), self.get(&#39;QB_SMP&#39;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
@@ -565,9 +579,7 @@ class BaseConfig(object):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_kvm =3D &#39;/dev/kvm&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_vhost =3D &#39;/dev/vhost-net&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.qemu_system.endswith((&#39;i386&#=
39;, &#39;x86_64&#39;)):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(&#39;/proc/cpuinfo&#39=
;, &#39;r&#39;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_cap =3D re.sea=
rch(&#39;vmx|svm&#39;, &quot;&quot;.join(f.readlines()))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not kvm_cap:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.kvm_cap_x86():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(=
&quot;You are trying to enable KVM on a cpu without VT support.&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(=
&quot;Remove kvm from the command-line, or refer:&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise RunQemu=
Error(yocto_kvm_wiki)<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160769): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160769" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160769</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88560844/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88560844/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000036051805d60528b8--

