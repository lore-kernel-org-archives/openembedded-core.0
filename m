Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 548717543D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 15:05:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w36F5aPf025720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 16:05:37 +0100
Message-ID: <1523027136.2942.9.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Apr 2018 16:05:36 +0100
In-Reply-To: <1522855946-8702-4-git-send-email-maxin.john@intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
	<1522855946-8702-4-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 04/10] at-spi2-atk: upgrade to version 2.26.2
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
X-List-Received-Date: Fri, 06 Apr 2018 15:05:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-04-04 at 18:32 +0300, Maxin B. John wrote:
> 1. convert to meson build
> 2. inherit gnomebase and associated cleanup
> 3. add libxml2 to DEPENDS list
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>

This and atk seem to fail in gir on x32:

https://autobuilder.yocto.io/builders/nightly-x32/builds/916/steps/BuildImages/logs/stdio

Cheers,

Richard

