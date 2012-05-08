Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRslO-0001Hy-4X
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 00:20:10 +0200
Received: by eaae1 with SMTP id e1so1700401eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 15:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tyWOsNdupc6ayuydfR+x5mXCovvUhSnkVPLuyD02g0k=;
	b=ypNvrGct/PXsXc9btjCwOZRYKUcDsziClFfrakwFErIWQ+iO4vg9mcOOz6FgnvwCMQ
	UOCWt8z07hB60TutnzW+CguMtPqsoIGlyft2RI7m1+3ytJpHsuegsIU9Li3BulsMVkvd
	lm+rlQRwlYnZ0hSLTjcp/zhQ5hfgUBN4QkH4xEDoABs/0RSRVNg+5g6ng38iSL9SWTc9
	6wsyJawvI9eGETZsBzZ6r5d/j5HUZnphV/ku5Ta9+GEo6+fYQorVlbcc6ErHUvlUi207
	H5UBosGow4i6NQZssgweqwACcXGqFcG6MM1VW8L6dLMT0qfSYC5ivKGCZDtP9eXUcopp
	908Q==
Received: by 10.14.47.131 with SMTP id t3mr1182373eeb.118.1336515018122; Tue,
	08 May 2012 15:10:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 8 May 2012 15:09:48 -0700 (PDT)
In-Reply-To: <4FA998F8.8060306@linux.intel.com>
References: <cover.1336015963.git.raj.khem@gmail.com>
	<4FA998F8.8060306@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 May 2012 15:09:48 -0700
Message-ID: <CAMKF1srhrwcEks0rGssCXQdyEFa9wYX6zVp14qAKns7wLHeJVA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Enable xserver-xorg for all qemumachines
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
X-List-Received-Date: Tue, 08 May 2012 22:20:10 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 8, 2012 at 3:06 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
> Khem,
>
> Not sure what I am doing differently, but I am not getting the xserver to
> start on at least ppc and mips (two that I tried just now).
>
> Are you build a Yocto sato image or oe-core sato image?
>
> I get the following on a ppc:
>
> Fatal server error:
> no screens found
> xinit: giving up
> xinit: unable to connect to X server: No such file or directory
> xinit: server error
>

hmmm I have booted core-image-sato but I have bare OE-Core
Do you have


http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/qemu-xserver-xorg&id=8a60dabb7902b7be42d06cb735e96248e2e67dba

is some layer on top changing it in some way ?


