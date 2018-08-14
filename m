Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 34AF478FD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:32:30 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id 8-v6so34806299oip.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7QNgZDSLmCaWEbOatTaptSPQItx51HKAdxWgFFSa25k=;
	b=QpKIlBXtcuWTV+vEgIl4qT/Xhe7TVKR25+unhFYhXRKJJL2PGTvHF/wI/S59lwWjGQ
	7UgSZAMqdbg8mQVJTmtI77/M5le3Alg1jOXMKcHKAgOYZTJxSrpqAIMny/jbKPGKnXUf
	1qwRGxAd+e8oV9ATaOEpU4tIJBTmd6MjzHJJ7zCXezI2qyTPOfnQ2gLFIUFixyD9It3J
	sCYarAW8n7bJPTJ1R+UTd03qfJMYL2tMeHPg7fYACeAoCXeM4hzm41Kw2clfBpCqk1at
	yWkpM4MGyTgq31VwTidW3np7JvKJUdZGTdG3zzr1jt95VBFZLPTIOuhWiYNocnARImjY
	0uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7QNgZDSLmCaWEbOatTaptSPQItx51HKAdxWgFFSa25k=;
	b=OBSz9s6g/56FQrkmfHnnEQbOQnJ67OZFaIgK3M91CcBsps/DfVtlN/R0vYqj/g4Skv
	AK1KtlzS2x0B01ppUc1vVzyRb056qgG7d3VN7hG4mljcTbnqqwGAQzzNvPRYI4SBRh9n
	y1nQADt8Uw1qkYKSv4eqEtTotqPh3VIuerd8N4ehbZqKtWvgVI5o7Mg811/nnutumrmM
	BMqNcCrGi/NSYjoXKUq4zv8rgm+u76ySzVQ+OFnHcDGntunfmCTA7Y9d2sYHp4MqLH25
	CJyxZtzON2qiKgS7eePxLtyqbTJwJEjptbUFpmXvkiss7vwEJnMIAmdHGtYFsf50BnKf
	V5VQ==
X-Gm-Message-State: AOUpUlFHLHj3NFI4Ay0+mBGv2QfJ790+alLQyCDiYMOWnLXfUfT/6a/v
	fP8E9QpmrK6zO4cmwH3WIqv7L0l6zJrmF57mqm173Q==
X-Google-Smtp-Source: AA+uWPz9Vv5+6tFF3lpn3DsI0xSJJAg2X8LDepY8I1y1MYTJKiLRSEDSSD6m40og1MZmmwsgd+M0twDhP5o1TRL9WqI=
X-Received: by 2002:aca:efd7:: with SMTP id
	n206-v6mr25204924oih.70.1534264351387; 
	Tue, 14 Aug 2018 09:32:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 09:32:10
	-0700 (PDT)
In-Reply-To: <CA+NJmkes2FzO3OvTVxjL075A5G_UMUjj_J-oc1BtjThTQ=YiZg@mail.gmail.com>
References: <CA+NJmkes2FzO3OvTVxjL075A5G_UMUjj_J-oc1BtjThTQ=YiZg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Aug 2018 17:32:10 +0100
Message-ID: <CAJTo0LaSOFApbGM6OpBWhkQUEdPk9qvXy-q+HWyiSVMku7G4=g@mail.gmail.com>
To: Isaac Nickaein <nickaein.i@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: iotop: failure, python module subprocess is missing
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
X-List-Received-Date: Tue, 14 Aug 2018 16:32:31 -0000
Content-Type: text/plain; charset="UTF-8"

Yes.  Should be a simple fix. :)

On 14 August 2018 at 17:27, Isaac Nickaein <nickaein.i@gmail.com> wrote:
> Hi,
>
> iotop built in my custom image complains about missing subprocess module:
>
>    root@colibri-imx7-emmc:~# iotop
>    No module named subprocess
>    To run an uninstalled copy of iotop,
>    launch iotop.py in the top directory
>    root@colibri-imx7-emmc:~#
>
> Shouldn't the iotop RDEPENDS on python-subprocess?
>
> I'm on rocko 2.4.2 with following recipe for iotop:
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/iotop/iotop_0.6.bb?h=rocko
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

