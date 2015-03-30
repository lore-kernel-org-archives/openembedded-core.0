Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5138C6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 10:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2UAEegD030011; Mon, 30 Mar 2015 11:14:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V4JHnst_j7N4; Mon, 30 Mar 2015 11:14:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2UAENnk029997
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Mar 2015 11:14:35 +0100
Message-ID: <1427710463.14020.272.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 30 Mar 2015 11:14:23 +0100
In-Reply-To: <86e4a87a659cffcf2383c89cdcec9ee4e2b84faa.1427352132.git.liezhi.yang@windriver.com>
References: <cover.1427352132.git.liezhi.yang@windriver.com>
	<86e4a87a659cffcf2383c89cdcec9ee4e2b84faa.1427352132.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] patch: fix CVE-2015-1196
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
X-List-Received-Date: Mon, 30 Mar 2015 10:14:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-03-25 at 23:42 -0700, Robert Yang wrote:
> A directory traversal flaw was reported in patch:
> 
> References:
> http://www.openwall.com/lists/oss-security/2015/01/18/6
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=775227
> https://bugzilla.redhat.com/show_bug.cgi?id=1182154
> 
> [YOCTO #7182]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/patch/patch.inc              |    5 +-

This patch shouldn't change the .inc but the versioned .bb file instead,
otherwise non-gplv3 builds fail.

In the interests of expedience, I tweaked the patch to apply to the
versioned .bb file instead and queued it.

Cheers,

Richard




