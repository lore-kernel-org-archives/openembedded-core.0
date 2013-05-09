Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UaUS6-0000ov-EX
	for Openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 19:16:24 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 8952DD22DE; Thu,  9 May 2013 18:57:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 12EC2D20DD;
	Thu,  9 May 2013 18:57:17 +0200 (CEST)
Message-ID: <518BD58B.1030307@linaro.org>
Date: Thu, 09 May 2013 18:57:47 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Lists Linaro-dev <linaro-dev@lists.linaro.org>, 
	Openembedded-core@lists.openembedded.org
X-Enigmail-Version: 1.4.6
Subject: Changes in Linaro layers for OpenEmbedded
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 17:16:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

NOTE: I skipped "openembedded-devel" ML cause most of users of Linaro
layers also read OE Core ML.

As I will leave Linaro at the end of May I would like to write some kind
of summary of current state of Linaro layers for OpenEmbedded.

At Linaro we have 3 layers:

1. meta-aarch64
2. meta-linaro
3. meta-linaro-toolchain

First one is BSP kind. I know that it had some issues which affected
each build which had it in BBLAYERS but I fixed those issues. I would
like to thank Khem Raj for pointing me at those.

We have git version of binutils there due to some changes which were not
present in 2.23 line. But use of this version is not required as builds
are fine with OE Core one.

We have "tune-armv8.inc" in this layer as well. There was attempt to
merge that into OE Core but "/lib or /lib64" discussion started and at
that time I decided to skip it. There are similar discussions at GCC and
Glibc mailing lists. Once they sort that out OE tune file will be
adapted by someone (I hope).

Rest of recipes can be split into 2-3 types. Few (like sysprof, emacs)
just disable recipes for AArch64. Other have extra patches to add
missing functionality or defines. And we have Linaro kernel for AArch64
there.

Second layer contains ARMv7a(b) machine definitions used for our machine
independent builds and some recipes.

There are no patches for OE recipes here. The only exception is busybox
where we enable "dpkg(-deb)" command which we need for our tools used to
merge rootfs with hardware support.

We have "recipes-extra" where we keep new recipes which may not be in a
nicest state so are not yet merged into OpenEmbedded (or have no use
there like "meta-toolchain-hhvm" one).

"recipes-linaro" is for our stuff. Images, automatic root shell on
serial port etc.

And last but not least is toolchain layer. Everything here is related to
gcc-linaro and Linaro binary cross toolchains (armv7a and aarch64 ones).
GCC 4.6 and 4.7 is there but 4.6 one will be removed when 4.8 will be
added into OE Core.

Who will maintain those layers after my leave? This was not decided yet.
There are few guys at Linaro who know how to use OpenEmbedded but most
of them is outside of Builds and Baselines team.

If you have any questions then better ask now.


