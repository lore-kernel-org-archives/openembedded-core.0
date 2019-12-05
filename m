Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5D86BDD2;
	Thu,  5 Dec 2019 03:10:49 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id k11so2120163qtm.3;
	Wed, 04 Dec 2019 19:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wkqPa6H32Rmmhj7rQX4inm5iRugHKDM5gxFf5ZrfksY=;
	b=iUBi4NdEydbq/AYWxvsn4JVJ3LouIBrpb0AmX3ylxciZ0Qlgf9G1T9YFCjWzBBEx4y
	X3KZy59aNrr3b06nwNn8BqWwIB3cwDtf7+AXnGybnTBzKjxQtGUziNm5VxJ34sG2Uw+2
	HPpLweJzPPjpjAs2kH4C/VpVCs4MnpVFFR6aXx1JTcZQchE9cWDhRBOOW9hQomN5S1ZI
	7zCYU1Rw5dBjoNfZz4TXe7AiVpBfywucKWlg6FCVi0yCmgPPlQWnoBvtv/7rfljAZQNt
	j6nyUYMQAD9i6Z/2R2qC3tOHQKsk+nCR14TG+D2R2Bt0nyvcf+nzrC30lW2H9Rsa/ZTA
	hzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wkqPa6H32Rmmhj7rQX4inm5iRugHKDM5gxFf5ZrfksY=;
	b=LA6vWcPwooeGR1Jz68E9Xm98wVkGTfrEaDZx6KqhAaJrrrzJ3B8p+LdUu03KFrj2vS
	l1gl6Gws80A2HQ7d+C9l5e7vOqsJvBiaCZL2yBU9YUNsCseCosuCbcf/iA28AqV0kBGQ
	luFcfB0K2ctho/e27tZWZfanVAgqk9LoOh8BPS5ibgWqeKhTi5SXOOvhtRS3LnKc/0z6
	E+8BpEmefK1mRPODpN9s8eDJWZ63pJprkPmZOS63jAr3Goomnd1lBp/Z6Ihjg0BqHwOM
	9swxwbnntqd2DzaJAs/Q48+Kgn/0/8Guzjs/30L2wHQoPJMId6Y3mc2A9XLDLdAZtxGV
	tzlA==
X-Gm-Message-State: APjAAAUTeOW0gqsJA4hk870JWehO9D5AhCRmPd8ns4HAACbFmthLqI6q
	y9yV+cJLkyt0/9QdizsP+rBUxnII2eyplEjptHE=
X-Google-Smtp-Source: APXvYqwr8LnVGjAqVHSA33RjVrLciflvbdVVaS5u4xmSgYNqe5cb7gYq62zuzZ285Vf0f96E7emP4MeiT723Rc/Fp8M=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr5914938qtq.53.1575515448583; 
	Wed, 04 Dec 2019 19:10:48 -0800 (PST)
MIME-Version: 1.0
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
	<9058755.I6fkynWszP@shodan>
In-Reply-To: <9058755.I6fkynWszP@shodan>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Dec 2019 19:10:22 -0800
Message-ID: <CAMKF1sqj8p1ErivXWMfddQpMKFgx6f_4uvgR58CQcy8GEGp3_A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core python minimum version requirement
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
X-List-Received-Date: Thu, 05 Dec 2019 03:10:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 4, 2019 at 6:08 PM Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> On Thursday, 5 December 2019 6:45:03 AM NZDT Richard Purdie wrote:
> > I just enabled hashequiv's server in local mode by default in poky.
> >
> > This causes an unintended side effect of requiring python 3.5 as the
> > minimum version.
> >
> > We had thought that the servers would be 'rare' and a 3.5 version
> > requirement for that was fine. It turns out a local server is also
> > extremely useful.
> >
> > The code needed the python 3.5 async support and trying to write it any
> > other way is a nightmare, we need that performance for the server.
> >
> > At this point I think we just give in and require python 3.5 as a
> > minimum. Any objections?
>
> Seems reasonable to me. Theoretically this should allow us to complete the
> subprocess cleanups as well (time permitting of course).
>
> FYI I came across repology.org which tells you the version of various packages
> in each distro, though it's not ideal:
>
>   https://repology.org/project/python/versions
>
> That seems to be missing a few distros, here's another entry:
>
>   https://repology.org/project/python3-defaults/versions
>
> For Ubuntu you have to go back to 14.04 to have 3.4; any others other than
> CentOS 7 that are as old we don't really support.
>

yeah and we bandaid centos7 anyway. So probably all is fine.

> There is also pkgs.org that I could have sworn used to support comparing
> package versions across distros but it doesn't seem to want to do it anymore.
> Distrowatch also tracks this per distro but only allows side-by-side
> comparisons across versions within a distro or only between two distros. I
> think in this instance we have the information we need though.
>
> Cheers,
> Paul
>
>
> --
>
> Paul Eggleton
> Intel System Software Products
>
>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture

