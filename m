Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E7C036F585
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 12:39:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s27CdkMQ019299; Fri, 7 Mar 2014 12:39:47 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6wi4X7lK0Dtt; Fri,  7 Mar 2014 12:39:46 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s27CdiDo019294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 7 Mar 2014 12:39:45 GMT
Message-ID: <1394195975.12327.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sebastien MENNETRIER <s.mennetrier@innotis.org>
Date: Fri, 07 Mar 2014 12:39:35 +0000
In-Reply-To: <CABgO3_O069SpHEeF0ALPuimB6Yag8W72tjAuLLsqaQT-7XgNWA@mail.gmail.com>
References: <1393509239-26637-1-git-send-email-s.mennetrier@innotis.org>
	<CABgO3_O069SpHEeF0ALPuimB6Yag8W72tjAuLLsqaQT-7XgNWA@mail.gmail.com>
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
X-List-Received-Date: Fri, 07 Mar 2014 12:40:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2014-03-04 at 09:19 +0100, Sebastien MENNETRIER wrote:
> Ping
> 
> 
> 
> 2014-02-27 14:53 GMT+01:00 Sébastien Mennetrier
> <s.mennetrier@innotis.org>:
>         This recipe is based on gst-meta-base
>         
>         Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org>
>         ---
>          .../gstreamer/gstreamer1.0-meta-base.bb            | 63
>         ++++++++++++++++++++++
>          1 file changed, 63 insertions(+)
>          create mode 100644
>         meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
>         
>         diff --git
>         a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
>         b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
>         new file mode 100644
>         index 0000000..3b797f0
>         --- /dev/null
>         +++
>         b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
>         @@ -0,0 +1,63 @@
>         +DESCRIPTION = "Gstreamer1.0 package groups"
>         +LICENSE = "MIT"
>         +DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base
>         gstreamer1.0-plugins-good gstreamer1.0-plugins-bad"
>         +LIC_FILES_CHKSUM =
>         "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
>         +
>          file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

This patch broke the builds since it was written and tested against
something which was not master. I can tell this since
${COREBASE}/LICENSE changed.

Cheers,

Richard






