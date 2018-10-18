Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2D084795F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 12:01:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9IC1sgW029452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 18 Oct 2018 13:01:55 +0100
Message-ID: <a8a5a1b9c5b5f477c5d6a119564f86ae4a8df342.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <Randy.MacLeod@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 13:01:54 +0100
In-Reply-To: <20181017022220.20841-2-Randy.MacLeod@windriver.com>
References: <20181017022220.20841-1-Randy.MacLeod@windriver.com>
	<20181017022220.20841-2-Randy.MacLeod@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] valgrind: update from 3.13.0 to 3.14.0
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
X-List-Received-Date: Thu, 18 Oct 2018 12:01:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-16 at 22:22 -0400, Randy MacLeod wrote:
> Removed patches are all upstream.
> Adjusted two patches due to rebase.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

I set the autobuilder at this and it fails in musl in
do_compile_ptest_base:

https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/126/steps/7/logs/step1b

Cheers,

Richard


