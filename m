Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1D273BB8;
	Thu, 24 Sep 2015 16:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8OGpOP2032444; Thu, 24 Sep 2015 17:51:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 11enEybllI7f; Thu, 24 Sep 2015 17:51:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8OGpCkm032437
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 24 Sep 2015 17:51:23 +0100
Message-ID: <1443113472.19044.79.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 24 Sep 2015 17:51:12 +0100
In-Reply-To: <20150924055552.GB2404@jama>
References: <20150923214627.8E23A50582@opal.openembedded.org>
	<20150924055552.GB2404@jama>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : Revert "systemd: disable problematic GCC 5.2 optimizations"
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
X-List-Received-Date: Thu, 24 Sep 2015 16:51:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-24 at 07:55 +0200, Martin Jansa wrote:
> On Wed, Sep 23, 2015 at 09:46:27PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master-next
> > Commit: e5e69130c3cf20a95bab1561716d7e54db0fe1ee
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=e5e69130c3cf20a95bab1561716d7e54db0fe1ee
> > 
> > Author: Ross Burton <ross.burton@intel.com>
> > Date:   Tue Sep 22 10:05:23 2015 +0100
> > 
> > Revert "systemd: disable problematic GCC 5.2 optimizations"
> 
> Please put at least some explanation why it was reverted.

I'll fix that, it was because we've merged the wrong version. Ross did
warn me, I'm just doing too many things at once and forgot :(

Cheers,

Richard


