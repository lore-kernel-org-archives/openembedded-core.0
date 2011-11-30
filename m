Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RViIW-00076h-VA
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 12:25:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAUBJGWW009827
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 03:19:16 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 30 Nov 2011 03:19:15 -0800
Message-ID: <4ED610AF.4040701@windriver.com>
Date: Wed, 30 Nov 2011 19:17:03 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1322648566.git.xiaofeng.yan@windriver.com>	<e5e2906ff7b536c1b3e09828ff2075812fc1d66e.1322648566.git.xiaofeng.yan@windriver.com>
	<20111130104419.GC4799@jama.jama.net>
In-Reply-To: <20111130104419.GC4799@jama.jama.net>
X-Originating-IP: [128.224.162.146]
Subject: Re: [PATCH 2/2] xserver-kdrive: update to 1.11.1.902
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 11:25:57 -0000
Content-Type: multipart/alternative;
	boundary="------------090000090004000701010301"

--------------090000090004000701010301
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id pAUBJGWW009827

On 2011=E5=B9=B411=E6=9C=8830=E6=97=A5 18:44, Martin Jansa wrote:
> On Wed, Nov 30, 2011 at 06:33:20PM +0800, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> I didn't remove the old one because it is possible for the new version=
 to \
>> have some bugs during using or testing.
> Just curious why this version exactly?
> There is 1.11.2 release already (1.11.1.902 is 1.11.2 RC2) and there is
> also RC1 for 1.11.3 or even 1.12 if we want to test RCs.
>
> And Saul IIRC sent xserver-xorg upgrade to 1.11.2 so it would be nice t=
o
> use the same.
>
> Cheers,
>

1.11.1.902 is the newest version when I decided to update xserver-kdrive.=
 I will test 1.11.2 later
Thanks


>> Patches are commented by "#". Some of them are obsolete.
>> keyboard-resume-workaround.patch is used in drive mode of keyboard
>> crosscompile.patch is to avoid to seach "/etc/X11/fontpath.d" of host =
during configuring of cross-compiling
>> It is no use in the version.
>>
>> enable-xcalibrate.patch is to avoid error of compiling tslib. No use i=
n the new version.
>> nodolt.patch is no use too.
>>
>> other patches are retained.
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>   .../xorg-xserver/xserver-kdrive_1.11.1.902.bb      |   37 ++++++++++=
++++++++++
>>   1 files changed, 37 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive=
_1.11.1.902.bb
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.=
902.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb
>> new file mode 100644
>> index 0000000..3980057
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb
>> @@ -0,0 +1,37 @@
>> +require xserver-kdrive.inc
>> +
>> +DEPENDS +=3D "libxkbfile libxcalibrate font-util pixman"
>> +
>> +RDEPENDS_${PN} +=3D "xkeyboard-config"
>> +
>> +EXTRA_OECONF +=3D "--disable-glx --enable-unit-tests=3Dno --enable-kd=
rive-evdev=3Dyes"
>> +
>> +PE =3D "1"
>> +PR =3D "r0"
>> +
>> +LIC_FILES_CHKSUM  =3D "file://COPYING;md5=3D74df27b6254cc88d2799b5f4f=
5949c00"
>> +
>> +SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.=
bz2 \
>> +          file://extra-kmodes.patch \
>> +		  file://disable-apm.patch \
>> +		  file://no-serial-probing.patch \
>> +		  file://keyboard-resume-workaround.patch \
>> +		  file://hide-cursor-and-ppm-root.patch \
>> +		  file://fbdev_xrandr_ioctl.patch \
>> +		  file://fix-newer-xorg-headers.patch"
>> +						=09
>> +#file://keyboard-resume-workaround.patch
>> +#file://enable-xcalibrate.patch
>> +#file://crosscompile.patch
>> +#file://nodolt.patch
>> +#file://kdrive-evdev.patch
>> +#file://kdrive-use-evdev.patch
>> +#file://enable-builtin-fonts.patch
>> +#file://optional-xkb.patch
>> +
>> +SRC_URI[md5sum] =3D "87dd7958ace0509f6e4da2908c2ee4fd"
>> +SRC_URI[sha256sum] =3D "06cb2dffb8d0182c539b154e412b25b98c75d0052cfb1=
6762e7af0d6bf23ec7b"
>> +
>> +
>> +
>> +S =3D "${WORKDIR}/xorg-server-${PV}"
>> --=20
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------090000090004000701010301
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id pAUBJGWW009827

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    On 2011=E5=B9=B411=E6=9C=8830=E6=97=A5 18:44, Martin Jansa wrote:
    <blockquote cite=3D"mid:20111130104419.GC4799@jama.jama.net"
      type=3D"cite">
      <pre wrap=3D"">On Wed, Nov 30, 2011 at 06:33:20PM +0800, Xiaofeng Y=
an wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">From: Xiaofeng Yan <a class=3D"moz-txt-link-rfc239=
6E" href=3D"mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver=
.com&gt;</a>

I didn't remove the old one because it is possible for the new version to=
 \
have some bugs during using or testing.
</pre>
      </blockquote>
      <pre wrap=3D"">
Just curious why this version exactly?
There is 1.11.2 release already (1.11.1.902 is 1.11.2 RC2) and there is
also RC1 for 1.11.3 or even 1.12 if we want to test RCs.

