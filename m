Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 17831601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:46:14 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so5339679pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=geG/iDQ23n+oOoqrUORage8oRed78iYPb8z07GehJHc=;
	b=DG0SDugUNNu/am0S7to9AEy0IRsNM3OHo1VD3DmvKNGeiXjP14PtPwpUjX8/Y5nx20
	YXYoeuZQ2lZAqgaQYNEinjtehIh6uu7P9T2JKQ5f+kpKlMB43VGbZz8uvfsBDNCP4iIk
	fpYm3ej7VBwa93k8oHgrsBEsJ48qnhsrBZdBDNoHwaB5xD1a/Fu1wzsHAbJLMAiV93To
	oxFI8zLe51Q+eZcxJILS7KPTLSSuKr4r82lqzW6DUfV/dQwHpk9ZMbWs7N52ds7KbpiA
	cnMDaUFi7BHxYe0OPHt4en4R3hrrp9mdHyyFB2s3iGolDbsauxLb0IrSG79vkp1znfyF
	QesA==
X-Gm-Message-State: ALoCoQnSf90YwIRAgSO3fiqZoE9dRlXtvgBwVin2XH1Ws1geGBG2KCh0Pd+GBOnfAL3o7Wo9mQfx
X-Received: by 10.66.141.74 with SMTP id rm10mr91780235pab.96.1438173974887;
	Wed, 29 Jul 2015 05:46:14 -0700 (PDT)
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com.
	[209.85.220.42]) by smtp.gmail.com with ESMTPSA id
	gk5sm34430444pac.21.2015.07.29.05.46.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 05:46:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabkd10 with SMTP id kd10so5339156pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:46:12 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.230.201 with SMTP id ta9mr93791042pac.95.1438173972275;
	Wed, 29 Jul 2015 05:46:12 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 05:46:12 -0700 (PDT)
In-Reply-To: <1438194339-13618-3-git-send-email-b54851@freescale.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
	<1438194339-13618-3-git-send-email-b54851@freescale.com>
Date: Wed, 29 Jul 2015 09:46:12 -0300
Message-ID: <CAP9ODKqULRtY5H2URDSGgbW+ROPT9OtuHZEZzXgKR_LBjvYemQ@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>,
	Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4 2/5] gstreamer1.0-plugins-base: handle audio/video decoder error
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
X-List-Received-Date: Wed, 29 Jul 2015 12:46:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 3:25 PM, Yuqing Zhu <b54851@freescale.com> wrote:
> When there is input data and no output data to the end of the stream, it will
> send GST_ELEMENT_ERROR and quit from playing.
> The patch comments the GST_ELEMENT_ERROR() and just add GST_ERROR_OBJECT()
> information instead.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>

Carlos?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

