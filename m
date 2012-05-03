Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPxSS-0006h7-C9
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 16:56:40 +0200
Received: by lbol5 with SMTP id l5so1132728lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=bFYnjsiQVIzPmmOroXF1r8S4m3Kvjhr9KkFBrt5jUaQ=;
	b=IYBI8mQAIT9oc5FknHDRPDTwpLjxJ7DrQqEU3pCTMHbOBaLWYOlx6A+OV9cefyk/U8
	d218DUOm6xq7FoHYYq00V2v+WdCxwHInjjFaRvGnbdV5wpcPpn8IAjqVbaSbhTWwV83D
	q8bD9AzO+qVdOOfR0rCUtALJvDafpejH+LBUnvacxkT6ZVNfAFqI9OCvrPP1x9mewBKU
	QZTZDvKqEwNA8pTtM7+swQneyosaCWp+zggrbfAALSu1cmpHUQciWMYbN4kroveuszsG
	du9Q0ylriC3/fxMBsT8XLQiIdOinZvwgHeLwLOk01v9D+JtQEJsq4EDfuc9ZzWEHUoEY
	SOcQ==
Received: by 10.112.100.170 with SMTP id ez10mr1216931lbb.15.1336056414786;
	Thu, 03 May 2012 07:46:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 07:46:24 -0700 (PDT)
In-Reply-To: <1336055718.30113.125.camel@ted>
References: <e6ccd54276855728be4e18f3fab28136736963a1.1336015963.git.raj.khem@gmail.com>
	<fb85f4acd897466f053198dd9606143b90c14c66.1336015963.git.raj.khem@gmail.com>
	<1336055718.30113.125.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 07:46:24 -0700
Message-ID: <CAMKF1sqiSO9kz3-0fKV+XDpB8+v2+pph_rZgRb6xof3OSHjTWg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] qemux86-64, qemux86: Override XSERVER variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 14:56:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 3, 2012 at 7:35 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We probably want to keep the weak setting but do it by fixing the
> ordering so this happens before the include of qemu.inc...
>

Thanks. I have revised the patch

> Cheers,
>
> Richard
>


