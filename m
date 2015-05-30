Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3161A73231
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 May 2015 21:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4ULR7Lh013799; Sat, 30 May 2015 22:27:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oE0w3A9WjgW4; Sat, 30 May 2015 22:27:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4ULQsTG013796
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 30 May 2015 22:27:05 +0100
Message-ID: <1433021213.404.150.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lucian Musat <george.l.musat@intel.com>
Date: Sat, 30 May 2015 22:26:53 +0100
In-Reply-To: <1432898941-1148-1-git-send-email-george.l.musat@intel.com>
References: <1432898941-1148-1-git-send-email-george.l.musat@intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/parselogs: Added another batch of errors to the whitelist.
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
X-List-Received-Date: Sat, 30 May 2015 21:27:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-29 at 14:29 +0300, Lucian Musat wrote:
> Signed-off-by: Lucian Musat <george.l.musat@intel.com>
> ---
>  meta/lib/oeqa/runtime/parselogs.py | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

This appears to breaks things:
http://errors.yoctoproject.org/Errors/Search/Args/?items=10&query=3bab6127758854542e07edacaeb849b30b0dca86


Cheers,

Richard


