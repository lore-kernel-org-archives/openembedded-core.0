Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB8174AEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:55:48 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id l197-v6so7522255oib.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2018 06:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9KM8lNKIJ9/kA+hyAqpott0RgdsiRePofHPEM3C6RLg=;
	b=RCakuLoSxERdBCwxg7Lv5JDkvcywFVEqhSJeqTbRx9zZgPjaxjsZeVwoSmQZHAU79H
	hnpmUwipCvwpj3eIYBCUJx4uqNav3s6KPglAxsRvmshIvaKv8kHIiSgYRIwELN6eg0iH
	EMz7mHVEMo53ABI+w4M2XVrNm66PCBiWI1mlal5nGC4fZQ63lALf6HwjsZaliPZ4Kjtx
	6DGR82bFidgX+/nt2TV0shVqfEHS6Y9Zba8ZlUzhPvyO4DMh0812cUs/uZ+crAk7N3xO
	Q+7nuDy3/aB2cQKoAFNdm7DfDWRTj+8D1OOSdTL4tmrcbz5eC9XiYQ+rbw/qJF9FpTI8
	N6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9KM8lNKIJ9/kA+hyAqpott0RgdsiRePofHPEM3C6RLg=;
	b=tyzjpTKfieNVkt3DQ+4gfrjbrPxUTTRZNxU5VX91IaDUEXDuIomzRjMc8vSLw7oZp3
	sEHtpG1mx3+gerT1QYSxPz+kT/9B+D238dQWkMph9ySkryjpUIYTXZa2oFnJ/VZXztuS
	9cIQqdSdATrXHn6LKIQKasjvy6p/DSL4n2H3qo8hOTXRT7Nfnh/OMVtZoK7EbOO2mdzj
	MYEd6mj6zNxOaV6I5vjq/yEZh4JkrpBpYX6TZ34ongQt+HIJAACNUB8XSmXke7o0CUrV
	KbA5uHwml9enapbvUp2WiWT5sYCxrMjA9kiSbYuumQOerMNVgnTClw/U5d5mFuhcbVr2
	QiWg==
X-Gm-Message-State: ABuFfoiZNI2uf8ibC1W1cBJsFti/dBuYmiCeI4fzHQ2UtuVQMqV0YLBp
	Go960SVdE2VUrxI3UHEkCOwoTg+xgtILXNpE6AW/IdOT
X-Google-Smtp-Source: ACcGV62ZOpxTMUgMVQOAOgqge88FgttHvcwm84gm2GP+KuEv5l3WEi2u0kHVlw4642V0BArfBBEpUrccdDNPjyT7dwI=
X-Received: by 2002:aca:685b:: with SMTP id
	d88-v6mr2976388oic.103.1538661349313; 
	Thu, 04 Oct 2018 06:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20181004132953.3568-1-angelo@sysam.it>
In-Reply-To: <20181004132953.3568-1-angelo@sysam.it>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Oct 2018 14:55:37 +0100
Message-ID: <CAJTo0LakckQ+=uGaP9Nf-Mg4i53=7w4FsuhGY7bC1Tv3t7HNSQ@mail.gmail.com>
To: angelo@sysam.it
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: (No subject)
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
X-List-Received-Date: Thu, 04 Oct 2018 13:55:48 -0000
Content-Type: text/plain; charset="UTF-8"

I'm curious: the data sheet for the processor you mention in 4/4 says
that it ha 64K of RAM.  Are there other processors in the range, or
have you done incredible things?

Ross
On Thu, 4 Oct 2018 at 14:30, Angelo Dureghello <angelo@sysam.it> wrote:
>
>
> This patch serie adds initial support for m68k architecture.
> A Linux kernel build has been tested successfully using a local
> meta layer, or kernel-yocto.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

