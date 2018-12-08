Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8885D6C54F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Dec 2018 00:07:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wB807JZm017887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 8 Dec 2018 00:07:20 GMT
Message-ID: <fae0fb29acedc0c26cf9d5860e053d1427316cb8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 08 Dec 2018 00:07:19 +0000
In-Reply-To: <20181207120605.11344-2-richard.purdie@linuxfoundation.org>
References: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
	<20181207120605.11344-2-richard.purdie@linuxfoundation.org>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Sat, 08 Dec 2018 00:07:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-07 at 12:06 +0000, Richard Purdie wrote:
> opkg needs the replaces/conflicts/provides in order for this package
> to function as intended. When enabled, this code caused failures for
> core-image-sato -c populate_sdk.
> 
> The reason is that nativesdk-autoconf has several perl dependencies.
> We
> need to list more of the things which this package provides/conflicts
> with in order for it to function correctly. Therefore add the missing
> entries.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/meta/dummy-sdk-package.inc  |  4 ++--
>  .../meta/nativesdk-sdk-provides-dummy.bb      | 20
> +++++++++++++++++++
>  .../meta/target-sdk-provides-dummy.bb         |  3 +++
>  3 files changed, 25 insertions(+), 2 deletions(-)

Sadly this breaks the SDK on machines without libxml-parser-perl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/68

so a resolution will need to be found to that before it can merge.

Cheers,

Richard


