Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3C06C44A;
	Thu,  5 Dec 2019 14:38:04 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id v2so3693837qtv.8;
	Thu, 05 Dec 2019 06:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l4nOPCg0iBm2S0xSP4s3jXuUz9m/0sWbxCizv/5/XmU=;
	b=Fz9oJX+QCZLI+BV+9NovANCXxY6f6wyv4UH+NNFJM5WW0DzOMWX6mCKZFW7hZfVh6x
	2QCxhq8DV6CBEiFi66WhKJSml8R4wHw3ZuyRgEQc1ANxji70lhg5y/snZp5k6AF9Xbbe
	hC890qFbjmsm2RkXZJD2Axm1ZvYHEBUdvon656tIzZaq9RLJ9ToLh53fhbSqX7UtA1E5
	hdTID71dvZwPaYPPdVZIipghneuex1BhOaN145aPgxLknbCo0ohkNdkJYFkmmfiCevsE
	vsqhOPmwsxsb+BSu1h0ozaAtIjwo1T7BhbZEncFjVtaGyE0DCK5wddMVHA0MkdbTk1xb
	bLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l4nOPCg0iBm2S0xSP4s3jXuUz9m/0sWbxCizv/5/XmU=;
	b=QDbr+PVEhwYBHQMSZx6qOc9dJoonEcFMMZPJqoTJ6S2DXdHE5B+lAwlPAK7wnL5xtV
	sW3WjykaYku8Dn+bXl/jXdmdGvEkhUJs5SW5wePTg4SwWnZdSZdng6oQQmjJ9dyw5Nlf
	PIYCG/C8ZYEXXwpfJLcfd1oPpeT2YoCYaKMIUvvj5DViLXMbz8wLmg7GQW937QAggnfW
	/jo2WQ80gWCuAvC7d/If23v70deupAQPEDopOawJHS+NDldztKvxVQm1ePnlz2AsjvMi
	I/zmhycyA1m+85kbBqTxVybsylwfqC7vabWt8Z13CFvJ0OYB3TPpQLOcDjjOTeoz1W5D
	hWvw==
X-Gm-Message-State: APjAAAWi9m/cZOmxE89pgEudRr1g/d6GN+QOxh5p7jZZc63WwU4IzbpZ
	K+531hBQgoXft4yu7syokKIw08fVPyvKHRfS9iY=
X-Google-Smtp-Source: APXvYqxgDi8hTYnK13FczCuVtLrxxBODsqptU8y74k8JeSOU3iorWisrX5EFN+kxND3kIjZ19X1rxR8cLrLX5rFrEnk=
X-Received: by 2002:ac8:748:: with SMTP id k8mr7843835qth.378.1575556685027;
	Thu, 05 Dec 2019 06:38:05 -0800 (PST)
MIME-Version: 1.0
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
	<9058755.I6fkynWszP@shodan>
	<CAP71WjybqtUNXJWnOv52QQYevR99_tVyEPpHjx_rwVZfjU02nA@mail.gmail.com>
	<2454376.zbUpM14kzO@shodan>
In-Reply-To: <2454376.zbUpM14kzO@shodan>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Dec 2019 06:37:38 -0800
Message-ID: <CAMKF1so90+_uwUjcXRVB69qFa8ikkcCsjEeR=WzLkQcSz+553w@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core python minimum version requirement
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
X-List-Received-Date: Thu, 05 Dec 2019 14:38:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 5, 2019 at 2:19 AM Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> On Thursday, 5 December 2019 7:48:11 PM NZDT Nicolas Dechesne wrote:
> > On Thu, Dec 5, 2019 at 3:08 AM Paul Eggleton
> > <paul.eggleton@linux.intel.com> wrote:
> > > FYI I came across repology.org which tells you the version of various
> > > packages in each distro, though it's not ideal:
> > >
> > >   https://repology.org/project/python/versions
> >
> > Nice! How do we get OE plugged into that? Have you looked at that?
>
> No, I haven't - only discovered it today. I agree we should look into it
> though.
>


you need to have binary feeds somewhere.

> Cheers
> Paul
>
> --
>
> Paul Eggleton
> Intel System Software Products
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

