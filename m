Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id EED137D717
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 17:28:07 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id a33so1481991pgm.5
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 09:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=+acxEmofSrqU68nr15tBd0BXtrKH6PcUPyleatCFTCs=;
	b=rrklVmdjZGQUBj/oUfSqVo4wok8ttCl9Mq+E1mdmENY0p69kYyeYeOuCM0jjPRuhlw
	h+1GfDdzvY4N7F3IU+5Ckf5hEqcC94GtenvRWGDhJ3sdJ6635SRvx+NrWmQ28pVvA6ml
	6CnETkX2qAf52kXzI+4mep5+e/sMqfwhmM0ZEigcbQw1jCbaSXVDWIaT8E9W+c0IQOsI
	4w5QQOeUtuG4jID8++kmkC3Urz9weNSnJS6EUSKVNMPufFsmrJTanoFzFg9hCxoeeujE
	Cbafy2OL1Cfp/yor7KUzs2Jwm5klLgtKybNI/P+m51FUwqVew012u86/Eg+oxh/VUPJd
	LRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=+acxEmofSrqU68nr15tBd0BXtrKH6PcUPyleatCFTCs=;
	b=XlrSI3i6l07h8WS7G4GLV/RkrB3RJ81rNMESKm5r+7vY7aPFvcqixROdmVb5mvIlB3
	MDxR/TjMTBd/H7lo1CjvocSX5vOodtoJSzL8cNOxSqghVhUTXBzC9mhrO3753SsotLPB
	ZlzKgRHZPABoHxgarPd+dbdEROluaq9vHzczMUL0Oke+agII+cEkAomYf/gzbhCesSVl
	JYtRU0Cv+NupTFIUJRdAgzYv7skHF7i1O7h2SFAA7ji8U6rrXkBR0kAjcq3wuq2tEWuC
	clL7avvJ+QGFtzbYJ5EUnQNIQDnWw7s/hyjYeQ+4i2sXMmCuw8brcjCRDDqkiMMEwK2i
	LEKg==
X-Gm-Message-State: APjAAAUc/iY026+hvqFjLGfoRy98gL0NlTyH0kxOf5L2iV2dRzzX13XA
	AEqt4smP+EIOpI074IbzjSyr3zXhvY8=
X-Google-Smtp-Source: APXvYqwt2dlJ+hdICxQ0y9JHm8OEmaFiV3x6Aoydj3Ijk15vk0hsfL+/aALkGsiFlcNu/uWBzXe6Bw==
X-Received: by 2002:a62:8205:: with SMTP id w5mr11011461pfd.136.1576171688540; 
	Thu, 12 Dec 2019 09:28:08 -0800 (PST)
Received: from apollo ([2601:646:9200:4e0::3552])
	by smtp.gmail.com with ESMTPSA id i4sm6269168pjw.28.2019.12.12.09.28.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 09:28:07 -0800 (PST)
Message-ID: <e72550962f846221b1d4c2bb4c8e56941c245ea0.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Mike Crowe <mac@mcrowe.com>, "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Date: Thu, 12 Dec 2019 09:28:06 -0800
In-Reply-To: <20191212160557.GA9981@mcrowe.com>
References: <20191212160557.GA9981@mcrowe.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: Use of multilib.conf taints hashes of -native recipes
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
X-List-Received-Date: Thu, 12 Dec 2019 17:28:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-12-12 at 16:05 +0000, Mike Crowe via Openembedded-core
wrote:
> We compile for a variety of machines, some of which require
> multilib.conf
> and some that do not. I was surprised to discover when switching
> between
> machines that the do_populate_sysroot_setscene tasks run for many
> -native
> recipe. :(
> 
> It looks like this is because RECIPE_SYSROOT changes:
> 
>  Variable RECIPE_SYSROOT value changed from '${WORKDIR}/recipe-
> sysroot' to '${WORKDIR}/${MLPREFIX}recipe-sysroot'
> 
> This problem goes away if I add the following line to native.bbclass:
> 
>  RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
> 
> but this feels like I'm solving the problem in the wrong place. Would
> it be
> better to modify multilmultilib.confib.conf to say something like:
> 
>  RECIPE_SYSROOT_class-target = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
> 
> instead? (Although I'm rather worried that this will stop it actually
> working.)

in multilib.conf if we do

RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
RECIPE_SYSROOT_class-native = "${WORKDIR}/recipe-sysroot"

might be better, since cross etc might still need it to differentiate
multilibs

other option could be to vardepexclude it for native recipes

I was also wondering if the defaults in bitbake.conf should use
MLPREFIX unconditionally and be removed from here.

> 
> Thanks.
> 
> Mike.


