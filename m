Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7197D7DFDB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 12:10:31 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id s3so3133307itk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dI86KRysxGAXWqPNXLpE4sQiWVQpqnmaXb8MRWPybaM=;
	b=AU7aBh+Fd79/0iBo+hZExILVe8HaA81kZ+sXoK7ujgUZ24AHRRrA073CW8hw/wIkBI
	mgnk1eQioqCy52A+AOHSJlCtdMDMU7TR3oOb29FGkkGW3nw5PxI917/WemOAu40pgsSJ
	2aYkHYCd93KU61D8cFtrsL0SEjyq+FM4BW49mRxYUaUX5C8d4uCjEFVzjSw3CbKiiGv0
	KtC9pQB4r2/kxUOZK2ydtyMdZGzDH22MTu8TjmxvcZ9pkrsu1bgotg5NxoCL6qt/MKlN
	APFRLBJ0ww9aMqyZCdQzbYcUnWLrIBR9FbZ+Zel0MLht2OyVsN54v/AuFidSO13TxZUA
	jHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dI86KRysxGAXWqPNXLpE4sQiWVQpqnmaXb8MRWPybaM=;
	b=OphIgAXT+CEYcUpmDzTaNRbGmDOVk8fDt6SZAkPU1CqdJiZiKYqFcuzkGp4jayhWDQ
	TbPgMqbc0brsFSlqwkjWoGWkcoLxtJb6xRJUSt1Un7+Ji7NyuG/p97Vm1T/HjdRRJ0qv
	Wwgof0Fq6pvGgxt0HMRcAnPs5+dV4HVfHOZICDsj/CJrMkyFTMGSrTBxE/vJytmZefBH
	KaWaidSbUMv5yrtEqXt12s5K1TZr4rgcprHBm0nH3YYMOndJdihKF51ZQis0PHSxQbzB
	huunkBaDL+51s5j+BxiiqrfdKkjWuC6l/rr7bZeHI1HJ9Svke60UjGCd/KZ+NXGarWiD
	mqAQ==
X-Gm-Message-State: APjAAAV5VX6bo+O2j/9lCGwMCZDMVqiKnR2SB6dRUXmZo3yQ8s4KC/U8
	ytns04UenCsG7l1KxCUGCrDCabdrCHDSk6CaNwg=
X-Google-Smtp-Source: APXvYqw4W84peaHYWogsG2gr587lFsCBIx7Yf2jrWUwOw5HpPqJZpn5mHju5tYtwEXvwRkT9ev/jEKvGdVG/yubkvbU=
X-Received: by 2002:a02:3846:: with SMTP id v6mr2845768jae.81.1557403832310;
	Thu, 09 May 2019 05:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190508201335.1732-1-schnitzeltony@gmail.com>
	<CAJTo0LYRyARnYkRfumy_hXXNb6otVKhr0di0fyptBb208wQ4mA@mail.gmail.com>
	<CALbNGRRzzJQVM7-bt6hsq_FQzHxJ+QTjrwfj9NFgmuUWKvQKZw@mail.gmail.com>
	<CALbNGRTqaL-N0hgTrSywEvnuE_wAkP0+CvNssXp0V2AEucXJ+Q@mail.gmail.com>
In-Reply-To: <CALbNGRTqaL-N0hgTrSywEvnuE_wAkP0+CvNssXp0V2AEucXJ+Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 May 2019 14:10:19 +0200
Message-ID: <CALbNGRRSXTqnBpk=f-c1TOmun1reHQ0k7-DFPujqDL-Ybc+q2A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson.bbclass: add MESON_CROSS_EXTRA_PROPS to inject properties into meson.cross
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
X-List-Received-Date: Thu, 09 May 2019 12:10:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2019 at 2:03 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
> So for me to understand it correctly: adding multiple '--cross-file'
> entries in commandline accumulates the contents of the files and it is
> not the last that wins?
>
> I am asking because help says 'File describing cross compilation
> environment.' so I wouldn't expect this behaviour.
>
Answer myself - and guess who did it :))

https://github.com/mesonbuild/meson/blob/master/docs/markdown/snippets/mult=
iple-cross-files.md

Andreas

