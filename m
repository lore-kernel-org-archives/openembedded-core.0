Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CED01605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 08:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2E8E2SI001515; Mon, 14 Mar 2016 08:14:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Vov4NP4aMb-0; Mon, 14 Mar 2016 08:14:02 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2E8Dw3k001511
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 14 Mar 2016 08:13:59 GMT
Message-ID: <1457943238.2804.294.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rebecca Chang <rebecca.swee.fun.chang@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 08:13:58 +0000
In-Reply-To: <1457939741-29071-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1457939741-29071-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [master][PATCH] rpm: enable xz/lzma compression
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
X-List-Received-Date: Mon, 14 Mar 2016 08:14:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-14 at 15:15 +0800, Rebecca Chang wrote:
> From: Anuj Mittal <anujx.mittal@intel.com>
> 
> Enable lzma compression support in rpm.

Your commit message says what the patch does but not why? Presumably
this change increases the size of the rpm install so what is the
benefit?

Cheers,

Richard

