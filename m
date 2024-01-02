Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E766C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 13:01:57 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.28252.1704200509299562662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 05:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id 70A9F14281
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 14:01:47 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.12]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rKeOu-1foEj20; Tue, 2 Jan 2024 14:01:44 +0100
Date: Tue, 02 Jan 2024 14:01:38 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] utfcpp: add recipe
To: openembedded-core@lists.openembedded.org
Message-Id: <QIXM6S.ZGI08VQ09CW21@t-online.de>
In-Reply-To: <17A68917D46BD8C6.19767@lists.openembedded.org>
References: <17A68917D46BD8C6.19767@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-C0rFmA+Y2v6bDHplrdrJ"
X-TOI-EXPURGATEID: 150726::1704200504-C1AEC9F9-DB577DEB/0/0 CLEAN NORMAL
X-TOI-MSGID: c8751cf5-572a-42a0-852c-d26d3c962274
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 13:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193232

--=-C0rFmA+Y2v6bDHplrdrJ
Content-Type: text/plain; charset=us-ascii; format=flowed

The documentation states:
This is a header-only library and the supported way of deploying it is:

Download a release from <https://github.com/nemtrif/utfcpp/releases> 
into a temporary directory Unzip the release Copy the content of 
utfcpp/source file into the directory where you keep include files for 
your project
The CMakeList.txt file was originally made for testing purposes only, 
but unfortunately over time I accepted contributions that added install 
target. /This is not a supported way of installing the utfcpp library/ 
and I am considering removing the CMakeList.txt in a future release.

This statement doesn't make a lot of sense to me but maybe it would be 
a good idea to install the files manually instead of using cmake?


On Tue, Jan 2 2024 at 01:52:14 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> utfcpp will be a required dependency for the upcoming taglib-2.0 
> update.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/conf/distro/include/maintainers.inc     |  1 +
>  meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc 
> b/meta/conf/distro/include/maintainers.inc
> index 8dc63b138e..f0a39beffd 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -824,6 +824,7 @@ RECIPE_MAINTAINER:pn-unzip = "Denys Dmytriyenko 
> <denis@denix.org>"
>  RECIPE_MAINTAINER:pn-update-rc.d = "Ross Burton <ross.burton@arm.com 
> <mailto:ross.burton@arm.com>>"
>  RECIPE_MAINTAINER:pn-usbinit = "Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
>  RECIPE_MAINTAINER:pn-usbutils = "Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>"
> +RECIPE_MAINTAINER:pn-utfcpp = "Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>"
>  RECIPE_MAINTAINER:pn-util-linux = "Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>>"
>  RECIPE_MAINTAINER:pn-util-linux-libuuid = "Chen Qi 
> <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>"
>  RECIPE_MAINTAINER:pn-util-macros = "Unassigned 
> <unassigned@yoctoproject.org <mailto:unassigned@yoctoproject.org>>"
> diff --git a/meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb 
> b/meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb
> new file mode 100644
> index 0000000000..9cbea94c63
> --- /dev/null
> +++ b/meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "UTF-8 with C++ in a Portable Way."
> +HOMEPAGE = "<https://github.com/nemtrif/utfcpp>"
> +LICENSE = "BSL-1.0"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c" 
> <file://license;md5=e4224ccaecb14d942c71d31bef20d78c/>
> +
> +SRC_URI = 
> "git://github.com/nemtrif/utfcpp.git;protocol=https;branch=master"
> +
> +SRCREV = "aed58281cf45838bdb7296e3109bd5a633d677ed"
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +FILES:${PN}-dev += "${datadir}/utf8cpp/cmake"
> --
> 2.43.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193230): 
> <https://lists.openembedded.org/g/openembedded-core/message/193230>
> Mute This Topic: <https://lists.openembedded.org/mt/103480458/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-C0rFmA+Y2v6bDHplrdrJ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>The documentation states:</div><div><p dir="auto">This is a header-only library and the supported way of deploying it is:</p>
<ul dir="auto">
<li>Download a release from <a href="https://github.com/nemtrif/utfcpp/releases">https://github.com/nemtrif/utfcpp/releases</a> into a temporary directory</li>
<li>Unzip the release</li>
<li>Copy the content of utfcpp/source file into the directory where you keep include files for your project</li>
</ul>
<p dir="auto">The CMakeList.txt file was originally made for testing 
purposes only, but unfortunately over time I accepted contributions that
 added install target. <em>This is not a supported way of installing the utfcpp library</em> and I am considering removing the CMakeList.txt in a future release.</p><p dir="auto">This statement doesn't make a lot of sense to me but maybe it would be a good idea to install the files manually instead of using cmake?</p></div></div><div id="geary-quote" dir="auto"><br>On Tue, Jan 2 2024 at 01:52:14 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">utfcpp will be a required dependency for the upcoming taglib-2.0 update.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/conf/distro/include/maintainers.inc     |  1 +
 meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8dc63b138e..f0a39beffd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -824,6 +824,7 @@ RECIPE_MAINTAINER:pn-unzip = "Denys Dmytriyenko &lt;denis@denix.org&gt;"
 RECIPE_MAINTAINER:pn-update-rc.d = "Ross Burton &lt;<a href="mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt;"
 RECIPE_MAINTAINER:pn-usbinit = "Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;"
 RECIPE_MAINTAINER:pn-usbutils = "Alexander Kanavin &lt;<a href="mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;"
+RECIPE_MAINTAINER:pn-utfcpp = "Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;"
 RECIPE_MAINTAINER:pn-util-linux = "Chen Qi &lt;<a href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;"
 RECIPE_MAINTAINER:pn-util-linux-libuuid = "Chen Qi &lt;<a href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;"
 RECIPE_MAINTAINER:pn-util-macros = "Unassigned &lt;<a href="mailto:unassigned@yoctoproject.org">unassigned@yoctoproject.org</a>&gt;"
diff --git a/meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb b/meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb
new file mode 100644
index 0000000000..9cbea94c63
--- /dev/null
+++ b/meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb
@@ -0,0 +1,13 @@
+SUMMARY = "UTF-8 with C++ in a Portable Way."
+HOMEPAGE = "<a href="https://github.com/nemtrif/utfcpp">https://github.com/nemtrif/utfcpp</a>"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c" "="">file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"</a>
+
+SRC_URI = "git://github.com/nemtrif/utfcpp.git;protocol=https;branch=master"
+
+SRCREV = "aed58281cf45838bdb7296e3109bd5a633d677ed"
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+FILES:${PN}-dev += "${datadir}/utf8cpp/cmake"
<div>-- 
</div>2.43.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#193230): <a href="https://lists.openembedded.org/g/openembedded-core/message/193230">https://lists.openembedded.org/g/openembedded-core/message/193230</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/103480458/3618223">https://lists.openembedded.org/mt/103480458/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-C0rFmA+Y2v6bDHplrdrJ--


