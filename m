Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 16E3977181
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 21:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4ULvrVU011590; Mon, 30 May 2016 22:57:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id itsc39eBH6VM; Mon, 30 May 2016 22:57:53 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4ULvq5e011586
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 May 2016 22:57:53 +0100
Message-ID: <1464645472.19134.107.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Date: Mon, 30 May 2016 22:57:52 +0100
In-Reply-To: <20160527102831.24166-1-otavio@ossystems.com.br>
References: <20160527102831.24166-1-otavio@ossystems.com.br>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] ca-certificates: Add openssl as a runtime dependency
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
X-List-Received-Date: Mon, 30 May 2016 21:57:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-05-27 at 07:28 -0300, Otavio Salvador wrote:
> The update-ca-certificates script uses the c_rehash utility which is
> installed by openssl. Add openssl as a runtime dependency to fulfill
> the utility requirement.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  meta/recipes-support/ca-certificates/ca-certificates_20160104.bb | 2
> ++
>  1 file changed, 2 insertions(+)

This broke allarch machine signature invariance however I merged a
patch to resolve that.

Cheers,

Richard

