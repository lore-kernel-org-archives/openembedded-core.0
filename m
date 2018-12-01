Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E58F76C08B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Dec 2018 11:16:35 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wB1BGY7P021448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 1 Dec 2018 11:16:35 GMT
Message-ID: <dbc8f813a6e6925a84ebadb25048d3732c6781d8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 01 Dec 2018 11:16:33 +0000
In-Reply-To: <20181201010807.28924-1-raj.khem@gmail.com>
References: <20181201010807.28924-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] nfs-utils: Upgrade to 2.3.2
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
X-List-Received-Date: Sat, 01 Dec 2018 11:16:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-11-30 at 17:08 -0800, Khem Raj wrote:
> enhance the musl-only patch to degrade certain Werros into Warnings
> which helps in compiling on musl, since its checking for __GLIBC__
> defines which are undefined on musl.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../nfs-utils-musl-res_querydomain.patch      | 43
> +++++++++++++++++--
>  ...{nfs-utils_2.3.1.bb => nfs-utils_2.3.2.bb} |  4 +-
>  2 files changed, 41 insertions(+), 6 deletions(-)
>  rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.3.1.bb =>
> nfs-utils_2.3.2.bb} (97%)

Doesn't build on x32 unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/43/steps/7/logs/step1b

Cheers,

Richard


