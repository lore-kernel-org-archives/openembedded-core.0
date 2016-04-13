Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id F0C6D6010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 23:58:15 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id a140so124784207wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 16:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=3J5Y6RuFmwr55Lb0Z7mz3FUoNmrEZK/DKFiZydZWJD8=;
	b=aZxyYEjq81RvW08ESoMEtjq76Xy1SvhBc09EvyAl0pAq42FXfxsO9z5zA96485UL2v
	Ak6rrUrqQb1lQO3wNS5aPQ1ej5j+WDOuynqKJaYbNW2JF32an70RsSkN+Iqc7gG+CFz3
	szNCliaNNbpCxHGQF6z9/aZMZKzw8S3RuO7IkkGO7cp4Ss9eR+jEt5K7iB+N7ffhSY/G
	dTCm1I7MV0eUjkSuz7cMm/yL+bzcdlaBRdzUjcrR+1ejvtX9cWWEbJ/XvaCm0d+UZzTQ
	jTwEXS+RI3DM/i8b1GQ+S0OspJFDBCd7PkEAWIjkVrOWg2163NtpM6fRRVPZk9UZYfsb
	fI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=3J5Y6RuFmwr55Lb0Z7mz3FUoNmrEZK/DKFiZydZWJD8=;
	b=W+dEHmPzx/8JzNcEV/mIvXfwWxePhP0Zqwh09JSRe9YZJtd9crnHBlfjs0/IZ5g0aM
	D3G2ADqKtyIrO5F0jDppWYh9KGlYY1FJ24okquUo+/OOTU00ImBVgQHy0IcVgNvSzTPg
	nu+bS97Ast4MAQayW/6KvrCPLbJGwjzxPuNTG9ehFR+pkQrb6VzBd6ONRGAICTyHNtv9
	/lFe9O8qstaeGm+W4GbfpGMycKiNHKx0jTpJPkdn8sNTUbhX1xll2Ut6fcebw55oFk5r
	acY1JZpLaRryjiYQmqFp1C0IcWZ5RzzAcTSxGvqJQ2JSJtrOOir9rztIK1rSm+GhdKHx
	Sruw==
X-Gm-Message-State: AOPr4FWBMoolIkkH8gOmIyUOjeUuRJf06qeajmHInHTfsKwbBg1jOMUkrSZZvrlXb5FMd4vZopUtL30FaMubsg==
MIME-Version: 1.0
X-Received: by 10.28.138.196 with SMTP id m187mr12741026wmd.61.1460591896088; 
	Wed, 13 Apr 2016 16:58:16 -0700 (PDT)
Received: by 10.194.235.3 with HTTP; Wed, 13 Apr 2016 16:58:16 -0700 (PDT)
Date: Wed, 13 Apr 2016 16:58:16 -0700
Message-ID: <CAJ86T=VDX8QpecxVbjEJNyxiymp9CeqcqYXV2-ARTML4ZdiAjw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Warnings from autotools_copy_aclocals()
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
X-List-Received-Date: Wed, 13 Apr 2016 23:58:16 -0000
Content-Type: text/plain; charset=UTF-8

Does anyone else see these type of warnings from
autotools_copy_aclocals()? I don't remember exactly when they started
(a few months ago at least, maybe more).

  WARNING: gmp-4.2.1-r0 do_configure:
/.../build-dcx960-debug/tmp/sstate-control/manifest-dcx960-debug-glibc-initial.populate_sysroot
not found
  WARNING: gmp-4.2.1-r0 do_configure:
/.../build-dcx960-debug/tmp/sstate-control/manifest-dcx960-debug-libgcc-initial.populate_sysroot
not found

