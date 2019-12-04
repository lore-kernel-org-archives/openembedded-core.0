Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
	[209.85.222.46])
	by mail.openembedded.org (Postfix) with ESMTP id C41447CDE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 19:15:00 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id x15so216489uar.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 11:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x9pkW4maqyuKWYsuGiKgejvvSBAx4Nr2kMQuFUSHsXE=;
	b=C6sRNYmmJg8LVO6iEMvwk2fJK/YnCDCHNGwuvXtQzWLFMR+k9K8fSQbupneZotXz7E
	Qs0ZoWAzLRJZyXqWzcWyTzuA8AD8KVWRyNoV2jslMCXAUwv3sivLzgzW+D4AeV78yg11
	oumgPRxJkySvmR+J/foNa4iHs25T/TwBK7YyluFfoV70+bTIok1T2CGUotCKGvRi02yv
	qBiOqTY2tiTjF/DEj5Y/0qardIBEdenTY+izFDKEmrpqmYy1LbqsY8qlcwYJ/O6Bspjr
	Zticm8L+4f7EIty0gWI34FAzbzN+fuq7G90i8VXS01Iga101FIreHOD9lRTaAyB7vzVW
	VDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x9pkW4maqyuKWYsuGiKgejvvSBAx4Nr2kMQuFUSHsXE=;
	b=EAuturhN8AvUsitT42IvFvuBSu8wkCgUAwlGJyVD4jzXZqu4WLo7Mvmsl2Fk8EjNnD
	umQyyYN3N9KW8OqRCIRO3UtVVUgXJKDrPBqtBTKz/0KfZE3occvhEwXbKWr88rDr3PBJ
	Voxo2eZvzXyY5cl99wUhO0hosjSURIrRgTsS9L8JWsJ9C/42YmA7AFGDBAVbaIpmYtUI
	IAixhkCUZgRMerKy2VQaUPgXNzoeAOFruJT+mB1iIPkm/GApv/Ma+NJVB1/L5ZawcVFf
	HII5pXqQg27AHBPiQteRnyWKo6vA80fUjY1RwrJMs2kCexPkLAPuaTfX/+CO30khgA4Q
	9KgA==
X-Gm-Message-State: APjAAAU1Tr+lK4vtrqsyByx1VBe5JxT+KDOVvh5gSHYX2PdVHwfAa6Rn
	YiJS+J6XOzEk69Zn04+JuSL5A5dDUGwSvnnZuNc=
X-Google-Smtp-Source: APXvYqw63MJ9CYHk5wus82eU0BFhwZGLsEcgzpDGhfSyNV4kd91LcT/s3VwtAZW3+vX1V3m08r7OzMFZEYiQdTnHpKQ=
X-Received: by 2002:ab0:644c:: with SMTP id j12mr3669669uap.22.1575486901639; 
	Wed, 04 Dec 2019 11:15:01 -0800 (PST)
MIME-Version: 1.0
References: <20191204184028.14813-1-anibal.limon@linaro.org>
In-Reply-To: <20191204184028.14813-1-anibal.limon@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Dec 2019 20:14:50 +0100
Message-ID: <CANNYZj8dQGgwgOCg_NohqU4H5eLwAK-aFowLa-ywFpf7-YU3ZQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] meta/recipes-graphics/waffle: Add inherit setuptools
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
X-List-Received-Date: Wed, 04 Dec 2019 19:15:00 -0000
Content-Type: multipart/alternative; boundary="0000000000001edf120598e5a111"

--0000000000001edf120598e5a111
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Dec 2019 at 20:04, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.or=
g> wrote:

> -inherit meson features_check lib_package bash-completion
> +inherit meson setuptools3 features_check lib_package bash-completion
>

I don't think you actually need setuptools3 here, just target python3
dependency is enough.

Alex

--0000000000001edf120598e5a111
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Dec 2019 at 20:04, An=C3=ADbal =
Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org">anibal.limon@lina=
ro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">-inherit meson features_check lib_package =
bash-completion<br>
+inherit meson setuptools3 features_check lib_package bash-completion<br></=
blockquote><div><br></div><div>I don&#39;t think you actually need setuptoo=
ls3 here, just target python3 dependency is enough.</div><div><br></div><di=
v>Alex<br></div></div></div>

--0000000000001edf120598e5a111--
