Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 76E876E650
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:31:33 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id b189so4643140wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 05:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ObNyzU1xxRw7IQ9EOI2Zy/Ot2p1GSkONaOzJfGSiwyE=;
	b=Bl7ifoJj9rD0QQcjIYs7L7K8Fyq7Pgr+DRsWqIeqextUzTgV/KdyHO4VAH97thwVqj
	ftHK4LsPdzPVZt/XUun1CS9owEEDrwtMF+nEqBTRM0cXWbRCVHwcd0b0LtH7D3P+X6Kc
	oUGqosunYmw3Uu/aplnMfWDHoxYQYo6qTvM3RgRCca9zI907YYaK9TipBr51ZbSoKK1H
	jlupwFebm8t3x8aBCDfX7+zV0+NXVLdSP+e+gFM5f1HZFKUkf/fwTikR/yIbRBammxtb
	mtciZwmMZvcKByELgrHfYEuH32aeQrf9CihlbSBih95aqpDW6qPurlvOT8j+2KauIKmT
	YSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ObNyzU1xxRw7IQ9EOI2Zy/Ot2p1GSkONaOzJfGSiwyE=;
	b=NpLJajt/8HCfvyq6hgOVPnznCjkjg3sEztqCh8AMc/MzpkP0HpNNt8o+yNqwbIaF+r
	fynpQXef20e030mad+OKn21Jw1WTtqTGLSEjIZ/jXoRlqco7SYrPQ0X0nUmf52FQt9Md
	X1xCXk79+wXghB77mpHPHHVdBOPt9TiDaR9pmsGlUW46vFvTls42VCFQ4iOFGb5RbUf9
	mNMYQYcG5I3dNicTyGQihBw20gxEYG5RVNVeX6ml3xapfLf5JgwHQS6BGzK6SLJEmcig
	j2G05ZwHFr1dqSwX889UdgO7ppy6yBh4x1tg1kvLvq2h8RS14qAGZ72RATACwyIx8YLQ
	wFKg==
X-Gm-Message-State: AMCzsaV7fcYwDcvJDBjvDfOJRMWvVDiYgrB2DHv/Y3ZzZ62EJs2qBpRt
	cJj+8x717KtTybGl9VVu1N8kiksdgGLqJfxc5oDsvw==
X-Google-Smtp-Source: AOwi7QD2uaHyc0Q4Nezq2gIZfgZ1WN41anTOfEsISmcvOC73RfKKN31u6S9LJ6biNimib6QD3WZlLFrLwqprkxPaHUE=
X-Received: by 10.223.136.85 with SMTP id e21mr11268425wre.37.1507638695032;
	Tue, 10 Oct 2017 05:31:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.131 with HTTP; Tue, 10 Oct 2017 05:31:14 -0700 (PDT)
In-Reply-To: <33c05071-504f-897e-48d7-c3e6ddaefaaa@linux.intel.com>
References: <20171010120012.20163-1-oystwa@gmail.com>
	<33c05071-504f-897e-48d7-c3e6ddaefaaa@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 10 Oct 2017 14:31:14 +0200
Message-ID: <CAD4b0_JXtK+3RxhNKG-yP8nb_hCLdt+vO_58H1p1jXSc5Striw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: =?UTF-8?Q?=C3=98ystein_Walle?= <ow@datarespons.no>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: fix typo in toolchain file
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
X-List-Received-Date: Tue, 10 Oct 2017 12:31:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 2:25 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/10/2017 03:00 PM, =C3=98ystein Walle wrote:
>
>> -set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
>> +set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
>
>
> Where is the typo and what is it, exactly?

-set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )

missing _ between CMAKE and ASM


--=20
Maciej Borzecki
RnDity

