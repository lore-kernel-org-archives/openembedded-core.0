Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id BD04E7C75F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 15:49:10 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id g1so17160772otj.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C/L5HlU5pDKXvFAnTQHITK8tHHwk0cICvOaStvC5Apo=;
	b=Lb33iMyUYtX1mf0Rst8ftpedMc3i2YTMmWebZkIkum5HDY9zc7I9y0pTdnuk+O68zq
	06hJ2vn4UMaW1uY5rwFOn2keJs2y7uYX92OdQC+i+V/Tmft6m0rhRYmFPc+NFeynaVtu
	3fxSSEgEYuZ8oB6iKwTddxpHB1V699e0m81nuLe+Ttt6p7npjroiuALKcXt9ojUWET4p
	FDz3J00eAIkag8RmxgUiyZU7/80Bynp8PBAq2zsmQ0wM1tOJZAzldwGD47y+9ox475EP
	ERuBIXIqeIVap1L2CfpexwFWLkg/9QZ0EAOZH1QS5BgDPR/SinN7/5+erYpTS0IFXQBZ
	v5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C/L5HlU5pDKXvFAnTQHITK8tHHwk0cICvOaStvC5Apo=;
	b=A1EuGbsNydYlEGElUeEk04APLO7Q2U4x1Xj54JnLxMd6oa0jgjk3gFalNx8s/RM5Fg
	3PpNyNpbU9m95iXxC3oLrE0ycDmuO1PTqj0PA6XudWTUegVfTlo/awp0TuyzObACdrIa
	tiUy1soneqobMXdgNZabiPN60JbiX01KTS9n3OtdZMfnYozl7yPOM9glKi0o81ruG2lL
	QWav7ccc+ON6x18ROf/EcN+yqB+jl6qM9PCzF5SvDvry6h+2e9kBi12VrxsSpdGFJ61b
	i3wp2W2Zzd6mfrGMzlMO4x6EOq5KCVuTs/KfOl+EqudKlOyig5A688A3VosK5QHWgvRi
	Fz/w==
X-Gm-Message-State: AHQUAuYbRlAQuCaCipRLuYLETfPgT+HN51+sBcXHQYMYJt6vJcnydkYV
	0K6w8cqdvmnUbpZWJ0yAsXXSzYspAlfRhp2XbZg=
X-Google-Smtp-Source: AHgI3IYOryRCHH64YBpbavalUIl6QGzpmh2vGUFlUVulTixFTEx3G+CQ16DfTnpwF24S84ns4amhQP8XOpTOWv5z1bY=
X-Received: by 2002:aca:c003:: with SMTP id q3mr5906733oif.119.1550245751588; 
	Fri, 15 Feb 2019 07:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20190215131047.64007-1-alex.kanavin@gmail.com>
	<CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
	<CANNYZj89mDDm6cPRgEjJe-n7Jn=rCGQyUb+cnBBLsDBNh+BXgg@mail.gmail.com>
	<be4efd67-1b40-70de-29c0-9e0fdcc7deae@pr.hu>
	<CAP9ODKqn67CQuO=pSGrdYDX-uJHOtQ7CCoa8QsVrwAbM+qxCNw@mail.gmail.com>
In-Reply-To: <CAP9ODKqn67CQuO=pSGrdYDX-uJHOtQ7CCoa8QsVrwAbM+qxCNw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Feb 2019 16:49:00 +0100
Message-ID: <CANNYZj-cQPyN0hfEXZZ223y+wwnfggFij7Q2Pk5PDoXeYXRM0g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 15:49:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Feb 2019 at 16:16, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:

> I don't see urgency in to do the convertion so if there is more people
> which wishes to keep autotools for this release, we can skip it for
> 19.0.1 upgrade.

The idea was to switch as many recipes as possible that are on the
dependency path to qemu-native to meson, to improve build times. With
the upcoming virgl patchset, mesa-native is in that set.

I'll still provide the patch, as soon as mesa is updated. At least it
could get a run on the AB to see where the known issues are.

Alex

