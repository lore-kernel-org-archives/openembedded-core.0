Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B491B74BF7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 16:20:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w53GKDYL022401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 3 Jun 2018 17:20:14 +0100
Message-ID: <59b5d79b652b43a7f435137016e1c86b13093a71.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 03 Jun 2018 17:20:13 +0100
In-Reply-To: <e42dcf03-8341-e0c6-c4b1-2d2c75d92584@windriver.com>
References: <1527840158-99078-1-git-send-email-hongzhi.song@windriver.com>
	<1527840759.16911.180.camel@linuxfoundation.org>
	<e42dcf03-8341-e0c6-c4b1-2d2c75d92584@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] Meta runtime cases: add testcases for kernel sample
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
X-List-Received-Date: Sun, 03 Jun 2018 16:20:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-06-02 at 07:48 +0800, Hongzhi, Song wrote:
> Hi Richard,
> 
> I have made patch-v2 with shared functions.
> And these kernel-samples are just for testing, so maybe it's
> unnecessary 
> to enable them by default.

Wouldn't we want to extend the automated testing within the project so
that we catch regressions in this area in the future? That would imply
we should enable this for at least one of our images.

Also, looking at the patch, I'm not sure:

KERNEL_FEATURES_append += " kernel-sample/kernel-sample.scc"

is enough to make this work, don't you have to install some kernel
modules as well? Do the tests need anything else installed to work?

Cheers,

Richard

