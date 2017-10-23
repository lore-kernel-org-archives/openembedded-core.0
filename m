Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id E6325600BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 05:04:06 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id z11so16213462pfk.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 22:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=kV3Mn4vOth9QIAN96ZJEpaJIQprcG4mI7maZrYnaoeE=;
	b=iDerHAijeEj9xyOt3+COONXklj0Avune7yEkvwLpGxR5KZvX6TJOS4CMfOczu1bh0r
	U81yrrtx3RYyZon0jzTy6UiJRdvUvSVl1zV3pfeEM9/KOKyu3CJVVET0OwxBaRN4kDwD
	esd55O8wopKzQQvRTyqwGjW6+jLwdXpb4+aM06TglwgtCN34cTHskCCBkti5f4HiY2oy
	QuUF2mozZvMnED+nOCdRjf91SWGaRJmXS7q+QdQynsU6YhDFDIE8VVjwl8vOwfONhsbi
	Kt3UsWR8C/MUg+FupYaAB7uZLHKiNen3/Rr2SaXsBTbWuxW+KmAgt5CxQQXxzuQe2T3l
	VRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=kV3Mn4vOth9QIAN96ZJEpaJIQprcG4mI7maZrYnaoeE=;
	b=scbS5qKUqCCTijYX5CJrEGLw2K+cqekwRky6krAxsxW3lppcbb4yFCA1VHHDb5fW0R
	Q8irwysXyrLmzHgwlEZZzSzgt5uGWLqcQEGeTym9PuAEftOrzHX1XTvSnb3pOJ7fcZXN
	BYi4oP4VOj6sJrX2QFn3CtnEjOBRF4SfcXg/Mh1brs+HdPoIDJN7OghDfm6umzI0TsPJ
	QoxFX7TKrr/9EsKjIH7LSAIzOJ12b6KPt26R2cpS3oR0Vj52q/A0cpZEWmvkaEggJzUu
	1si5oHXB6X9DwwKI2SoYuFpE0Uj1ZL190OvtHWwYhnovst8M+4OR9ziSiG6cI4Na2ubP
	B2xw==
X-Gm-Message-State: AMCzsaW8mc2BY8XDpwOUps9ciKU7gGsO2GQbJ4M7uT6CYwJFr3LgGK3F
	R874SUxkeVaZW0bWBIpOtFXAUpSxCQRIN+JjBCgDRw==
X-Google-Smtp-Source: ABhQp+RaHgEeLeuNIOC6OhO5+rcZ5Xi3dV1VxIf29fEBqSJ33XO/mL3jFfaCEP6VPwKrRKHM/z/fBc0/mHcN+fDKe48=
X-Received: by 10.98.150.149 with SMTP id s21mr11866166pfk.151.1508735047997; 
	Sun, 22 Oct 2017 22:04:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Sun, 22 Oct 2017 22:03:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Oct 2017 22:03:37 -0700
Message-ID: <CAMKF1srGH8tNmFMvqRmV0jXQz+HAVwrXYw1v6EoZQZrb_poDrg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: devtool modify errors on second recipe
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
X-List-Received-Date: Mon, 23 Oct 2017 05:04:07 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Paul

I am seeing this errors message consistently since few weeks on master
when using
devtool modify

NOTE:   do_populate_sysroot: 100.0% sstate reuse(1 setscene, 0 scratch)
Traceback (most recent call last):
  File "/mnt/a/oe/sources/openembedded-core/scripts/devtool", line
331, in <module>
    ret = main()
  File "/mnt/a/oe/sources/openembedded-core/scripts/devtool", line 318, in main
    ret = args.func(args, config, basepath, workspace)
  File "/mnt/a/oe/sources/openembedded-core/scripts/lib/devtool/standard.py",
line 714, in modify
    initial_rev = _extract_source(srctree, args.keep_temp,
args.branch, False, config, basepath, workspace, args.fixed_setup, rd,
tinfoil)
  File "/mnt/a/oe/sources/openembedded-core/scripts/lib/devtool/standard.py",
line 545, in _extract_source
    with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:
FileNotFoundError: [Errno 2] No such file or directory:
'/mnt/a/oe/build/tmp/work/mips32r2-bec-linux-musl/dovecot/2.2.29-r0/devtooltmp-zjst6lsd/initial_rev'


This does not happen when I use it for first time but there after when
I try to modify the second recipe it shows up.

The setup hasn't changed so it use to work fine. Now as a workaround I
delete the workspace/
folder everytime I finish modifying a recipe but thats quite cumbersome

Thanks
-Khem

