Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C67E060107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 16:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VGvw9O005798; Wed, 31 Aug 2016 17:57:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mHYBwSVJT_D1; Wed, 31 Aug 2016 17:57:58 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VGvrT6005795
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Aug 2016 17:57:54 +0100
Message-ID: <1472662673.29583.90.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 17:57:53 +0100
In-Reply-To: <lya8ftx7w4.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lya8ftx7w4.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Replacement for tslib?
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
X-List-Received-Date: Wed, 31 Aug 2016 16:57:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-08-31 at 17:42 +0200, Enrico Scholz wrote:
> Hello,
> 
> tslib is more or less mandatory for resistive touchscreens but it was
> removed some days ago.  This breaks e.g. meta-qt5 layer which depends 
> on it.
> 
> Is this removal really final (which would be really bad, because
> resistive
> touchscreens are used e.g. in industrial environments)?

The underlying pressure was from xcalibrate never having been merged
into x11 and hence needing to replace xtscal by xinput-calibrate. With
that change, the need for tslib wasn't clear.

Its was also frustrating having two sets of pointercal files, one for
xinput-calibrate and one for tslib.

That said, I can see the need for tslib and if that is the only way to
support these touchscreens in qt5/qt4 we might have to reconsider that.

Are you sure the kernel interfaces that xinput is using don't work for
qt4/qt5? If not, we may need to reconsider tslib...

Cheers,

Richard

