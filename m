Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7578174059
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 10:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4EAmUqr021694; Thu, 14 May 2015 11:48:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pxsJvqla4hfj; Thu, 14 May 2015 11:48:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4EAmHnA021680
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 14 May 2015 11:48:29 +0100
Message-ID: <1431600497.30971.208.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 May 2015 11:48:17 +0100
In-Reply-To: <1431520254-31607-1-git-send-email-Martin.Jansa@gmail.com>
References: <1431520254-31607-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable thumb where it fails for qemuarm
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
X-List-Received-Date: Thu, 14 May 2015 10:48:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-13 at 14:30 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc_4.9.bb               | 23 ++++++++++++++++++++++
>  meta/recipes-devtools/guile/guile_2.0.11.bb        | 19 ++++++++++++++++++
>  meta/recipes-devtools/opensp/opensp_1.5.2.bb       |  5 +++++
>  meta/recipes-extended/mailx/mailx_12.5.bb          |  4 ++++
>  .../gstreamer/gstreamer1.0-libav_1.4.5.bb          |  9 +++++++++
>  meta/recipes-support/libunwind/libunwind_1.1.bb    |  6 ++++++
>  6 files changed, 66 insertions(+)

As mentioned on the bug relating to this, I think we should create an
include file which sets the values as needed for these recipes rather
than adding the quite long comments to the recipes themselves. This is
similar to what we do where we know there are security flags issues for
example.

Cheers,

Richard


