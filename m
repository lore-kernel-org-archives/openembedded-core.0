Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8A77FD99
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 04:05:35 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id m14so2433364qvl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 20:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/pZ2l17tCgboV+fgUb2UxJMovcjBF0IqhIexe9cRpW4=;
	b=ZGnH9qxmnO+Y6w0f0bTlzslNvrNCpxw3aeb9gGhoX3eu1S/FF3N6iDFBhd6lvPBTaD
	aXhqmh0ByCsbG1bFFvtOWpQW3k+8FWmW00EryDctzozGCuTw/ogvXUf3fUqT65d/sszY
	gh+ke8dWOStjgkA/mpnuG+y+IXxoCyVDQfUHLtxHo90N5KtoTo1TWUblmYQtJ7w0AZmH
	auAAEfiM1zNlPhz4tSacdWc11c6ywNfodMD2gIIhwhEyhofE4p0A7w9cjVQa9d+hrZRJ
	Q2I/MRv333yMkudYJrFwARjejKw8RAID3N/Ah+uvVjMDFX1hI8z50qb93CiSHJkSKrgg
	LcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/pZ2l17tCgboV+fgUb2UxJMovcjBF0IqhIexe9cRpW4=;
	b=dhH2+5tSYRrrJPIgr91jVN7O4hgB3UTRuDm984rEPzJouOeMPjFQdmw+kDUePqlZlY
	QzFhEQOwrczAkos7sgGqXK4gVrkkV4xejKvtH8RbH8Y9ZZBQtx0liW9qlb/zBop4UV01
	3Ei/RtT1chjY4fXG9RjHyzZMbLfJHgEKp0lQsxSPBz+IFD2Ia7VW4gRb/DadEAa/FfJ8
	OhhTpK5GWpQVEUCVcria55gdI7vyuZYrqrVZAzasFnddi72DRXYCsHW0TXvBDnzcfj9Y
	nKN7cFtaykZ2lSNC8fGKAvflFZXPswFg13v6sazAMmm0o4j8GS/DKsn/UgqngscMt6a/
	5BxQ==
X-Gm-Message-State: APjAAAVG8HQCGzmqXri3PO/e3iHLyV+9nc3LEkQJIjpRa86fv/jU1A8O
	OOoL9oKYKzIRD+/aL61SGEgqZcFchW8zSv1YD0I=
X-Google-Smtp-Source: APXvYqw/Oy9Q9cU8ywuVS53lFNhtu71ngCHfKaBm+xDjNMu7kIqSAq+rTLHnjVnxI5g5w+7FuG1TNKU3K4D2nUpcfpE=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr7104199qva.109.1578542736326; 
	Wed, 08 Jan 2020 20:05:36 -0800 (PST)
MIME-Version: 1.0
References: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
In-Reply-To: <baf60d23-56e5-72a2-f7f7-adb10c29a5f9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Jan 2020 20:05:10 -0800
Message-ID: <CAMKF1soSLjcZBoF2sg9cnTUWS2p5k3cqhR2Zo472tMOOeDiB1w@mail.gmail.com>
To: Pascal Huerst <pascal.huerst@gmail.com>
Cc: Rich Persaud <persaur@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Looking for a way to build latest tagged releases in recipes
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
X-List-Received-Date: Thu, 09 Jan 2020 04:05:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 8, 2020 at 4:10 AM Pascal Huerst <pascal.huerst@gmail.com> wrote:
>
> Hey everyone!
>
> I'm looking for a way in yocto to build tagged releases or actually to
> build the newest tagged release from repositories.
>
> There is a way to specify a branch or a tag in a recipe, but no way to
> always clone the newest tagged release, that I'm aware of. I submitted a
> patch to bitbake's mailing list with a proposal [1], that would use
> bitbake's `latest_versionstring()`, to always find, fetch and build the
> latest tagged release. Unfortunately there wasn't much of a reaction on
> that proposal, so I'm taking a step back, collecting ideas on how this
> could be achieved properly.
>
> Please share your ideas...
>

while I understand the usecase, it has a downside, where a build can fail due to
someone pushing a new tag. I think we allow AUTOREV on branches which
is helpful in development and
CI systems. but deducing newest tag is useful when making releases,
this also means that it will bump the rev
in recipe automatically and people might get enticed to use it in
release process.

For such usecases, Maybe you can use floating tags ( like
'latest-release' or 'last-good' ) and move them when needed and lock
the recipes to use them to achieve what you want.

since use of AUTOREV in public recipes is discouraged, this does not
affect public layers as much
but I do worry about alternate workflows.

> Thanks!
> Pascal
>
> [1]
> http://lists.openembedded.org/pipermail/bitbake-devel/2019-December/020618.html
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

