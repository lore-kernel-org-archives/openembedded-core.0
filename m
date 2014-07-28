Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0D30C70892
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 17:25:58 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id rd18so6740708iec.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 10:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vMSHBMw5dSeF9x95WOr60lUJ+CZ+pEZqNP+H+/918w8=;
	b=pV8NaMOq2uwDaEQ1VVmrJQILA+Z7on4/qOHs2W/McexS4bPFIaTZX8AIiOKTjd2roS
	+i2P0pN3y7569umVWkDXtZUANozxurtssg6yhuuUIkExj5URmg4ZPndB0tnkIcMoJzOZ
	7kIeuPK3e10Bfp2E9YT3sL00zD2IliqfA4EzY4TMBd7+dmpXx75jVS8JVrfUumRs6Do9
	jota0rIf5raU4RqP6U8CIQgnQw35KMYAftMQLGIKraGyBWRmMiZkG2pSu7/X83WgarKx
	DfIAfBxg1z3I32E7chdaqWnrFOIbCtrmSMDDgnA2Y0jgP5efQMuT2MTgu7+WIQEghE4g
	EUlg==
X-Received: by 10.42.82.6 with SMTP id b6mr41622862icl.51.1406568358914; Mon,
	28 Jul 2014 10:25:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Mon, 28 Jul 2014 10:25:28 -0700 (PDT)
In-Reply-To: <1406545263-7393-1-git-send-email-rongqing.li@windriver.com>
References: <1406545263-7393-1-git-send-email-rongqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2014 10:25:28 -0700
Message-ID: <CAMKF1soxPmXjX6bbcto=c1qHvJB1bgdJdgTpz8dA-ibBp-7Tgg@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: redefine a function
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
X-List-Received-Date: Mon, 28 Jul 2014 17:26:01 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 28, 2014 at 4:01 AM,  <rongqing.li@windriver.com> wrote:
> +[PATCH] reimplement umul_ppmm to make it be able to building on mips64 64bit ABI
> +
> +Upstream-Status: Pending[This version was not maintained by upstream, larger versions have been fixed]
> +

if you mean newer release have been fixed then this patch should be
marked 'Backport'

