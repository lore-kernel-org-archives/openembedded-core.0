Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RNOQJ-0003qq-TO
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 13:35:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA7CTMeJ012457
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 04:29:22 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 7 Nov 2011 04:29:22 -0800
Message-ID: <4EB7CE01.9000508@windriver.com>
Date: Mon, 7 Nov 2011 20:24:33 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320665106.git.xiaofeng.yan@windriver.com>	<fea248bae1ee38a8c74392d47bf4480cb405cfae.1320665106.git.xiaofeng.yan@windriver.com>	<94D2553B-05A3-4DA1-918D-26E66F3E9DCC@dominion.thruhere.net>	<4EB7C898.1060001@windriver.com>
	<16520868-387A-48EB-8828-6F7BEC3C9219@dominion.thruhere.net>
In-Reply-To: <16520868-387A-48EB-8828-6F7BEC3C9219@dominion.thruhere.net>
X-Originating-IP: [128.224.162.146]
Subject: Re: [PATCH 1/2] qmmp: update to 0.5.2
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
X-List-Received-Date: Mon, 07 Nov 2011 12:35:36 -0000
Content-Type: multipart/alternative;
	boundary="------------030101050609010505060801"

--------------030101050609010505060801
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id pA7CTMeJ012457

On 2011=E5=B9=B411=E6=9C=8807=E6=97=A5 20:11, Koen Kooi wrote:
> Op 7 nov. 2011, om 13:01 heeft Xiaofeng Yan het volgende geschreven:
>
>> On 2011=E5=B9=B411=E6=9C=8807=E6=97=A5 19:58, Koen Kooi wrote:
>>> Op 7 nov. 2011, om 12:57 heeft Xiaofeng Yan het volgende geschreven:
>>>
>>>
>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>
>>>>
>>>> qmmp: remove old recipe and add new recipe
>>>>
>>>> Use do_split_package for each grouping and name them correctly besid=
es updating package.
>>>> The format to name plugins of qmmp:
>>>> qmmp-plugin-<group>-<library>    with the Description: Qmmp<Group>  =
 plugin for %s"
>>>>
>>>> Signed-off-by: Xiaofeng Yan
>>>> <xiaofeng.yan@windriver.com>
>>>>
>>>> ---
>>>> meta/recipes-qt/qt-apps/qmmp_0.5.1.bb |   47 -----------------------=
-----
>>>>
>>>> -FILES_${PN}-plugin-input-mad =3D "${libdir}/qmmp/Input/libmad.so"
>>>> -RDEPENDS_${PN}-plugin-input-mad =3D "libmad"
>>>> -FILES_${PN}-plugin-input-vorbis =3D "${libdir}/qmmp/Input/libvorbis=
.so"
>>>> -RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"
>>>>
>>>> diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt=
/qt-apps/qmmp_0.5.2.bb
>>>> new file mode 100644
>>>> index 0000000..035b50f
>>>> --- /dev/null
>>>> +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>>> @@ -0,0 +1,54 @@
>>>> +dESCRIPTION =3D "Qmmp (Qt-based Multimedia Player) is an audio-play=
er, written with help of Qt library"
>>>> +HOMEPAGE =3D
>>>> "http://qmmp.ylsoftware.com"
>>>>
>>>> +LICENSE =3D "GPLv2"
>>>> +LIC_FILES_CHKSUM =3D
>>>> "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833"
>>>>
>>>> +SECTION =3D "multimedia"
>>>> +
>>>> +PR =3D "r0"
>>>> +
>>>> +DEPENDS =3D "taglib libmad libvorbis libogg alsa-lib"
>>>> +RDEPENDS_${PN} +=3D "taglib alsa-lib libmad curl"
>>>>
>>> RDEPENDS go below do_install, like in the old recipe. The variable fo=
llow the task order, so DEPENDS goes at the top, RDEPENDS (do_package) go=
es down below do_install.
>>>
>>>
>> Hi koen,
>>
>> Thank you for finding my fault, but in this recipe , do_install use de=
fault mode. I should put RDEPENDS below  FILES_${PN}, right?
> Yes please.
>
Thanks, I modified my fault.

> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------030101050609010505060801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id pA7CTMeJ012457

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
    <title></title>
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    On 2011=E5=B9=B411=E6=9C=8807=E6=97=A5 20:11, Koen Kooi wrote:
    <blockquote
      cite=3D"mid:16520868-387A-48EB-8828-6F7BEC3C9219@dominion.thruhere.=
net"
      type=3D"cite">
      <pre wrap=3D"">
Op 7 nov. 2011, om 13:01 heeft Xiaofeng Yan het volgende geschreven:

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">On 2011=E5=B9=B411=E6=9C=8807=E6=97=A5 19:58, Koen=
 Kooi wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">Op 7 nov. 2011, om 12:57 heeft Xiaofeng Yan het =
volgende geschreven:


</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"">From: Xiaofeng Yan <a class=3D"moz-txt-link-rf=
c2396E" href=3D"mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windr=
iver.com&gt;</a>


qmmp: remove old recipe and add new recipe

Use do_split_package for each grouping and name them correctly besides up=
dating package.
The format to name plugins of qmmp:
qmmp-plugin-&lt;group&gt;-&lt;library&gt;   with the Description: Qmmp&lt=
;Group&gt;  plugin for %s"

Signed-off-by: Xiaofeng Yan=20
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:xiaofeng.yan@windriver.=
com">&lt;xiaofeng.yan@windriver.com&gt;</a>

---
meta/recipes-qt/qt-apps/qmmp_0.5.1.bb |   47 ----------------------------

-FILES_${PN}-plugin-input-mad =3D "${libdir}/qmmp/Input/libmad.so"
-RDEPENDS_${PN}-plugin-input-mad =3D "libmad"
-FILES_${PN}-plugin-input-vorbis =3D "${libdir}/qmmp/Input/libvorbis.so"
-RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-a=
pps/qmmp_0.5.2.bb
new file mode 100644
index 0000000..035b50f
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -0,0 +1,54 @@
+dESCRIPTION =3D "Qmmp (Qt-based Multimedia Player) is an audio-player, w=
ritten with help of Qt library"
+HOMEPAGE =3D=20
<a class=3D"moz-txt-link-rfc2396E" href=3D"http://qmmp.ylsoftware.com">"h=
ttp://qmmp.ylsoftware.com"</a>

+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D=20
<a class=3D"moz-txt-link-rfc2396E" href=3D"file://COPYING;md5=3D393a5ca44=
5f6965873eca0259a17f833">"file://COPYING;md5=3D393a5ca445f6965873eca0259a=
17f833"</a>

+SECTION =3D "multimedia"
+
+PR =3D "r0"
+
+DEPENDS =3D "taglib libmad libvorbis libogg alsa-lib"
+RDEPENDS_${PN} +=3D "taglib alsa-lib libmad curl"

</pre>
          </blockquote>
          <pre wrap=3D"">RDEPENDS go below do_install, like in the old re=
cipe. The variable follow the task order, so DEPENDS goes at the top, RDE=
PENDS (do_package) goes down below do_install.


</pre>
        </blockquote>
        <pre wrap=3D"">Hi koen,

Thank you for finding my fault, but in this recipe , do_install use defau=
lt mode. I should put RDEPENDS below  FILES_${PN}, right?
</pre>
      </blockquote>
      <pre wrap=3D"">
Yes please.

</pre>
    </blockquote>
    Thanks, I modified my fault.<br>
    <br>
    <blockquote
      cite=3D"mid:16520868-387A-48EB-8828-6F7BEC3C9219@dominion.thruhere.=
net"
      type=3D"cite">
      <pre wrap=3D"">regards,

Koen</pre>
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

--------------030101050609010505060801--
