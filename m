Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C7B6A770A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 22:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JME0sO018635; Fri, 19 Aug 2016 23:14:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id toUHgFi4Y9ss; Fri, 19 Aug 2016 23:14:00 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JMDsIL018628
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Aug 2016 23:13:56 +0100
Message-ID: <1471644834.16712.59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 23:13:54 +0100
In-Reply-To: <1471473060-27026-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1471473060-27026-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<1471473060-27026-2-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] oeqa/selftest Adds eSDK test cases to devtool verification.
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
X-List-Received-Date: Fri, 19 Aug 2016 22:14:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-08-17 at 17:31 -0500, Francisco Pedraza wrote:
> The covered functions are, install libraries headers, image
> generation binary feeds and
> sdk update devtool.
> 
> Signed-off-by: Francisco Pedraza <
> francisco.j.pedraza.gonzalez@intel.com>
> ---
>  meta/lib/oeqa/selftest/eSDK.py | 147
> +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/eSDK.py

I do love the idea of this and having more tests but the kernel module
ESDK test fails on ppc and mips:

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/911/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/898

Cheers,

Richard

