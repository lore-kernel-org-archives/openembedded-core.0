Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC657889F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 14:05:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2BE5Gii014133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 11 Mar 2018 14:05:19 GMT
Message-ID: <1520777116.10851.192.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Victor Kamensky <kamensky@cisco.com>, Ian Arkver <ian.arkver.dev@gmail.com>
Date: Sun, 11 Mar 2018 07:05:16 -0700
In-Reply-To: <alpine.LRH.2.00.1803101241080.24419@sjc-ads-6991.cisco.com>
References: <1520067650.3436.41.camel@linuxfoundation.org>
	<91616f15-f805-22db-6073-8698f49bab86@gmail.com>
	<412d4c49-8956-38aa-a1ea-417541585b2d@gmail.com>
	<alpine.LRH.2.00.1803101241080.24419@sjc-ads-6991.cisco.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Need arm64/qemu help
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
X-List-Received-Date: Sun, 11 Mar 2018 14:05:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Victor,

On Sat, 2018-03-10 at 16:11 -0800, Victor Kamensky wrote:
> Any progress on the issue? In case if not, I am adding few Linaro
> guys
> who work on aarch64 qemu. Maybe they can give some insight.
> 
> I was able to reproduce on my system and I
> and look at it under gdb. It seems that some strange aarch64
> percularity might be in play. Details inline, root cause is still
> not clear.

From the OE side we simply don't have people able to dig into this kind
of problem in detail unfortunately. I'm also travelling at the moment
which just complicates my own availability.

I am pleased you can replicate it and have been able to dig into it a
bit. My own theory was something like the timer interrupts stalling
since I've seen that problem on two other occasions recently on x86 and
ppc due to totally different issues but it sounds like you've ruled
that out.

At least from a replication standpoint it happens with a second of the
kernel boot so you don't need the rootfs and can likely script a fast
"brute force" of the issue (restart qemu until it hangs in boot).

I can confirm we continue to see the problem on our builds and it is
causing a real problem for us as we can't tell whether qemuarm64 is
really failing or just hanging :(

Any help in getting this figured out is much appreciated!

Cheers,

Richard

