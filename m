Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id EDD2460777
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 14:08:25 +0000 (UTC)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <5c4588bd-53f6-6086-0443-faed9c0732cc@embed.me.uk>
Date: Tue, 22 Nov 2016 14:07:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
Subject: distro checking and lsb_release
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
X-List-Received-Date: Tue, 22 Nov 2016 14:08:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

With the recent changes to distro checking the lsb_release binary is now
required. I tried adding this to SANITY_REQUIRED_UTILITIES however it
seems as though the distro check is done before the SanityEvent is
triggered. Where would be the best place to check this binary is
available to prevent an ugly python traceback?

Cheers,
Jack.

