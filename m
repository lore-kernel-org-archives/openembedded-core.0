Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA0778A37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 06:57:11 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id d19-v6so5862238oti.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 23:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+ASLt/fOvYzhwwLMqjWvlWhww0h+IAqdQmmZgiworHA=;
	b=uPyvInL4wvDB+lgdhwoChOvcTxpMkoNaI3IFoRn0iZX/fJhHSZpxLVWIN86JeL3mYa
	XFI2Pf+L4ffz3IiBW2iPvugyPWHvGISHG1CRwSrqDEwfTqyuwsAveeKXTJNtyrotVcph
	3V8nEtQ0QXMGrJgjUfw5l6EUuCLUlF1SLlIGOgzgxgzbPxvRRKZoBMkmAl10MyxeqFdP
	EvdwOg0UzBxz1ZR/ktHJIyF+j/czS1s8UjHOSqVflDB8eKq65A2eTUog04a5e5I1xbR5
	ISZGcWyCDE/U7NoTRfBj6GamDkg8jfmDbyccs125ALqg4ZTiQvch6yIQwvBtdf5B+L/x
	2fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+ASLt/fOvYzhwwLMqjWvlWhww0h+IAqdQmmZgiworHA=;
	b=T4ShWeeZ+X7PKhS5DgoyQ/qsko8Ik8hlIzN6IPWsShLy2EMSISvhW2ZMj4ACJbWrrx
	m/4j6R0QCPVIm4Yyj2/kz01QIr4SdnPNoqwXBq9e+fD/uFPzavYDFmFp+urPbINxkho6
	Qbw3Ny1imG/D4oXlkHftfvJYMfvSDPFvpopd3MZNZyKW9SLY9rHxnDL6uhEjLKzrgtks
	pGqajHbq2sEZbsISz5wShGrYvbdhINWKJCg+bSSyZVUlArU+T5vCY7vUH/OBMyLC1+4C
	UN786oFo5dPypKIjl9IHhWWTKt50hZPcV1PuqRzb1pZQbJZ1LfThdR+ItmH5o6O/qqZC
	IhjA==
X-Gm-Message-State: APt69E1+K30s85tf+7q40f0/2mr75Tcc9/y1d+zWUvzYO4fyyyzW7fmw
	R+6Fp4M9dXDYMOQuOktfHBVnPXNvhLveRn+KW3I=
X-Google-Smtp-Source: ADUXVKKSlZoeXgIwmX/2gBRztuwRvDoFf27vN/ebdTG5y7PTZBye3jYKj/SOSh0s+I5H99lNFOePXGmUTNOQ3pAUdvA=
X-Received: by 2002:a9d:3010:: with SMTP id d16-v6mr604957otc.23.1528959432689;
	Wed, 13 Jun 2018 23:57:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 23:57:12
	-0700 (PDT)
In-Reply-To: <0273521858960b5e6bc63bd83284115dc97a566f.1528951773.git.Qi.Chen@windriver.com>
References: <cover.1528951773.git.Qi.Chen@windriver.com>
	<0273521858960b5e6bc63bd83284115dc97a566f.1528951773.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Jun 2018 09:57:12 +0300
Message-ID: <CANNYZj_Lj=bieGAFpzSU+U0TWKJyfiyL5r8OtgC+brYGVFn=fA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa/runtime/cases/rpm.py: change to use base-passwd-doc
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
X-List-Received-Date: Thu, 14 Jun 2018 06:57:11 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-14 7:52 GMT+03:00 Chen Qi <Qi.Chen@windriver.com>:
> The test cases assume that rpm-doc is built out, as it says it its
> comment. This is not always true. And it sometimes results in
> following error.
>
>   |     cls.tc.target.copyTo(test_file, dst)
>   | UnboundLocalError: local variable 'test_file' referenced before assignment

Wait, you need to explain this further. What is the situation when it
isn't true?

Alex

