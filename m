Return-Path: <Stefan_Seefeld@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DD34C60EE6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 17:38:59 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VJoNa-0000jq-3H from Stefan_Seefeld@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Sep 2013 10:39:02 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 11 Sep 2013 10:39:02 -0700
Received: from [0.0.0.0] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.2.247.3;
	Wed, 11 Sep 2013 10:39:01 -0700
Message-ID: <5230AAB4.2060005@mentor.com>
Date: Wed, 11 Sep 2013 13:39:00 -0400
From: Stefan Seefeld <stefan_seefeld@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 11 Sep 2013 17:39:02.0114 (UTC)
	FILETIME=[CDBBE420:01CEAF15]
Subject: build errors after upgrading
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2013 17:39:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hello,

I was successfully building images for qemux86_64, when I decided to
update to pull in recent fixes and improvements. So after git-pulling
I'm now seeing these errors:

ERROR: Nothing PROVIDES 'virtual/libgl' (but
/usr/local/OpenEmbedded/oe-core/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
DEPENDS on or otherwise requires it)
ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required
distro feature ['opengl'] (not in DISTRO_FEATURES)
ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required
distro feature ['opengl'] (not in DISTRO_FEATURES)


which I was able to work around by adding "opengl" to the distro
features via

DISTRO_FEATURES_append = " opengl ptest"

Now I'm getting a link error during the xorg-xserver build (two missing
symbols are "noXFree86DRIExtension" and "noGlxExtension", which makes me
wonder whether these are related to the above.

I see some recent activity on mesa-gl, which could be related. Can
someone offer some advice ?

Thanks,
        Stefan


-- 
Stefan Seefeld
CodeSourcery / Mentor Graphics
http://www.mentor.com/embedded-software/


