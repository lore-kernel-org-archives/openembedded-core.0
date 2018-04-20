Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 407C7745DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 07:13:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3K7DNuC018382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 20 Apr 2018 08:13:25 +0100
Message-ID: <1524208403.18865.129.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ola x Nilsson <ola.x.nilsson@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 08:13:23 +0100
In-Reply-To: <20180419111730.10269-2-olani@axis.com>
References: <1522849430.11431.367.camel@linuxfoundation.org>
	<20180419111730.10269-1-olani@axis.com>
	<20180419111730.10269-2-olani@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] package.bbclass: Include dbgsrc for static libs
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
X-List-Received-Date: Fri, 20 Apr 2018 07:13:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-04-19 at 13:17 +0200, Ola x Nilsson wrote:
> The debugsource must be added from the package providing the static
> lib, because any package using that lib does not have access to the
> source code.
> 
> Fixes [YOCTO #12558]
> 
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> ---
>  meta/classes/package.bbclass | 44 ++++++++++++++++++++++++++++++++
> ------------
>  1 file changed, 32 insertions(+), 12 deletions(-)

I messed up and accidentally merged this onto OE-Core early and then we
had test failures on mingw. 

To resolve that I've added a tweak to disable this on mingw since it
doesn't work there.

Cheers,

Richard

