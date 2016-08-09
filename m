Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6557D771C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 13:01:08 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id u13so918139uau.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=GSqA2EB7ozKuB/rRD8QDpdsjdDeZkv/50W2ynbOea/0=;
	b=OQlxp96JbSN1b4pgVso+K5YtxKJp8mu9Too1vKOCFVrYd8LPqOENiGc07ezm78YLKa
	tAthw5xZNPOcte/QbeiO7dlH3ELDp9AzZryKzov66aNYOBjbq+lIIHqex2YBm05oH3ng
	tpKZ0KxkQ26GuTks0KJr4XF6fyD44RWC3DGfNtpJ38Wdjp7cQFoifirB6yK+DcRFU8E3
	Z66OcFE+K3j9Gnck0/E6dtpgI+fenCMxbmJzvOveXutlZTJyMdCWAnUGLb/QbTQUVC/C
	YKWRpSBj1iPmDiBnJ+GBi0G2Z4RfkSbeoBHJzBe4YlC6F2WnsTDp4ELJrhzwK3SxT6h9
	98fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=GSqA2EB7ozKuB/rRD8QDpdsjdDeZkv/50W2ynbOea/0=;
	b=ess/OSdF0l9cBpwwTiRAEOA6UpNAXptjpDK1l950U9mQ2ow9eBAWOWXCBkYeUi6c20
	6UkKX5zQ88KeVB94CiYx9xZWAXiQKrBJOeqzjlJkyiETaGagjUz/5ZIoQwkSDqTU3prp
	ggNFnDK62QUguvDSSUJmO9IOIU0XscmCqJROLEbYtQhRKJyPYDAhecTW2AExr4lZjmXa
	lxWS0TytgAn+Cxd30Qh6X8xZPVNFplYxPQwWBqYGORUaaDTHyn59QqGzCWTr+Aa36/Xm
	/MhPka612XkBDq9ue38c+ovAYVyKhmoxEnxlo9aN+uj32BWJhM7a5jc8DYdFM4y9LkQ5
	ibZw==
X-Gm-Message-State: AEkoousrKJOpewJlAF7g+b/Ju7E3HMcjaqqHdVxS8bAEi0YAnFoDGvapkL3Uwod5+31iKw==
X-Received: by 10.31.188.203 with SMTP id m194mr51648780vkf.120.1470747669510; 
	Tue, 09 Aug 2016 06:01:09 -0700 (PDT)
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com.
	[209.85.217.178]) by smtp.gmail.com with ESMTPSA id
	l36sm6552806ual.19.2016.08.09.06.01.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Aug 2016 06:01:07 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f178.google.com with SMTP id k90so18112928uak.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 06:01:07 -0700 (PDT)
X-Received: by 10.159.36.108 with SMTP id 99mr1080910uaq.79.1470747666924;
	Tue, 09 Aug 2016 06:01:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Tue, 9 Aug 2016 06:01:06 -0700 (PDT)
In-Reply-To: <AMSPR04MB309A834D90712D16444EDE5E21C0@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <1470671116-1997-1-git-send-email-tom.hochstein@nxp.com>
	<CAJTo0LaWyLEPg5S3=B=H_Gb4XNuhgiAqYMMgOBdf3JRHuE0FMQ@mail.gmail.com>
	<AMSPR04MB309A834D90712D16444EDE5E21C0@AMSPR04MB309.eurprd04.prod.outlook.com>
Date: Tue, 9 Aug 2016 10:01:06 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrxraeGxYKk1UtBXSGkPMULyvHdTo=k86+x5Sc7o0roAQ@mail.gmail.com>
Message-ID: <CAP9ODKrxraeGxYKk1UtBXSGkPMULyvHdTo=k86+x5Sc7o0roAQ@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH] mesa-demos: Fix OpenGL ES configurability
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
X-List-Received-Date: Tue, 09 Aug 2016 13:01:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 9, 2016 at 8:43 AM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> No, master does not need this fix. The problematic patch
> 0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch does not
> exist on master because the underlying issue was addressed upstream (without
> introducing this bug).

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

