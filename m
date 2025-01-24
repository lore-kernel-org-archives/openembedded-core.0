Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95192C0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 21:24:10 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.3805.1737753848595532182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 13:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id E99932BF4;
	Fri, 24 Jan 2025 22:24:06 +0100 (CET)
Received: from [192.168.178.67] ([84.154.163.122]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tbR9q-1fHErA0; Fri, 24 Jan 2025 22:24:06 +0100
Date: Fri, 24 Jan 2025 22:24:36 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v3 8/8] image.bbclass: enable systemd user
 services
To: Artur Kowalski <arturkow2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <0H3MQS.XUE64PHM04QW2@t-online.de>
In-Reply-To: <bc3f0959-969e-4298-9d1f-04c5202f9b63@gmail.com>
References: <20250120124605.263817-2-arturkow2000@gmail.com>
	<20250120124605.263817-10-arturkow2000@gmail.com>
	<6QFLQS.3B9MTODL3DXT1@t-online.de>
	<bc3f0959-969e-4298-9d1f-04c5202f9b63@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wSRG7V4akCBPDLbTA+gI"
X-TOI-EXPURGATEID: 150726::1737753846-D77FD9EF-EC8556F5/0/0 CLEAN NORMAL
X-TOI-MSGID: 0e9116ea-4ef7-4ebc-96c9-ab558f0c5c85
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 21:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210252

--=-wSRG7V4akCBPDLbTA+gI
Content-Type: text/plain; charset=us-ascii; format=flowed

DEBUG: Executing python function do_image
NOTE: Executing systemd_preset_all ...
DEBUG: Executing shell function systemd_preset_all
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/recipe-sysroot-native/usr/bin/systemctl:222: 
DeprecationWarning: 'count' is passed as positional argument
  unit = re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
ln -s /usr/lib/systemd/system/systemd-boot-update.service 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/sysinit.target.wants/systemd-boot-update.service
ln -s /usr/lib/systemd/system/remote-cryptsetup.target 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/multi-user.target.wants/remote-cryptsetup.target
ln -s /usr/lib/systemd/system/systemd-resolved.service 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/sysinit.target.wants/systemd-resolved.service
ln -s /usr/lib/systemd/system/systemd-resolved.service 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/dbus-org.freedesktop.resolve1.service
ln -s /usr/lib/systemd/system/remote-fs.target 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/multi-user.target.wants/remote-fs.target
ln -s /usr/lib/systemd/system/reboot.target 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/ctrl-alt-del.target
ln -s /usr/lib/systemd/system/getty@.service 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/getty.target.wants/getty@tty1.service
ln -s /usr/lib/systemd/system/systemd-journald-audit.socket 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/sockets.target.wants/systemd-journald-audit.socket
ln -s /usr/lib/systemd/system/systemd-journald-audit.socket 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/systemd-journald.service.wants/systemd-journald-audit.socket
ln -s /usr/lib/systemd/system/systemd-userdbd.socket 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/sockets.target.wants/systemd-userdbd.socket
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/recipe-sysroot-native/usr/bin/systemctl:222: 
DeprecationWarning: 'count' is passed as positional argument
  unit = re.sub(r"@[^\.]*\.", "@.", self.unit, 1)
ln -s 
/usr/lib/systemd/user/xdg-desktop-portal-rewrite-launchers.service 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/user/graphical-session-pre.target.wants/xdg-desktop-portal-rewrite-launchers.service
ln -s /usr/lib/systemd/user/localsearch-3.service 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/user/gnome-session.target.wants/localsearch-3.service
ln -s /usr/lib/systemd/user/gnome-keyring-daemon.service 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/user/default.target.wants/gnome-keyring-daemon.service
ln -s /usr/lib/systemd/user/gnome-keyring-daemon.socket 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/user/sockets.target.wants/gnome-keyring-daemon.socket
ln -s /usr/lib/systemd/user/pipewire-pulse.service 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/user/default.target.wants/pipewire-pulse.service
ln -s /usr/lib/systemd/user/pipewire-pulse.socket 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/user/sockets.target.wants/pipewire-pulse.socket
Error: Systemctl preset_all issue in org.gnome.Shell@wayland.service
WARNING: 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/temp/run.systemd_preset_all.16269:158 
exit 1 from 'systemctl 
--root="/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs" 
--global --preset-mode=enable-only preset-all'
WARNING: Backtrace (BB generated script):
	#1: systemd_preset_all, 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/temp/run.systemd_preset_all.16269, 
