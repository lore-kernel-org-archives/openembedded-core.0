Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1E225731DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 23:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UMwtnx024803; Wed, 31 Aug 2016 00:00:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xq46UUaTigV3; Wed, 31 Aug 2016 00:00:51 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UN0neO024908
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Aug 2016 00:00:50 +0100
Message-ID: <1472598049.29583.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stephano Cetola <stephano.cetola@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 00:00:49 +0100
In-Reply-To: <20160829222432.6123-1-stephano.cetola@linux.intel.com>
References: <20160829222432.6123-1-stephano.cetola@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] provide better error message when runqemu-ifup fails
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
X-List-Received-Date: Tue, 30 Aug 2016 23:02:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-29 at 15:24 -0700, Stephano Cetola wrote:
> If runqemu-ifup fails hen running testimage, a rather cryptic error
> regarding "no tty present" is displayed. If this step fails, we
> should at least point the user at runqemu-gen-tapdevs. A quick search
> of this term in the manual will lead them to "Enabling Runtime Tests
> on QEMU" which should give them all the info they need.
> 
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> ---
>  scripts/runqemu-internal | 1 +
>  1 file changed, 1 insertion(+)

The shortlog needs a prefix, e.g. "scripts/runqemu:" and this patch
will likely need adapting on top of Robert's changes (see master-next).

Cheers,

Richard

