Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABA0477BDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 20:17:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3AKHs32011417
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Apr 2017 13:17:54 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Apr 2017 13:17:53 -0700
References: <CAEg-Je8BnTDr6BxLOUBO3Y5a+yKjggk=cLSY7n-Aeq61GMVmTQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Neal Gompa <ngompa13@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
X-Forwarded-Message-Id: <CAEg-Je8BnTDr6BxLOUBO3Y5a+yKjggk=cLSY7n-Aeq61GMVmTQ@mail.gmail.com>
Message-ID: <1301981f-af40-612f-a383-5feb2886e33e@windriver.com>
Date: Mon, 10 Apr 2017 15:17:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAEg-Je8BnTDr6BxLOUBO3Y5a+yKjggk=cLSY7n-Aeq61GMVmTQ@mail.gmail.com>
Subject: About misappropriation of one of my patches in OpenEmbedded
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
X-List-Received-Date: Mon, 10 Apr 2017 20:17:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Neal attempted to send this directly to the list, but he is not subscribed.  For
an issue such as this, he also should not be required to subscribe to get this
corrected.


-------- Forwarded Message --------
Subject: About misappropriation of one of my patches in OpenEmbedded
Date: Mon, 10 Apr 2017 16:13:57 -0400
From: Neal Gompa <ngompa13@gmail.com>
To: openembedded-core@lists.openembedded.org
CC: richard.purdie@linuxfoundation.org, Mark Hatle <mark.hatle@windriver.com>

Hello all,

Recently, I started poking around with Yocto/OE stuff (specifically
around the RPM stack) and I noticed that one of my patches was pulled
into OpenEmbedded, specifically my patch for making libsolv compile
against musl[1]. I wrote that to make DNF work on a musl-based RPM
based Linux distribution (Unity Linux) two years ago. I'm certainly
happy to see my patch used in OpenEmbedded, but I am very displeased
with how it was handled.

Contrary to the Commit Patch Message Guidelines[2], someone added a
Signed-off-by line for me that I did not approve. No one ever asked me
about it, and I never even knew about this patch being in OE until a
couple of weeks ago.

To add insult to injury, when the patch was refreshed for libsolv
0.6.24, the attribution of my authorship was completely removed[3]. As
a Git formatted patch, it is very easy to preserve the original
attribution, and I'm extremely upset and disappointed that a
professional project like OpenEmbedded permitted this.

Nearly all the Free and Open Source Software work I do is in my
limited spare time (I don't do any FOSS work for a living), and it's
heartbreaking to see people take my work and re-attribute it to
themselves, or say things on my behalf that I certainly did not say.

I would greatly appreciate this being corrected immediately.

Thanks in advance,
Neal Gompa

[1]:
https://github.com/openembedded/openembedded-core/commit/dcc5d6bc2e3e5848f36fe1001b8cb65576047b7d

[2]: http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

[3]:
https://github.com/openembedded/openembedded-core/commit/60d6c0018c6855e669ced66c420b761d9e7ddd78

-- 
真実はいつも一つ！/ Always, there's only one truth!

