Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 56A6571C54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 10:22:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MAM9Q3011941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 11:22:10 +0100
Message-ID: <1503397329.32591.79.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Aug 2017 11:22:09 +0100
In-Reply-To: <20170821205721.20086-2-Martin.Jansa@gmail.com>
References: <20170821205721.20086-1-Martin.Jansa@gmail.com>
	<20170821205721.20086-2-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 11:22:10 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] grub2: fix build with gcc-7
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
X-List-Received-Date: Tue, 22 Aug 2017 10:22:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-21 at 22:57 +0200, Martin Jansa wrote:
> * build with gcc-7 fails with:
>   | ./config-util.h:1504:48: error: this use of "defined" may not
> be   portable [-Werror=expansion-to-defined]
>   |              || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
>   |                                                 ^~~~~~~~~~~~~~~
>   and we're not building on Apple or BSD, so we should be able
>   to just ignoreit until it's resolved properly in some newer gnulib
>   and imported from gnulib to grub-2
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-bsp/grub/grub-efi_2.02.bb | 6 ++++++
>  1 file changed, 6 insertions(+)

Sadly this appears to break grub-efi everywhere on the autobuilder,
e.g.:

https://autobuilder.yocto.io/builders/nightly-no-x11/builds/428/steps/BuildImages/logs/stdio

I took a risk and tried to get this into M3 buts its not paid off and
we'll need another rebuild :(.

Cheers,

Richard



