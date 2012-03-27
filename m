Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCeb9-0001eH-Sr
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 00:10:39 +0200
Received: by lagw12 with SMTP id w12so460436lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 15:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=zPZ74B9BKmzjq2V8CUwn1oikItBEpYYIWrvuNfB/XOA=;
	b=dquWuXn/OneD0UTMct0GvCvKjVjQJ8THCzaZQizzvOICMzcpP9YpfC53hu1lCWY51t
	mxTZn+LWM3mWQ2doppX8agNXySGNEnawgFBAcAncB91E7F1iRAZM5vYAiwXzg/Rb+5qr
	Kcdf9bi1+G0DzHruMXQRAL39F3Yyp/bB0v+o1p+XnTguL/Q2wh3DCaO5U69KfX5sy2NJ
	R2p6PFMtXxIbKdASYs/NMfR2RTGp4Bm8PVju0a+Ea4bqGR9AlsorlAESVe+cAteSsivl
	u7cAGSSZTAsNGjOMn2OmIon9vgAuBR9ZI5U7paev0LGbO11Dc/oHkgArXTIpAEwnQ6bJ
	eqOw==
Received: by 10.152.146.163 with SMTP id td3mr20101577lab.31.1332885698561;
	Tue, 27 Mar 2012 15:01:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Tue, 27 Mar 2012 15:01:07 -0700 (PDT)
In-Reply-To: <CAGiJk9evph+E_CzqN9iOAqAD9ypkcDvV9xj2LrkD1O05Dv=CbA@mail.gmail.com>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<CAGiJk9cw9KxmoPcmad1aR64vXaqKujUY7nH_pVePnfVPY-uedw@mail.gmail.com>
	<CDC69864-7475-4B3C-B966-C3B6CC67B8E7@dominion.thruhere.net>
	<CAGiJk9cUtvJn2uKRxBzP_0nvs78bYvEJ2JKsCx4HKdo1zxL9DA@mail.gmail.com>
	<4F6B4C0B.3030504@linux.intel.com>
	<CAAQYJAtjfhhckJOTo1dxit4S72wFQ5Jt+r4MMfN6-Qu-Bw=DOg@mail.gmail.com>
	<CAGiJk9evph+E_CzqN9iOAqAD9ypkcDvV9xj2LrkD1O05Dv=CbA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Mar 2012 15:01:07 -0700
Message-ID: <CAMKF1sqMyYATLuVF8WNhRvQZya8nj1LGmHKM30uSAnr8Pk42TQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Tue, 27 Mar 2012 22:10:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 23, 2012 at 1:00 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> There is a layer called meta-multimedia, would giflib, libpng and the
> others fit into it?

From what you explained in another thread on its usage in KDE I think
its better to have a copy of it in meta-kde FWIW since if KDE switched
to using QT provided support for it then you can simply dump the recipe
and it will be fairly local change.


