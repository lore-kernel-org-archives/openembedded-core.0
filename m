Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A2AB579494
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 22:26:08 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7MMQ7ST018525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 22 Aug 2018 23:26:08 +0100
Message-ID: <5b9ebaaedfa3886588107a799e5d2875f54730fa.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <sno@netbsd.org>, openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 23:26:07 +0100
In-Reply-To: <6f2c8337c703580fe1e993d160a8d72c6dd7f6fd.camel@linuxfoundation.org>
References: <20180822090424.14573-1-sno@netbsd.org>
	<20180822090424.14573-2-sno@netbsd.org>
	<6f2c8337c703580fe1e993d160a8d72c6dd7f6fd.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/2] libxml-parser-perl: fix "...contains bad RPATH"
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
X-List-Received-Date: Wed, 22 Aug 2018 22:26:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-22 at 16:56 +0100, Richard Purdie wrote:
> Sorry, this fails to build the nativesdk version:
> 
> https://autobuilder.yocto.io/builders/nightly-x86/builds/1261/steps/B
> uilding%20Toolchain%20Images/logs/stdio
> 
> I suspect you need to strip the RPATH in the nativesdk case...

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=3fc37317a78b19ce4eea10dad73a17186c68ff58

added to your patch 'fixes' it...

Cheers,

Richard

