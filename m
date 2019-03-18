Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id A8FD960291
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 20:58:50 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id e80so10614748ote.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 13:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=IImxEmXdQFLLutubB589yjikpbhMMT8xOM/hOtZzhzM=;
	b=GvpKiTQo8Rhv9ehLFYcjB8JJlNQjiIzD6PJfDhhCGCg9ha/1fIHuLefu/GTOyQ4e0n
	5vdbdfkkfnvDmU4b7W5SieK+A9nxIPNGr9V02m7XXfrn7igHFXHvtuQfN1cZcg1ZMlsv
	jKIWOM9htsXr5cppbKhtkKzGJLxmPI9QJJa/oDdRIWq/RY6+hkAE6+rBSdOSU+Oc7tSS
	1aMj+cv8mZNa3CjBDCRcsYfkSjfX9QZraO/piGyCObmUQQsSwH0nwYGnjY3WmqW0mdi7
	KRclMURN0AZN5t4vMVASGabG+Laa9OtH+jTLPK73rxdEHgU1vfJYkGxa02r4sJp3cyNM
	cw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=IImxEmXdQFLLutubB589yjikpbhMMT8xOM/hOtZzhzM=;
	b=rDgHa5AfqQw1+S8CHLodyRDnU0UlZU7AZECZWyagugwEjq7ooSpBofZivQUs2ABhXD
	vSTTmD9tseXngyZuFXpKS7KSfsW3sz+8/0Ofrt/kgzd4qHwbAfqc0Fj965CgYyzkznTa
	W9vWzlVl5eOYbkEtxAXsHyERR9ps7cmK/0/48Zix8RNJzLg7w2ygIFW1O6EthluO4EM+
	RKIA/tVpYiFtWJ/UGCdtqRq/y9DHGqH3dqei/0t2lknwiBOuUHx9lTLZ/beUcNWetv48
	UuB2GKJyyJBnRBc1PQ8mWOQU6FOW0SKyyJwleEWtd62rlZfUN/mCxDzKml9+ADj9dcsr
	TOjg==
X-Gm-Message-State: APjAAAWVXQvqnNM1c21JRr/oDXkfmKIVY5MiXfiQziJgjow82F3abKvo
	ddbOI9aHY3CyIz4LOvsPIO+Q3FKcX8D5qQ==
X-Google-Smtp-Source: APXvYqzx7YOATWprkWH1pnx1/KvAwKuAsDb7njez6nXHYZrKd+onE4BKTr79Hpo3/YGcdKCktEQjOA==
X-Received: by 2002:a05:6830:2005:: with SMTP id
	e5mr12251610otp.258.1552942730912; 
	Mon, 18 Mar 2019 13:58:50 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
	[209.85.210.53]) by smtp.gmail.com with ESMTPSA id
	m65sm4496674oia.15.2019.03.18.13.58.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 13:58:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f53.google.com with SMTP id c18so15698500otl.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 13:58:49 -0700 (PDT)
X-Received: by 2002:a05:6830:56:: with SMTP id
	d22mr3116272otp.294.1552942729395; 
	Mon, 18 Mar 2019 13:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190315212140.9597-1-fabio.berton@ossystems.com.br>
	<a4bbe97737049688cff93e4da243c112e6e79052.camel@linuxfoundation.org>
In-Reply-To: <a4bbe97737049688cff93e4da243c112e6e79052.camel@linuxfoundation.org>
Date: Mon, 18 Mar 2019 17:58:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoTnuoKUUhpStFA-R_3+Pfzrt4uKDvOFdunnbYs8rqzZA@mail.gmail.com>
Message-ID: <CAP9ODKoTnuoKUUhpStFA-R_3+Pfzrt4uKDvOFdunnbYs8rqzZA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Eric Engestrom <eric.engestrom@intel.com>, Matt Turner <mattst88@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: Update 18.3.4 -> 19.0.0
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
X-List-Received-Date: Mon, 18 Mar 2019 20:58:50 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

On Mon, Mar 18, 2019 at 11:00 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2019-03-15 at 18:21 -0300, Fabio Berton wrote:
> >   - Patch 0005-egl-add-missing-include-stddef.h-in-egldevice.h.patch
> >     was applied on commit e68777c87ceed02ab199b32f941778c3cf97c794.
> >   - Refresh all patches
> >   - mesa 19.0.0 deprecated the use of autotools and we need to add
> >     --enable-autotools flag. For details see mesa commit:
> >     e68777c87ceed02ab199b32f941778c3cf97c794
> >
> >   The complete change log can be found here:
> >     https://www.mesa3d.org/relnotes/19.0.0.html
>
> This failed pretty much everywhere, e.g.:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/407
>
> I think it will be too late to get this into 2.7.

We are looking at this here; we intend to have it working anyway so we
can decide if it goes on 2.7 or not.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

