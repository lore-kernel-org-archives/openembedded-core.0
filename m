Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C011B784C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 12:54:36 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7HCsVUn013523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 17 Aug 2017 13:54:32 +0100
Message-ID: <1502974471.13978.210.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
Date: Thu, 17 Aug 2017 13:54:31 +0100
In-Reply-To: <63fa43885db5438b55a88dfe69ea8d679da15a05.1502869419.git.hongxu.jia@windriver.com>
References: <cover.1502869419.git.hongxu.jia@windriver.com>
	<63fa43885db5438b55a88dfe69ea8d679da15a05.1502869419.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 17 Aug 2017 13:54:32 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/8] bash: 4.3.30 -> 4.4
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
X-List-Received-Date: Thu, 17 Aug 2017 12:54:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-08-16 at 04:31 -0400, Hongxu Jia wrote:
> Rebase patches:
> - fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
> - test-output.patch
> 
> Drop backported patches:
> - CVE-2016-9401.patch
> - fix-run-intl.patch
> 
> Add ${PN}-loadable for loadable builtins which is new features in
> Bash 4.4
> 
> The 4.4 fixed CVE-2017-5932 and CVE-2016-0634
> - https://security-tracker.debian.org/tracker/CVE-2017-5932
> - https://security-tracker.debian.org/tracker/CVE-2016-0634
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

There is a multilib issue with one of the headers:

https://autobuilder.yocto.io/builders/nightly-multilib/builds/430

Cheers,

Richard

