Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B4AC177A63
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 12:44:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7RCiSR3007664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 27 Aug 2017 13:44:31 +0100
Message-ID: <1503837868.32591.252.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Aug 2017 13:44:28 +0100
In-Reply-To: <20170826230537.26171-1-otavio@ossystems.com.br>
References: <20170826230537.26171-1-otavio@ossystems.com.br>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 27 Aug 2017 13:44:31 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Sun, 27 Aug 2017 12:44:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2017-08-26 at 20:05 -0300, Otavio Salvador wrote:
> There is no COMPATIBLE_HOST in the recipe neither it makes sense for
> this to be machine specific.
> 
> Possibly, initramfs-framework's based modules may be machine specific
> but if there is the case they can just RDEPENDS on
> initramfs-framework-base and provide the specific module as another
> recipe.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 8 +++
> -----
>  1 file changed, 3 insertions(+), 5 deletions(-)

This causes selftest failures for:

oe-selftest -r sstatetests.SStateTests.test_sstate_allarch_samesigs
oe-selftest -r sstatetests.SStateTests.test_sstate_allarch_samesigs_multilib

as in this build:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/487/steps/Running%20oe-selftest/logs/stdio

Cheers,

Richard

