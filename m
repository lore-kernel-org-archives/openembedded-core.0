Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C85A17622A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 22:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6TM8WhS022624; Wed, 29 Jul 2015 23:08:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yOicKAZ20x1M; Wed, 29 Jul 2015 23:08:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6TM8H05022615
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Jul 2015 23:08:29 +0100
Message-ID: <1438207697.11208.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 29 Jul 2015 23:08:17 +0100
In-Reply-To: <1438125665-14966-2-git-send-email-armccurdy@gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
	<1438125665-14966-2-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] busybox: merge login-utilities.cfg into defconfig
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
X-List-Received-Date: Wed, 29 Jul 2015 22:08:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-28 at 16:20 -0700, Andre McCurdy wrote:
> The login-utilities.cfg busybox config fragment was added during the
> transition of the default login manager from tinylogin to busybox [1].
> The tinylogin recipe was removed from oe-core prior to the 1.5 (dora)
> release [2].
> 
> Merging the config fragment into defconfig simplifies the process of
> keeping the oe-core busybox defconfig aligned with new releases of
> busybox.
> 
>   [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=4207
>   [2] http://git.openembedded.org/openembedded-core/commit/?id=2762ff976a3473be4259889029e048ab8b3be5ab
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>

I'm kind of torn on this. The original intent was to split up the
busybox config into more granular fragments so that rather that having
to provide a defconfig for it, you could just select the components you
wanted and your custom config on top of that.

If we do go down that route, it does imply a different kind of
maintenance of the config fragments is needed as we move forward. In
some ways I'd hope the fragment tools could help with that.

Obviously any more split up hasn't happened as yet and I know that
personally, given my workload I'm unlikely to find time soon :(. I'd be
interested to see what others think?

Cheers,

Richard





