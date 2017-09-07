Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A433177CC6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 12:21:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v87CL9GS008952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 7 Sep 2017 13:21:10 +0100
Message-ID: <1504786869.726.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Date: Thu, 07 Sep 2017 13:21:09 +0100
In-Reply-To: <20170907111347.u4bixwf2q7mabuy3@mcrowe.com>
References: <20170907111347.u4bixwf2q7mabuy3@mcrowe.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: Building and using a second toolchain
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
X-List-Received-Date: Thu, 07 Sep 2017 12:21:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-09-07 at 12:13 +0100, Mike Crowe wrote:
> It thought that the simplest path to making this work would be to ensure
> that the manifest files generated during the build have the names that all
> other recipes will expect, but this means using the wrong TARGET_ARCH in my
> binutils-cross-arm and gcc-cross-initial-arm recipes which I can't do
> without also overriding TARGET_SYS and PN at least which definitely isn't
> pretty.
> 
> I remember reading posts about doing this on the list in the past, but my
> search engine skills aren't up to the job of finding anything. Am I missing
> an easier way to make this work?

Have you considered using multilib? You could have a 32 bit multilib
defined for the 64 bit system, then just use its 32 bit compiler?

Cheers,

Richard

