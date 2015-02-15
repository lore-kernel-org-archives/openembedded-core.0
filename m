Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5726B6B7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Feb 2015 22:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1FM2U77023257; Sun, 15 Feb 2015 22:02:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G7NR1MZW8BvU; Sun, 15 Feb 2015 22:02:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1FM2DsI023250
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 15 Feb 2015 22:02:25 GMT
Message-ID: <1424037733.20217.105.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Sun, 15 Feb 2015 22:02:13 +0000
In-Reply-To: <e94539a84d12272c0d7777584807be1d09bd3a57.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
	<e94539a84d12272c0d7777584807be1d09bd3a57.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/12] slang: fix and enable parallel build
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
X-List-Received-Date: Sun, 15 Feb 2015 22:02:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-02-13 at 00:15 -0800, Robert Yang wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../slang/slang/slang-makefile-fix-parallel.patch  |  177 ++++++++++++++++++++
>  meta/recipes-extended/slang/slang_2.2.4.bb         |    2 +-
>  2 files changed, 178 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/slang/slang/slang-makefile-fix-parallel.patch

The autobuilder is still seeing issues with this:

http://errors.yoctoproject.org/Errors/Details/8700/
http://errors.yoctoproject.org/Errors/Details/8699/

Cheers,

Richard