line 158
	#2: main, 
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/temp/run.systemd_preset_all.16269, 
line 162
DEBUG: Python function do_image finished

This is all there is in log.do_image

On Fri, Jan 24 2025 at 19:24:52 +01:00:00, Artur Kowalski 
<arturkow2000@gmail.com> wrote:
> Can you provide your `log.do_image` file? I will try to reproduce 
> this locally too.
> 
> 
> W dniu 24.01.2025 o 13:51, Markus Volk pisze:
>> With this patch applied I see an error in image creation after 
>> do_rootfs if gnome-shell is installed:
>> 
>> | Error: Systemctl preset_all issue in 
>> org.gnome.Shell@wayland.service 
>> <mailto:org.gnome.Shell@wayland.service>
>> | WARNING: 
>> /home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/temp/run.systemd_preset_all.2011511:158 
>> exit 1 from 'systemctl 
>> --root="/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs" 
>> --global --preset-mode=enable-only preset-all'
>> 
>> 
>> 
>>  On Mon, Jan 20 2025 at 13:46:06 +01:00:00, Artur Kowalski via 
>> lists.openembedded.org 
>> <arturkow2000=gmail.com@lists.openembedded.org> 
>> <mailto:arturkow2000=gmail.com@lists.openembedded.org> wrote:
>>> Run systemctl preset-all with --global flag so user unit's are 
>>> enabled
>>> the same way system units are.
>>> 
>>> Signed-off-by: Artur Kowalski <arturkow2000@gmail.com 
>>> <mailto:arturkow2000@gmail.com>>
>>> ---
>>>  meta/classes-recipe/image.bbclass | 1 +
>>>  1 file changed, 1 insertion(+)
>>> 
>>> diff --git a/meta/classes-recipe/image.bbclass 
>>> b/meta/classes-recipe/image.bbclass
>>> index 84a2017eb5..f08818db03 100644
>>> --- a/meta/classes-recipe/image.bbclass
>>> +++ b/meta/classes-recipe/image.bbclass
>>> @@ -702,6 +702,7 @@ reproducible_final_image_task () {
>>>  systemd_preset_all () {
>>>      if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; 
>>> then
>>>  	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only 
>>> preset-all
>>> +	systemctl --root="${IMAGE_ROOTFS}" --global 
>>> --preset-mode=enable-only preset-all
>>>      fi
>>>  }
>>> 
>>> --
>>> 2.47.1
>>> 
>>> 
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#210039): 
>>> <https://lists.openembedded.org/g/openembedded-core/message/210039>
>>> Mute This Topic: 
>>> <https://lists.openembedded.org/mt/110714552/3618223>
>>> Group Owner: openembedded-core+owner@lists.openembedded.org 
>>> <mailto:openembedded-core+owner@lists.openembedded.org>
>>> Unsubscribe: 
>>> <https://lists.openembedded.org/g/openembedded-core/unsub> 
>>> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> 


--=-wSRG7V4akCBPDLbTA+gI
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>DEBUG: Executing python funct=
ion do_image</div><div>NOTE: Executing systemd_preset_all ...</div><div>DEB=
UG: Executing shell function systemd_preset_all</div><div>/home/flk/poky/bu=
ild/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/recipe-sysroot-nati=
ve/usr/bin/systemctl:222: DeprecationWarning: 'count' is passed as position=
al argument</div><div>&nbsp; unit =3D re.sub(r"@[^\.]*\.", "@.", self.unit,=
 1)</div><div>ln -s /usr/lib/systemd/system/systemd-boot-update.service /ho=
me/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootf=
s/etc/systemd/system/sysinit.target.wants/systemd-boot-update.service</div>=
<div>ln -s /usr/lib/systemd/system/remote-cryptsetup.target /home/flk/poky/=
build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/system=
d/system/multi-user.target.wants/remote-cryptsetup.target</div><div>ln -s /=
usr/lib/systemd/system/systemd-resolved.service /home/flk/poky/build/tmp/wo=
rk/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/sys=
init.target.wants/systemd-resolved.service</div><div>ln -s /usr/lib/systemd=
/system/systemd-resolved.service /home/flk/poky/build/tmp/work/intel_corei7=
_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/dbus-org.freedeskt=
op.resolve1.service</div><div>ln -s /usr/lib/systemd/system/remote-fs.targe=
t /home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/=
rootfs/etc/systemd/system/multi-user.target.wants/remote-fs.target</div><di=
v>ln -s /usr/lib/systemd/system/reboot.target /home/flk/poky/build/tmp/work=
/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/ctrl-=
alt-del.target</div><div>ln -s /usr/lib/systemd/system/getty@.service /home=
/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/=
etc/systemd/system/getty.target.wants/getty@tty1.service</div><div>ln -s /u=
sr/lib/systemd/system/systemd-journald-audit.socket /home/flk/poky/build/tm=
p/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system=
/sockets.target.wants/systemd-journald-audit.socket</div><div>ln -s /usr/li=
b/systemd/system/systemd-journald-audit.socket /home/flk/poky/build/tmp/wor=
k/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/syst=
emd-journald.service.wants/systemd-journald-audit.socket</div><div>ln -s /u=
sr/lib/systemd/system/systemd-userdbd.socket /home/flk/poky/build/tmp/work/=
intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/system/socket=
s.target.wants/systemd-userdbd.socket</div><div>/home/flk/poky/build/tmp/wo=
rk/intel_corei7_64-poky-linux/gnome-image/1.0/recipe-sysroot-native/usr/bin=
/systemctl:222: DeprecationWarning: 'count' is passed as positional argumen=
t</div><div>&nbsp; unit =3D re.sub(r"@[^\.]*\.", "@.", self.unit, 1)</div><=
div>ln -s /usr/lib/systemd/user/xdg-desktop-portal-rewrite-launchers.servic=
e /home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/=
rootfs/etc/systemd/user/graphical-session-pre.target.wants/xdg-desktop-port=
al-rewrite-launchers.service</div><div>ln -s /usr/lib/systemd/user/localsea=
rch-3.service /home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnom=
e-image/1.0/rootfs/etc/systemd/user/gnome-session.target.wants/localsearch-=
3.service</div><div>ln -s /usr/lib/systemd/user/gnome-keyring-daemon.servic=
e /home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/=
rootfs/etc/systemd/user/default.target.wants/gnome-keyring-daemon.service</=
div><div>ln -s /usr/lib/systemd/user/gnome-keyring-daemon.socket /home/flk/=
poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/s=
ystemd/user/sockets.target.wants/gnome-keyring-daemon.socket</div><div>ln -=
s /usr/lib/systemd/user/pipewire-pulse.service /home/flk/poky/build/tmp/wor=
k/intel_corei7_64-poky-linux/gnome-image/1.0/rootfs/etc/systemd/user/defaul=
t.target.wants/pipewire-pulse.service</div><div>ln -s /usr/lib/systemd/user=
/pipewire-pulse.socket /home/flk/poky/build/tmp/work/intel_corei7_64-poky-l=
inux/gnome-image/1.0/rootfs/etc/systemd/user/sockets.target.wants/pipewire-=
pulse.socket</div><div>Error: Systemctl preset_all issue in org.gnome.Shell=
@wayland.service</div><div>WARNING: /home/flk/poky/build/tmp/work/intel_cor=
ei7_64-poky-linux/gnome-image/1.0/temp/run.systemd_preset_all.16269:158 exi=
t 1 from 'systemctl --root=3D"/home/flk/poky/build/tmp/work/intel_corei7_64=
-poky-linux/gnome-image/1.0/rootfs" --global --preset-mode=3Denable-only pr=
eset-all'</div><div>WARNING: Backtrace (BB generated script):&nbsp;</div><d=
iv><span class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>#1: sys=
temd_preset_all, /home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/g=
nome-image/1.0/temp/run.systemd_preset_all.16269, line 158</div><div><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>#2: main, /home/=
flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/temp/run=
.systemd_preset_all.16269, line 162</div><div>DEBUG: Python function do_ima=
ge finished</div></div><div><br></div><div>This is all there is in log.do_i=
mage</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Fri, Jan 24 202=
5 at 19:24:52 +01:00:00, Artur Kowalski &lt;arturkow2000@gmail.com&gt; wrot=
e:<br><blockquote type=3D"cite">

 =20
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
 =20
 =20
    <p>Can you provide your `log.do_image` file? I will try to reproduce
      this locally too.<br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">W dniu 24.01.2025 o&nbsp;13:51, Markus V=
olk
      pisze:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:6QFLQS.3B9MTODL3DXT1@t-online.de"=
>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
      <div id=3D"geary-body" dir=3D"auto">
        <div>With this patch applied I see an error in image creation
          after do_rootfs if gnome-shell is installed:</div>
        <div><br>
        </div>
        <div>
          <div>| Error: Systemctl preset_all issue in
            <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:org.gnome.=
Shell@wayland.service">org.gnome.Shell@wayland.service</a></div>
          <div>| WARNING:
/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-image/1.0/te=
mp/run.systemd_preset_all.2011511:158
            exit 1 from 'systemctl
--root=3D"/home/flk/poky/build/tmp/work/intel_corei7_64-poky-linux/gnome-im=
age/1.0/rootfs"
            --global --preset-mode=3Denable-only preset-all'</div>
        </div>
        <div><br>
        </div>
        <div><br>
        </div>
      </div>
      <div id=3D"geary-quote" dir=3D"auto"><br>
        On Mon, Jan 20 2025 at 13:46:06 +01:00:00, Artur Kowalski via
        lists.openembedded.org
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:arturkow2000=3Dgm=
ail.com@lists.openembedded.org">&lt;arturkow2000=3Dgmail.com@lists.openembe=
dded.org&gt;</a> wrote:<br>
        <blockquote type=3D"cite">
          <div class=3D"plaintext" style=3D"white-space: break-spaces;">Run=
 systemctl preset-all with --global flag so user unit's are enabled
the same way system units are.

Signed-off-by: Artur Kowalski &lt;<a href=3D"mailto:arturkow2000@gmail.com"=
 moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">arturkow2000@gmai=
l.com</a>&gt;
---
 meta/classes-recipe/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 84a2017eb5..f08818db03 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -702,6 +702,7 @@ reproducible_final_image_task () {
 systemd_preset_all () {
     if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
 	systemctl --root=3D"${IMAGE_ROOTFS}" --preset-mode=3Denable-only preset-a=
ll
+	systemctl --root=3D"${IMAGE_ROOTFS}" --global --preset-mode=3Denable-only=
 preset-all
     fi
 }
=20
<div>--=20
</div>2.47.1

</div>
          <div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#210039): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210039" moz-do-not-send=3D"true" class=3D"moz-txt-l=
ink-freetext">https://lists.openembedded.org/g/openembedded-core/message/21=
0039</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110714552/361=
8223" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://list=
s.openembedded.org/mt/110714552/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">openembedded-c=
ore+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://lis=
ts.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:f_l_k@=
t-online.de" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">f_l_k=
@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div>
        </blockquote>
      </div>
    </blockquote>
 =20

</blockquote></div>
--=-wSRG7V4akCBPDLbTA+gI--


