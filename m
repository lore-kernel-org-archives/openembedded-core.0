Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 356BF77D9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 11:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v37B3Zw0010058; 
	Fri, 7 Apr 2017 12:03:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EafiMSzpkL_R; Fri,  7 Apr 2017 12:03:35 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v37AvwmX008943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 7 Apr 2017 11:57:59 +0100
Message-ID: <1491562678.17200.91.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Choong, Yin Thong" <yin.thong.choong@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 07 Apr 2017 11:57:58 +0100
In-Reply-To: <CF0C948DE8E2634BB64BF489FF9EF7E7CB2F5A@PGSMSX105.gar.corp.intel.com>
References: <1491467730-8418-1-git-send-email-yin.thong.choong@intel.com>
	<1491467730-8418-5-git-send-email-yin.thong.choong@intel.com>
	<1491550600.17200.82.camel@linuxfoundation.org>
	<CF0C948DE8E2634BB64BF489FF9EF7E7CB2F5A@PGSMSX105.gar.corp.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: "Phoong, Stanley Cheong Kwan" <stanley.cheong.kwan.phoong@intel.com>, "Khor,
	Chin Kooi" <chin.kooi.khor@intel.com>, "Gan,
	Yau Wai" <yau.wai.gan@intel.com>, "Ang,
	Chin Huat" <chin.huat.ang@intel.com>, "Tan,
	Shen Joon" <shen.joon.tan@intel.com>, "Ng,
	Wei Tee" <wei.tee.ng@intel.com>, "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
Subject: Re: [PATCH v3 4/8] logrotate: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Fri, 07 Apr 2017 11:03:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-04-07 at 09:10 +0000, Choong, Yin Thong wrote:
> Is wired. I bitbake successful on my machine. bitbake logrotate
> -ccleanall and bitbake logrotate.
> In this case, I should submit my entire patch or only resubmit this
> patch [PATCH v3 4/8] with cover letter?

Please send just this patch. If you setup a multiconfig configuration
and then "bitbake lib32-logrotate" you'd see this error.

You can see the configuration the autobuilder used here:
https://autobuilder.yocto.io/builders/nightly-world/builds/214/steps/CreateAutoConf/logs/stdio
for that world build for example.

Cheers,

Richard

