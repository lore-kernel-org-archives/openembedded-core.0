Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EFBD8749F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 12:33:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w4MCXnO8007994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 May 2018 13:33:50 +0100
Message-ID: <1526992429.8937.152.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
	openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 13:33:49 +0100
In-Reply-To: <20180522122553.29109-4-git@andred.net>
References: <20180522122553.29109-1-git@andred.net>
	<20180522122553.29109-4-git@andred.net>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 4/4] sstate: avoid indirect bison/flex-native dependencies (via SSTATE_EXCLUDEDEPS_SYSROOT)
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
X-List-Received-Date: Tue, 22 May 2018 12:33:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-05-22 at 13:25 +0100, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Avoid adding flex-native or bison-native to the sysroot without a
> specific
> dependency in the recipe. This means indirect dependencies
> (e.g. X -> Y -> binutils-cross -> flex-native) no longer meet the
> dependency incidentally. This improves determinism and avoids build
> failures when people switch to external toolchains.
> 
> Based on an idea by Richard Purdie:
>     http://lists.openembedded.org/pipermail/openembedded-core/2018-Ja
> nuary/146324.html
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>  meta/conf/layer.conf | 6 ++++++
>  1 file changed, 6 insertions(+)

The trouble was that the patch above of mine doesn't actually work and
breaks things from what I remember, some issue showed up in testing on
our autobuilder. I don't remember exactly what it breaks unfortunately
:(.

Cheers,

Richard


