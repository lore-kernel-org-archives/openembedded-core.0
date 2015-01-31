Return-Path: <rapphil@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8923760024
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Jan 2015 23:45:26 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id z107so43137273qgd.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Jan 2015 15:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zTIO/64lGzr6ub0IRt1+fX0LZ7Q6pFXhEkifkhlgcck=;
	b=VeVp4FRWIZHMObLnrBORsMczO16y98ADq8cdmB72bTSwNGLlzL9lk2SOuHsBG4DInA
	Trf671OdGlbZRD1O0uAixedddUmsRGBb6X3SOw1gfk5XsTwW+NAZDn3VHmbOQUqyB/JH
	0k/bEPK91LTNuV2aOqEyW1e4pe/ShdnPLgpBPNe5ObmH1mpPfgXXITX/UigE9Lio+i+u
	2pflUCSJ+3boENuxs7ADU22gzG3Ewo4yf0nYDxSKw1ek8V4j7V2GBBsj9KMS9j6R/QOA
	Mfxrn70uaTAJuPXabkG3FpAnQNToZX+SV8uK7U2cTTcGEBiq8doqMYp163IWpw3GXhwc
	CM8Q==
MIME-Version: 1.0
X-Received: by 10.224.114.209 with SMTP id f17mr27593645qaq.68.1422747927450; 
	Sat, 31 Jan 2015 15:45:27 -0800 (PST)
Received: by 10.140.240.67 with HTTP; Sat, 31 Jan 2015 15:45:27 -0800 (PST)
In-Reply-To: <CAJTo0LZG97KQbY8mTwBpruADXJz+mJomGa1s2Q_KWVgAENB-hg@mail.gmail.com>
References: <cover.1421651689.git.liezhi.yang@windriver.com>
	<c1e126ada5030706b289f4916e24f280f423d6f3.1421651689.git.liezhi.yang@windriver.com>
	<CAJTo0LZG97KQbY8mTwBpruADXJz+mJomGa1s2Q_KWVgAENB-hg@mail.gmail.com>
Date: Sat, 31 Jan 2015 21:45:27 -0200
Message-ID: <CAENGNhdPsd5NkL0B2Y91w_ointzgW3NRFhk-DvxhvQ8KFpyLQQ@mail.gmail.com>
From: Raphael Philipe <rapphil@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] binutils: upgrade to 2.25
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
X-List-Received-Date: Sat, 31 Jan 2015 23:45:30 -0000
Content-Type: text/plain; charset=UTF-8

I've got the same outcome while testing this patch with meta-fsl-ppc;

It seems to be a recorrent issue.
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=754610

Any clue on how to solve it?


On Thu, Jan 22, 2015 at 10:00 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 19 January 2015 at 07:16, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> * Remove the following patches since they are already in the new code:
>>   binutils/fix-pr15815.patch
>>   binutils/fix-pr16428.patch
>>   binutils/fix-pr16476.patch
>>   binutils/fix-pr2404.patch
>>   binutils/replace_macros_with_static_inline.patch
>>   binutils/binutils_CVE-2014-8484.patch
>>   binutils/binutils_CVE-2014-8485.patch
>>   binutils/binutils_CVE-2014-8501.patch
>>   binutils/binutils_CVE-2014-8502.patch
>>   binutils/binutils_CVE-2014-8502_1.patch
>>   binutils/binutils_CVE-2014-8503.patch
>>   binutils/binutils_CVE-2014-8504.patch
>>   binutils/binutils_CVE-2014-8737.patch
>>
>> * The file src-release is gone.
>>
>> * Updated patches for the new code.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>
>
> FYI, this is breaking u-boot on meta-fsl-ppc (#7145) so when Freescale have
> fixed their u-boot fork we can merge this.
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

