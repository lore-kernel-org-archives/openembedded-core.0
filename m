Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id D48D665CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 03:05:36 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e9so56680pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 19:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=cakoahJDWEbnaQmOXy0tk5E+aooXnEdvLjzvl6E2i48=;
	b=MX23OliAnL+hy+LCMyMcliljDig4c5qhEjjeE4yXf6ennhYaHuWZUJpnRRGyaxM/4o
	QFk2R6LOcQK/11KHihNvJq6RMUWDh5eCnrJGm2VGGjhG1bO+pIdJgOGTNlmJ8yfGYlVj
	6GHk+W54kSUY5bTz6Ly8Bm4dbZkJBzhv5zN5dCOzpX8hzfQFifOBYhyuMyyGwm9HBjgC
	EbnvovLbSassc0yfmYW0LtExkjZAZMUEjS4WqdTjqLq3BI1mmRdpN7eQvB5CWWR1rdg5
	l01swn6UuBlnxWahBeQe7Lr1phQ/9usPm1jc5Xyz4OdVHgtQAy/AoQK2jJJZcZopgR/K
	mhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=cakoahJDWEbnaQmOXy0tk5E+aooXnEdvLjzvl6E2i48=;
	b=Me/LEavEa7xm1ToglPYLPjaMJtfVe/pHDE5XNY+4TLw/wLfiHz0Q5dDJevl3cQpnVh
	HbPX5hnjQwAHddD8ItZpDV0MKpG/RBudc0S+oDeqGx1+IUJFSLYLc4U6S9iM6b8fUawb
	6sge6qbUfNSnsvrrYWhDexZq75NjiNhQoAptKW+zojeZ2Za8R+OabB1YaXLVcgMSNyAS
	eNIONaStGo6Iqhdlig4rYP2g4E7wgrJrUCYbN0sgfW2JcERWXT5s2LQl19Ay+LbyDQ4d
	j8htGSOt2TjaCOOnGj47tF2zDL5vpNb6VNXCIU0neqmDyIJ4D3uB0h4pL1uyTiM0VQzG
	944Q==
X-Gm-Message-State: AKaTC01vsMS1JVe5A4XBTXaNrTjCjy+04VkUDy/Q6Syf1sEvekywHpp8e+z+F2KXOYtCvA==
X-Received: by 10.99.134.72 with SMTP id x69mr1605171pgd.140.1479870337824;
	Tue, 22 Nov 2016 19:05:37 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:d191:f445:6e57:1696?
	([2601:646:8882:b8c:d191:f445:6e57:1696])
	by smtp.gmail.com with ESMTPSA id
	c15sm48129474pfd.36.2016.11.22.19.05.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 19:05:37 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20161123020049.22482-1-Yuanjie.Huang@windriver.com>
Date: Tue, 22 Nov 2016 19:05:36 -0800
Message-Id: <7CEAD313-1930-44C6-92A5-29E922A3485A@gmail.com>
References: <20161123020049.22482-1-Yuanjie.Huang@windriver.com>
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gdb-cross: depends on flex-native and bison-native
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
X-List-Received-Date: Wed, 23 Nov 2016 03:05:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 22, 2016, at 6:00 PM, Yuanjie Huang =
<Yuanjie.Huang@windriver.com> wrote:
>=20
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>=20
> Some source code of gdb is generated with flex or bison. Make both
> dependencies, to avoid compilation failure on host without them.


can you find out which parts those are ? what is it trying to do to need =
flex/yacc
>=20
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
> meta/recipes-devtools/gdb/gdb-cross.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc =
b/meta/recipes-devtools/gdb/gdb-cross.inc
> index 5fa7c33..a34223e 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
> @@ -1,6 +1,6 @@
> require gdb-common.inc
>=20
> -DEPENDS =3D "expat-native ncurses-native"
> +DEPENDS =3D "expat-native ncurses-native flex-native bison-native"
>=20
> inherit python3native
>=20
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


