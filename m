Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 06DE273695
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 23:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u82NGAi7007589; Sat, 3 Sep 2016 00:16:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eLChLk2V9uae; Sat,  3 Sep 2016 00:16:10 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u82NG6bY007583
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 3 Sep 2016 00:16:07 +0100
Message-ID: <1472858166.29583.218.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 03 Sep 2016 00:16:06 +0100
In-Reply-To: <1472832102-8067-4-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1472832102-8067-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1472832102-8067-4-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/4] libffi: Add patch for MIPS soft float
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
X-List-Received-Date: Fri, 02 Sep 2016 23:16:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-09-02 at 17:01 +0100, Zubair Lutfullah Kakakhel wrote:
> The pull request for this patch has already been sent upstream
> to libffi. Add patch until it gets merged upstream
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  ...ard-float-specific-code-into-ifdef-blocks.patch | 244
> +++++++++++++++++++++
>  meta/recipes-support/libffi/libffi_3.2.1.bb        |   1 +
>  2 files changed, 245 insertions(+)
>  create mode 100644 meta/recipes-support/libffi/libffi/0002-mips-wrap
> -hard-float-specific-code-into-ifdef-blocks.patch

The patch file this commit adds needs a header adding along the lines
of:

Upstream-Status: Submitted [link to submission]

Cheers,

Richard

