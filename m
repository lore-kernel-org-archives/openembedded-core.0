Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD8965F81
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 17:52:04 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id at20so7569567iec.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Aug 2014 10:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KL1+N60/yzYzSAmuXO/8awCC7/9hNgOx3F5JT725XG0=;
	b=BbuyUppIzn52GBUkpJgj1BIGadOAhcOuDx4ZFaeixTmyMrnctSO1j0ULR+PDWqb5Oe
	JhOPvcF9wb6QO0L8bpakJVOCm6HoN+E238xgZMT9mpMHxNvtnpeLLfxAGxt1eHEh4gcH
	vhRaL4v5kr9ivPgy4d0n2mJneeLvxkfhvg9qCszWU9+2lV4C4DMLVGMWrO9faJ2XAVsj
	VhBFU/m+u1/HvIvv4sfqg+SdcLMfi2t+urWa9rIQIcFICHBG0z+/eqZi5SSPJjPsBt4Y
	2cKmBaoGBIO5ja3ppaLVKa/mW0k4ZNMtguhgGBXMN+jw06RY2EYiFNiI1hbCsSiH0LsW
	1VNA==
X-Received: by 10.43.64.198 with SMTP id xj6mr11851982icb.70.1407001925176;
	Sat, 02 Aug 2014 10:52:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Sat, 2 Aug 2014 10:51:34 -0700 (PDT)
In-Reply-To: <1406969253.6981.14.camel@ted>
References: <1406969253.6981.14.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Aug 2014 10:51:34 -0700
Message-ID: <CAMKF1spACB-2W=pAuqRSngx2+S0f3Q8a3LhEV3FcwVmGWkC3GQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools: Fix warning for odctools-crosssdk
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
X-List-Received-Date: Sat, 02 Aug 2014 17:52:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 2, 2014 at 1:47 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> odcctools-crosssdk doesn't use the suffixed naming the rest of crosssdk does
> and this results in a annoying build warning. Avoid this.

why does odcctools behave like that.

