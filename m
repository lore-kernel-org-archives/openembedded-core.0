Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 552447598B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 06:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5F6t78I029492; Mon, 15 Jun 2015 07:55:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jxCv1LfVWAd7; Mon, 15 Jun 2015 07:55:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5F6spXL029489
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 15 Jun 2015 07:55:03 +0100
Message-ID: <1434351291.28975.265.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changhyeok Bae <changhyeok.bae@lge.com>
Date: Mon, 15 Jun 2015 07:54:51 +0100
In-Reply-To: <1433826505-23893-1-git-send-email-changhyeok.bae@lge.com>
References: <1433826505-23893-1-git-send-email-changhyeok.bae@lge.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] {python, python3}-native: fix TypeError
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
X-List-Received-Date: Mon, 15 Jun 2015 06:55:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-09 at 14:08 +0900, Changhyeok Bae wrote:
> g-ir-core in meta-gir is building with python-native.
> When the g-ir-core(v1.42.0) is building, following error is occurred.
> 
> Error in g-ir-core:
> EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
> | TypeError: expected a character buffer object

Doesn't this mean BUILD_SYS or HOST_SYS weren't set in the environment?
Wouldn't this patch just mean you get a value of something like "None"?

Cheers,

Richard


