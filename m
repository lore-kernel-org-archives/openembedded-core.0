Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5576271DDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 07:37:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4U7bBWZ031036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 30 May 2017 08:37:12 +0100
Message-ID: <1496129831.25229.153.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fan Xin <fan.xin@jp.fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 08:37:11 +0100
In-Reply-To: <1495775169-24954-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1495775169-24954-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 30 May 2017 08:37:12 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] elfutils: Upgrade 0.168 to 0.169
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
X-List-Received-Date: Tue, 30 May 2017 07:37:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-05-26 at 14:06 +0900, Fan Xin wrote:
> 1) Upgrade elfutils from 0.168 to 0.169
> 2) Delete unnecessary patches which has been merged into 0.169
> 3) Rebase the patch files for 0.169
> 
> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>

This fails to build for musl, the musl specific patch needs rebasing:

SRC_URI_append_libc-musl = " file://0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch "

https://autobuilder.yocto.io/builders/nightly-musl/builds/277/steps/BuildImages/logs/stdio

Cheers,

Richard

