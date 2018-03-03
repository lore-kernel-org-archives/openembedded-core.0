Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E2F7E78066
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 16:53:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w23GrveU024834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 3 Mar 2018 16:53:59 GMT
Message-ID: <1520096037.3436.59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>,
	openembedded-core@lists.openembedded.org
Date: Sat, 03 Mar 2018 16:53:57 +0000
In-Reply-To: <20180302203314.32737-1-matt@madison.systems>
References: <20180302203314.32737-1-matt@madison.systems>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v4 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Sat, 03 Mar 2018 16:53:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-03-02 at 12:33 -0800, Matt Madison wrote:
> New in v4:
>     * updated the go source patch to protect
>       GOROOT to defer generating an error
>       until a build action would try to update
>       something in GOROOT
>     * updated go.bbclass to compile for both
>       static and dynamic linking, similar to
>       go-runtime
>     * fixed missing sign-off
> 
> New in v3:
>     * reduced one of the go source patches,
>       eliminating an unneeded change (thanks
>       Otavio)
>     * Added bbclass and recipe patches to
>       handle SECURITY_CFLAGS settings if
>       they're enabled
>     * Added go-runtime-staticdev to target-side
>       SDK, needed for go static builds (fixes
>       test case failure in oe-selftest)
>     * two more minor cleanups
> 
> New in v2:
>     * Fixed Upstream-Status line in go patches
>     * Added GOTMPDIR to do_configure[dirs]

I think there may be an issue still lurking somewhere with the PIE
changes:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/871/st
eps/Running%20oe-selftest/logs/stdio

Cheers,

Richard

