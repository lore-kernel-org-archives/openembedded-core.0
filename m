Subject: [meta-multimedia][PATCH] pipewire: Remove duplicate avahi from PACKAGECONFIG
To: openembedded-core@lists.openembedded.org
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
X-Originating-Location: Vienna, AT (213.255.218.135)
X-Originating-Platform: Linux Firefox 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 21 Oct 2026 01:22:08 -0700
Message-ID: <RGrU.1792570928474513034.9LmG@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="DAvQReeekfQbVmQPVOnp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 08:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248373

--DAvQReeekfQbVmQPVOnp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

avahi is included in PACKAGECONFIG if zeroconf is in DISTRO_FEATURES.
The update to 0.3.63 enabled it unconditionally a second time.

Fixes: c4d52888a0 ("pipewire: update 0.3.62 -> 0.3.63")

Signed-off-by: Einar Jon Gunnarsson < tolvupostur@gmail.com >
---
meta-multimedia/recipes-multi media/pipewire/ pipewire_1.6.9. bb ( http://p=
ipewire_1.6.9.bb ) | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-mult imedia/pipewire/ pipewire_1.6. 9.=
bb ( http://pipewire_1.6.9.bb )
b/meta-multimedia/recipes-mult imedia/pipewire/ pipewire_1.6. 9.bb ( http:/=
/pipewire_1.6.9.bb )
index 33b46de6cf..143f3d5e0a 100644
--- a/meta-multimedia/recipes-mult imedia/pipewire/ pipewire_1.6. 9.bb ( ht=
tp://pipewire_1.6.9.bb )
+++ b/meta-multimedia/recipes-mult imedia/pipewire/ pipewire_1.6. 9.bb ( ht=
tp://pipewire_1.6.9.bb )
@@ -92,7 +92,7 @@ PACKAGECONFIG:class-target ??=3D " \
${@bb.utils.contains('DISTRO_ FEATURES', 'systemd', 'systemd
systemd-system-service systemd-user-service', '', d)} \
${@bb.utils.filter('DISTRO_FE ATURES', 'alsa vulkan pulseaudio', d)} \
${PIPEWIRE_SESSION_MANAGER} \
-=C2=A0 =C2=A0 ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack l=
ibusb
pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling \
+=C2=A0 =C2=A0 ${FFMPEG_AVAILABLE} flatpak gstreamer gsettings jack libusb
pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling \
libcamera readline ncurses \
"

--
2.43.0

--DAvQReeekfQbVmQPVOnp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>avahi is included in PACKAGECONFIG if zeroconf is in DISTRO_FEATURES.<=
br />The update to 0.3.63 enabled it unconditionally a second time.<br /><b=
r />Fixes: c4d52888a0 ("pipewire: update 0.3.62 -&gt; 0.3.63")<br /><br />S=
igned-off-by: Einar Jon Gunnarsson &lt;<a href=3D"mailto:tolvupostur@gmail.=
com" target=3D"_blank" rel=3D"noopener">tolvupostur@gmail.com</a>&gt;<br />=
---<br />&nbsp;meta-multimedia/recipes-multi<wbr />media/pipewire/<a href=
=3D"http://pipewire_1.6.9.bb" target=3D"_blank" rel=3D"noopener noreferrer"=
 data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp://pipewire_1.6=
.9.bb&amp;source=3Dgmail&amp;ust=3D1792657286935000&amp;usg=3DAOvVaw0Gj2NdS=
YCE2jtF52HIdxJ-">pipewire_1.6.9.<wbr />bb</a> | 2 +-<br />&nbsp;1 file chan=
ged, 1 insertion(+), 1 deletion(-)<br /><br />diff --git a/meta-multimedia/=
recipes-mult<wbr />imedia/pipewire/<a href=3D"http://pipewire_1.6.9.bb" tar=
get=3D"_blank" rel=3D"noopener noreferrer" data-saferedirecturl=3D"https://=
www.google.com/url?q=3Dhttp://pipewire_1.6.9.bb&amp;source=3Dgmail&amp;ust=
=3D1792657286935000&amp;usg=3DAOvVaw0Gj2NdSYCE2jtF52HIdxJ-">pipewire_1.6.<w=
br />9.bb</a><br />b/meta-multimedia/recipes-mult<wbr />imedia/pipewire/<a =
href=3D"http://pipewire_1.6.9.bb" target=3D"_blank" rel=3D"noopener norefer=
rer" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp://pipewire=
_1.6.9.bb&amp;source=3Dgmail&amp;ust=3D1792657286935000&amp;usg=3DAOvVaw0Gj=
2NdSYCE2jtF52HIdxJ-">pipewire_1.6.<wbr />9.bb</a><br />index 33b46de6cf..14=
3f3d5e0a 100644<br />--- a/meta-multimedia/recipes-mult<wbr />imedia/pipewi=
re/<a href=3D"http://pipewire_1.6.9.bb" target=3D"_blank" rel=3D"noopener n=
oreferrer" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp://pi=
pewire_1.6.9.bb&amp;source=3Dgmail&amp;ust=3D1792657286935000&amp;usg=3DAOv=
Vaw0Gj2NdSYCE2jtF52HIdxJ-">pipewire_1.6.<wbr />9.bb</a><br />+++ b/meta-mul=
timedia/recipes-mult<wbr />imedia/pipewire/<a href=3D"http://pipewire_1.6.9=
.bb" target=3D"_blank" rel=3D"noopener noreferrer" data-saferedirecturl=3D"=
https://www.google.com/url?q=3Dhttp://pipewire_1.6.9.bb&amp;source=3Dgmail&=
amp;ust=3D1792657286935000&amp;usg=3DAOvVaw0Gj2NdSYCE2jtF52HIdxJ-">pipewire=
_1.6.<wbr />9.bb</a><br />@@ -92,7 +92,7 @@ PACKAGECONFIG:class-target ??=
=3D " \<br />&nbsp; &nbsp; &nbsp;${@bb.utils.contains('DISTRO_<wbr />FEATUR=
ES', 'systemd', 'systemd<br />systemd-system-service systemd-user-service',=
 '', d)} \<br />&nbsp; &nbsp; &nbsp;${@bb.utils.filter('DISTRO_FE<wbr />ATU=
RES', 'alsa vulkan pulseaudio', d)} \<br />&nbsp; &nbsp; &nbsp;${PIPEWIRE_S=
ESSION_MANAGER} \<br />-&nbsp; &nbsp; ${FFMPEG_AVAILABLE} avahi flatpak gst=
reamer gsettings jack libusb<br />pw-cat raop sndfile v4l2 udev volume webr=
tc-echo-cancelling \<br />+&nbsp; &nbsp; ${FFMPEG_AVAILABLE} flatpak gstrea=
mer gsettings jack libusb<br />pw-cat raop sndfile v4l2 udev volume webrtc-=
echo-cancelling \<br />&nbsp; &nbsp; &nbsp;libcamera readline ncurses \<br =
/>&nbsp;"<span style=3D"color: #888888;"><br /><br />-- <br />2.43.0</span>=
</div>

--DAvQReeekfQbVmQPVOnp--
