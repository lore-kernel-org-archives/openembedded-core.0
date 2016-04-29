Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id D420D6FF97
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 20:35:20 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id 90so32046552qgz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 13:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5mPM1MBde4N4DoERIn8sbULAuzJUpDzf6/rPIZwaap8=;
	b=J5Hgg0fS8nd/n5dpU5TkylzuuvkX0qxfOUK8ZByS9ctm952RgX1PqLIypUWiauWxed
	CtzxvIilvfOelrabN8W8ZZsKpgA0MOUAREfOEiI/58HmvDSf/BLRyBVEny2FEJspKHMZ
	XfplDTtwf0cFfMjZG4Y7SWAc+rv30e1ECI7Qj+FqeLB1MYmdrrdFz4TJuACFiJ+dpIyz
	xPFvS0m4vs86WkQwAeRVRee8kfkk4k1QKcnyImNNEkK0zpB9yhNqz7jCk5g0pyKfHz17
	hrNQUK8Ju64iSfrYyoFmPzZkWr0WTCM2BZ3A+5Q5Py94+h3NYlAOdmFTe8SF/kxRtzdk
	wBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5mPM1MBde4N4DoERIn8sbULAuzJUpDzf6/rPIZwaap8=;
	b=h01AYhjNM3x0LsySK1UfjrWe1F/uBFKLTYYv3sFYS34y8huWqYWs0EABEP4TNCDofV
	+m3AxhVqVJBkqzLMgD0G7pKH0WDb9C6q/0rH8giQvVXz6hHNKb5iQ/bF1QrYgajMHd31
	56TPbf/qdY9BwH1gdVaNoSF6XIAM/MRFBWBODilaNsqMT0nynoSkLwNX/tqPuoTug1JT
	IbSOExIQ4d7juAwWCy3DUrt9V3BCNnaQ11UDRu1Z5qAMVVZo+PS3Qfv/GxkYhlMubMcE
	k8bp0W/O3l17Q8SZDXAIkfIwOofUUk5qayk3rkZiOBN+10OiQteQ73B8re79aImSrYlx
	yr1Q==
X-Gm-Message-State: AOPr4FWpTk6VxFPV5PuQ9YgEYb4IojCr6BAMSTQZPfa16RhtltGVSVvKpm67fb5FkidYPT5r90DJCOypWjoMXw==
X-Received: by 10.140.196.74 with SMTP id r71mr21755560qha.41.1461962121079;
	Fri, 29 Apr 2016 13:35:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 29 Apr 2016 13:34:51 -0700 (PDT)
In-Reply-To: <1461761088-15117-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1461761088-15117-1-git-send-email-alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Apr 2016 13:34:51 -0700
Message-ID: <CAMKF1spLRX=XrS+Kf8GeC=XufwtTPxQJ-oeEQHH1ay2sOZb4Wg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-powerpc64.inc: disable the use of qemu usermode on ppc64
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
X-List-Received-Date: Fri, 29 Apr 2016 20:35:23 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 27, 2016 at 5:44 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> It simply does not work at all:
> https://lists.yoctoproject.org/pipermail/yocto/2016-April/029698.html
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/conf/machine/include/powerpc/arch-powerpc64.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> index 49419b6..f751c6b 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> @@ -7,6 +7,9 @@ TUNECONFLICTS[m64] = "m32 nf"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64', '', d)}"
>  TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'powerpc64', '', d)}"
>
> +# user mode qemu doesn't support ppc64
> +MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'qemu-usermode', '', d)}"
> +

should we replace qemu-ppc with qemu-ppc64 instead of disabling it

>  AVAILTUNES += "powerpc64"
>  TUNE_FEATURES_tune-powerpc64 = "m64 fpu-hard"
>  BASE_LIB_tune-powerpc64 = "lib64"
> --
> 2.8.0.rc3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

