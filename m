Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6D37977141
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 10:38:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w55AcaXn027087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 5 Jun 2018 11:38:37 +0100
Message-ID: <0c711c63b399d560b356b8531a7c89ec61f3e13a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel =?ISO-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	openembedded-core@lists.openembedded.org
Date: Tue, 05 Jun 2018 11:38:36 +0100
In-Reply-To: <1528084100-1518-1-git-send-email-daniel.diaz@linaro.org>
References: <1528084100-1518-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v3] ltp: bump to release 20180515
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
X-List-Received-Date: Tue, 05 Jun 2018 10:38:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2018-06-03 at 22:48 -0500, Daniel Díaz wrote:
> The following patches have made it to upstream:
> * 0001-configure-Fix-default-value-of-without-numa-switch-i.patch
> * 0001-configure-add-knob-to-control-numa-support.patch
> * 0003-Add-knob-to-control-tirpc-support.patch
> * 0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
> * 0040-safe_macros-make-is_fuse-return-zero-if-fs_type-is-N.patch
> 
> These patches have been refreshed in order to apply cleanly
> and without any fuzz:
> * 0004-build-Add-option-to-select-libc-implementation.patch
> * 0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> * 0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
> * 0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
> * 0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> 
> Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
> ---
> v2: Actually change SRCREV, refresh/remove patches as needed.
> v3: Patch diff with -M.

Sadly this fails to build on musl:

https://autobuilder.yocto.io/builders/nightly-musl/builds/1073

Cheers,

Richard

