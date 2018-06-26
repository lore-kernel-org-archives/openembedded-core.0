Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 41A5374775
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 15:07:35 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id c15-v6so19419954otl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 08:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hx5jhUolFgBBxHnGVanALBRsfcKzJOMOt0eGcSqcPLI=;
	b=o1q755JpGLifS9lRuQ5k4XlvUfB0Ol7+LBTvk8wHFUw4r4Ul1/1LZipHX1x7Ww4iZ1
	mtUj+27PX3byOq8kRoo35bOK3gQ2L8JLiZkaMRvnaTyn43hE8sch/PcPP1WcVRj5S+aI
	ZA/K9vfMSNCbQVmFD92ml4NgNuo87vd6alhBFGQOPh7ODfN87oHDRPrOGk4kOxCorqrN
	ecfm14ZMmEfxZ9gpcznAOwxdvc5RcBRqYoF5KdZzqSWJImY+nAiFEPRDt+GdQ4lyf2/E
	j9TE/pbuPqa5TrvAY19puaxsUyolnRkYcO3t1zwlTUY5I01lUhavrjTloJwZdFyhnEB5
	yNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hx5jhUolFgBBxHnGVanALBRsfcKzJOMOt0eGcSqcPLI=;
	b=AduejTsxaTOoRrTs8eC056gYvM+rZ0UfTJZEllGSKYv4eWlC7sUWl0QM3OJSVF/UlA
	JzzEHcvjgvSkTNRgp7lMnJueCc5jPNc8/W5DNnd1FNLWd+gaY6+1K63RRpGQMxnDba35
	vIBE51fPVpyyqolZm9IL9a2bFWP1u07nyPcXZw/fQdR3IVBqZGMiMxp5+pNu6BaFUrn4
	sqzsT5sOVcIyOk55r7DQ80tMUqf1nqCLX+WZxZlFGML1e71U4rzx2cqI4hu/w5acxVH7
	cLvmk7FG+ZyM1pAjv+Aat7ZGG40K3DJdTdcaTul27d0dHKh5bx9auu5OfLLBormHJxHR
	qHGg==
X-Gm-Message-State: APt69E2P49Ly0fp1pV2GmexFUbVvCaP0ctUA4YhTN0QznPKMMIlhs8EF
	aYoLaZPaRu0AGXPYxh/0AoQsejYTDKVlRI8MxZQ=
X-Google-Smtp-Source: AAOMgpdZc5ASIliYjSrswMwx89TrPjZsb4TvHAzzLriSjzExsdj2nO2Hcel62kir9cVYF4WqKqV3SMq/m2eKhQsPFXQ=
X-Received: by 2002:a9d:3010:: with SMTP id
	d16-v6mr1007198otc.23.1530025656188; 
	Tue, 26 Jun 2018 08:07:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 08:07:35
	-0700 (PDT)
In-Reply-To: <CABPh3UMZTQwbOhJc0MN9HOg4hThYqG5tcg-sS7OhFjbgrPAhww@mail.gmail.com>
References: <CABPh3UMZTQwbOhJc0MN9HOg4hThYqG5tcg-sS7OhFjbgrPAhww@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Jun 2018 17:07:35 +0200
Message-ID: <CANNYZj_M=6Ku76j2y=fvdEyN2xvv=8avg4NK-zmg9gs5Ur5nXw@mail.gmail.com>
To: nick83ola <nick83ola@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [HELP] ptest & ptest
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
X-List-Received-Date: Tue, 26 Jun 2018 15:07:35 -0000
Content-Type: text/plain; charset="UTF-8"

The Yocto documentation has general information:

https://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest

Alex


2018-06-26 14:57 GMT+02:00 nick83ola <nick83ola@gmail.com>:
> Hi all,
>
> I have a python3 package that launch a py.test test suite from
> setup.py and I have created a recipe for it using setuptools3
>
> Anyone has some hint about how to add a ptest target to run the tests
> into the final image (or better in a qemu test image)?
>
> there are some recipe/documentation that I can look at about creating
> -ptest target for python packages?
>
> Regards
> Nicola Lunghi
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

