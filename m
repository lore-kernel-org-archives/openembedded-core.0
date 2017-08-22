Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4FEB777EA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 10:37:11 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MAb3iO013668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 11:37:04 +0100
Message-ID: <1503398223.32591.81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Aug 2017 11:37:03 +0100
In-Reply-To: <20170821213116.26081-1-anibal.limon@linux.intel.com>
References: <20170821213116.26081-1-anibal.limon@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 11:37:05 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: jagadeesh.krishnanjanappa@caviumnetworks.com
Subject: Re: [PATCH 1/2] apt: Upgrade to 1.2.24
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
X-List-Received-Date: Tue, 22 Aug 2017 10:37:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-21 at 16:31 -0500, Aníbal Limón wrote:
> The LIC_FILES_CHKSUM changed because the license file now has
> style changes in the text remains GPLv2+.
> 
> The patch Revert-always-run-dpkg-configure-a-at-the-end-of-our
> was updated because now the precision fields use floating
> point numbers.
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> ---
>  .../{apt-native_1.2.12.bb => apt-native_1.2.24.bb} |  0
>  meta/recipes-devtools/apt/apt.inc                  |  8 ++++----
>  ...ys-run-dpkg-configure-a-at-the-end-of-our.patch | 24 +++++++++++-
> ----------
>  .../apt/{apt_1.2.12.bb => apt_1.2.24.bb}           |  0
>  4 files changed, 16 insertions(+), 16 deletions(-)
>  rename meta/recipes-devtools/apt/{apt-native_1.2.12.bb => apt-
> native_1.2.24.bb} (100%)
>  rename meta/recipes-devtools/apt/{apt_1.2.12.bb => apt_1.2.24.bb}
> (100%)

https://autobuilder.yocto.io/builders/nightly-packagemanagers/builds/80/steps/BuildImages_2/logs/stdio

Cheers,

Richard