And Saul IIRC sent xserver-xorg upgrade to 1.11.2 so it would be nice to
use the same.

Cheers,

</pre>
    </blockquote>
    <br>
    <pre wrap=3D"">1.11.1.902 is the newest version when I decided to upd=
ate xserver-kdrive. I will test 1.11.2 later
Thanks

</pre>
    <blockquote cite=3D"mid:20111130104419.GC4799@jama.jama.net"
      type=3D"cite">
      <pre wrap=3D""></pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">
Patches are commented by "#". Some of them are obsolete.
keyboard-resume-workaround.patch is used in drive mode of keyboard
crosscompile.patch is to avoid to seach "/etc/X11/fontpath.d" of host dur=
ing configuring of cross-compiling
It is no use in the version.

enable-xcalibrate.patch is to avoid error of compiling tslib. No use in t=
he new version.
nodolt.patch is no use too.

other patches are retained.

Signed-off-by: Xiaofeng Yan <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
---
 .../xorg-xserver/xserver-kdrive_1.11.1.902.bb      |   37 ++++++++++++++=
++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.1=
1.1.902.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902=
.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb
new file mode 100644
index 0000000..3980057
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb
@@ -0,0 +1,37 @@
+require xserver-kdrive.inc
+
+DEPENDS +=3D "libxkbfile libxcalibrate font-util pixman"
+
+RDEPENDS_${PN} +=3D "xkeyboard-config"
+
+EXTRA_OECONF +=3D "--disable-glx --enable-unit-tests=3Dno --enable-kdriv=
e-evdev=3Dyes"
+
+PE =3D "1"
+PR =3D "r0"
+
+LIC_FILES_CHKSUM  =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://=
COPYING;md5=3D74df27b6254cc88d2799b5f4f5949c00">"file://COPYING;md5=3D74d=
f27b6254cc88d2799b5f4f5949c00"</a>
+
+SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2=
 \
+          <a class=3D"moz-txt-link-freetext" href=3D"file://extra-kmodes=
.patch">file://extra-kmodes.patch</a> \
+		  <a class=3D"moz-txt-link-freetext" href=3D"file://disable-apm.patch"=
>file://disable-apm.patch</a> \
+		  <a class=3D"moz-txt-link-freetext" href=3D"file://no-serial-probing.=
patch">file://no-serial-probing.patch</a> \
+		  <a class=3D"moz-txt-link-freetext" href=3D"file://keyboard-resume-wo=
rkaround.patch">file://keyboard-resume-workaround.patch</a> \
+		  <a class=3D"moz-txt-link-freetext" href=3D"file://hide-cursor-and-pp=
m-root.patch">file://hide-cursor-and-ppm-root.patch</a> \
+		  <a class=3D"moz-txt-link-freetext" href=3D"file://fbdev_xrandr_ioctl=
.patch">file://fbdev_xrandr_ioctl.patch</a> \
+		  <a class=3D"moz-txt-link-freetext" href=3D"file://fix-newer-xorg-hea=
ders.patch">file://fix-newer-xorg-headers.patch</a>"
+							       =20
+#<a class=3D"moz-txt-link-freetext" href=3D"file://keyboard-resume-worka=
round.patch">file://keyboard-resume-workaround.patch</a>
+#<a class=3D"moz-txt-link-freetext" href=3D"file://enable-xcalibrate.pat=
ch">file://enable-xcalibrate.patch</a>
+#<a class=3D"moz-txt-link-freetext" href=3D"file://crosscompile.patch">f=
ile://crosscompile.patch</a>
+#<a class=3D"moz-txt-link-freetext" href=3D"file://nodolt.patch">file://=
nodolt.patch</a>
+#<a class=3D"moz-txt-link-freetext" href=3D"file://kdrive-evdev.patch">f=
ile://kdrive-evdev.patch</a>
+#<a class=3D"moz-txt-link-freetext" href=3D"file://kdrive-use-evdev.patc=
h">file://kdrive-use-evdev.patch</a>
+#<a class=3D"moz-txt-link-freetext" href=3D"file://enable-builtin-fonts.=
patch">file://enable-builtin-fonts.patch</a>
+#<a class=3D"moz-txt-link-freetext" href=3D"file://optional-xkb.patch">f=
ile://optional-xkb.patch</a>
+
+SRC_URI[md5sum] =3D "87dd7958ace0509f6e4da2908c2ee4fd"
+SRC_URI[sha256sum] =3D "06cb2dffb8d0182c539b154e412b25b98c75d0052cfb1676=
2e7af0d6bf23ec7b"
+
+
+
+S =3D "${WORKDIR}/xorg-server-${PV}"
--=20
1.7.0.4


_______________________________________________
Openembedded-core mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Openembedded-core@li=
sts.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class=3D"moz-txt-link-freetext" href=3D"http://lists.linuxtogo.org/cgi=
-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-b=
in/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <pre wrap=3D"">
</pre>
      <pre wrap=3D"">
<fieldset class=3D"mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Openembedded-core@li=
sts.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class=3D"moz-txt-link-freetext" href=3D"http://lists.linuxtogo.org/cgi=
-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-b=
in/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090000090004000701010301--
