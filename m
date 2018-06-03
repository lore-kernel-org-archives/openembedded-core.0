Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2D19A745D9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 22:41:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w53Mfbco000942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 3 Jun 2018 23:41:39 +0100
Message-ID: <8168c081f3ce907473d2386466daa4f6447f3fa8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 03 Jun 2018 23:41:37 +0100
In-Reply-To: <88bf43bd0058ea5c78ca82468bccfaebcdb4ab09.1527670923.git.liezhi.yang@windriver.com>
References: <cover.1527670923.git.liezhi.yang@windriver.com>
	<88bf43bd0058ea5c78ca82468bccfaebcdb4ab09.1527670923.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 10/16] dropbear: add default config file to disable root login
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
X-List-Received-Date: Sun, 03 Jun 2018 22:41:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-05-30 at 17:03 +0800, Robert Yang wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> root login is disabled by default for openssh and we can
> enable it through IMAGE_FEATURES 'debug-tweaks' or
> 'allow-empty-password', so change to the same default
> behavior for dropbear.
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-core/dropbear/dropbear.inc              | 3 +++
>  meta/recipes-core/dropbear/dropbear/dropbear.default | 2 ++
>  2 files changed, 5 insertions(+)
>  create mode 100644 meta/recipes-
> core/dropbear/dropbear/dropbear.default

This or the preceeding patch in the series appears to cause the first
failure in:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1096/steps/Running%20oe-selftest/logs/stdio

(FAIL: test_non_root_user_can_connect_via_ssh_without_password
(imagefeatures.ImageFeatures))

Cheers,

Richard

