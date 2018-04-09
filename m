Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4F174683
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 16:36:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w39GaW5v000945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 9 Apr 2018 17:36:33 +0100
Message-ID: <1523291792.2942.100.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Date: Mon, 09 Apr 2018 17:36:32 +0100
In-Reply-To: <20180409115657.16651-2-koen.kooi@linaro.org>
References: <20180409115657.16651-1-koen.kooi@linaro.org>
	<20180409115657.16651-2-koen.kooi@linaro.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH 2/3] bind: fix openSSL detection when using multiarch
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
X-List-Received-Date: Mon, 09 Apr 2018 16:36:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-04-09 at 13:56 +0200, Koen Kooi wrote:
> In multiarch /usr/include and /usr/lib/<tuple/ are not on the same
> level anymore. This change will pass a correct includedir, but a
> wrong libdir, but the linker picks it up anyway.
> 
> Tested on multiarch and regular build.

How far off working is mulitarch for OE-Core?

The reason I ask is I'd like to understand the scope of the changes
needed to support it. It also influences whether these are sumo or post
2.5 changes.

Cheers,

Richard

