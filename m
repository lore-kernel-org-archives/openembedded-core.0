Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C1BFE6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Dec 2016 00:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBV058Qq024367; Sat, 31 Dec 2016 00:05:08 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o-wYubMlL5Ll; Sat, 31 Dec 2016 00:05:08 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBV054Yf024363
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 31 Dec 2016 00:05:06 GMT
Message-ID: <1483142704.9843.154.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 31 Dec 2016 00:05:04 +0000
In-Reply-To: <1483133732-17872-2-git-send-email-juro.bystricky@intel.com>
References: <1483133732-17872-1-git-send-email-juro.bystricky@intel.com>
	<1483133732-17872-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH 1/1] build-appliance-image: support for Toaster
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
X-List-Received-Date: Sat, 31 Dec 2016 00:05:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-12-30 at 13:35 -0800, Juro Bystricky wrote:
> +	# Install modules needed for toaster
> +	export HOME=${IMAGE_ROOTFS}/home/builder
> +	mkdir -p ${IMAGE_ROOTFS}/home/builder/.cache/pip
> +	pip3 install --user -I -U -v -r
> ${IMAGE_ROOTFS}/home/builder/poky/bitbake/toaster-requirements.txt
> +	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/.local
> +	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/.cache

Can we safely assume that the build machine has pip3 on it? Is that in
our default list of build requirements?

Cheers,

Richard

