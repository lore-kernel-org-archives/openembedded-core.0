Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 294DB6093B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 11:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v36BI96B001950; 
	Thu, 6 Apr 2017 12:18:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uQg-LFasbuvC; Thu,  6 Apr 2017 12:18:10 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v36BD67I001593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 6 Apr 2017 12:13:07 +0100
Message-ID: <1491477186.17200.31.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Apr 2017 12:13:06 +0100
In-Reply-To: <1491304245-7194-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1491304245-7194-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] oe-selftest: test wic sparse_copy API
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
X-List-Received-Date: Thu, 06 Apr 2017 11:18:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-04-04 at 14:10 +0300, Ed Bartosh wrote:
> Added new parameter 'api' to sparse_copy function to specify
> underlying filemap API to use. By default sparse_copy will
> try both available APIs.
> 
> Added test case for sparse_copy to wic test suite.
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/lib/oeqa/selftest/wic.py | 26 ++++++++++++++++++++++++++
>  scripts/lib/wic/filemap.py    |  6 ++++--
>  2 files changed, 30 insertions(+), 2 deletions(-)

This failed on the autobuilder:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/244/steps/Running%20oe-selftest/logs/stdio

Cheers,

Richard

