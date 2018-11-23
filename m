Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE1B6C5BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 17:19:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wANHJwL3008041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 23 Nov 2018 17:19:59 GMT
Message-ID: <8c0a42265a1cbf6727a5ad25983a286dfe2a33ca.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Yocto
	discussion list <yocto@yoctoproject.org>
Date: Fri, 23 Nov 2018 17:19:58 +0000
In-Reply-To: <b96afa3704ab3844fb69bfd7218fc381c368403c.camel@linuxfoundation.org>
References: <b96afa3704ab3844fb69bfd7218fc381c368403c.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: Autobuilder changes
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
X-List-Received-Date: Fri, 23 Nov 2018 17:19:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-11-23 at 17:02 +0000, Richard Purdie wrote:
> I've take this quiet period as an opportunity to make some
> significant autobuilder changes:

I knew I was missing something:

Successful builds are now deleted when they complete using the
background deletion (clobberdir). This should reduce the clutter lying
around on the worker filesystems. It also means builds shouldn't be
contending with background deletion as much.

Failed builds have their build directory renamed to "build-renamed".
This means that the paths all become invalid and can't be accidentally
referenced from other builds.

I did a sweep through the workers deleting all the old build
directories and cleared a lot of the diskspace on them.

Cheers,

Richard


