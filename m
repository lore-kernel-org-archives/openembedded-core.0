Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 35E9073243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 20:52:49 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so88591670igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 13:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=mPHe57zFFsJaheUe8Nv3ccKVTaRhsG/zo1mF+KlIaO8=;
	b=hXRBZnULuVBumGm1hYXv5kvupYOuZpT3PjqXvfjvjdDvi8rSOkn83Eyd9S6Oxi1Dum
	MzqrpcWAmjncl0MouwTcpULLWj1gcd9Zk8QPKgG3vyVYuJm2DnuCU/GcY9y/4FU9xwCS
	azADIHSDMuE8JQjt21r/UdCpe12wRR68cirphTdeKjckVwcV7VoGPw0SXfX1oLIAJLyi
	Uk1madr98WlSBcGlOhZOjxfUJ82GSLnoqX9dE8UFYUXc9CYd5Iaju4QtQY85hjlw6/jx
	xg9RVRUYJ1OLzVHeau0JuG1yw3TN2lyPBP2ntxqrgtQhv/Yk1hy3TS5VNDKWdGb4V86l
	9Hkg==
X-Gm-Message-State: ALoCoQkGrE1fRdD1DhkKNLZ+jNyDxRw7hBy35Fmjx9Ux3r96umHDUqHfrJXArGwtnfZW3BAptZE8
X-Received: by 10.50.143.10 with SMTP id sa10mr19547854igb.66.1442955169675;
	Tue, 22 Sep 2015 13:52:49 -0700 (PDT)
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com.
	[209.85.213.176])
	by smtp.gmail.com with ESMTPSA id x1sm1806843igl.14.2015.09.22.13.52.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 13:52:48 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcpb10 with SMTP id pb10so107590144igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 13:52:47 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.138.72 with SMTP id qo8mr20520252igb.46.1442955167704;
	Tue, 22 Sep 2015 13:52:47 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 22 Sep 2015 13:52:47 -0700 (PDT)
In-Reply-To: <5601A857.7060404@mlbassoc.com>
References: <560173B5.1000408@mlbassoc.com>
	<CAP9ODKpcr+YgGsvnRrsxy9Z2xsN5+KP4KiP-UvYij5eyN+1V1g@mail.gmail.com>
	<56019A6B.3070206@mlbassoc.com>
	<CAP9ODKpQDhCL9QbACgMRzV=N_Z7476a1_OxkhV7z0O7PfVd_rQ@mail.gmail.com>
	<5601A857.7060404@mlbassoc.com>
Date: Tue, 22 Sep 2015 17:52:47 -0300
Message-ID: <CAP9ODKqdB3Lf4fVtJ=Oy1-OZu5-3PY0Vgsz3JOsyiZW=7TDszg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error building gdk-pixbuf-native
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
X-List-Received-Date: Tue, 22 Sep 2015 20:52:50 -0000
Content-Type: text/plain; charset=UTF-8

Hello Gary,

On Tue, Sep 22, 2015 at 4:13 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> It seems to be a host [contamination?] issue.  I get this error
> on a build host that does not have libharfbuzz.so installed.  On
> a build host which does, there is no error.
>
> Note that it is only for the native package, so perhaps that's
> where the dependency needs to be updated/checked (hence my original
> query)

Thanks for helping to reproduce it however it always work for me.

One thing I noticed is that the svg pixbuf backend is provided by
librsvg and the error seems to come from it. However, looking at the
dependencies it seems the harfbuzz dependency comes from 'pango'.

I am clueless about how to debug it. Richard, any hints?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

