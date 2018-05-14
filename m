Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4222B60574
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 08:20:11 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w4E8K6LV030399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 May 2018 09:20:07 +0100
Message-ID: <1526286006.5720.113.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chris.laplante@agilent.com, openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2018 09:20:06 +0100
In-Reply-To: <BN6PR1201MB019576F9685E3FFFC5E183E08B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
References: <BN6PR1201MB019576F9685E3FFFC5E183E08B9F0@BN6PR1201MB0195.namprd12.prod.outlook.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: Running BitBake multiple times without rechecking upstream AUTOREV versions
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
X-List-Received-Date: Mon, 14 May 2018 08:20:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-05-11 at 18:23 +0000, Chris Laplante via Openembedded-core 
wrote:
> Hi all,
>  
> I’m working on using Jenkins to host our Yocto build. One of the
> things that would be nice is to be able to do a “bitbake our-user-
> image”, upload the artifacts to our network file storage, and then do
> a “bitbake our-user-image -c populate_sdk_ext”. I’d like to do these
> separately so that developers are not waiting around for the eSDK to
> be generated if all they care about is the kernel, for example. My
> concern is that the second bitbake invocation could end up building
> different stuff if someone were to check in code in between when the
> two “bitbake”s are run. This is primarily a concern with recipes that
> use AUTOREV (as we do for development purposes).
>  
> Is there a way to essentially “freeze” the BitBake data store and re-
> use it across multiple bitbake invocations?

Have you tried BB_SRCREV_POLICY = "cache"?

Cheers,

Richard

