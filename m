Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6962378607
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 08:09:48 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7G89l1G025710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 16 Aug 2017 09:09:48 +0100
Message-ID: <1502870987.13978.87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 09:09:47 +0100
In-Reply-To: <20170814032418.3936-2-raj.khem@gmail.com>
References: <20170814032418.3936-1-raj.khem@gmail.com>
	<20170814032418.3936-2-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 16 Aug 2017 09:09:49 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/3] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Wed, 16 Aug 2017 08:09:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2017-08-13 at 20:24 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)

I think this breaks on x32:

https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/1183/steps/BuildImages/logs/stdio

Cheers,

Richard

