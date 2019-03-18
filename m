Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2936C0F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 23:52:10 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id z25so9305729vsk.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5JWI8qbS5qsbpcibqJDelWnWqFSkvP1cT/pDswss9TE=;
	b=RbnvBaR+gAt4mwslTnBC2LxC0aXDrauIZbUbjjHXoG9EULDnStPmmvq6SZsvsgPVVN
	GPXVbq4oZOQClg/QDxe/pVNW4JzlkLaDo7WrKr6sb6CEFqmxye0xm7MrASIZvdmlYUce
	uy16ra8f5lyJhCCxUJq6jDWkFAEeJtDsNeNq10DuUccPxUDkONrd6o9qHMWXsTT5/XkT
	0d3600Beg7HeAGfHfLDZDmhEzBkGhIrnVCqm/CgIDS9FclFtxTJotuKf1XavL5o4kvWZ
	2d9n1JaJLGM7RK8yjPs9lsiuuvjDafwHVwjvHvuTlurQCo/kJqCD41aLWfwaeOW2k0pc
	kpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5JWI8qbS5qsbpcibqJDelWnWqFSkvP1cT/pDswss9TE=;
	b=M7C4NRJODZu/jZVSFWb5QicR8CvIaNDUgDDdgWm0MY3f8wH1xG8IBOFrO+Wr7YWNx6
	ug4Jj5BHhFH92oOdZRTIfW2P0PYdNUqGoj5+bo/gTqcNyHa9EgjawmaEhPfGRjUDPatd
	0cKRdYAb2Sr0MWBf+Mn3hj9h4nxpxYb1YO/dXFq6k8BW/J+9ulYZTA1E/wky3ldS2lBl
	VaPrjQBPUWX4N6/BFSu8QAdE0aVW4GOtIyPgzcZQqa21QVG7t0dXGb6FoNyZeyfoHDb1
	T9taZ8r6RnStqSjsLHLf+kbUhWeNIxQgLISJ3a5tIq3g2MtFEOi/2x9Xu61dLoUt68+s
	bMlw==
X-Gm-Message-State: APjAAAXDv42Vjq4We37JJny3OzvXb5HFLJJQPPOqo308f76u3R6q0NZk
	cdOxcVBvBtBRps+huZwX7cFNbca5AiLvYYpVreg=
X-Google-Smtp-Source: APXvYqwg658meyH+qLR+aZ16KoC/1d2GedqNLISXc8+MTHRZTTEELhwJoaMriKEluX2NmtSToI0C6rgQSIYvDeBheX4=
X-Received: by 2002:a67:986:: with SMTP id 128mr5702961vsj.137.1552953131712; 
	Mon, 18 Mar 2019 16:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190318133618.4022-1-otavio@ossystems.com.br>
	<e9d01fa735d068ea16da35db9cf303841b67b909.camel@linuxfoundation.org>
In-Reply-To: <e9d01fa735d068ea16da35db9cf303841b67b909.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Mar 2019 16:52:00 -0700
Message-ID: <CAJ86T=U0NLArgbpFWt_FooB0H9sTYxyqC345ZMftFDXezJfV9Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Mon, 18 Mar 2019 23:52:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 18, 2019 at 4:35 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I went to have a look at how this upstream C utility was going and
> found that they've moved to github issues and there is no such issue
> open.

It's already been implemented and is present in openssl 1.1.0:

  https://www.openssl.org/docs/man1.1.0/man1/rehash.html

