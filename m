Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DA6DE6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 21:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6SLdnPv027331; Thu, 28 Jul 2016 22:39:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9rG9AWRKQ2h8; Thu, 28 Jul 2016 22:39:49 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6SLdhU9027328
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 28 Jul 2016 22:39:44 +0100
Message-ID: <1469741983.9142.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 22:39:43 +0100
In-Reply-To: <1469728851-20606-1-git-send-email-alejandro.hernandez@linux.intel.com>
References: <1469728851-20606-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v3] python-setuptools: Upgrade to v 25.1.0
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
X-List-Received-Date: Thu, 28 Jul 2016 21:39:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-07-28 at 18:00 +0000, Alejandro Hernandez wrote:
> LICENCE checksum did not change, it is emebedded on the setup.py
> file,
> this file changed, so the line number where we get the checksum
> changed.
> 
> Signed-off-by: Alejandro Hernandez <
> alejandro.hernandez@linux.intel.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc |  6 ++--
>  .../python/python-setuptools_22.0.5.bb             | 38 ------------
> ----------
>  .../python/python-setuptools_25.1.0.bb             | 38
> ++++++++++++++++++++++
>  3 files changed, 41 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python
> -setuptools_22.0.5.bb
>  create mode 100644 meta/recipes-devtools/python/python
> -setuptools_25.1.0.bb

This patch results in:

ERROR: python3-setuptools-22.0.5-r0 do_fetch: Checksum failure fetching https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-22.0.5.tar.gz
ERROR: python3-setuptools-22.0.5-r0 do_fetch: Function failed: Fetcher failure for URL: 'https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-22.0.5.tar.gz'. Checksum mismatch!
File: '/media/build3/sources/setuptools-22.0.5.tar.gz' has md5 checksum 869f3029dcc66a64ba39875e2a2f044a when a4814dead37e74a86883c66f7d420d73 was expected
File: '/media/build3/sources/setuptools-22.0.5.tar.gz' has sha256 checksum 19aad19471052d5daefe96f2c1fa2e88dcdb17488bf8708d7e6356881ea833cb when 6a0f8111feb5a3438c6309cda49810a16d23e73c173331281edc37dd1374d1d5 was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] = "869f3029dcc66a64ba39875e2a2f044a"
SRC_URI[sha256sum] = "19aad19471052d5daefe96f2c1fa2e88dcdb17488bf8708d7e6356881ea833cb"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.

ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/work/core2-64-poky-linux/python3-setuptools/22.0.5-r0/temp/log.do_fetch.131527
ERROR: Task /media/build1/poky/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb:do_fetch (/media/build1/poky/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb:do_fetch) failed with exit code '1'

Since I suspect there is a common file between python and python3...

Cheers,

Richard

