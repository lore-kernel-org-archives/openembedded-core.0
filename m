Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6B70074588
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 15:53:06 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 193-v6so2700954wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 08:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AhzBWVGfjd1a+g/8jbGYzMina8HVQU//JSIk4oqYJx4=;
	b=XwrmUjM8Ix4E+seI56K7piG2cEHlZerGDbLk0E1pYD5xu253ldIvCZ6nNvZXFiuXms
	JWZdA2YHisKDzEXs0yvwN/sllmGt41X+0T+zL2GN+zlO19qUvDpt6rM1FHefOlvcjpE6
	yq09Pk5S/LTS68Hn/u57qeg1RMKKh54Xs1M/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AhzBWVGfjd1a+g/8jbGYzMina8HVQU//JSIk4oqYJx4=;
	b=S7HTyJcGH8UrP0AaHBuQ2mPLmXL3BC/ZjyA2wDg5Dy2hlhnE9cduGsTFHZaJ7Ty0Pg
	feywxsRdSxL3YTneUMjoCFMdlGrHe7W+xGJ75+LWX3PYmY0Nq34DZXHp/J5VugFzSjhT
	iCngG5OjAvt4qPsJsheZMNtx1kfs5RcrBg/5nnhKbMkTd3USuwu87WQmPcCaBBAtESNy
	f+JyuqZki8NOaLxrEBqFVyPLZZnscL8nWgBLRRwkfBI7LNMeZ/qKH29nk55lXStxPAB4
	Vcnq6ZzCxuPWZ/+pnzqzRb2ywvf0j8GZH2Z7YraTbEwYUjZ8XgE9c0TilG+Gw0LImJk4
	LRCw==
X-Gm-Message-State: ABuFfog86ZvM7m58L5qtYjDGa4nnoNtzgljQDlN1537p8nSGB5AEWpMP
	nEKNr3ilPsNzPV7lokJ/U4j6Uw==
X-Google-Smtp-Source: ACcGV60/ecygSVpzkOzUw6PU9x2M/FQF8HU5Lp5REWV8HXsPaF6dzuptrcTN9gGhkwmVbXaSRp7jOA==
X-Received: by 2002:a1c:4c16:: with SMTP id
	z22-v6mr2173732wmf.89.1538495586892; 
	Tue, 02 Oct 2018 08:53:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b81-v6sm8515213wmh.47.2018.10.02.08.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Oct 2018 08:53:05 -0700 (PDT)
Message-ID: <fbc98892f7466c1855f79d66b78144d5e8105707.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kang Kai <Kai.Kang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Oct 2018 16:53:01 +0100
In-Reply-To: <ee33ddce-5bba-6102-79da-7466e5f2d667@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<5266d8bc086fe75047d2cc84d25a4a83b28811b5.1538199671.git.kai.kang@windriver.com>
	<d53eac33f13004eec2b52746d09ca77a3019ccaa.camel@linuxfoundation.org>
	<ee33ddce-5bba-6102-79da-7466e5f2d667@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 05/10] nss: move create blank certificates to pkg_postinst
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
X-List-Received-Date: Tue, 02 Oct 2018 15:53:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-10-02 at 23:29 +0800, Kang Kai wrote:
> On 2018年09月29日 20:44, Richard Purdie wrote:
> > On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > > 
> > > There is a multilib install file conflict of nss:
> > > > file /etc/pki/nssdb/key4.db conflicts between attempted
> > > > installs of
> > > > lib32-nss-3.38-r0.corei7_32 and nss-3.38-r0.corei7_64
> > > 
> > > Move the creation of blank certificates to pkg_postinst. And
> > > check if
> > > certificates exist already, don't re-create them.
> > > 
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > ---
> > >  meta/recipes-support/nss/nss_3.38.bb | 32 +++++++++++++++++-----
> > > ----
> > > --
> > >  1 file changed, 20 insertions(+), 12 deletions(-)
> > 
> > This does raise a question - why aren't the generated files the
> > same?
> > Is there a determinism problem here? This sounds like the image
> > would
> > change with each build and couldn't be reproduced so we have a
> > bigger
> > problem?
>  
> It calls certutil to create blank certificates: 
> 
> certutil -N -d sql:${D}${sysconfdir}/pki/nssdb/ -f ./empty_password
> 
> It should be current time related that create blank certificates in
> current directory, the key4.db files are different:
> 
> kkang@msp-lpggp1:~/buildarea/bar-build
> $ touch empty
> kkang@msp-lpggp1:~/buildarea/bar-build
> $ ./tmp/sysroots-components/x86_64/nss-native/usr/bin/certutil -N -d
> sql:./ -f ./empty 
> password file contains no data
> kkang@msp-lpggp1:~/buildarea/bar-build
> $ md5sum *.db
> 1de1260b3f38349a8633d33acd4e4de7  cert9.db
> *7fea1d4dbc99db3ba1b72e30428eb5dc  key4.db*
> kkang@msp-lpggp1:~/buildarea/bar-build
> $ rm *.db
> kkang@msp-lpggp1:~/buildarea/bar-build
> $ ./tmp/sysroots-components/x86_64/nss-native/usr/bin/certutil -N -d
> sql:./ -f ./empty 
> password file contains no data
> kkang@msp-lpggp1:~/buildarea/bar-build
> $ md5sum *.db
> 1de1260b3f38349a8633d33acd4e4de7  cert9.db
> *9fbbae3e2d65d29f51e357a2dc4650a2  key4.db*

Can we generate them with a known standard time then? Is there some way
to specify that or can we add one?

Cheers,

Richard

