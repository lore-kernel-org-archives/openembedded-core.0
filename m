Return-Path: <msm-oss@mcclintock.net>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9906F77C28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:33:39 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 197so9118744pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B7nTyPtAYEzulVDdCMLluI1PAf4l1sBHAPwxwlqPlfQ=;
	b=ayTjk3SSCx/s+SXGfwwAxE7qTqeYzoTP9EnXbrl8JTUyIFmDnijLUxm79/+syDvi0H
	zq1AuzkSsiBnVjUiizUkMgBPCG4rDd1kGC+BJ4v3/ZwT8/4Jh72dC+djHjtw8oTQrJ0+
	VicwtZEcN/gwWR2LLpKSNcGt0/bsIGB/eewc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B7nTyPtAYEzulVDdCMLluI1PAf4l1sBHAPwxwlqPlfQ=;
	b=CygyYQ6hn8XhoRMCJhJw4M+eRteyReiohFDuim0YwxbfSdXCT6eBgrL/PjsIr3UB/W
	e/qwzlrMKYQxkI2fZd9nib+mheY32egbO3vXHoqh4fqM6BCEGFOWllyfs4iArhwiO2Lt
	In1qUM6PZbFlgSh9qVygBFVvGcDwCYXWrE5/I2UzryBCZK4dJAEHVQmicGSY2/5VKuqH
	IP6RN+raaTO2AZprBj+EKxNeRtVMtxHgxeDXnsOzW1ZhBf7jOY23PfUZclsA+5+CEPQF
	ZcnM+DiooZ55pvqQOE+/urezmTdMyqoaY6kLY/rqaGvJx0tJs3skIOV4XJUFCe0oyVUI
	FTAg==
X-Gm-Message-State: AFeK/H1GZPpPkrW+C11U+PrMehPmLTyGkk19Hes0ZmVtK6MINekdMNx01hwFCOsM9NR46VVZGi2WAILdImodOQ==
X-Received: by 10.99.60.70 with SMTP id i6mr30829751pgn.231.1491406420391;
	Wed, 05 Apr 2017 08:33:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.153.197 with HTTP; Wed, 5 Apr 2017 08:33:19 -0700 (PDT)
In-Reply-To: <CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
References: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
	<CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
From: Matthew McClintock <msm-oss@mcclintock.net>
Date: Wed, 5 Apr 2017 10:33:19 -0500
Message-ID: <CAEsOVNencj+9iW4xnqAUTzJAZ1_W=o8-N2-S6x0fr2pB-YJd9g@mail.gmail.com>
To: Ravi chandra reddy <vlsireddy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe [patch] modification to generate a static library instead of shared library
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
X-List-Received-Date: Wed, 05 Apr 2017 15:33:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 5, 2017 at 10:18 AM, Ravi chandra reddy <vlsireddy@gmail.com> wrote:
> Hi All,
>           I am using meta-oe to generate libxml2 library using AARCH64
> compiler. However it generates shared object [.so] library.
>
> is there any setting in recipe to modify this, to generate static library
> [instead of shared library]
>
> if so, please point me to the recipe/file to change.
>
> if not, i will try to add it as patch, plz point me to appropriate files to
> change

Is the ${PN}-staticdev package getting generated for you?

-M

