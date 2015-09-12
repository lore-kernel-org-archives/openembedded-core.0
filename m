Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 04908762B7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Sep 2015 22:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8CM0kSM007358; Sat, 12 Sep 2015 23:00:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XV3qo58tKAi3; Sat, 12 Sep 2015 23:00:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8CM0Ua8007352
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 12 Sep 2015 23:00:42 +0100
Message-ID: <1442095230.18370.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leonardo.sandoval.gonzalez@linux.intel.com
Date: Sat, 12 Sep 2015 23:00:30 +0100
In-Reply-To: <7f18159f085ddebd9b4dd58912b83c83f092b10e.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<7f18159f085ddebd9b4dd58912b83c83f092b10e.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: leonardo.sandoval.gonzalez@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/3] iasl: Recipe taken from the luv-yocto repository
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
X-List-Received-Date: Sat, 12 Sep 2015 22:00:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-14 at 20:07 +0000,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Taken from [1]. ACPICA is licensed under two main licenses:
> 1) An Intel license (Intel-ACPI) and 2) a dual GPL/BSP license. This
> recipe uses the latter.
> 
> [1] https://github.com/01org/luv-yocto/tree/master/meta-luv/recipes-extended/iasl
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  meta/recipes-extended/iasl/iasl_20150515.bb | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta/recipes-extended/iasl/iasl_20150515.bb

Sadly this and the ovmf patch trigger failures in world and world-lsb
builds:

https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds/495
https://autobuilder.yoctoproject.org/main/builders/nightly-world-lsb/builds/213

Cheers,

Richard


