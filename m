Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A8FC96E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 06:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6T6pbTY007483; Fri, 29 Jul 2016 07:51:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nU-zyz9GItLm; Fri, 29 Jul 2016 07:51:37 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6T6pVPV007478
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Jul 2016 07:51:32 +0100
Message-ID: <1469775091.9142.41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 07:51:31 +0100
In-Reply-To: <1469624577-24972-7-git-send-email-maxin.john@intel.com>
References: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
	<1469624577-24972-7-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 6/9] glew: upgrade to 2.0.0
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
X-List-Received-Date: Fri, 29 Jul 2016 06:51:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-07-27 at 16:02 +0300, Maxin B. John wrote:
> 1.13.0 -> 2.0.0
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-graphics/glew/{glew_1.13.0.bb => glew_2.0.0.bb} | 4 ++-
> -
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/glew/{glew_1.13.0.bb => glew_2.0.0.bb}
> (90%)

Failed in testing:

https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
lds/883/steps/BuildImages_4/logs/stdio


Cheers,

Richard


