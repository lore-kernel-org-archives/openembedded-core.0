Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id D7A546FEFE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Sep 2017 15:47:11 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id r133so8115785pgr.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Sep 2017 08:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lmu2Ws5qVzplJ4HUsw2cLjs8xqENeYTFAWA6QojLdSI=;
	b=PMUhRBAUiB6p0ifTZwNgxuqh6qZcPHRYsey38G5KwRIzfKRnDVf07A1Xw3zC7y10W0
	7haeYrEb3BFeHdlFj+bVp9qInNiV/hKUrWysDtO38YJ9i5RG8ZDAI9lawLLl6+C4FeY5
	iaxNsZUwADwxdgoorrZzi2LwcRpGcckSVt0yXgw+/uTyCnCyekCtsqWtygNtnGr1hdT9
	SAtJxrUSsXysGf1Niqc0nkZjDUvUtEYmyhOZOm1ou+oa7M8eSjCwVUiF6hUQQ52rlTFY
	UQMTB3rvfahvqbPVIWwCAxHQF1ZmWiV8kjGu9Gjbnh0sSTo/jHPa9IPwn/EwLl0hD3IH
	rxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lmu2Ws5qVzplJ4HUsw2cLjs8xqENeYTFAWA6QojLdSI=;
	b=mW4aJVwQui9Ltn85d6uUMVugCdP+HrsKZVctXML/UqosnT4INDNTzlhfZJnDpO7o5g
	2iE+5nOIFe8fRztUq/XfICHIM5BafaFcL19BVXYMg+Zx1Gb3yCjrkIwVK0xcRFJgPnft
	x4NUii1MIFZfns53XFV162lQMu+xp8l6Otd0CiVduZa9O0ylrMfUrbzUupz/G/EAkDQO
	h5buhZWETW6wPjrQ0dZOyU16p1lU5cNuj5EbvmPTPbYVYRzmBHUcqm3lu9YDEUEtqqqT
	XAR5ON8FmycQpBxJushf6ERjZFCQtYh3JCDUkvlzSqbLr5e4AroZMlYqWAniOcAXZZdR
	6yrw==
X-Gm-Message-State: AHPjjUhyrTIOTsJsRk6hUunuGlnh9kzF9rIXNa0ow/Z6mRadrkHy2jiu
	tYvmJyj+n510ieNa9hXzUUAlFpmveg==
X-Google-Smtp-Source: ADKCNb5kQaefGkR4V15UH8Qlu++9q0aU42VMgk1QVf5O1OAGAL9UJy6BFZAmBnNxfszLIuRe7FAp0kf5M8+2JPSNnuc=
X-Received: by 10.98.166.151 with SMTP id r23mr6318722pfl.168.1504367233179;
	Sat, 02 Sep 2017 08:47:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Sat, 2 Sep 2017 08:46:42 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.21.1709020834020.17885@localhost.localdomain>
References: <alpine.LFD.2.21.1709020834020.17885@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Sep 2017 08:46:42 -0700
Message-ID: <CAMKF1sp__FwjghAY5EGHZ5DqC_QwFn5sQpqBy=Um07ALUcsZxQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is 'SRC_URI_append += "file://appendtest.txt"' in layerappend.py deliberate?
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
X-List-Received-Date: Sat, 02 Sep 2017 15:47:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 2, 2017 at 5:34 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   just noticed in meta/lib/oeqa/selftest/cases/layerappend.py this
> snippet:
>
> ////// start
>
>     append = """
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
> SRC_URI_append = " file://appendtest.txt"     <--- first
>
> sysroot_stage_all_append() {
>         install -m 644 ${WORKDIR}/appendtest.txt ${SYSROOT_DESTDIR}/
> }
>
> """
>
>     append2 = """
> FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
> SRC_URI_append += "file://appendtest.txt"     <--- second
> """
>
> ////// end
>
>   is there some reason that SRC_URI_append is done correctly in that
> first example, but in that weirdly superfluous way using "+=" in the
> second example?

send a patch to fix it append +=  is usually not preferred.

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

