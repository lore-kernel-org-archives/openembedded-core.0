Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6333365DAF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 17:35:18 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id vb8so8344448obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jul 2014 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=NO20fqOiXGQVZwVUg5THqloWdHbNAXDvgIIXbT0D3Uc=;
	b=ZAImNshX4rZZ1JmXGycSd6764GhuQyDS4oi07imawXsmjvijjAOcfJGEVYv2gcraqi
	DPd1LyHa4WQLbhhWEkNVLYzrIkjgnRr9oGdGnxy2cdp4gXqEq5B+3/sf5Mi/Vd8d/sqy
	eXybf51BgyXG7iYNSS2ikUo61CxW8kLSvSfOixIqDrA7ixH29G91Iaqcm5MHBkCA7mPk
	ETUBIhAIKAWLJYaQ++nYM/i0Z6tNHoT66DoYs0wCzF/nfE2OT6POETas8gyUbcjtwKvu
	S3uWwWSCd0MEDRyyU9zEmjExYoHpA2yHtTeUDkJfOHju8Sn47vUrIlqzu6bkd0ujIYHf
	l9EQ==
MIME-Version: 1.0
X-Received: by 10.182.104.66 with SMTP id gc2mr47696975obb.17.1404927319325;
	Wed, 09 Jul 2014 10:35:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Wed, 9 Jul 2014 10:35:19 -0700 (PDT)
In-Reply-To: <cover.1404885647.git.hongxu.jia@windriver.com>
References: <cover.1404885647.git.hongxu.jia@windriver.com>
Date: Wed, 9 Jul 2014 14:35:19 -0300
X-Google-Sender-Auth: dhVSOc9xnOm3XkKlH2Y1VvTBq0A
Message-ID: <CAP9ODKqcaxiD137QiZYZX6-F_jEQgoXD8ZL-2jS2fA+YDf=O1A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/8] support xmlto
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
X-List-Received-Date: Wed, 09 Jul 2014 17:35:27 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 9, 2014 at 7:16 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Change in V2:
>
> - For alsa-utils/xorg-proto-common.inc/xorg-lib-common.inc/xserver-xorg.inc,
>   add PACKAGECONFIG for xmlto and disable it by default rather than directly
>   enable it.
>
> - EXTRA_OECONF has --without-catalog to instead of passing CFLAGS directly.
>
> Test Steps:
>
> 1. vim local.conf
> ...
> IMAGE_FEATURES += "ssh-server-dropbear"
> PACKAGECONFIG_pn-alsa-utils = "xmlto"
> IMAGE_INSTALL_append = " xmlto"
> ...
>
> 2. bitbake alsa-utils
> If the build is ok, it means xmlto-native could work.
>
> 3. bitbake core-image-minimal
>
> 4. start qemu target and ssh the target
>
> 5. copy a manual source to target
>    ssh tmp/work/i586-poky-linux/alsa-utils/1.0.27.2-r0/alsa-utils-1.0.27.2/alsactl/alsactl_init.xml root@192.168.7.2:/home/root
>
> 6. on target
>    root@qemux86:~# xmlto man alsactl_init.xml
>    Note: Writing alsactl_init.7
>
> [YOCTO #2416]
>
> //Hongxu

Thanks for reworking the patchset.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

