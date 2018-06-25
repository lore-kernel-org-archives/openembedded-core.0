Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4A99374EDD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 07:22:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5P7MZrU024396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 25 Jun 2018 08:22:36 +0100
Message-ID: <226b5eb6a987a309622e0e28002a4c5550accefe.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Mon, 25 Jun 2018 08:22:35 +0100
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF7363AEB0BC@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527502858-81691-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LZVcc+_ocfuYEUBKK0Hbr0SaZEH7CUYKK17gMk+CXwxwg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9A7F@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-ege3VdhZ_AR=CpTmOZc3yyO55BOpt0YZNMk+Ww2BpJA@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9E2F@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-xJa=pQwc3ORfzjOXqvOyKWHbOFVFPh=oH1J-urrZmKg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AEB0BC@G08CNEXMBPEKD01.g08.fujitsu.local>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Mon, 25 Jun 2018 07:22:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-06-23 at 10:50 +0000, Zheng, Ruoqin wrote:
> Yes, modifying the image recipe can actually customize your root file
> system, as linux vendors, they are familiar with bitbake and it's
> very easy to them.
> But, as I know, there are many users who are not very familiar with
> bitbake but also want to customize their root file system. And it's
> hard to make them learn how to use bitbake. 
> 
> So if dnf-nativesdk can be used in sdk, as linux vendors, they only
> need to provide rpm packages and sdk to users instead of teaching
> them how to use bitbake. At last, users can use dnf-nativesdk to
> manage their packages as what they do in their host.
> 
> So I hope to add dnf-nativesdk in toolchain.

I've just replied to the patch. We did once consider extending meta-
toolchain this way however we also found it simply does not scale.

For example, you can have users add/remote packages but what happens
when they want to build a new package? Or build a new rootfs?

We found that whatever we did with meta-toolchain, we were going to
have to duplicate code that the core system already has.

For that reason we created eSDK and I'd much rather someone started
with that and put wrappers around it for the common use cases
(something like devtool) so that the user doesn't need to use bitbake
(even if it is used for some things behind the scenes).

Cheers,

Richard


