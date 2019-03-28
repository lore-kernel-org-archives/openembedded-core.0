Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 25D627D088
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 14:38:01 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id w18so6347340itj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qbFemevEd1KNiTBsYu6y/54TAaG+W15lZ888AjvKqLk=;
	b=BpUk1x9bQlr9S45g3q0hzFoixHTmHfTRLPs8plr1HbmlFQxxmKrjVAcoqJOSko3+Bq
	KlgF6acDe922MD6JRg09vYa3bTdnW6kICC3pdnapp3i7sqQjDpDhdGYUt3OkR2d9g+4H
	FOKb1bCm8Nro2+urRfwE/fORRzC5JcCluopBEiz8zW2z/hI+WuhyYAeLcfEJkhRK2qbs
	a+ekc20ZpU6voElsKjSISD6U74j+GkUKRxnpdQMvG65Ta6u3VxOCD+MkkncDrziZYQjp
	EkFcpJK7j+73Pat/8l+j3LDA80L1XQUprN+RRDt/G3pY44umaZA3C7TUpxrqDgS6Wgd1
	maZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qbFemevEd1KNiTBsYu6y/54TAaG+W15lZ888AjvKqLk=;
	b=V5HG/c9361RomrL4BPQTY4kTOiGQJAhWb0BkdXDY0OqBGKPpdDI/A8tUIXwPCniqvP
	h5FtUegQmDM1z6CiRInIiMrvqskp8Pz1kPeaDFUpeo0bp9nnOpBygAmTvD556OFIVTRO
	rhp0m3RftX1tYtbL6jmA7jGx2COlYsmVaRJ5Qq/TAp8+VyjI6k+UaD+sRKXX8cIxrECC
	OJQkZE8FqdEOsQapbQ+hWUXn/DRdvgjYbC998MsZWD6LhI6VqkF2MoahRsaq/qhot71O
	z7usPRwSXEDXs0MQbgd3AXacB3fqwxH2L0ea02V5yKS953fXCRmi9mm+nTH0FVwMmip3
	NXxA==
X-Gm-Message-State: APjAAAWkSwzOKlgMfHEKY4vTrp7zmnMni72ki5UgSLF1RTnvzOFbsff5
	iN78DOKs9YKLXN71SbXNduR5VMmIlFHs/2zYDbY6Ww==
X-Google-Smtp-Source: APXvYqxDBaTlnn47RHJC4Vs+EJgA4WNMMzoQaZaOHhsbiIjOLKM4aG36COgCCDzb+I1ooQjO5zBLgYDMCJUlx1Sbyg0=
X-Received: by 2002:a02:c955:: with SMTP id u21mr14960634jao.105.1553783883139;
	Thu, 28 Mar 2019 07:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553775186.git.Qi.Chen@windriver.com>
	<a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
	<CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
	<CAJTo0La3fza0yn=dcWYWjSh00oJD1NQg8UMDOYSN0w_y4qODXw@mail.gmail.com>
	<CAJTo0LYwZ0WNNsA0Wm+uzAsuAHHiRzKOE=aGZZOkRfa56Furpg@mail.gmail.com>
	<20190328134644.GK18421@bill-the-cat>
	<CAJTo0LYw1UPfhZy0oJZ5+D=nL0THTaFF4M-1gR8YdqGykB-JmQ@mail.gmail.com>
	<CANNYZj-qn9M=hrJoAh-U7SpiUqZ5v2ctC5AzBKM0yoDkT8q6pw@mail.gmail.com>
In-Reply-To: <CANNYZj-qn9M=hrJoAh-U7SpiUqZ5v2ctC5AzBKM0yoDkT8q6pw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Mar 2019 14:37:51 +0000
Message-ID: <CAJTo0LbbBNLREOnAUL__BVzcXOG+z2yNgOCFHcB+9H5jThgemA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] binutils: fix PV to respect upstream tag and also cve database
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
X-List-Received-Date: Thu, 28 Mar 2019 14:38:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2019 at 14:08, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> The tag and version upstream are both 2.32. It's Khem who declared PV
> to be 2.32.0 :)

Yes I noticed that after sending.  Let's ask Khem nicely to use the
right version. :)

Ross

