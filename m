Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC986AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 20:28:11 +0000 (UTC)
Received: by yhpt93 with SMTP id t93so74883086yhp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 13:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=lU0/NySDdPOO0Ih6RBssribZjhPG/4SewP63ZLZV8p8=;
	b=FoI/A1H1DKTUXlCS3aCUuV7cX1kigCXLe8imFtRnsf/mF+mJKw86T57fT/vlnW/M/U
	3ERssaNxGkq50volmNsLMFHoHU08AMZ7UZAp3j2aK8JemU60h2eRmfPLPdErNjYcHUqL
	PHbvBGOSNs1+jiUKy8Y1XftY4lJ3khLkuYYyM927CizViAt89IoeqCv74uYCM3iwCoCA
	nQgrzm8OCsy1uxD2lNGpHnTv8HMkN/EgXaEj/t138i8j+OnFojaPurgQTecvQ0dqcQai
	MpB/L6+PohXCV/ZPSP8cE5bvXv0By1tT7ZFenbivI+g3LHjDM2+V2NNgWgNgdGO94P8i
	gAVg==
MIME-Version: 1.0
X-Received: by 10.170.195.10 with SMTP id m10mr1186246yke.50.1427142492009;
	Mon, 23 Mar 2015 13:28:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Mon, 23 Mar 2015 13:28:11 -0700 (PDT)
In-Reply-To: <BY2PR03MB441ABAB2D76B74B50C50F61840D0@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1426066820-19627-1-git-send-email-B40290@freescale.com>
	<BY2PR03MB441ABAB2D76B74B50C50F61840D0@BY2PR03MB441.namprd03.prod.outlook.com>
Date: Mon, 23 Mar 2015 17:28:11 -0300
X-Google-Sender-Auth: SmMuZpKU58TZYpqAdsqPPzCuA-Y
Message-ID: <CAP9ODKr2i4UXe2uW28vpUkiwS9qp=7VcW0dQBUdhJwgtU6HzDg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "B40290@freescale.com" <B40290@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] u-boot.inc: fix rename image error
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
X-List-Received-Date: Mon, 23 Mar 2015 20:28:13 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 22, 2015 at 11:09 PM, B40290@freescale.com
<B40290@freescale.com> wrote:
> Ping.
>
> -----Original Message-----
> From: Chunrong Guo [mailto:B40290@freescale.com]
> Sent: Wednesday, March 11, 2015 5:40 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo Chunrong-B40290
> Subject: [OE-core][PATCH v4] u-boot.inc: fix rename image error
>
>   Resolve mismatch between U-Boot configs and uboot image name.
>   The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
>   and repeat compile or install so we need to check if ${type} match ${config} .
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

We are working in a deadline; I won't be able to test this until Wed. Sorry.

Did you try this with meta-fsl-arm?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

