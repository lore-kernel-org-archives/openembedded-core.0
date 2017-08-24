Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0C93E7829E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 09:43:54 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id w9so538566pgm.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=xxRYijn9CmIQ4NijeUF/aXywRe4unU3EYY7gdpfDpPE=;
	b=bBN1iIDrVStGM9167KELiM8iflQMMKQdhDrcFUtV/1WyRRZiDkc0iqxV/8wt7KPVbR
	xJ3wC2BqoVtAHVCXW1Z0vElJVWDxjxttpzi2HPH+TKkfpoif9GQ8jMUn/KmD9HZB2fvc
	quSXGWHA5zfz8gMv4WXHWiEFkuQtFFUP2T0dkHI6XVTBVbKl5Ub4zKvwU/FaSnZLivjM
	R4oMb9Oa+aNk02ODsnq0e8PAOadtBFbeMR1X63btDLD4rwk0kVtd759fJitSA93gKyrE
	gHioc9B9zbmGVp0SIfg8EIQtbOKji8JrZjEtNn6wphvd23hkMaTB2GefpNzXea8uEa26
	9xvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=xxRYijn9CmIQ4NijeUF/aXywRe4unU3EYY7gdpfDpPE=;
	b=FyK5UUrBWP02xdzUM4KMlSuxfDp2O1Q+E7jsZ4YuVAZgQMEqZZPDTlBHoYWmGMdbKU
	inGPOwH+zaD4JDD7I0wZbzNC7QQKhGwRNkcK4b7R0pOSPp0M5IHYUKp6cj0NyuX5paen
	3MmEp5P3RQHWOG7h4uRjjrbeL5CPZxwnEZYlh94yWUd5Ynuucs12l6hlARfzaOhnoDAt
	1xH5W55mYMBnzD8tmVplkxVIcNy/W+zKR+PXtYx0uSgyTfBMOy4UXXoMvnVWaWwuqb3H
	i8fRE/kKLupVPJisovNEyhdWuGAIcqpj186LD77ZKcx+ylzXnhTXpJV87AsuU9FzWmlg
	FMsw==
X-Gm-Message-State: AHYfb5hwRdcCKs1/GVMPCm8ZYhvqclrX8TRPmHbp7uDJ/O9kY3fnFaHd
	WtWBj9w15z1C3A56IKE=
X-Received: by 10.101.88.202 with SMTP id e10mr5262089pgu.75.1503567836244;
	Thu, 24 Aug 2017 02:43:56 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F93A.dip0.t-ipconnect.de. [93.232.249.58])
	by smtp.gmail.com with ESMTPSA id
	e12sm6442383pgu.73.2017.08.24.02.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Aug 2017 02:43:55 -0700 (PDT)
Message-ID: <1503567828.3674.10.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 11:43:48 +0200
In-Reply-To: <20170824091924.25945-1-git@andred.net>
References: <20170824091924.25945-1-git@andred.net>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: Add run-parts to HOSTTOOLS
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
X-List-Received-Date: Thu, 24 Aug 2017 09:43:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-24 at 10:19 +0100, André Draszik wrote:
> From: André Draszik <adraszik@tycoint.com>
> 
> ca-certificates runs a postinst task, update-ca-
> certificates,
> which ultimately wants to execute run-parts.
> 
> Signed-off-by: André Draszik <adraszik@tycoint.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 334ba2361f..8011689118 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -469,7 +469,7 @@ HOSTTOOLS += " \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep
> gunzip gzip \
>      head hostname install ld ldd ln ls make makeinfo md5sum mkdir
> mknod \
>      mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd
> python python2 \
> -    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh
> sha256sum \
> +    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen run-
> parts sed sh sha256sum \
>      sleep sort split stat strings strip tail tar tee test touch tr
> true uname \
>      uniq wc wget which xargs \
>  "

Is run-parts guaranteed to be available on the host?

IMHO it would be better to ensure that run-parts is in recipe-sysroot-
native when installing ca-certificates. PACKAGE_WRITE_DEPS can be set
in ca-certificates.bb for that. I'm just not sure about what provides
run-parts in OE.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



