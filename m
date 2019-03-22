Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF3360125
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 21:51:45 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id c189so2135581qke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Cpc8HVb0WJXfrurbsDsWBZ6PbYc3B7bJ+PnmUwN+WaE=;
	b=T+ixhuZsQXeHRGU04lp4sXiqOWe0C6FND2aJVagaW1vlRmYV3vhZoKKnMdAmdPALAV
	01Ax7KP3xII9VNiV+uTIO1jBR3Vn3F/MQqSerOSC5BIJpbTvRS0+YPmYP9rXyUhmNE3a
	cI46HPKflx3FBeMs+6Y8amKNZnVS4GD6hqKq/CqdBYNW78mRRCt1l9pNcGFooT/jbXnz
	OiBL9LCUf4L0U6ZGIefGFIWbA0azU31tc/qSrGkpuR8aEnbn/Yugi4huAcpU6JaEnoXu
	61vSew5voElQ+C6rpubolC7jvFRGev+yohNP8erthbDum98AbSbpWT6QkCy1DvVN1QM/
	A5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Cpc8HVb0WJXfrurbsDsWBZ6PbYc3B7bJ+PnmUwN+WaE=;
	b=nAQZV0wpepmulX1Kr+M+k4f2zjFSwFFeRSEzpZIXEKIXU6XlNGbm9BuuwZofda9ieA
	enGtzEpiANf47doNR328yq7do5GMNhijbV+P+jrMToSRr4u7JzY1hY4DbvFtvB2CO15d
	jZuoZmrUiu2UmUeILDIDdComQC4Sl51ijxXpj3JrgI5YoQZWS28pLeyeq44/zoE/Pn4x
	7nPWIKaKHby6C1W0Uz+M23eTVi26JgY3JBM4qOJYgjnQOtKTVmRvN6RaR1abXS/Jm8p9
	SwWZ1rh1YCRRjqvdmzdrddPxLSm7XhK0WT3BvOqO6m3UbniOnfJ/Fn0ptt2sInk6C1Bn
	jHzw==
X-Gm-Message-State: APjAAAWh9GZFfIG6EdOyyQlMOrOLN/ibXEiH7jJhm+g6VNuMyViC1Ex3
	ALPKe3Hi88NhPV9e7AzqlvWQeE5+vO6NjTeTC18=
X-Google-Smtp-Source: APXvYqxhrI4LnACnqVcPAefAWnH21/sTvqY783guMz3p9dFd3eSCR5JEi+hIE5Bopep5onbnqCl95Bvd7uUxtxGXH+s=
X-Received: by 2002:ae9:f44a:: with SMTP id z10mr3835464qkl.223.1553291506748; 
	Fri, 22 Mar 2019 14:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190320230557.7094-1-open.source@oleksandr-kravchuk.com>
	<d42f9e5f5f57a33eb445c083017da4a9aabd1010.camel@linuxfoundation.org>
In-Reply-To: <d42f9e5f5f57a33eb445c083017da4a9aabd1010.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Mar 2019 14:51:20 -0700
Message-ID: <CAMKF1spV_jnyW354ic24sT5EJND1k-8b2W_GesDm70tW29fqVA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] ninja: upate to 1.9.0
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
X-List-Received-Date: Fri, 22 Mar 2019 21:51:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 22, 2019 at 4:44 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-03-21 at 00:05 +0100, Oleksandr Kravchuk wrote:
> > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com
> > >
> > ---
> >  meta/recipes-devtools/ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb} | 2
> > +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/ninja/{ninja_1.8.2.bb =>
> > ninja_1.9.0.bb} (92%)
>
> Fails to build on musl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/423
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/424
>

doxygen fails too

https://errors.yoctoproject.org/Errors/Details/234025/

> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

