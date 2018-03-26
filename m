Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 960A471C9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 12:40:47 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id e98-v6so10538819itd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fpqzza+aZcIBUUwNa94VYauFHK/uCT1l34uaa5iGNY8=;
	b=kD0SGxhJjT3fegXwOaGSIkUg5Oy+riJhw1qtiRnwS98BV/LMd6KAJ7cgbWb4XB/HGI
	RAIIDCvN3aEXYLv+LsUH1LhhBbNglxYLN6jVMUl8nIy1sRZZDYWnz0NdooUHaweO9mrQ
	afJeCl2ZhkhP5dXO2SxkymVNksjDgeRrbNq+dHV1lVuXFbSFVPcKy3hehkERl0m7DNa1
	9RpevsMbaS56UCX/wMCrdyxpERxLYvIoydiY/Zb1Shjh+GEi+oZOVlGDzJ6tunx2Xfbd
	V1IRX845zKxRgPzSTCB2APJZZ43/lJDGxlbMONRicKaXAaEN5eJqr/gkZeghAzqK6J8o
	7iIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fpqzza+aZcIBUUwNa94VYauFHK/uCT1l34uaa5iGNY8=;
	b=J+/xJjq3pmFnxCL+/kzppOfCkIqXKmhsn0PnIjMlNkLyL6Rky3RU628MbYseUKuq9K
	G+8SgAJb3phQx4FWgQAdLZtpiEOrsjqDozw5xUz+chEcrsusqwVET35r9SEgBIcCDGw1
	c4YGHcamKO5oQSBbmvQ122lp3e2vuJrIWg8quZoJQX5CGbUL7jSjRhlWrYILE7p4Tl87
	wadKrBHmjjbTn9nT6STTcZUrGUdsj8SlcOmlZq9zVDe+YJ2tWgtYmSLa/Mxbfh+G7DKQ
	cdLo3WjPFjWWd3V3jC/9oLudpH7MTHUznyuIX/dBpe1LiYxxY/Ij3abcssO8sv/C6Hn2
	C7Lg==
X-Gm-Message-State: AElRT7Ex0clKux/bXSjIoduQSZnVJ7ay99G52jnD7EKaB2qU+MbVAlco
	FWx3R7zygXlueyBXRb1K4ZBq6j+puW38I2rKlGm29A==
X-Google-Smtp-Source: AIpwx49SqgiZyCRECI+Wyh7BxcG13quykKRX6E3FNherAzCHk+rmSvEHVSVdg8vX8IZm/+qn51VQlZeiHMvaBS92vkg=
X-Received: by 2002:a24:1f15:: with SMTP id
	d21-v6mr15713018itd.45.1522068048595; 
	Mon, 26 Mar 2018 05:40:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 26 Mar 2018 05:40:28 -0700 (PDT)
In-Reply-To: <VI1PR0701MB2814121932475233E7F689C890AD0@VI1PR0701MB2814.eurprd07.prod.outlook.com>
References: <VI1PR0701MB2814121932475233E7F689C890AD0@VI1PR0701MB2814.eurprd07.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Mar 2018 13:40:28 +0100
Message-ID: <CAJTo0LZHEmkYX-z-=vq3zAUmGOWRPAUsN-thcyFB4TGruEuLBA@mail.gmail.com>
To: "Geller, Nir" <nir.geller@servotronix.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: multilib - python3 vs. lib32-python3 - bitbake core-image-minimal fails
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
X-List-Received-Date: Mon, 26 Mar 2018 12:40:47 -0000
Content-Type: text/plain; charset="UTF-8"

On 26 March 2018 at 13:04, Geller, Nir <nir.geller@servotronix.com> wrote:
> I understand that there's a conflict regarding the installation of
> /usr/bin/python3.5m-config between python3 and lib32-python3, but I have no
> idea how to solve it.

You only need python*-config when building stuff, so I'd change the
packaging so that it is in ${PN}-dev, which you can then not install.

Ross

