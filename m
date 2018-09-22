Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8266E6E660
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 15:59:13 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8MFwEZK009382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 22 Sep 2018 16:58:20 +0100
Message-ID: <cf9d1a3f0b8e3b7d69c61212daa029f290975fc1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2018 08:58:13 -0700
In-Reply-To: <20180921142608.36203-6-abrodkin@synopsys.com>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
	<20180921142608.36203-6-abrodkin@synopsys.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Werner Koch <wk@gnupg.org>, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v3 5/9] libgpg-error: Add ARC support
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
X-List-Received-Date: Sat, 22 Sep 2018 15:59:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-21 at 17:26 +0300, Alexey Brodkin wrote:
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Werner Koch <wk@gnupg.org>
> ---
> 
> Changes v2 -> v3:
>  * Use proper [recently upstreamed] fix for ARC Glibc toolchain
>  * Fix compilation for x86_64 due to renamed header
> 
> Changes v1 -> v2:
> 
>  * Added upstream status

Its still breaking on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/21/builds/72/st
eps/7/logs/step1b

I think its for i586 which needs fixing similarly to x86_64.

I did pull the simpler less risky pieces in for 2.6 but this experience
is making me nervous about the remaining patches which should perhaps
wait until 2.7.

Cheers,

Richard

