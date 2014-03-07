Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 071C46CD4B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 13:34:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s27DYMbX021553; Fri, 7 Mar 2014 13:34:22 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 244kNUO7lQKJ; Fri,  7 Mar 2014 13:34:22 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s27DYGNM021536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 7 Mar 2014 13:34:18 GMT
Message-ID: <1394199246.12327.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?S=E9bastien?= Mennetrier <s.mennetrier@innotis.org>
Date: Fri, 07 Mar 2014 13:34:06 +0000
In-Reply-To: <CABgO3_M1-S7vQC=ypS58T9w6pJTjomAT1uM+Fik4ETA3GSOHzQ@mail.gmail.com>
References: <1393509239-26637-1-git-send-email-s.mennetrier@innotis.org>
	<CABgO3_O069SpHEeF0ALPuimB6Yag8W72tjAuLLsqaQT-7XgNWA@mail.gmail.com>
	<1394195975.12327.33.camel@ted>
	<CABgO3_M1-S7vQC=ypS58T9w6pJTjomAT1uM+Fik4ETA3GSOHzQ@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Create gstreamer-1.0 package groups
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
X-List-Received-Date: Fri, 07 Mar 2014 13:34:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2014-03-07 at 14:24 +0100, Sébastien Mennetrier wrote:
> Hi,
> 
> 
> This patch was written in dora branch. I will try to adapt it for
> master branch and I will send a new patch ASAP.
> 
> Sorry for my mistake.
> 
I think it needs:

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
index 3b797f0..a73b04c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -1,7 +1,7 @@
DESCRIPTION = "Gstreamer1.0 package groups"
LICENSE = "MIT"
DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
PACKAGES = "\

in future can you please say which branch it was tested on if its not master.

Cheers,

Richard




