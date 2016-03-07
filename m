Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id D1F5765CB5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 11:47:11 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id bc4so126818493lbc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 03:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=ReC91njrPH7J8v7QC5AnWu7T4Yt8jiReQfJVhwj0ijs=;
	b=FwDsAj9FxC+DW3uLTnFt8fR9nQIetqMt4OJKqLgxwbM7IJWTlYvYJtBHPZAjh/7HUk
	JC3Rs1ocImRC5bE99wWrmzQc28YTrJeLxOskZ/r/3Ty2sWHw3X5HSjdL16TUnVq5VAul
	24tHiVYNFaWwlJSg9H4UVk9wCxMt1SH076GxsLUdGMpS+bBVOetvqIZZLFAF8jLReJSr
	WpBe7E/YIwnYm2iKCsdZXNamDZe6c1A8UB17ZQ93lNGT2cxW86ECDqfPVWc8lZRsWSmQ
	r8rrLlXSGVK0to2vaKNDYIIImxFpL260N5d2cMKsi/2omzJR08eGlnWecogSoOo5WaQB
	HLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=ReC91njrPH7J8v7QC5AnWu7T4Yt8jiReQfJVhwj0ijs=;
	b=VT2mrGgwxAmsamooV+r4dL+SpIzZftjTbZ0/ACL1nRUMUvy40NRwy0vkmCAVLkPC5J
	syztJAWwGSYWM2oW44jEMJ3kBr9AaH1qkjZ9BllSrzrwKbvZylzkpwCCT3wMQ/VcECyi
	uQLiC2me5qUtl5zZRqhHLuFkMjs2mDWBpyVt2PpqnOKKCg83G2gMCsHaB11+q9kP+558
	HGOeGqqrXCf4rK5lokW9Vs5zmX9XNkEgHKzfDdPqBXwLazih52UeSI+v3Btofcu3Q3tD
	2PLNs7wsF3lTdXVu2HWXwkkVC3Tky9+qwzyl4hE0IAq6BJ8o9vNR6NdX2XoKmaYmHByt
	o2/A==
X-Gm-Message-State: AD7BkJJYkKqEz9Gv8sRKMJVOXP3rvsvTK6IFY170K5Vy1QzD9PG64zdrVgdoVBcFHpOPOA==
X-Received: by 10.112.254.164 with SMTP id aj4mr7232752lbd.130.1457351231135; 
	Mon, 07 Mar 2016 03:47:11 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	au9sm2709819lbc.24.2016.03.07.03.47.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2016 03:47:10 -0800 (PST)
Date: Mon, 7 Mar 2016 12:47:09 +0100
From: Anders Darander <anders@chargestorm.se>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Message-ID: <20160307114709.GD6004@ad.chargestorm.se>
Mail-Followup-To: Herve Jourdain <herve.jourdain@neuf.fr>,
	openembedded-core@lists.openembedded.org
References: <004901d1785c$fb27d0f0$f17772d0$@neuf.fr>
	<005801d1785e$07915900$16b40b00$@neuf.fr>
MIME-Version: 1.0
In-Reply-To: <005801d1785e$07915900$16b40b00$@neuf.fr>
X-Accept-Language: sv, en, de
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [systemd][PATCH] some dependencies in systemd seem not to be taken into account in systemd_229.bb
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
X-List-Received-Date: Mon, 07 Mar 2016 11:47:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

(Resending as it didn't go to the list).

Thanks!

I've just ran into this myself this morning.

A few comments are inlined.

* Herve Jourdain <herve.jourdain@neuf.fr> [160307 11:51]:

> # Sign the journal for anti-tampering

> -PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"

Please, keep this line as it is. If gcrypt isn't enabled, we need to
pass --disable-gcrypt. Tnus, it should be part of this line.

> +# RESOLVED depends on GCRYPT, so disable gcrypt only if resolved and gcrypt
> are NOT part of PACKAGECONFIG - done in EXTRA_OECONF

Remove the comment.

> +PACKAGECONFIG[gcrypt] = "--enable-gcrypt,,libgcrypt"

As above, keep the original line.


> -PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"

> +# RESOLVED depends on GCRYPT, so enable gcrypt any time resolved is in
> PACKAGECONFIG

Either keep this comment, and keep enabling gcrypt.

Though, I'd prefer to follow the precedence of importd, and just have
the comment stating what you need to enable.

> +PACKAGECONFIG[resolved] = "--enable-resolved
> --enable-gcrypt,--disable-resolved,libgcrypt"

No, don't add --enable-gcrypt to the resolved PACKAGECONFIG.


> +# RESOLVED depends on GCRYPT, so disable gcrypt only if resolved and gcrypt
> are NOT part of PACKAGECONFIG

> +EXTRA_OECONF += "${@bb.utils.contains_any('PACKAGECONFIG', 'resolved
> gcrypt', '', '--disable-gcrypt', d)}
> <mailto:$%7b@bb.utils.contains_any('PACKAGECONFIG',%20'resolved%20gcrypt',%2
> 0'',%20'--disable-gcrypt',%20d)%7d> "

Skip this part.


> +             if [ ${@bb.utils.contains('PACKAGECONFIG
> <mailto:$%7b@bb.utils.contains('PACKAGECONFIG> ', 'resolved', 'true',
> 'false', d)} -a \

> +         ! ${@bb.utils.contains('PACKAGECONFIG
> <mailto:$%7b@bb.utils.contains('PACKAGECONFIG> ', 'gcrypt', 'true', 'false',
> d)} ]; then

> +                           PACKAGECONFIG_append = "gcrypt"

> +             fi

Isn't this too late? (I've not runtime tested this).

If you go the route of modifying PACKAGECONFIG automatically, I'd prefer
an anonymous python funtion doing this at the recipe processing stage.


> -SYSTEMD_PACKAGES = "${PN}-binfmt"

> -SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"

> +#SYSTEMD_PACKAGES = "${PN}-binfmt"

> +#SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"

> +SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt',
> '${PN}-binfmt', '', d)}
> <mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%20'$%7bPN%7d-bin
> fmt',%20'',%20d)%7d> "

> +SYSTEMD_SERVICE_${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG',
> 'binfmt', 'systemd-binfmt.service', '', d)}
> <mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%20'systemd-binfm
> t.service',%20'',%20d)%7d> "

This looks good, but should probably be a separate patch.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

