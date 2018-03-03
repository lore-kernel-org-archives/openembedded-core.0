Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3AFD7789EA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 18:21:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w23ILkXV027030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Mar 2018 18:21:47 GMT
Message-ID: <1520101306.3436.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 03 Mar 2018 18:21:46 +0000
In-Reply-To: <1520067650.3436.41.camel@linuxfoundation.org>
References: <1520067650.3436.41.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Sat, 03 Mar 2018 18:21:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-03-03 at 09:00 +0000, Richard Purdie wrote:
> Hi,
> 
> I need some help with a problem we keep seeing:
> 
> https://autobuilder.yocto.io/builders/nightly-arm64/builds/798
> 
> Basically, now and again, for reasons we don't understand, all the
> sanity tests fail for qemuarm64.

Another failure:

https://autobuilder.yocto.io/builders/nightly-arm64/builds/801/steps/Running%20Sanity%20Tests/logs/stdio

In this case one testimage failed, the others passed...

Cheers,

Richard

