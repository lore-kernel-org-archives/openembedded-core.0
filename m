Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id A6A9977047
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 09:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 53ADA315B0A4;
	Wed, 30 Sep 2015 11:42:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id aIrKq3HrtgVo; Wed, 30 Sep 2015 11:42:04 +0200 (CEST)
Received: from [172.22.22.61] (55d452fc.access.ecotel.net [85.212.82.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 45DD5315B08F;
	Wed, 30 Sep 2015 11:42:04 +0200 (CEST)
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1443179044.git.jussi.kukkonen@intel.com>
	<aa28a5439d5375728b83962d6814045053f9fdd6.1443179044.git.jussi.kukkonen@intel.com>
	<56056F47.7040004@opendreambox.org>
	<CAJTo0LZKYa5h-Ziprps5XP2AEDzpdUNT5O85rdnK23Dd2zBUZw@mail.gmail.com>
	<CAHiDW_F1GDB4j_jne6w2VdCbWUCaYsV_jZEg949GYyJR2gUKSQ@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <560BAE6B.405@opendreambox.org>
Date: Wed, 30 Sep 2015 11:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_F1GDB4j_jne6w2VdCbWUCaYsV_jZEg949GYyJR2gUKSQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] connman: Depend on xuser-account unconditionally
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
X-List-Received-Date: Wed, 30 Sep 2015 09:42:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 30.09.2015 09:08, Jussi Kukkonen wrote:
> I see the patch is in master now but I'll just note here that Ross' idea
> here seems like a good solution (even if it makes figuring out the
> overall policy a little trickier for humans) and I see nothing that
> would prevent it from working. I just got side tracked with other D-Bus
> policy bugs while look at this: After I'm done with those I'll make a
> patch to move the xuser connman policy to the xuser recipe.

Thank you, Jussi!

Regards,
Andreas

