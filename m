Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 48F3B77CEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 17:43:08 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id x23so26500837wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=XsyUxX5q/+UOKXdSQqXUo4dZtdPmmY8zbnYNvioMqlU=;
	b=UGQB9W1YE4KbogB3wR3m7D2i5fH9HWyEAHjmrUnvKfat94S3QUzrija+vQi517o7Wl
	7LPAbs4xy0ko2dARkHNMRvj4T/NHcgEREOUn9i4pk4IIX+3ub/mkozJ2DqdU39lZdtsf
	k0gOh1e2PFkk769Rw5FPQ0g7F5y5il8CGkj6UdUssPyFAZ9dWt0m0emcSEbd50EfLxAK
	IVCsYay9kTrIsQF4jeAqeiMIAvjVltW8E44EFVWNWbz9tQVkkXKy4KWKA+M7IReipqFu
	KOK2zj4uNVlIsAIiQRGxd61AjPQP48dZ8ZSaMKNBUHnidvjA1mFchREEqE5mYiuviyv2
	vbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=XsyUxX5q/+UOKXdSQqXUo4dZtdPmmY8zbnYNvioMqlU=;
	b=jE5cjSzDrjDyWioxXPnT1eOiqzQIm06ssxLj0fLRHQWoy8nlLDFnhiZMVL5fkEanYr
	VOAeQD0gRqo0Kz5Quvvj/SWe06jafvSqoTprs2/bTPYtrkrYt+h0QQx4SZJk9t/5qGD3
	WU8/kSC2L6QHmB6j9jhyrc/cgKVCCpiUbPk5SF6GbhRHt7QKlNTuYEXNRWXB62pgepuJ
	GUmtyEV1TCG5e/4++Y3gx1TQCwAP/9AXslfv8+qEF594moCSkieTJAc6Pb6/C9qhh+27
	4Du/CK7UcdkQrphu29QZfdEwXLYhTz3dXscpUWsjayCDCfX6xTVPznBVL6G15qWGcE/K
	CIqg==
X-Gm-Message-State: AIVw110JVOdDSheb1StOa1XQpqynFqF+nTVBBw1Sn2QBN41GEntmjD24
	FqgmOGXCNtu5SxKNWZ4=
X-Received: by 10.28.54.217 with SMTP id y86mr8756412wmh.81.1499708589962;
	Mon, 10 Jul 2017 10:43:09 -0700 (PDT)
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com.
	[209.85.128.169]) by smtp.gmail.com with ESMTPSA id
	w198sm12856903wme.21.2017.07.10.10.43.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 10:43:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f169.google.com with SMTP id r103so148445624wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:43:08 -0700 (PDT)
X-Received: by 10.223.139.218 with SMTP id w26mr7561576wra.206.1499708588812; 
	Mon, 10 Jul 2017 10:43:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.73.84 with HTTP; Mon, 10 Jul 2017 10:43:07 -0700 (PDT)
In-Reply-To: <ee38977370db92520a2e0d81e76189be3661f787.1499294682.git.wei.tee.ng@intel.com>
References: <cover.1499294682.git.wei.tee.ng@intel.com>
	<ee38977370db92520a2e0d81e76189be3661f787.1499294682.git.wei.tee.ng@intel.com>
Date: Mon, 10 Jul 2017 14:43:07 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrfpfKumQpxZgyr46yZtNk08q12WfNYM73E+sn96CTx=w@mail.gmail.com>
Message-ID: <CAP9ODKrfpfKumQpxZgyr46yZtNk08q12WfNYM73E+sn96CTx=w@mail.gmail.com>
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] initramfs-framwork: module to support boot live image
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
X-List-Received-Date: Mon, 10 Jul 2017 17:43:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 6, 2017 at 3:28 PM,  <wei.tee.ng@intel.com> wrote:
> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
>
> setup-live module is a new module being introduced to integrate the
> functionality of init-live.sh into new scriptlet in order to
> support the live boot image. The udev-extraconf rdepends is being
> added to perform automounting. It gets to run before the rootfs
> and finish module.
>
> [YOCTO #11701]
>
> Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>

I think this patch could be squashed onto the first as it is required
for it to work.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

