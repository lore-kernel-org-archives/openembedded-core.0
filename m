Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBA96612C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 07:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4O7PeTB002653; Tue, 24 May 2016 08:26:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Z6FozH_zJ_in; Tue, 24 May 2016 08:26:02 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4O7PwYN002709
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 May 2016 08:25:59 +0100
Message-ID: <1464074758.9570.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 08:25:58 +0100
In-Reply-To: <8f3a29655613c98c31c41ade3134540a96f074a7.1464057554.git.paul.eggleton@linux.intel.com>
References: <cover.1464057554.git.paul.eggleton@linux.intel.com>
	<8f3a29655613c98c31c41ade3134540a96f074a7.1464057554.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] oe-init-build-env: allow GIT_SSL_CAINFO from external environment
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
X-List-Received-Date: Tue, 24 May 2016 07:26:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-05-24 at 14:40 +1200, Paul Eggleton wrote:
> buildtools-tarball sets GIT_SSL_CAINFO so that the included
> ca-certificates can be used by git; that can't work however unless
> the GIT_SSL_CAINFO is still set in the environment in which git gets
> run by the fetcher, so allow it through from the external
> environment.
> 
> Fixes [YOCTO #9666].
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/oe-buildenv-internal | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Would it make more sense to just list this in
lib/bb/fetch2/__init__.py:runfetchcmd() instead?

In some ways I'd be in favour of pruning the main bitbake.conf list in
favour of just listing things like proxy variables there specifically
in the fetcher.

If users want to be able to configure that list, we could expose that
list from bitbake too...

Cheers,

Richard



