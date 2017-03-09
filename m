Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D51927750B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 22:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MbJOZ000327; Thu, 9 Mar 2017 22:37:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3itWsMSW0BNZ; Thu,  9 Mar 2017 22:37:19 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MbHje000321
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Mar 2017 22:37:18 GMT
Message-ID: <1489099037.22968.125.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Mar 2017 22:37:17 +0000
In-Reply-To: <1489098798.1925.1.camel@gmail.com>
References: <8bbaa675-7c8b-d00d-3b22-f051abf763a2@windriver.com>
	<1488412401.24526.48.camel@linuxfoundation.org>
	<1489098798.1925.1.camel@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: About scripts/oe-find-native-sysroot
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
X-List-Received-Date: Thu, 09 Mar 2017 22:37:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-09 at 23:33 +0100, Adrian Freihofer wrote:
> Hi,
> 
> scripts/runqemu-gen-tapdevs requires native sysroot as a command line
> parameter. Which folder might be passed to the script now?

bitbake qemu-helper-native

and then pass in the native recipe sysroot from the WORKDIR of that
recipe.

Cheers,

Richard

