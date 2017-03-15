Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 732D072F0A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 16:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2FG7nrm021232; Wed, 15 Mar 2017 16:08:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IssUAnRzLvrs; Wed, 15 Mar 2017 16:08:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2FG8O50021330
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Mar 2017 16:08:25 GMT
Message-ID: <1489594104.13980.67.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Ibarra Lopez, Humberto" <humberto.ibarra.lopez@intel.com>, Alexander
	Kanavin <alexander.kanavin@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Wed, 15 Mar 2017 16:08:24 +0000
In-Reply-To: <F187383F84EB304A88D055C3049588791BCF0AF1@FMSMSX106.amr.corp.intel.com>
References: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
	<CAJTo0LY4pN1n2s9Qe1FSesSRFUcWFLdsQQ6Z2J8-DZqGeBK14Q@mail.gmail.com>
	<9ca28013-06c6-c668-2e42-1d13a75d4331@linux.intel.com>
	<F187383F84EB304A88D055C3049588791BCF0AF1@FMSMSX106.amr.corp.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] rpm: add support for remote package feeds via PACKAGE_FEED_URIS variable
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
X-List-Received-Date: Wed, 15 Mar 2017 16:08:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-03-15 at 15:38 +0000, Ibarra Lopez, Humberto wrote:
> Sorry, missed the previous mail.
> 
> I am not sure how to improve the hardcoding there, I don't like it
> either, but couldn't find an alternative. The thing is that we need
> the ip of the host as seen from the target to run testimage, but we
> don’t have the exact value for that one until qemu is up. The issue
> here is that we need to give this ip to the conf in the
> PACKAGE_FEED_URIS before building so we can get an image with this
> var to later use in testimage.
> 
> If someone has a better idea to get rid of this hardcoding, it would
> be great to know.

We could run a sed command inside the image after it boots but before
triggering the tests to put the correct IP/port number into the file?

Not a perfect test but simple and probably good enough for this?

Cheers,

Richard

