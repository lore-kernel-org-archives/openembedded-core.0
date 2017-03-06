Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id E179F730B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 18:48:13 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id f54so179225338uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 10:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CebOyMdIbLSdjU/DIaCSCxFcQOOxL5pp8xu8FQxsFuo=;
	b=JvpPt1fiBeNs9NJd3Sv2/aLyvIbVuL4P8D5DcGxjmcK2AugNyCqTxCO2ShK3uVRwGF
	/6DrgdBIrTDYtihoihSkuP61cuSyzpZYocOWBUVb+xshC6B8co3bXsjJX2+7He4odXpn
	gbouUnZOwICR3HVKbdzxO+wJPNazfD+jeswZqgp0+pI5PzuyLq2hh9SUZIZ0kSDpa4JA
	FqH/5p7LxBhhQszEB+GSqmMMfM/I/J/qNOoyhVRwkZG9xaY+F4pxc8kc5ewrC8D0BYin
	cFVJEyl2VvU1NkOcaTityPurzgjcpJsMytW2JJHDOk0o6n8TkaiZEDGhSTRXLaJzfu76
	4MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CebOyMdIbLSdjU/DIaCSCxFcQOOxL5pp8xu8FQxsFuo=;
	b=b46nj/62I7Z0H9A+6FFAO9GhjPLuL14ub/LkAkTn3Q/a8EhdoAK+bb8qHbWTFGVP9q
	QaD8VyhwPTekgS4OgiylHEGsvRe3U+rbPK0cVWJDhi+mSnA7lVNTYAQZJC9KXnwvgGtP
	Jw9M+AbXH5tQNQ4nR64cEwU/oWTV8uc/M+/H6WPX0gRCx14CCyDtPHPrpn/l2B146Loi
	cVkRKwnEO/Wewje/S7jK+i/Ue+0ZcFXLxggEe/u0I4lYGJAaoHrweU1q66/LZPmN3zel
	9v5v52KI/R8WW9TAlJWOVu1nuRpSZchkFoUsJHIQS3AOGu2Sd1Z0Fm2LDF85+atq44xR
	tJ7Q==
X-Gm-Message-State: AMke39n8Bdmjn0eZvUhyApvB3xP8G2hIpiCP2EWbvScfr6mJXXHPdpjvHZyUi/TApJbgj15rWrZzSHs/r19Whw==
X-Received: by 10.31.204.197 with SMTP id c188mr7484502vkg.31.1488826094656;
	Mon, 06 Mar 2017 10:48:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Mon, 6 Mar 2017 10:47:44 -0800 (PST)
In-Reply-To: <1488812725.3261.4.camel@linux.intel.com>
References: <20170303231811.27812-1-raj.khem@gmail.com>
	<1488812725.3261.4.camel@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Mar 2017 10:47:44 -0800
Message-ID: <CAMKF1sqBKD4Nit0mtu9Fzxnv8MfroKq7E+jNMM7LtjWuABpGrA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V7] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 06 Mar 2017 18:48:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 6, 2017 at 7:05 AM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> For the moment, manually cutting & pasting patchtest results:
>
>
> * Issue             Added patch file is missing Upstream-Status in the
> header [test_upstream_status_presence]
>   Suggested fix    Add Upstream-Status: <status> to the header of
> meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)
>
> * Issue             A patch file has been added, but does not have a
> Signed-off-by tag [test_signed_off_by_presence]
>   Suggested fix    Sign off the added patch file
> (meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch)
>

Sent a v7 which fixes this

