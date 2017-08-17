Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E985C782E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 07:34:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7H7YRSV016901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 17 Aug 2017 08:34:29 +0100
Message-ID: <1502955267.13978.181.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
Date: Thu, 17 Aug 2017 08:34:27 +0100
In-Reply-To: <81560385801247ea5c615b7c21dbf9ed199e6492.1502869419.git.hongxu.jia@windriver.com>
References: <cover.1502869419.git.hongxu.jia@windriver.com>
	<81560385801247ea5c615b7c21dbf9ed199e6492.1502869419.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 17 Aug 2017 08:34:29 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 7/8] gpgme: 1.8.0 -> 1.9.0
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
X-List-Received-Date: Thu, 17 Aug 2017 07:34:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-08-16 at 04:31 -0400, Hongxu Jia wrote:
> Rebase patches:
> - pkgconfig.patch -> 0001
> - python-lang-config.patch -> 0002
> - 0001-Correctly-install-python-modules.patch -> 0003
> - python-import.patch -> 0004
> - 0001-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch ->
> 0005

Looks like there is some kind of python packaging issue:

https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/1185/steps/BuildImages/logs/stdio

Cheers,

Richard


