Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sor5n-0008Na-6N
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 09:12:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2012 00:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="191132232"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2012 00:00:58 -0700
Message-ID: <4FFD24A9.10801@intel.com>
Date: Wed, 11 Jul 2012 10:00:57 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: "Dennis.Yxun" <dennis.yxun@gmail.com>
References: <CAF1ZMEfHzvtM35g_PSigbyVCKysTbJY=UODmnKNU6aoncU8YfA@mail.gmail.com>
In-Reply-To: <CAF1ZMEfHzvtM35g_PSigbyVCKysTbJY=UODmnKNU6aoncU8YfA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: build directfb-1.6.1 fail
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
X-List-Received-Date: Wed, 11 Jul 2012 07:12:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dennis,

It looks like the configure script finds imlib2 library even though
there is no recipe for imlib2. There is a possibility (I experienced
something similar for libx11) to use your host's imlib2 library...

On my machine, for example, this is what config.log looks like:

configure:19602: checking for imlib2-config
configure:19633: result: no
configure:19642: WARNING: *** Imlib2 library not found, building without
Imlib2 support ***

And DirectFB compiles just fine.

Can you attach the directfb config.log so I can have a look?

Thanks,
Laurentiu

On 07/11/2012 07:34 AM, Dennis.Yxun wrote:
> hi All:
>  Have problem build directfb, seems imlib2 library is missing
>  Attached file is full compile log
> 
> Dennis
> 
> 
> g2.lo idirectfbimageprovider_mpeg2.c
> | mipsel-oe-linux-libtool: link: ( cd ".libs" && rm -f "libidirectfbimageprovide
> r_dfiff.la" && ln -s "../libidirectfbimageprovider_dfiff.la" "libidirectfbimagep
> rovider_dfiff.la" )
> | mipsel-oe-linux-libtool: link: ( cd ".libs" && rm -f "libidirectfbimageprovide
> r_gif.la" && ln -s "../libidirectfbimageprovider_gif.la" "libidirectfbimageprovi
> der_gif.la" )
> | idirectfbimageprovider_imlib2.c:64:20: fatal error: Imlib2.h: No such file or
> directory
> | compilation terminated.
> | make[4]: *** [idirectfbimageprovider_imlib2.lo] Error 1
> | make[4]: *** Waiting for unfinished jobs....
> | mipsel-oe-linux-libtool: link: ( cd ".libs" && rm -f "libidirectfbimageprovide
> r_pnm.la" && ln -s "../libidirectfbimageprovider_pnm.la" "libidirectfbimageprovi
> der_pnm.la" )
> 



