Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BD12A79023
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 16:53:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7KGrvSc002987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 20 Aug 2018 17:53:59 +0100
Message-ID: <179b2fa5f801bc5f8cf6618489889352039a4ad9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 17:53:57 +0100
In-Reply-To: <760193dd3732a2239aa96f7660dd85ed4071ebd2.1534497181.git.Qi.Chen@windriver.com>
References: <cover.1534497181.git.Qi.Chen@windriver.com>
	<760193dd3732a2239aa96f7660dd85ed4071ebd2.1534497181.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] assimp.py: fix AttributeError in tearDownClass
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
X-List-Received-Date: Mon, 20 Aug 2018 16:54:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-17 at 17:17 +0800, Chen Qi wrote:
> When running this test case, we will see the following error.
> 
>   AttributeError: type object 'BuildAssimp' has no attribute
> 'project'
> 
> assimp.py test case does not make use of SDKBuildProject, so remove
> the import statement and the tearDownClass.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/sdk/cases/assimp.py | 5 -----
>  1 file changed, 5 deletions(-)

I'm not seeing this error when I run the test and I can't see it on the
autobuilders. Why are you seeing this and we're not?

I'm trying to understand some other odd behaviour in SDK tests and am
wondering if this is related or not.

(e.g. https://autobuilder.yocto.io/builders/nightly-mips/builds/1221/st
eps/Running%20SDK%20Sanity%20Tests/logs/stdio)

Cheers,

Richard

