Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EE3BF75094
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 09:17:40 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5H9HWPd022622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 17 Jun 2018 10:17:34 +0100
Message-ID: <83c024358c85f13cf3a8d0d021b090cc755af1a3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org,
	alexander.kanavin@linux.intel.com, raj.khem@gmail.com
Date: Sun, 17 Jun 2018 10:17:32 +0100
In-Reply-To: <1529051705-100332-1-git-send-email-mingli.yu@windriver.com>
References: <1529051705-100332-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH V2] boost: Improve reproducibility
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
X-List-Received-Date: Sun, 17 Jun 2018 09:17:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-15 at 16:35 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> Set .file section explicitly for .S files to avoid
> the linker introduces the host path in symbols for
> object files whose source file is .S
> Otherwise, there is a host path in the symbols as
> below:
> $ readelf --wide --symbols /my-build/boost/1.67.0-
> r0/boost_1_67_0/x86_64-poky-
> linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e
> d/libboost_context.so.1.67.0
> 42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-
> r0/boost_1_67_0/x86_64-poky-
> linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38e
> d/asm/make_x86_64_sysv_elf_gas.o
> 
> [YOCTO #12708]
> 
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> 
Thanks for working through this, the final result is a much better fix!

Cheers,

Richard

