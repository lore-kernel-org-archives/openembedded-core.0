Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UAlYr-0002KC-Gb
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 19:17:02 +0100
Received: by mail-wg0-f54.google.com with SMTP id fm10so688561wgb.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 10:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=LKi6QTIdztM6ryqTTVYOa/nT6a5yTv41W93jy9X6yNE=;
	b=jXDrW08s/tTiijrkDnA4hHA6z06lXZM6LxH1XDXKz598Tdzh8fDWdmHB2yYNVlnf6F
	bi3hP7VvHQFaoVFHwQI2txwvssj9IjIVi39uKQ1AIMQP1wMv0Wu9g5t80FB8URZFGfHP
	lgoUgZfqVBDDSwlO9rKV1moOdiCNZulQuMvhS9oS+oNVgK/rlRhkJgTHueKSfjKCXkMJ
	QOIPBM9ABUV6ExuaeAa2C+XxOBi/CNkk5ydgVIyaC5ZkY5jdMXontj0xwtRzXiSBfA07
	GkoCOij6cc6vCt8p7ZrW3DwMeHd791xvj3spJZrXo1VCI8TPVcgeGh3j9kKEv2zzAkI1
	D16w==
MIME-Version: 1.0
X-Received: by 10.180.97.99 with SMTP id dz3mr5584648wib.8.1361988040505; Wed,
	27 Feb 2013 10:00:40 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Wed, 27 Feb 2013 10:00:40 -0800 (PST)
In-Reply-To: <cover.1361976853.git.tom.zanussi@linux.intel.com>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
Date: Wed, 27 Feb 2013 13:00:40 -0500
Message-ID: <CAHUNapSHx-HAK86oQQWG9hYwa_zV11ccqs-i5GxUA+ztjvBNAA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: tom.zanussi@linux.intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] add libaudit and enable 'perf trace'
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
X-List-Received-Date: Wed, 27 Feb 2013 18:17:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 27, 2013 at 10:00 AM,  <tom.zanussi@linux.intel.com> wrote:
> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>
> 'perf-trace' is a new perf subcommand available in the 3.8 kernel -
> this patchset enables it.  'perf trace' requires libaudit, which
> is added as a new recipe.

(I'm just getting used to this workflow, so sorry if I've messed
something up on my end)

When I try to build with just the following added to my conf/local.conf

    IMAGE_INSTALL_append = " perf"

I get the following error:

Build Configuration:
BB_VERSION        = "1.17.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "SUSE-LINUX-12.2"
TARGET_SYS        = "i586-poky-linux"
MACHINE           = "qemux86"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20130227"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta
meta-yocto
meta-yocto-bsp    =
"tzanussi/perf-trace-v1:9f91a3a29701218dd756380ebcd2a1a32ad40615"

Computing transaction...error: Can't install perf-3.4-r9@qemux86: no
package provides /bin/bash
ERROR: Function failed: do_rootfs


