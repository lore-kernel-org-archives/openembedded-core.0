Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B87C1780D9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 22:06:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5BM60qj031288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 11 Jun 2017 23:06:01 +0100
Message-ID: <1497218760.3942.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changhyeok Bae <changhyeok.bae@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Jun 2017 23:06:00 +0100
In-Reply-To: <1496899587-30479-1-git-send-email-changhyeok.bae@gmail.com>
References: <1496899587-30479-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 11 Jun 2017 23:06:01 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] iproute2: Upgrade 4.10.0 -> 4.11.0
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
X-List-Received-Date: Sun, 11 Jun 2017 22:06:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-08 at 05:26 +0000, Changhyeok Bae wrote:
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  .../iproute2/{iproute2_4.10.0.bb =>
> iproute2_4.11.0.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/iproute2/{iproute2_4.10.0.bb =>
> iproute2_4.11.0.bb} (75%)

Failed to build with musl:

https://autobuilder.yocto.io/builders/nightly-musl/builds/297/steps/BuildImages/logs/stdio

Cheers,

Richard

