Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0C950601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 10:02:00 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id k132so10584974ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 02:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=NIYN6ePc8HX4A9CmBZIeK6mJ25li+1tXlIKf3jNF0e0=;
	b=Rfkn+hEBcYgWx89S8psoANOoH8d9htuZB+koA09vxvnA/Wc4vU/1S4XwWqtwWzNSRc
	lmoPlA6jyAOa9Dk5NdIpS4cULN4kpvieX+Z1WWmcowMMTZawJOlKCPrzuCKgYsnf0jJK
	TYO8+VtNf9ccvRa/TxLLZAObQUQNIH76dAyUpMSczXNzRY8ACZH6cjrooCzUlqyzVNLf
	QfoeYt1WeFZOHI8fjf68c3XPK3RBZDT8YBq6fXrKWVwgmA8FeX6YbYtIOoNa/fsGQU4b
	WnH/4E9NUHsYNyxm33T/wf5C0hLU3Rd+GQYdRhDlvV9zT2+3lnbJXTj2msQiCrdM7hQ7
	73gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=NIYN6ePc8HX4A9CmBZIeK6mJ25li+1tXlIKf3jNF0e0=;
	b=hHwatPKelpnILOld6TzOZLaaakMiRE55PgpXoe8OtElATect4HvwmhvaKlS6MzyWuu
	eijYNFuPXS077eTZzRdM9nRnk89L0dEqKt+MDTpctkitbntKNAkQmcxjtGyWi9IZjGH7
	fnYBYIzbw1O03Cvja1sgflxAh5pALDBaOYb0zjHKeyZETBiyMCFf2ngxtTwuB/mvzjmU
	57nK8nmJ8U5Qb0Al+kmBYTqybo22g5ppkbE9vfpuQx5cTh0K4Iam3ChHerZUWKMFRQ47
	dTynCtYzm5pKeJleGYulfFLc0cawjBGZWWphZ+OvF3OxJ/8Bw9x59NXQnis24L2NiEWn
	4olA==
X-Gm-Message-State: AIkVDXL27NFqJQqBXsEaPPF0hYCEPqqFHsJY6DPLl9mKWc+8hAXWfV94B0ohkEK37SIOcFeF
X-Received: by 10.36.120.5 with SMTP id p5mr43718409itc.5.1483524120773;
	Wed, 04 Jan 2017 02:02:00 -0800 (PST)
Received: from pohly-mobl1 (p57A56308.dip0.t-ipconnect.de. [87.165.99.8])
	by smtp.gmail.com with ESMTPSA id
	e5sm11168263ioj.43.2017.01.04.02.01.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 02:01:59 -0800 (PST)
Message-ID: <1483524116.28169.33.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Wed, 04 Jan 2017 11:01:56 +0100
In-Reply-To: <1482961124.106950.55.camel@ranerica-desktop>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<ce57b729e9ac830d808040b7e3ff1fc128475420.1482324587.git.patrick.ohly@intel.com>
	<1482961124.106950.55.camel@ranerica-desktop>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Wed, 04 Jan 2017 10:02:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-28 at 13:38 -0800, Ricardo Neri wrote:
> >  do_install_class-target() {
> > -    OVMF_DIR_SUFFIX="X64"
> > -    if [ "${TARGET_ARCH}" != "x86_64" ] ; then
> > -        OVMF_DIR_SUFFIX="Ia32" # Note the different capitalization
> > -    fi
> > +    # Traditional location.
> >      install -d ${D}${datadir}/ovmf
> > +    install -m 0755 ${WORKDIR}/ovmf/OVMF.fd ${D}${datadir}/ovmf/bios.bin
> 
> Now that I think about it. Installing here does not sever any purpose.
> Thus, I think this can be removed by perhaps doing do_install[noexec] =
> "1"

I was trying not to break traditional usage patterns. If we keep the
"bios" runqemu parameters, then we should also keep the bios.bin file.

> > +}
> >  
> > -    FIXED_GCCVER=$(fixup_target_tools ${GCC_VER})
> > -    build_dir="${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_${FIXED_GCCVER}"
> > -    install -m 0755 ${build_dir}/FV/OVMF.fd \
> > -	${D}${datadir}/ovmf/bios.bin
> > +inherit deploy
> 
> I am not sure if there is a right way for inheriting in bitbake.
> However, a quick grep -n inherit reveals that the majority of the
> recipes put their inheritances towards the top of the recipe.

Agreed, that seems to be more common, although there are also examples
where "inherit deploy" is directly in front of "do_deploy". I chose the
latter because it was a more localized change, but will change it in
rev2.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




