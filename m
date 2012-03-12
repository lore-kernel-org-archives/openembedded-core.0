Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7CaW-0002M1-5O
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:15:28 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2012 14:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117021951"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2012 14:06:33 -0700
Message-ID: <4F5E6559.9010505@linux.intel.com>
Date: Mon, 12 Mar 2012 14:06:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAHod+Ge8QmNp5TXhoKnqLR_2s+eGg=jOWLG2keAoCYFjTs3ByA@mail.gmail.com>
In-Reply-To: <CAHod+Ge8QmNp5TXhoKnqLR_2s+eGg=jOWLG2keAoCYFjTs3ByA@mail.gmail.com>
Subject: Re: [PATCH 1/5] Split xcb-util into separate packages.
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
X-List-Received-Date: Mon, 12 Mar 2012 21:15:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/10/2012 07:49 AM, Marko Katić wrote:
> xcb-util was split into separate packages during the 0.3.6 -> 0.3.8
> transition.
> Change xcb-util.inc to reflect that.
>
This patch series looks OK, but the comment need refining.

First it's best to have correctly Subjects that list the file or recipe 
area being addressed and then what's the summary

For example in this case:

xcb-util: Remove packaging and modify SRC_URI for multiple ${PN} names

xcb-util was split into separate packages during the 0.3.6 -> 0.3.8 
transition, so update the .inc file to reflect that by removing the 
older packaging.

The reset of this series needs similar updates to commit messages.

Also, if possible can you use a git repo (request an oe-core or poky 
branch).
>
>
> diff --git a/meta/recipes-graphics/xcb/xcb-util.inc
> b/meta/recipes-graphics/xcb/xcb-util.inc
> index cd9923d..5e77a22 100644
> --- a/meta/recipes-graphics/xcb/xcb-util.inc
> +++ b/meta/recipes-graphics/xcb/xcb-util.inc
> @@ -18,20 +18,6 @@ DEPENDS += "gperf-native"
>   PARALLEL_MAKE = ""
> -SRC_URI = "http://xcb.freedesktop.org/dist/xcb-util-${PV}.tar.bz2"
> -
> -PACKAGES =+ "libxcbatom libxcbaux libxcbevent libxcbicccm \
> -             libxcbimage libxcbkeysyms libxcbproperty \
> -             libxcbreply libxcbwm"
> -
> -FILES_libxcbatom = "${libdir}/libXCBAtom.so.*"
> -FILES_libxcbaux = "${libdir}/libXCBAux.so.*"
> -FILES_libxcbevent = "${libdir}/libXCBEvent.so.*"
> -FILES_libxcbicccm = "${libdir}/libXCBICCCM.so.*"
> -FILES_libxcbimage = "${libdir}/libXCBImage.so.*"
> -FILES_libxcbkeysyms = "${libdir}/libXCBKeysyms.so.*"
> -FILES_libxcbproperty = "${libdir}/libXCBProperty.so.*"
> -FILES_libxcbreply = "${libdir}/libXCBReply.so.*"
> -FILES_libxcbwm = "${libdir}/libXCBWM.so.*"
> +SRC_URI = "http://xcb.freedesktop.org/dist/${PN}-${PV}.tar.bz2"
>   inherit autotools pkgconfig
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


