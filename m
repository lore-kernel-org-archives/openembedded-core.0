Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B580C746AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 09:41:20 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3A9f3vI001029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 10 Apr 2018 10:41:12 +0100
Message-ID: <1523353262.2942.143.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 10:41:02 +0100
In-Reply-To: <1523295825-118054-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1523295825-118054-1-git-send-email-ee.peng.yeoh@intel.com>
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
X-List-Received-Date: Tue, 10 Apr 2018 09:41:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-04-09 at 10:43 -0700, Yeoh Ee Peng wrote:
> QA team were testing qemu boot image and shutdown on each
> qemu architecture manually. Add automated test to test qemu boot on
> ext4 and nfs, finally check that it can shutdown properly.
> 
> Original runqemu tests was dedicated for MACHINE=qemux86-64 and
> it was testing various live image (iso and hddimg) will be able
> to boot while live image was not supported on all qemu architecture.
> 
> The new tests were designed as a separate class as this tests
> focus on testing qemu boot and shutdown on each qemu architecture.
> Furthermore, this tests focus on testing qemu could shutdown
> as expected.
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

I do have one other question about this. There are various other tests
which boot qemu images. Would we be able to assume that because those
tests work, the start/stop of qemu is working? Or is there a unique
element we need to test specifically here?

Cheers,

Richard

