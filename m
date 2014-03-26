Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id EABAB6FA42
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:40:40 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id a41so2144551yho.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=+5ap1giQ058oSv8j518jbJAQReDo9BOWNSj/Ww5Ao6w=;
	b=AwpKqarye+YFHZsKDbVk46uR6Rji62Vuj98jXmzNiP3LkbyfL7DKB5pOFgjxgUt263
	sGSSeX40YLUT7hap29tnomVImm8/7kzaZjxjQN9u85+ktuw8N2WOIeAD44hHVIXpM49I
	HxIwIXxwKDCn7UZDv2uAvX3O8RkKLLa/XcIeNiWechi6EAQot8YyCpDa2fRumzUB/Iqa
	PYxev4jqXg4sq2pdUvMhmNYh+TTtA0YlKSiNGu8AXR+Tcn8BQPFpbCMsAg430VCBNIcI
	3ZO6fzN8HiBBKrcY4BB/tuDGzvbs6lEadymGF7XiXXTDvwYFD2Pk+t14sSVuIBJhxAN0
	J6Ww==
MIME-Version: 1.0
X-Received: by 10.236.110.77 with SMTP id t53mr67385389yhg.78.1395844841396;
	Wed, 26 Mar 2014 07:40:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 26 Mar 2014 07:40:41 -0700 (PDT)
In-Reply-To: <a1ff6a91da21f19e5365114dca7ae942803efcd6.1395825881.git.kai.kang@windriver.com>
References: <cover.1395825881.git.kai.kang@windriver.com>
	<a1ff6a91da21f19e5365114dca7ae942803efcd6.1395825881.git.kai.kang@windriver.com>
Date: Wed, 26 Mar 2014 11:40:41 -0300
X-Google-Sender-Auth: Z80MR_pxrewN52t1dWXSLeW8vh4
Message-ID: <CAP9ODKr7NrMD1E3FTqB_vKrnXRs1vkeR0bcVm8TDaZCr1T+BEw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Kai Kang <kai.kang@windriver.com>, Lauren Post <lauren.post@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] cryptodev-linux: add recipe
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
X-List-Received-Date: Wed, 26 Mar 2014 14:40:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 26, 2014 at 7:15 AM, Kai Kang <kai.kang@windriver.com> wrote:
> Yocto kernel linux-yocto uses cryptodev-linux to use device /dev/crypto.
> So add cryptodev-linux which is one alternative of ocf-linux and then
> remove ocf-linux later.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>

Awesome Kai, I was about to send the same thing :-)

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Lauren, adding you to Cc so you are aware of it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

