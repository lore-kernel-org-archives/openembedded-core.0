Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 90EAF78345
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 21:39:08 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6RLd7DP007893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 27 Jul 2017 22:39:08 +0100
Message-ID: <1501191547.22282.176.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Asselstine <mark.asselstine@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 22:39:07 +0100
In-Reply-To: <1500912616-8012-1-git-send-email-mark.asselstine@windriver.com>
References: <1500912616-8012-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 27 Jul 2017 22:39:08 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] python: don't include -tests with modules
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
X-List-Received-Date: Thu, 27 Jul 2017 21:39:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-07-24 at 12:10 -0400, Mark Asselstine wrote:
> Although 'test' is listed in the python module list
> (https://docs.python.org/3/py-modindex.html) it is meant only to be
> used 'internally' by folks developing python itself. Per the
> documentation:
> 
>   Note The test package is meant for internal use by Python only. It
>   is documented for the benefit of the core developers of Python. Any
>   use of this package outside of Python’s standard library is
>   discouraged as code mentioned here can change or be removed without
>   notice between releases of Python.
> 
> Per the above it is best not to include this module to discourage
> folks who might not head the above warnings. Additionally this module
> is one of the largest py modules going, by dropping this unneeded
> module from the 'modules' package we can reduce overall image size,
> something which is important for many embedded deployments.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
>  meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

As per the comments at the top of these files, the generator scripts
need to be fixed too?

Cheers,

Richard

