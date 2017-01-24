Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C066473281
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 17:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0OH2s7x023060; Tue, 24 Jan 2017 17:02:54 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3PkOu2yBaUrr; Tue, 24 Jan 2017 17:02:53 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0OH2pIM023051
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Jan 2017 17:02:52 GMT
Message-ID: <1485277371.30673.59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Goodbody <andrew.goodbody@cambrionix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2017 17:02:51 +0000
In-Reply-To: <LOXP123MB0117B11AD747FFC1742D78C685750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
	<LOXP123MB0117B11AD747FFC1742D78C685750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: configure error for glibc 2.25.2
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
X-List-Received-Date: Tue, 24 Jan 2017 17:02:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-01-24 at 15:59 +0000, Andrew Goodbody wrote:
> Further to this I see the following message in
> log.do_prepare_recipe_sysroot.20511
> 
> WARNING: Manifest /home/andrew/src/camol3/camol/build/tmp-camol-
> glibc/sstate-control/manifest-allarch-linux-libc-
> headers.populate_sysroot not found?
> 
> Which is quite correct as that file does not exist, however the
> following file does exist
> 
> /home/andrew/src/camol3/camol/build/tmp-camol-glibc/sstate-
> control/manifest-armv7at2hf-neon-linux-libc-headers.populate_sysroot
> 
> So it looks like linux-libc-headers is not being installed in the
> recipe sysroot because it is looking for the manifest with the wrong
> arch.
> 
> Anyone know what could be going wrong here?

Short answer is yes.

Your configuration is mixing different tune/package architectures and
is confusing recipe specific sysroots (armv7ahf-neon != armv7at2hf-
neon), looks like thumb and non-thumb. 

I believe I have a patch which I'll send shortly as I've been chasing
this in other circumstances.

Cheers,

Richard

