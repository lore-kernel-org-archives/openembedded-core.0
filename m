Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U3ZO6-0007Ha-AY
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 22:52:10 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id EF670D22F6; Thu,  7 Feb 2013 16:39:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E3FC3D22F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2013 16:38:54 +0100 (CET)
Message-ID: <5113CA88.9020508@linaro.org>
Date: Thu, 07 Feb 2013 16:38:48 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
	<a306516e1af55efcd93563779e389448e16c97d3.1360055640.git.laurentiu.palcu@intel.com>
In-Reply-To: <a306516e1af55efcd93563779e389448e16c97d3.1360055640.git.laurentiu.palcu@intel.com>
Subject: Re: [PATCH 1/8] add fontcache.bbclass
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
X-List-Received-Date: Thu, 07 Feb 2013 21:52:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 05.02.2013 10:34, Laurentiu Palcu pisze:
> All font packages should inherit this class in order to generate the
> proper postinst/postrm scriptlets.
> 
> The scriptlets will actually create a host intercept hook that will be
> executed at the end, at do_rootfs time, after all packages have been
> installed. This is good when there are many font packages.
> 
> [YOCTO #2923]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/fontcache.bbclass |   47 ++++++++++++++++++++++++++++++++++++++++

> +${@qemu_run_binary(d, '$D', '/usr/bin/fc-cache')} --sysroot=$D >/dev/null 2>&1

What about platform which do not have qemu support? Like AArch64...

| Configuring libpcre-staticdev.
| Building from feeds activated!
| Running intercept scripts:
| > Executing update_font_cache
| ERROR: Function failed: do_rootfs (see
/home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/genericarmv8-oe-linux/linaro-image-sdk/1.0-r2/temp/log.do_rootfs.23211
for further information)



