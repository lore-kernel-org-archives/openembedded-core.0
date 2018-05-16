Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BCB4747FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 22:06:18 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id n10-v6so1219739plp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 15:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r8hk+3kFL++VEDVvqZtn2m6QSBxQXciHOLe70Y80cJU=;
	b=DdH/1D2PI8cjTndvQzCl6WoyR1cL6dvBtA2ImiewKv+a/56Dx29K3Z+l85vzDod0WX
	hzOHe6M0IiBYrF8WQSnSiuxTv97VNGlWXZIHSkS+A2psehps7zPQ0Elb9riJLNNYHBkY
	dAqOx88tOmuh+B1DKx/umW6HObhCpDPuYrCKOL7WAHvNBm0ogOXNpLWwYiGTwPM6I5yg
	ZlQ+IYS/Zbt7Yft9ShagPhu7ayC3N4BR32yGHyXHwvf8xT0s9XyYUXm20tSNdpwWRhFT
	zJTdbNOWZ1TV7RQ099j/yz7Cgnwse7XmJOOoBb+8H2rjQ3KRljPOBP21qqY4vyMomKVo
	SQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r8hk+3kFL++VEDVvqZtn2m6QSBxQXciHOLe70Y80cJU=;
	b=ZEZ46zyIppx2M93Lgdxegpmnbf/gsxyOGcgWjhm83wxAMq++5zRAhfcjfQZhBdPBlc
	TrL8XqS5sxmfWKUMvybTz4I4O14bBZxzK2rzA1OIdmkGyzikHDZXFg/k7RdH2Zaxo0gN
	EqyoUEtNZnKl6uIRnWypFmuh2Hv/d05F04oIjXu75OE7f3Z0YTz/lap4ztLvxaof3hqV
	yZQ1XDo76JpGK9rY+fKsXBYhPKChtXQxfWGlm5sVgJuKPf9tEPDPPdPnCnUsfW6iGv/u
	cB4NcmsbDtpaWTUYCZicdDCjrA0dr3CwJHKHU8yZn+o53aeLoIB/OoSAyOsnb+vItOtl
	5QtQ==
X-Gm-Message-State: ALKqPweI83Bo6iC9U37yCmQHIW4x5n761pPmVEdWYVRrsiXiCnB7BO2Z
	dTsqhRkLNmiCbc7kxNz/aTO5AZ6ySWrPmOous7PAEA==
X-Google-Smtp-Source: AB8JxZpfTI3hudrebBVIcpUuP1Y1C7sFuScKmKQkWK2pkK6xCJ7kk2S7jsqrbewiCUDcZ/i8yDAyEOFxqGDLsGRLWuc=
X-Received: by 2002:a17:902:10c:: with SMTP id
	12-v6mr2681524plb.252.1526508379311; 
	Wed, 16 May 2018 15:06:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Wed, 16 May 2018 15:05:48
	-0700 (PDT)
In-Reply-To: <CAP9ODKrXkwobok9O9RsebrZ7eOQze_t_fL5KqXCcDvkk9B3DRQ@mail.gmail.com>
References: <20180516201415.8002-1-marex@denx.de>
	<CAP9ODKrXkwobok9O9RsebrZ7eOQze_t_fL5KqXCcDvkk9B3DRQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2018 15:05:48 -0700
Message-ID: <CAMKF1sofR4pwFFPNocd2r3jk+AxohUQLg_ih+0B9fbWUnccoAQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.05 release
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
X-List-Received-Date: Wed, 16 May 2018 22:06:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 16, 2018 at 3:00 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Wed, May 16, 2018 at 5:14 PM, Marek Vasut <marex@denx.de> wrote:
>> This upgrades the U-Boot from 2018.03 to 2018.05 release.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Ross Burton <ross.burton@intel.com>
>
> Nice work :-)


is libfdt/dtc host/target mixup faux pas fixed in this version

