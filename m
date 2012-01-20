Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RoLhy-0002mi-7a
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 22:09:14 +0100
Received: by lags15 with SMTP id s15so555093lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 13:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=JZz76H9hIAZLgMoeVkcehRhNuMym/SxJ0ah5nNPZQyg=;
	b=fjtE4icINH0on0laBsJOqUUkU1vzOHbG718nplEEhymr0hbrRhUo9peusiz10uKxRr
	dJy9FCs/dIMvg/a9o68avw4SOk3nRSoIlF+Gf974trcZQwlDR66wMGVS00zogmJiIzcD
	hJtUfVCI30mCpuSwLdw/3z0IzfKTbpWBJiCD8=
Received: by 10.152.134.41 with SMTP id ph9mr15911679lab.17.1327093293266;
	Fri, 20 Jan 2012 13:01:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.22.233 with HTTP; Fri, 20 Jan 2012 13:01:02 -0800 (PST)
In-Reply-To: <F707AE0BFC9B4879966C68C90082DDFA@gmail.com>
References: <CAMKF1sqGt0FTbnhpuP9HCeJ6LpqJrRs8GVB6azdPGfcvYHSJSQ@mail.gmail.com>
	<CABcZANn5zbXFwTuXwL2GM1FknKrY1OjBfDv=TTyH1=NRrqqDKw@mail.gmail.com>
	<CAMKF1soievYHSvbvqyvL0gROW+4v-5fU7FretdXyFfHWbOrJVA@mail.gmail.com>
	<F707AE0BFC9B4879966C68C90082DDFA@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jan 2012 13:01:02 -0800
Message-ID: <CAMKF1soJHJ3KGWrVaK57crNefQskwa0XfKpiLPSfnafbCTtd+A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: adding tools-debug to EXTRA_IMAGE_FEATURES pulls other tasks from same recipe
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
X-List-Received-Date: Fri, 20 Jan 2012 21:09:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 20, 2012 at 12:35 PM, Christopher Larson <kergoth@gmail.com> wrote:
>
> Possibly, but note that it doesn't need to live in a class, either. At
> mentor, our distro has a .inc that defines a variety of package groups for
> our images.

yeah may be define them in some of default .inc files we have


