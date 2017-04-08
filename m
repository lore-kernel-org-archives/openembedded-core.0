Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 804776011C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Apr 2017 14:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v38ESlNA016863; 
	Sat, 8 Apr 2017 15:28:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UZI3WMnbYsaN; Sat,  8 Apr 2017 15:28:47 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v38EOnwK016513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 8 Apr 2017 15:24:50 +0100
Message-ID: <1491661489.17200.111.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 08 Apr 2017 15:24:49 +0100
In-Reply-To: <9f6d9252c6eb66b5f2c01ba34366424591d032bb.1491557671.git.liezhi.yang@windriver.com>
References: <cover.1491557671.git.liezhi.yang@windriver.com>
	<9f6d9252c6eb66b5f2c01ba34366424591d032bb.1491557671.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: "Bartosh, Eduard" <eduard.bartosh@intel.com>
Subject: Re: [PATCH 6/8] runqemu: do not rely on grepping images
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
X-List-Received-Date: Sat, 08 Apr 2017 14:28:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-04-07 at 02:47 -0700, Robert Yang wrote:
> Fixed when the image is large and not enough memory:
>   grep: memory exhausted
>   Aborted
> 
> [YOCTO #11073]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/qemuboot.bbclass |  3 +++
>  scripts/runqemu               | 19 +++++++++++--------
>  2 files changed, 14 insertions(+), 8 deletions(-)

This breaks oe-selftest:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/248/steps/Running%20oe-selftest/logs/stdio

Perhaps not all the failures but certainly:
wic.Wic.test_rawcopy_plugin_qemu
wic.Wic.test_qemu_efi
wic.Wic.test_qemu

We see intermittent failures on these tests anyway and I think you're
onto the right track with a potential fix though.

Cheers,

Richard



