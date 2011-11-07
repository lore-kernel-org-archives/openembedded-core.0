Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RNO3z-000388-JA
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 13:12:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA7C6H5V009151
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 04:06:17 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 7 Nov 2011 04:06:17 -0800
Message-ID: <4EB7C898.1060001@windriver.com>
Date: Mon, 7 Nov 2011 20:01:28 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320665106.git.xiaofeng.yan@windriver.com>	<fea248bae1ee38a8c74392d47bf4480cb405cfae.1320665106.git.xiaofeng.yan@windriver.com>
	<94D2553B-05A3-4DA1-918D-26E66F3E9DCC@dominion.thruhere.net>
In-Reply-To: <94D2553B-05A3-4DA1-918D-26E66F3E9DCC@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 07 Nov 2011 12:12:32 -0000
Content-Type: multipart/alternative;
	boundary="------------070700060500050606000808"

--------------070700060500050606000808
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2011?11?07? 19:58, Koen Kooi wrote:
> Op 7 nov. 2011, om 12:57 heeft Xiaofeng Yan het volgende geschreven:
>
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> qmmp: remove old recipe and add new recipe
>>
>> Use do_split_package for each grouping and name them correctly besides updating package.
>> The format to name plugins of qmmp:
>> qmmp-plugin-<group>-<library>    with the Description: Qmmp<Group>   plugin for %s"
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta/recipes-qt/qt-apps/qmmp_0.5.1.bb |   47 ----------------------------
>>
>> -FILES_${PN}-plugin-input-mad = "${libdir}/qmmp/Input/libmad.so"
>> -RDEPENDS_${PN}-plugin-input-mad = "libmad"
>> -FILES_${PN}-plugin-input-vorbis = "${libdir}/qmmp/Input/libvorbis.so"
>> -RDEPENDS_${PN}-plugin-input-vorbis = "libvorbis libogg"
>> diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>> new file mode 100644
>> index 0000000..035b50f
>> --- /dev/null
>> +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>> @@ -0,0 +1,54 @@
>> +dESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written with help of Qt library"
>> +HOMEPAGE = "http://qmmp.ylsoftware.com"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>> +SECTION = "multimedia"
>> +
>> +PR = "r0"
>> +
>> +DEPENDS = "taglib libmad libvorbis libogg alsa-lib"
>> +RDEPENDS_${PN} += "taglib alsa-lib libmad curl"
> RDEPENDS go below do_install, like in the old recipe. The variable follow the task order, so DEPENDS goes at the top, RDEPENDS (do_package) goes down below do_install.
>
Hi koen,

Thank you for finding my fault, but in this recipe , do_install use 
default mode. I should put RDEPENDS below  FILES_${PN}, right?
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------070700060500050606000808
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    On 2011&#24180;11&#26376;07&#26085; 19:58, Koen Kooi wrote:
    <blockquote
      cite="mid:94D2553B-05A3-4DA1-918D-26E66F3E9DCC@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
Op 7 nov. 2011, om 12:57 heeft Xiaofeng Yan het volgende geschreven:

</pre>
      <blockquote type="cite">
        <pre wrap="">From: Xiaofeng Yan <a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>

qmmp: remove old recipe and add new recipe

Use do_split_package for each grouping and name them correctly besides updating package.
The format to name plugins of qmmp:
qmmp-plugin-&lt;group&gt;-&lt;library&gt;   with the Description: Qmmp&lt;Group&gt;  plugin for %s"

Signed-off-by: Xiaofeng Yan <a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
---
meta/recipes-qt/qt-apps/qmmp_0.5.1.bb |   47 ----------------------------

-FILES_${PN}-plugin-input-mad = "${libdir}/qmmp/Input/libmad.so"
-RDEPENDS_${PN}-plugin-input-mad = "libmad"
-FILES_${PN}-plugin-input-vorbis = "${libdir}/qmmp/Input/libvorbis.so"
-RDEPENDS_${PN}-plugin-input-vorbis = "libvorbis libogg"
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
new file mode 100644
index 0000000..035b50f
--- /dev/null
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -0,0 +1,54 @@
+dESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written with help of Qt library"
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://qmmp.ylsoftware.com">"http://qmmp.ylsoftware.com"</a>
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=393a5ca445f6965873eca0259a17f833">"file://COPYING;md5=393a5ca445f6965873eca0259a17f833"</a>
+SECTION = "multimedia"
+
+PR = "r0"
+
+DEPENDS = "taglib libmad libvorbis libogg alsa-lib"
+RDEPENDS_${PN} += "taglib alsa-lib libmad curl"
</pre>
      </blockquote>
      <pre wrap="">
RDEPENDS go below do_install, like in the old recipe. The variable follow the task order, so DEPENDS goes at the top, RDEPENDS (do_package) goes down below do_install.

</pre>
    </blockquote>
    Hi koen,<br>
    <br>
    Thank you for finding my fault, but in this recipe , do_install use
    default mode. I should put RDEPENDS below&nbsp; FILES_${PN}, right?<br>
    <blockquote
      cite="mid:94D2553B-05A3-4DA1-918D-26E66F3E9DCC@dominion.thruhere.net"
      type="cite">
      <pre wrap="">regards,

Koen</pre>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------070700060500050606000808--
