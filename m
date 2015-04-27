Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1E58365CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 14:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3RECglv009054; Mon, 27 Apr 2015 15:12:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id p3nX19AW_ZJj; Mon, 27 Apr 2015 15:12:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3RECPkQ009045
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Apr 2015 15:12:37 +0100
Message-ID: <1430143945.13022.120.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rongqing Li <rongqing.li@windriver.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Mon, 27 Apr 2015 15:12:25 +0100
In-Reply-To: <553DF0CC.4040705@windriver.com>
References: <553DF0CC.4040705@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] remove the subversion_1.6.15.bb
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
X-List-Received-Date: Mon, 27 Apr 2015 14:12:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-04-27 at 16:18 +0800, Rongqing Li wrote:
> Hi:
> 
>     there are two version subversion in oe-core, Do we have special
> need on subversion 1.6.15, if not, I like to remove it
> 
> ./meta/recipes-devtools/subversion/subversion_1.8.13.bb
> ./meta/recipes-devtools/subversion/subversion_1.6.15.bb

They changed the on disk format between 1.6 and 1.7 which is why we kept
1.6.x. At this point I personally think it could be removed now though. 

CC'ing Martin since I seem to remember he had some interest in this.

Cheers,

Richard




