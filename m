Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 193A378883
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 17:24:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w24HOi8j022893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 4 Mar 2018 17:24:45 GMT
Message-ID: <1520184284.3436.73.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <timothy.t.orling@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 04 Mar 2018 17:24:44 +0000
In-Reply-To: <33ac1c7b856b09d1f12d7bbf13dd9343cf27a867.1520166347.git.timothy.t.orling@linux.intel.com>
References: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
	<33ac1c7b856b09d1f12d7bbf13dd9343cf27a867.1520166347.git.timothy.t.orling@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/7] libtest-needs-perl: add 0.002005
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
X-List-Received-Date: Sun, 04 Mar 2018 17:24:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2018-03-04 at 04:41 -0800, Tim Orling wrote:
> Skip tests when modules not available
> 
> * Dependency for ptest of liburi-perl
> 
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  .../perl/libtest-needs-perl_0.002005.bb            | 29
> ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/libtest-needs-
> perl_0.002005.bb

Can you send a patch to fix:

https://autobuilder.yocto.io/builders/nightly-oe-
selftest/builds/878/steps/Running%20oe-selftest/logs/stdio

i.e. 

oe-selftest -r distrodata.Distrodata.test_maintainers

please? (missing maintainers entry for libtest-needs-perl)

Cheers,

Richard






