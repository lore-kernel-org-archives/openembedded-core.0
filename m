Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2510A73D40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 14:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3KEYXvQ009436; Mon, 20 Apr 2015 15:34:33 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lB1XhXKvpT-z; Mon, 20 Apr 2015 15:34:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3KEYKNV009349
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 20 Apr 2015 15:34:32 +0100
Message-ID: <1429540460.26983.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan =?ISO-8859-1?Q?M=FCller-Klieser?= <s.mueller-klieser@phytec.de>
Date: Mon, 20 Apr 2015 15:34:20 +0100
In-Reply-To: <1429525121-28802-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1429525121-28802-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][dizzy][PATCH] gcc-4.9: backport from gcc trunk r212178
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
X-List-Received-Date: Mon, 20 Apr 2015 14:34:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-04-20 at 12:18 +0200, Stefan Müller-Klieser wrote:
> When compiling meta-toolchain-qt5 on cortexa8, the compiler throws an
> internal compiler error:
> 
> ...
> qttools-opensource-src-5.3.2/src/linguist/shared/po.cpp:
> In function 'bool loadPO(Translator&, QIODevice&, ConversionData&)':
> qttools-opensource-src-5.3.2/src/linguist/shared/po.cpp:717:1:
> internal compiler error: in add_stores, at var-tracking.c:6000
> ...
> 
> Tracking this down led to https://bugs.linaro.org/show_bug.cgi?id=534
> It seems the bug is well know and fixed upstream. So backporting from
> trunk seems to be the right solution. This fixes the compiler problem
> on cortexa8 and does not seem to be very invasive. The original commit
> can be found at:
> 
> git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212178 138bc75d-0d04-0410-961f-82ee72b054a4
> 
> Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
>  ...racking.c-backport-from-gcc-trunk-r212178.patch | 39 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0060-gcc-var-tracking.c-backport-from-gcc-trunk-r212178.patch

Does this need to be added to master before we can backport to dizzy?

Cheers,

Richard


