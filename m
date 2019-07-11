Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by mail.openembedded.org (Postfix) with ESMTP id BCB4E7EDD1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 07:53:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id r15so3372728lfm.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 00:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=fx1vWM/ac8DjCf2JG9RxeEGnpb2WIVWaIlb5LZWABNo=;
	b=qrF+eTxUgtdDVX9R+W9huR7kMSLvNplRdFQ3S6HRhhkmd1nJ+LBss1oKwcxQiVlkjk
	+iWTWHgLMtwKq5fzc9/tbBOSK3k1PSJauHIOgDTff2M+pr+SNUMpxFlifpOPtS0ox0Go
	SrmkpE8xCrQavgymwDV4KHQOq6oiFmaJCYt6aV+/lUyg+5jKuIEf+B9/e3xzcpAaCLMi
	g8Ma38vtUTZ1tzyJUuy1HNvTiHwDhNbut+0r35Jf2VAeU868YlBWlzY4Ylek1mhkPvNX
	fJsJoizOM4sNAQJoPI0y4+8j4BptiUL+HY456ur03KFMEIPaF0iq1yBoYceLqczg/+wJ
	OpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=fx1vWM/ac8DjCf2JG9RxeEGnpb2WIVWaIlb5LZWABNo=;
	b=AdRrHZEjNxRLwwoaQEiXO5itCdUV/0MkJeG49ANuKoQmyA3gOmFhQSHutzfSqu5PGv
	uyqhfIVdoVaRSnR+VRu3IX/GC+Tt+tb0E02NVfpODD78q0KVgl/1UV2XIIEe5Bat2Wnq
	oXj8AuRFeF//YCAtF1fYx05KFEVu8w+7fsXOxOsbjy7gMaHNBgZWU9NZ+QVorqRaUFLo
	N3zVPJYSQeR7+rtHnTiLW+uVNkn2UI66Dv6sGRDBrqSj00H6loCZy9EMneW4ADIuloYd
	7qrwLxyc1MIM3eDYislHJsWs5DK307axMv7yQufRvsVVLg1abSqrsZNM6JwU5Zc1fWeI
	DKkA==
X-Gm-Message-State: APjAAAWmZIdnTRAxCy9n68iR96o0xIhQEE0t7BDviUOs/nRLDj98lOu/
	vil9xS+UsyK+NfpOsaSOYbPVTCm6X39u9CFgua/5qmAmSOA=
X-Google-Smtp-Source: APXvYqyeB01QNBvLUyHcSdM709n0nW8tiSeeG8ut8y8dopnhRNH1RohFG46w6bsA8AbaftJKWf8d8ZwmY3Fdt/Lnbcg=
X-Received: by 2002:a19:641a:: with SMTP id y26mr1061688lfb.29.1562831625716; 
	Thu, 11 Jul 2019 00:53:45 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 11 Jul 2019 19:54:01 +1200
Message-ID: <CADySD0Emqv2BGzzfGETMAbC=URDR6O5yerU0bfzzLpFQrXuGRw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RDEPENDS libstdc++ error
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
X-List-Received-Date: Thu, 11 Jul 2019 07:53:46 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a third party tool which I was packaging in my image based upon Yocto 1.6

Now I am upgrading to Yocto 2.7 and the recipe which packages third
party tool is generating following error:

requires libstdc++.so.6(CXXABI_1.3), but no providers found in
RDEPENDS_test-util? [file-rdeps]
requires libstdc++.so.6(GLIBCXX_3.4), but no providers found in
RDEPENDS_test-util? [file-rdeps]

Is there a way to fix this without asking vendor to provide a new
version of tool?

Thanks
Ankur

