Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXvoF-0006q4-T3
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:52:48 +0200
Received: by mail-vc0-f174.google.com with SMTP id hf12so592784vcb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 08:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=zD6uNQ7gOqVgZVYa4eJCWFz0qOAzJ4grviRIWjlAPqg=;
	b=Lg72x+OY/knsX8jSuZo1leGCFJ4HcLGjCnsHrxiXn3Uk0EBrhGnWC465Eo/OLYAxxB
	Qtc1GrX67mKlqLuAIMOxQh5mC82pxagcGNynFLeprpHsf5EsQ/iESkB5oGBLj1x21G1y
	qYaMte+NbD53fZgcjQTZ7V+fss/32eCgG0IidDsQiOvOrzWzpv0xWpwCfxGGVgMeHvot
	Y4wdH3aD3/TeKSZuGcCVpwvHOp3EDZt+rdIDQpO6ERIdp3wjKi7YVONdTne0IXSK1iOx
	fYIRPASF7x/9dOyxHLHlpJM4j2I0wvMVF4FZ2WWpECNSBXL/wHy+8RpAEuY9NoyDYTPq
	2DhA==
X-Received: by 10.52.117.212 with SMTP id kg20mr2035752vdb.55.1367508885633;
	Thu, 02 May 2013 08:34:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Thu, 2 May 2013 08:34:25 -0700 (PDT)
In-Reply-To: <1367508484-19933-1-git-send-email-otavio@ossystems.com.br>
References: <1367508484-19933-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 May 2013 16:34:25 +0100
Message-ID: <CAJTo0LaOnztqQ0F5KeqrLFRaC6Smpt=Vyi8rK-VEvzB-q2qFHw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQk+d9jb2O02mzSPUI/rNyz9ljpyOgP524pHc7YtfCRAyljK8TAFRUgZ+AsYbaqh9HVPlxoM
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-demos: Use PACKAGECONFIG to enable/disable features
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
X-List-Received-Date: Thu, 02 May 2013 15:53:16 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2013 16:28, Otavio Salvador <otavio@ossystems.com.br> wrote:
> This allow selection of following features:
>
>  drm, egl, freetype2, gbm, gles1, gles2, glut, osmesa, vg, wayland, x11
>
> The x11 features is enabled depending on distro features but the
> wayland has not been enabled as it does not work with Wayland
> 1.0. Rest were enabled for a sane default.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Otavio sent me this patch earlier in the week and I worked with him on
this, and tested on atom-pc, so:

Signed-off-by: Ross Burton <ross.burton@intel.com>.

Ross


