Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B9E16787DE
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 15:25:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w05FPBda009532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 5 Jan 2018 15:25:12 GMT
Message-ID: <1515165911.30291.31.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Schultz <d.schultz@phytec.de>,
	Openembedded-core@lists.openembedded.org
Date: Fri, 05 Jan 2018 15:25:11 +0000
In-Reply-To: <1515163072-18559-1-git-send-email-d.schultz@phytec.de>
References: <1515163072-18559-1-git-send-email-d.schultz@phytec.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [RFC] cryptodev: Fix build errors with v4.11
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
X-List-Received-Date: Fri, 05 Jan 2018 15:25:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-01-05 at 15:37 +0100, Daniel Schultz wrote:
> Commit message from the included patch:
> "Linux kernel has added -Werror=designated-init around 4.11
> (c834f0e8a8b)
> triggering build errors with gcc 5 and 6 (but not with gcc 4)"
> 
> Backport from https://github.com/cryptodev-linux/cryptodev-linux
> Based on commit f0d69774afb27ffc62bf353465fba145e70cb85a
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>

I'm a little puzzled. Which release is this against? We're using
kernels newer than 4.11 so why aren't things breaking?

Cheers,

Richard

