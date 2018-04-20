Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A65C574503
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 07:15:20 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3K7FGGJ018546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 20 Apr 2018 08:15:17 +0100
Message-ID: <1524208516.18865.131.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 08:15:16 +0100
In-Reply-To: <1523323712-112201-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1523323712-112201-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] oe-selftest: runqemu: add tests for qemu boot and shutdown
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
X-List-Received-Date: Fri, 20 Apr 2018 07:15:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-04-09 at 18:28 -0700, Yeoh Ee Peng wrote:
> QA team were testing qemu boot image and shutdown on each
> qemu architecture manually. Add automated test to test qemu boot on
> ext4 and nfs, finally check that it can shutdown properly.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/runqemu.py | 70
> ++++++++++++++++++++++++++++++++-
>  1 file changed, 68 insertions(+), 2 deletions(-)

The test is good however it fails on our infrastructure since
portmap/rpcbind aren't running. This is a new dependency for the test
infrastructure we'd have to document so I don't want to merge this for
2.5. 

Since the code itself is fine, instead I've merged the test but
disabled the NFS test by default and we'll need to revisit this in 2.6
to enable it.

Cheers,

Richard

