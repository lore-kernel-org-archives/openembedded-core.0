Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64DEB78227
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 21:30:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7ALUZ5J027931
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 14:30:36 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 10 Aug 2017 14:30:35 -0700
To: Scott Ellis <scott@jumpnowtek.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1502287422.130517799@apps.rackspace.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b40bb1c8-2220-41a7-cf9f-89ef3a628c76@windriver.com>
Date: Thu, 10 Aug 2017 17:30:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502287422.130517799@apps.rackspace.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [meta-qt5] Host paths show up in target qmake environment
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
X-List-Received-Date: Thu, 10 Aug 2017 21:30:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Scott,

On 2017-08-09 10:03 AM, Scott Ellis wrote:
> This breaks qmake on target.
> 
> Same behavior in both pyro and master branches of meta-qt5.
> 
> This differs from earlier branches of meta-qt5, using earlier versions of Qt.

Thanks for the report.

meta-qt5 is not part of oe-core so it's discussed on:
     openembedded-devel@lists.openembedded.org
I've CCed that list and BCCed oe-core to move the discussion
over.

Someone who works on meta-qt5 might take time to fix this bug but
it would be great if you could fix it and send a patch as you've
done a couple of times before.

Start by looking for 'host path' related email on this oe-core list:
 
https://www.google.ca/search?q=host+path+site%3Alists.openembedded.org%2Fpipermail%2Fopenembedded-core%2F&oq=host+path+site%3Alists.openembedded.org%2Fpipermail%2Fopenembedded-core%2F&aqs=chrome..69i57.4517j0j4&sourceid=chrome&ie=UTF-8


../Randy

> 
> root@rpi3:~# qmake -query
> QT_SYSROOT:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot
> QT_INSTALL_PREFIX:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr
> QT_INSTALL_PREFIX/raw:/usr
> QT_INSTALL_ARCHDATA:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib/qt5
> QT_INSTALL_ARCHDATA/raw:/usr/lib/qt5
> QT_INSTALL_DATA:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/share/qt5
> QT_INSTALL_DATA/raw:/usr/share/qt5
> QT_INSTALL_DOCS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/share/doc/qt5
> QT_INSTALL_DOCS/raw:/usr/share/doc/qt5
> QT_INSTALL_HEADERS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/include/qt5
> QT_INSTALL_HEADERS/raw:/usr/include/qt5
> QT_INSTALL_LIBS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib
> QT_INSTALL_LIBS/raw:/usr/lib
> QT_INSTALL_LIBEXECS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib/qt5/libexec
> QT_INSTALL_LIBEXECS/raw:/usr/lib/qt5/libexec
> QT_INSTALL_BINS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/bin/qt5
> QT_INSTALL_BINS/raw:/usr/bin/qt5
> QT_INSTALL_TESTS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/share/qt5/tests
> QT_INSTALL_TESTS/raw:/usr/share/qt5/tests
> QT_INSTALL_PLUGINS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib/qt5/plugins
> QT_INSTALL_PLUGINS/raw:/usr/lib/qt5/plugins
> QT_INSTALL_IMPORTS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib/qt5/imports
> QT_INSTALL_IMPORTS/raw:/usr/lib/qt5/imports
> QT_INSTALL_QML:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib/qt5/qml
> QT_INSTALL_QML/raw:/usr/lib/qt5/qml
> QT_INSTALL_TRANSLATIONS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/share/qt5/translations
> QT_INSTALL_TRANSLATIONS/raw:/usr/share/qt5/translations
> QT_INSTALL_CONFIGURATION:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/etc/qt5
> QT_INSTALL_CONFIGURATION/raw:/etc/qt5
> QT_INSTALL_EXAMPLES:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/share/qt5/examples
> QT_INSTALL_EXAMPLES/raw:/usr/share/qt5/examples
> QT_INSTALL_DEMOS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/share/qt5/examples
> QT_INSTALL_DEMOS/raw:/usr/share/qt5/examples
> QT_HOST_PREFIX:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot-native
> QT_HOST_DATA:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib/qt5
> QT_HOST_BINS:/usr/bin/qt5
> QT_HOST_LIBS:/oe4/rpi/tmp-pyro/work/cortexa7hf-neon-vfpv4-poky-linux-gnueabi/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/recipe-sysroot/usr/lib
> QMAKE_SPEC:linux-oe-g++
> QMAKE_XSPEC:linux-oe-g++
> QMAKE_VERSION:3.1
> QT_VERSION:5.8.0
> 
> 
> The error you see on the target processing a simple Qt .pro file
> 
> root@rpi3:~/tspress# qmake
> Could not find qmake configuration file linux-oe-g++.
> Error processing project file: /home/root/tspress/tspress.pro
> 
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

