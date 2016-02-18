Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF4D601A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 14:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1IEjtcr014096; Thu, 18 Feb 2016 14:45:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DlOQMRZqcgqo; Thu, 18 Feb 2016 14:45:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1IEjo2B014092
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Feb 2016 14:45:51 GMT
Message-ID: <1455806750.28376.85.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Franco <alejandro.franco@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 14:45:50 +0000
In-Reply-To: <1455702940-5840-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1455702940-5840-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2] testimage: add/modify DEFAULT_TEST_SUITES
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
X-List-Received-Date: Thu, 18 Feb 2016 14:45:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-02-17 at 09:55 +0000, Alex Franco wrote:
> - Add generic variables to reuse values in default test suites
> - Add more default test suites variables
> - Modify existing test suites to use generic vars when possible
> 
> [YOCTO #8410]
> 
> Alex Franco (2):
>   testimage: add DEFAULT_TEST_SUITES for more images
>   testimage: reuse generic test suites

Results in failures on the autobuilder, e.g.:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/builds/667/steps/Running%20Sanity%20Tests/logs/stdio

(I'm guessing it was from these patches)

Cheers,

Richard

