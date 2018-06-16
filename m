Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0BA72EA2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 21:30:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5GLU5xG002938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 16 Jun 2018 22:30:06 +0100
Message-ID: <92feae4657c30ea2eb31fe0b04c00eba413dfca9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2018 22:30:04 +0100
In-Reply-To: <e01f930a544e33f6ed0504e7cfac12e5da619fc3.1529075133.git.raj.khem@gmail.com>
References: <cover.1529075133.git.raj.khem@gmail.com>
	<e01f930a544e33f6ed0504e7cfac12e5da619fc3.1529075133.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/3] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Sat, 16 Jun 2018 21:30:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-15 at 08:08 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)

I think this patch breaks on multlib:

https://autobuilder.yocto.io/builders/nightly-multilib/builds/1085/steps/BuildImages_2/logs/stdio
https://autobuilder.yocto.io/builders/nightly-multilib/builds/1085/steps/BuildImages_3/logs/stdio
https://autobuilder.yocto.io/builders/nightly-multilib/builds/1085/steps/BuildImages_4/logs/stdio

and x32:

https://autobuilder.yocto.io/builders/nightly-x32/builds/1063/steps/BuildImages/logs/stdio

Cheers,

Richard

