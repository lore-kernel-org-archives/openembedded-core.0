Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B20416067D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 09:42:23 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w079gI2s008809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 7 Jan 2018 09:42:19 GMT
Message-ID: <1515318138.29722.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 07 Jan 2018 09:42:18 +0000
In-Reply-To: <1515227515-18557-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1515227515-18557-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] [PATCH] bjam-native: 1.65.1 -> 1.66.0
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
X-List-Received-Date: Sun, 07 Jan 2018 09:42:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-01-06 at 16:31 +0800, Huang Qiyu wrote:
> 1.Upgrade bjam-native form 1.65.1 to 1.66.0
> 2.Upgrade boost form 1.65.1 to 1.66.0
> 
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

https://autobuilder.yocto.io/builders/nightly-musl/builds/700/steps/BuildImages/logs/stdio

Applying patch 0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
patching file tools/build/src/tools/gcc.jam
Hunk #1 FAILED at 1068.
1 out of 1 hunk FAILED -- rejects in file tools/build/src/tools/gcc.jam
Patch 0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch does not apply (enforce with -f)

Along with around 30 other occurrences of a similar error. Does make me
wonder how that was tested?

Cheers,

Richard

