Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qjh24-0007FS-4M
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 02:22:28 +0200
Received: by iyj12 with SMTP id 12so691730iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 17:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=lEdPXK2+9n69YNuGj8AGL+k1pwZgvYsma8TIsQeySks=;
	b=LUPoCyN9kMREGbLR1ibPT1/aCWwgD48fb01VbOV91RSNi9EJuQwx2b1lGJqMIh0VE/
	B84CQcB6a9m2LnExIkgePSszW7/iqyilo9xXn31xBlVXnnulCfo7X9VWyZWVJx1eLJGR
	Llr5X4+kaCCxI+pHaa+HDq3oz/rcPIvB5fHiM=
Received: by 10.231.41.69 with SMTP id n5mr1079564ibe.83.1311207500580;
	Wed, 20 Jul 2011 17:18:20 -0700 (PDT)
Received: from [172.23.10.146] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id d3sm486346iba.6.2011.07.20.17.18.19
	(version=SSLv3 cipher=OTHER); Wed, 20 Jul 2011 17:18:19 -0700 (PDT)
Message-ID: <4E277049.6020308@gmail.com>
Date: Wed, 20 Jul 2011 17:18:17 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
Subject: Re: [PATCH 00/10] Small fixes
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
X-List-Received-Date: Thu, 21 Jul 2011 00:22:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 02:06 PM, Martin Jansa wrote:
> Fixes for recipes using intltool, distributions not having locales support in libc and distutils fix
>
> The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:
>
>    lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib (2011-07-20 15:43:43 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
>
> Martin Jansa (10):
>    tcmode-default: set preferred version also for (e)glibc-locale
>    eglibc-package: don't fail without localedef/gconv
>    intltool: inherit perlnative
>    polkit: inherit perlnative
>    shared-mime-info: inherit perlnative
>    xkeyboard-config: inherit perlnative
>    avahi: inherit perlnative
>    vte: inherit perlnative

I guess all inherit perlnative patches can me squashed into one

>    python: save Makefile.sysroot in do_compile
>    python: add patch to fix cross compilation on host with linux-3.0
>
>   meta/conf/distro/include/tcmode-default.inc        |    2 ++
>   meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
>   meta/recipes-core/eglibc/eglibc-package.inc        |    8 ++++++--
>   meta/recipes-devtools/intltool/intltool.inc        |    3 +--
>   .../python/python/07-linux3-regen-fix.patch        |   18 ++++++++++++++++++
>   meta/recipes-devtools/python/python_2.6.6.bb       |    8 +++++---
>   meta/recipes-extended/polkit/polkit_0.101.bb       |    2 +-
>   .../xorg-lib/xkeyboard-config_2.1.bb               |    2 +-
>   .../shared-mime-info/shared-mime-info.inc          |    2 +-
>   meta/recipes-support/vte/vte.inc                   |    2 +-
>   10 files changed, 37 insertions(+), 12 deletions(-)
>   create mode 100644 meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
>



