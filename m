Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0BBY-0006PT-IX for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 13:20:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MCCLOE027856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 12:12:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26737-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 12:12:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MCCCV3027850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 12:12:13 GMT
Message-ID: <1329912732.20261.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 12:12:12 +0000
In-Reply-To: <CA+b4E8x4_cCvhUw-UgLK=9ymuoXsiih8BMZc=ts0B7Qf=oaNuQ@mail.gmail.com>
References: <CA+b4E8x4_cCvhUw-UgLK=9ymuoXsiih8BMZc=ts0B7Qf=oaNuQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Cannot satisfy the following dependencies for task-core-basic: libusb-compat (>= 0.1.3)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Feb 2012 12:20:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-21 at 18:50 -0500, Brandon Stafford wrote:
> In trying to build core-image-basic, it seems that libusb-compat
> cannot be found:
>
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following
> dependencies for task-core-basic:
> |  * libusb-compat (>= 0.1.3) *
> |  * opkg_install_cmd: Cannot install package task-core-basic.
> NOTE: package core-image-basic-1.0-r0: task do_rootfs: Failed
>
> However, it seems like libusb-compat should be findable:
>
> :~/oe-core/build$ ls ../meta/recipes-support/libusb/
> libusb1_1.0.8.bb  libusb-compat-0.1.3  libusb-compat_0.1.3.bb
>
> Do I need to tell bitbake to look in recipes-support explicitly?

The above error looks like its from the rootfs generation and not from
bitbake itself.

The first question is did it build libusb-compat at all? Are there any
stamps for this in tmp/stamps/*/libusb-compat* or files in
tmp/work/*/libusb-compat* that would suggest that it did?

Secondly, did it place any libusb-compat package into tmp/deploy/ipk/* ?

The answers to the above questions will start to help know where to look
for the problem.

Cheers,

Richard



