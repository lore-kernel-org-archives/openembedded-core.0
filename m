Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 78E32781DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Dec 2017 15:06:11 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBSF6AGS029336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 28 Dec 2017 15:06:12 GMT
Message-ID: <1514473570.5525.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Dec 2017 15:06:10 +0000
In-Reply-To: <20171222133535.31170-1-otavio@ossystems.com.br>
References: <20171222133535.31170-1-otavio@ossystems.com.br>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] mesa: Upgrade to 17.3.1 release
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
X-List-Received-Date: Thu, 28 Dec 2017 15:06:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-12-22 at 11:35 -0200, Otavio Salvador wrote:
> The 17.3.1 release, published in December 21, 2017, is the first 17.3
> stable release for use. It fixes a number of issues since 17.3.0
> release.
> 
> The release notes can be seen at:
> 
>  - 17.3.0: https://www.mesa3d.org/relnotes/17.3.0.html
>  - 17.3.1: https://www.mesa3d.org/relnotes/17.3.1.html
> 
> This commit has reworked few patches, to apply to the new source, and
> dropped the backported ones.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Doesn't build unfortunately:

https://autobuilder.yocto.io/builders/nightly-rpm-non-rpm/builds/645/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/129/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-packagemanagers/builds/310/steps/BuildImages/logs/stdio
https://autobuilder.yocto.io/builders/nightly-x32/builds/653/steps/BuildImages/logs/stdio

Cheers,

Richard

