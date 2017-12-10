Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1699B784DC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Dec 2017 16:27:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBAGRaUj008064
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 10 Dec 2017 16:27:37 GMT
Message-ID: <1512923256.19417.135.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Sun, 10 Dec 2017 16:27:36 +0000
In-Reply-To: <20171208154859.15927-1-sgw@linux.intel.com>
References: <20171208154859.15927-1-sgw@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 0/3] Remove ELF Image Type
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
X-List-Received-Date: Sun, 10 Dec 2017 16:27:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-12-08 at 07:48 -0800, Saul Wold wrote:
> The ELF Image type is not currently used any more by the
> coreboot project which was the original creator of this
> image type along with the mkelfimage tool.  The tool was
> removed from the coreboot repo back in 2014 and has no 
> updates.  Each time binutils changes, the mkelfimage tool
> breaks and requires a patch to the convert.bin.c special
> header file.
> 
> Seeing as there have been no objections, please consider
> merging this patch set!

Sadly it breaks:

oe-selftest -r devtool.DevtoolTests.test_devtool_modify_git

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/678/st
eps/Running%20oe-selftest/logs/stdio

so we need to tweak that test first.

Cheers,

Richard


