Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E531E794FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:21:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7N8LJPw011426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 23 Aug 2018 09:21:21 +0100
Message-ID: <728628a0122ed03e4afc896a87b21b98adeee305.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Seokha Ko <sukdo399@daum.net>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Aug 2018 09:21:19 +0100
In-Reply-To: <1eba2212-41ee-01e4-d5e0-98567dbd468b@daum.net>
References: <20180820232105.20179-1-sukdo399@daum.net>
	<CAMKF1sr+670v4NnJqh++SVrFRaFFMXf3ZfNQkoBJXCZJgOnWsQ@mail.gmail.com>
	<1eba2212-41ee-01e4-d5e0-98567dbd468b@daum.net>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-packagegroup-sdk-host: Add wayland-scanner to the SDK native toolchain
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
X-List-Received-Date: Thu, 23 Aug 2018 08:21:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-21 at 16:10 +0900, Seokha Ko wrote:
> currently nativesdk-wayland-dev package copies bin directory which 
> includes wayland-scanner only.
> 
> And, IMHO, if there are other tools for dev package, we need them
> for 
> nativesdk target also.

wayland-dev has all kinds of dependencies which we do not need in the
SDK. This patch will significantly increase the size of the SDK
unnecessarily.

We need to put the scanner into a separate package and include that.

Cheers,

Richard

