Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 952876011F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Dec 2017 16:57:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vB9GvmUx005228
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 9 Dec 2017 16:57:51 GMT
Message-ID: <1512838668.19417.119.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 09 Dec 2017 16:57:48 +0000
In-Reply-To: <1512652937-15773-1-git-send-email-maxin.john@intel.com>
References: <1512652937-15773-1-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] i2c-tools: upgrade to 4.0
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
X-List-Received-Date: Sat, 09 Dec 2017 16:57:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-12-07 at 15:22 +0200, Maxin B. John wrote:
> Update the SRC_URI to point to kernel.org location where
> i2c-tools is hosted these days.
> 
> Remove Modules.mk since it was used for deprecated binaries
> (eepromer, eeprom)
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-devtools/i2c-tools/files/Module.mk    | 72 ------------
> ----------
>  .../{i2c-tools_3.1.2.bb => i2c-tools_4.0.bb}       | 14 ++---
>  2 files changed, 5 insertions(+), 81 deletions(-)
>  delete mode 100644 meta/recipes-devtools/i2c-tools/files/Module.mk
>  rename meta/recipes-devtools/i2c-tools/{i2c-tools_3.1.2.bb => i2c-
> tools_4.0.bb} (64%)

Fails on musl sadly:

https://autobuilder.yocto.io/builders/nightly-musl/builds/643/steps/BuildImages/logs/stdio

Cheers,

Richard

