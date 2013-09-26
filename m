Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 579CC6CA7E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 21:51:44 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id u16so2262773iet.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 14:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=cYBP6hXCou9E9P7WQLblj9aEL66iSzdXM0TKF/zKjsU=;
	b=bU4osxTRmrOKA2V1kcuAxav8YrOIpcmGfoiTpSswdCg6xA4ul018EglpDOxPHcdLih
	OJaA6chiZ6Au1eNOBJlT7687Css8h9GRkG7bIGCaf+r1l0EX+cuiMTq9anLfb1bugdn8
	4K+Lb/J9kZoJhhXXFaD3P09FFDhDiH8vzBuuFwJlxDzF9mGBhksqbbSrgYcl7PUt7np/
	ay8JCDYOhU7EZa3L0nqtW/lSxX3Uw59FipC0JydCS6Cg6MHcc09og62S1XYF9IeqkLPI
	J0Jk3q41blzuHGHVSYCbTGZzcPTaWWQ/vGwx2nVQ2tw4qGuHkZd8MyuEvEyleeRQCaqW
	iWew==
MIME-Version: 1.0
X-Received: by 10.42.223.134 with SMTP id ik6mr3870410icb.4.1380232305922;
	Thu, 26 Sep 2013 14:51:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Thu, 26 Sep 2013 14:51:45 -0700 (PDT)
In-Reply-To: <1380213785-29476-1-git-send-email-ross.burton@intel.com>
References: <1380213785-29476-1-git-send-email-ross.burton@intel.com>
Date: Thu, 26 Sep 2013 18:51:45 -0300
X-Google-Sender-Auth: w74e3Ria3XY-z53ZcLb0ZuO9-C0
Message-ID: <CAP9ODKoz9QJuPss4UaZsbwXO71Dcjo70Uw1z14++0HWqEqnqQg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglinfo: drop machine-specific configuration from oe-core
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
X-List-Received-Date: Thu, 26 Sep 2013 21:51:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 26, 2013 at 1:43 PM, Ross Burton <ross.burton@intel.com> wrote:
> eglinfo.inc has some board-specific EGLINFO_DEVICE settings but is missing the
> dependencies.  Maintaining them for all supported devices in oe-core isn't
> scalable and this is trivially supported though a bbappend in each BSP layer.
>
> This was also causing problems compiling eglinfo on meta-yocto-bsp's beagleboard
> machine as the EGLINFO_DEVICE setting for beagleboard was telling it to use the
> closed GPU drivers, which are not supported in meta-yocto-bsp.
>
> [ YOCTO #5224 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
...
> +# BSP layers should add .bbappend files for the -x11 and -fb .bb recipes, which
> +# append the respective EGL/OpenGLES/OpenVG libraries to DEPENDS and set
> +# EGL_DEVICE as appropriate.
>  EGLINFO_DEVICE ?= "generic"
> -EGLINFO_DEVICE_raspberrypi ?= "raspberrypi"
> -EGLINFO_DEVICE_beagleboard ?= "beagleboard"
> -EGLINFO_DEVICE_mx6 ?= "imx6"

Are you going to send the bbappend files for the respective layers?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

