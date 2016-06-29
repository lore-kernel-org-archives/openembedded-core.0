Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2286573172
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 06:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5T6XAnT028921; Wed, 29 Jun 2016 07:33:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HmpbJ5emReI0; Wed, 29 Jun 2016 07:33:10 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5T6X79R028918
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Jun 2016 07:33:09 +0100
Message-ID: <1467181987.8590.105.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Li Zhou <li.zhou@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2016 07:33:07 +0100
In-Reply-To: <20160629031255.3551-1-li.zhou@windriver.com>
References: <20160629031255.3551-1-li.zhou@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] python3: correct the multilib support patch
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
X-List-Received-Date: Wed, 29 Jun 2016 06:33:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-06-29 at 11:12 +0800, Li Zhou wrote:
> When python3 rebased its multilib patch, the hard coded "lib" path
> isn't really changed because of the rebasing's error, and cause
> phthon3's failure when running on 64bit platforms as below:
> Could not find platform independent libraries <prefix>
> Could not find platform dependent libraries <exec_prefix>
> Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
> Fatal Python error: Py_Initialize: Unable to get the locale encoding
> ImportError: No module named 'encodings'
> 
> Here correct the rebasing error and solve this issue.
> 
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  ...ython3-correct-the-multilib-support-patch.patch | 47
> ++++++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.5.1.bb      |  1 +
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/0001-python3
> -correct-the-multilib-support-patch.patch


Don't we want to correct the "bad" patch rather than adding an
additional patch? Or did I misunderstand the problem?

Also, are there some automated tests we should be adding to catch this
kind of problem? I'm a little worried none of our testing caught this.

Cheers,

Richard

