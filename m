Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1560E70178
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 23:32:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4QNWlik008109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 27 May 2017 00:32:51 +0100
Message-ID: <1495841567.25229.122.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 27 May 2017 00:32:47 +0100
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sat, 27 May 2017 00:32:54 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 00/36] OEQA threading support and selftest migration
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
X-List-Received-Date: Fri, 26 May 2017 23:33:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-05-26 at 15:37 -0500, Aníbal Limón wrote:
> This series is the integration of tree main changes into the OEQA
> module,
> 
> * Implement threading support into OEQA core module
> * Enables OEQA threaded mode into {,e}SDK test component
> * Migrate current oe-selftest to use the same framework

I tried this on the autobuilder:

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/
builds/901/steps/Running%20oe-selftest/logs/stdio

It was fast, the oe-selftest run which usually takes several hours took
30 mins. The above logs suggest we might have a coverage issue though.

Cheers,

Richard

