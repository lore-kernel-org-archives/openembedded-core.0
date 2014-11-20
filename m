Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9FAE565C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 14:41:48 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id t59so1378865yho.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 06:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Lf3Iy/oM6QkfL9EsjOO7eM44AIZReyLBlmQZohnyQ0A=;
	b=Sg+E0fuCVMBli8BznWyseQUCckn5b9wZjGF7dsbp1oPJuTh66I1+DZXROfWWJUOa/j
	ab/+03bNVJun8BJLIpCXdZsv5zAUg8Ja9DNcPn2Iv5qncmUfLFG+beiO7c+dA1AfAv2I
	SYt0mG7jaGekr/1HocwkeomRrLa7/z9rV3ZVDMBuaDzecghI96wnnN7AY9/1u5ZGaJx+
	xyCwM3m5vwIGLLJ/zh6Tmrs3DrhCRPaItRdhrSf00gzHo+xkKojFiaie49dueqjTmC4L
	u0fWHD5lqMwZe7sEgDlmd8adF/Ahpg0dFS27k1wtYPJfNroSEi/zWUqP/OdEEvIvXsBH
	4NMQ==
MIME-Version: 1.0
X-Received: by 10.170.116.21 with SMTP id i21mr886489ykb.105.1416494508911;
	Thu, 20 Nov 2014 06:41:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Thu, 20 Nov 2014 06:41:48 -0800 (PST)
In-Reply-To: <1416494008-13794-1-git-send-email-alexandru.damian@intel.com>
References: <1416494008-13794-1-git-send-email-alexandru.damian@intel.com>
Date: Thu, 20 Nov 2014 12:41:48 -0200
X-Google-Sender-Auth: FaZOimmhbXuLGIS_xlB1pZWnBsA
Message-ID: <CAP9ODKpgZdmNxKP9t=hG_LpN5suJYFwrNCye_EsQU-CxuOYKeg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Alex DAMIAN <alexandru.damian@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toaster: add toaster layer configuration files
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
X-List-Received-Date: Thu, 20 Nov 2014 14:41:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 20, 2014 at 12:33 PM, Alex DAMIAN
<alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> In managed mode, Toaster tries to create project configuration
> based on the layers that are being checked-out on disk.
>
> This is done by using a JSON configuration file that is layer-specific.
>
> This patch adds toasterconf.json files to the oe core layer, for usage
> with a standalone OpenEmbedded-Core checkout, and to the meta-yocto
> layer for usage with Poky checkouts.
>
> The toasterconf.json files describe basic configuration
> for Toaster projects, including default layers,
> default configuration variable values,
> toaster-compatible branches, and the layerindex URL
> where the base layer and compatible layers.
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>

Split this in two; one for OE-Core and another for meta-yocto.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

