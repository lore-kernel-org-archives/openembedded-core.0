Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E648E7547C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Apr 2018 10:25:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w37APiKv009405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 7 Apr 2018 11:25:45 +0100
Message-ID: <1523096744.2942.54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 07 Apr 2018 11:25:44 +0100
In-Reply-To: <1523091927-15811-1-git-send-email-liu.ming50@gmail.com>
References: <1523091927-15811-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] meta: conf: avoid appending LIBCOVERRIDE to OVERRIDES
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
X-List-Received-Date: Sat, 07 Apr 2018 10:25:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2018-04-07 at 11:05 +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> The order of any other overrides should be before forcevariable, or
> else it will get the highest priority.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/native.bbclass                   | 2 --
>  meta/classes/nativesdk.bbclass                | 2 +-
>  meta/conf/bitbake.conf                        | 3 ++-
>  meta/conf/distro/include/tclibc-baremetal.inc | 5 ++---
>  meta/conf/distro/include/tclibc-glibc.inc     | 5 ++---
>  meta/conf/distro/include/tclibc-musl.inc      | 5 ++---
>  6 files changed, 9 insertions(+), 13 deletions(-)

We do not want to inject an empty entry into OVERRIDES. This patch
changes things so we can end up with "::" in there.

I suspect we've fixed bugs in bitbake where problems resulted from that
however I still don't want to do it.

Cheers,

Richard

