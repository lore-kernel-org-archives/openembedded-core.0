Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 627E978243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 20:36:57 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y43so11021338wrd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=jBB8s1tfkSoaFW9V7mjbfSu11GRu6Z4ryvv5ghXPTkE=;
	b=pR/nIO2cVXHCPLcSiSihP2vqVuzUWjWn+C4phieDjeUz47rG12xeR2x4wI8YDy7lUg
	pPEL14JuWcpp+hD88G/thtPgb8gcQ5eEbczCLt0jt3f1LuDsSdyTG3SQRWGmq1GOt3x9
	ZdKEwduwaYtXsy2DS4Pp6sOoF3J3mYi3uLP8pCysUzQ5RgOK70O1MMaO2MBK/8uu4Inb
	a5jXiMlSOc47wMY+MjPeZybPXerZf0mKyquJ5X24dfjA4J5vdtI0W9I2Vmu6DZ8azqTQ
	HyGwzPiWrURzl6XfwdrF0fH9YrSH/5yurMsay2pnObMNbw/LYuajrEBe3Vxw7QpRjetm
	Kxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=jBB8s1tfkSoaFW9V7mjbfSu11GRu6Z4ryvv5ghXPTkE=;
	b=H6x84nxq7o44PauCf/v9lRcXxJSzf/hDfM59y/1yTL9sTW/fku7CgcGU8dj8HJxHkI
	s5FJwjkkAFkqWifsutQkAwJFxv7u8oTD/W0A0zT4Q9HcVgXhtEPQSidIr2jVXtIdePSU
	6uqYVwo70HUw4H2bneg3fT6yEpAOp4m4hnt1YG0VIzRHQfmDDeRasiCkgJQEsmPsUl5S
	yii+vra5vEM3Ffpopj/980+RDZXfAuesePceWxJwWoMXr8oU8f9Dyt3heGzjxtoOIACF
	5Z0EQLVJrpPkCGmsCbVHTbFEXlsJI2yKcqsjJ/ENknpgQb2vYW/XNccwp5iHDRiyDpGm
	5AMw==
X-Gm-Message-State: AIVw111v89Ua4DQOBxFF6TYeMun5/79oD1liRf/PvDWOpC3vUXmrfcuH
	T6dlyibUOlMNZI2Wgeg=
X-Received: by 10.223.158.133 with SMTP id a5mr7847289wrf.188.1500583018058;
	Thu, 20 Jul 2017 13:36:58 -0700 (PDT)
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com.
	[74.125.82.49]) by smtp.gmail.com with ESMTPSA id
	p63sm3410272wrb.75.2017.07.20.13.36.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 13:36:57 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f49.google.com with SMTP id v139so231593wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:36:56 -0700 (PDT)
X-Received: by 10.28.126.8 with SMTP id z8mr3393743wmc.46.1500583016740; Thu,
	20 Jul 2017 13:36:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.198.141 with HTTP; Thu, 20 Jul 2017 13:36:55 -0700 (PDT)
In-Reply-To: <CAJTo0Lb8YFtgzfX5m+0mBo52Opc7ayzThQFuxcHDqbVKV1qmCA@mail.gmail.com>
References: <20170717184050.5474-1-otavio@ossystems.com.br>
	<CAJTo0La-FM3ThuMWJPB4riFf1QLeq0Vd=cRJ_DBjrCCbOCV4Vw@mail.gmail.com>
	<CAJTo0LapT9NrznbPkFYoVmLcQwVMArSjGT0vFjJ0Z-7x-TvWBw@mail.gmail.com>
	<CAMKF1spheC7ODGgJ3FeBUiUfDDLH=K1SFJ1=Vr8odT55Q4WTuQ@mail.gmail.com>
	<CAP9ODKo3H0WUp1T3jQK6qANHMhHLgX5T7cR9HLmmXPJnwpj7FQ@mail.gmail.com>
	<CAP71WjyVmM=a3rpoGm+CoyERx2=q60sHhT-TanoXHxEef_o6PQ@mail.gmail.com>
	<CAJTo0Lb8YFtgzfX5m+0mBo52Opc7ayzThQFuxcHDqbVKV1qmCA@mail.gmail.com>
Date: Thu, 20 Jul 2017 17:36:55 -0300
X-Gmail-Original-Message-ID: <CAP9ODKreV8ydJ30cWn3C-FeQ-O5uNt-6qp9vB28F1DSFfMW5eQ@mail.gmail.com>
Message-ID: <CAP9ODKreV8ydJ30cWn3C-FeQ-O5uNt-6qp9vB28F1DSFfMW5eQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 17.1.5 release
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
X-List-Received-Date: Thu, 20 Jul 2017 20:36:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 5:25 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 July 2017 at 21:14, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
>>
>> It built fine for me (OE-core/nodistro + meta-qcom) with and without
>> pkg-config installed on the host.
>
>
> Yeah it's not that, mesa builds fine for intel-corei7 on my machine, but
> fails with qemuppc.
>
> libdrm isn't generating a libdrm_intel if I build for qemuppc.  Maybe it's
> looking for kernel bits that are disabled in our latest kernels?

My understanding was that mesa was going to include those headers and
stop requiring libdrm-intel. I don't recall if it made into 17.1 or it
is master development.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

