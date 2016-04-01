Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id ABE7773695
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 14:21:14 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id f52so1106973qga.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2N3NehKRQxKlqw6Q+uBxUi1TUJAsPQxZmPP+CYVW/jU=;
	b=gCMwd4y3LQpbr3ZOT0QKuYRzAIxuCnvqzlZKGgLjYShlB/Nrb5867DVdTDbCanZ9cQ
	qEvkAXVA0/30XxCaVxtvNXnjTeTE43OarL5G13iNPSTOSVbmq7+7ojNO72Nzsv6o06S2
	jdjkKDgsBiWUQONPhdGY1FzGue5KzmrbNc4xj4XirqAwE6fcyXun+2QP1DxI/VlJpWwZ
	CCFnoqdfXpmRsChJXEQUl8dxKjS6k6Dzb7/7xNf+1WXVCqmGDasToJ861DJT9GNpp40W
	/w8pRAOgEPyJSAjoNK8P83HZ2aJdMkXh6O4IFGmfJLfxYofxXGsoHQbzcKwS/woPKI2T
	e/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2N3NehKRQxKlqw6Q+uBxUi1TUJAsPQxZmPP+CYVW/jU=;
	b=I9F49AIbSzfR60rV9DKV0R+S0zx7R6O24/YQI+mU7O3ui3rOvMOMUHv8ADPJkVyt+i
	Ec1co3uvnREKRb4drmbgKZuWykW9G1b64T5aP1PZEbU87UbPyCsuGrR21N69RQLT1KGT
	K9rfNvB5Eu1d7gzVvbVea8NQ1dAyaxDXhXFxH5UiYLaZDUnz4GndKZ/PNXqReGlpdCvR
	VmN/1KeQuTjIYvGIb5Gu+oZ9c2pPgoclGrB7FLoM1+DfDcVUpZ+0p4fieE4NdvZz07Xk
	jK0qZz2kOcVuZ8jnAotCSunPklQ7gzz1r0wLS6th6BoY4mQL5mjMwRPKHvly1k40pDTw
	i4NA==
X-Gm-Message-State: AD7BkJIIwqX9uDwxxuBl+n/qZn6mEQ+moK/Uaf30452T/e0hD9tZLML4cqTJWxCq7m9+GxXtUd9wnoZjUCCj6w==
X-Received: by 10.140.100.244 with SMTP id s107mr24405386qge.19.1459520474957; 
	Fri, 01 Apr 2016 07:21:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 1 Apr 2016 07:20:45 -0700 (PDT)
In-Reply-To: <CANwerB3q0tnyeqGGYddsZQ5CE4yDC6znL3NY8oJXLMOU4u9fTQ@mail.gmail.com>
References: <1459039503-5526-1-git-send-email-net147@gmail.com>
	<CAMKF1sqV+PeZZvH1Am-MEs-f3e4JtENPdX=ByDesatb3EGM76Q@mail.gmail.com>
	<CANwerB3q0tnyeqGGYddsZQ5CE4yDC6znL3NY8oJXLMOU4u9fTQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Apr 2016 07:20:45 -0700
Message-ID: <CAMKF1srusBXY=OpSFgw+jxtQrJOWQpn0GezTCbP=nN3Bs+VaiA@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: disable conflicting PACKAGECONFIG variables
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
X-List-Received-Date: Fri, 01 Apr 2016 14:21:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 1, 2016 at 4:42 AM, Jonathan Liu <net147@gmail.com> wrote:
>>> -EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
>>> +EXTRA_OECONF += "--with-python=${WORKDIR}/python"
>>
>> should this point to a valid python location ?
>
> ${WORKDIR}/python is created by do_configure_prepend()
>

Will it look for this location during execution ?
and will it work when gdb-cross is built from sstate into a different workdir ?

