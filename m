Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2C254783AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 09:23:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7H9N0Vv027121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 17 Aug 2017 10:23:02 +0100
Message-ID: <1502961780.13978.199.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 10:23:00 +0100
In-Reply-To: <1502958914-22960-1-git-send-email-hongxu.jia@windriver.com>
References: <1502955267.13978.181.camel@linuxfoundation.org>
	<1502958914-22960-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 17 Aug 2017 10:23:02 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] gpgme: remove local m4/python.m4
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
X-List-Received-Date: Thu, 17 Aug 2017 09:23:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-17 at 04:35 -0400, Hongxu Jia wrote:
> While multilib, the local m4/python.m4 incorrectly assigned
> am_cv_python_pyexecdir and am_cv_python_pythondir which caused
> the following error enabled:
> ...
> ERROR: gpgme-1.9.0-r0 do_package: QA Issue: gpgme: Files/directories
> were installed but not shipped in any package:
>   /usr/lib/python3.5/site-packages/gpg-1.9.0-py3.5.egg-info
> ...
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-support/gpgme/gpgme_1.9.0.bb | 1 +
>  1 file changed, 1 insertion(+)

Thanks for the quick turnaround on this and the other fix, its much
appreciated. I'll include them in the next build and see where we are.

Cheers,

Richard

