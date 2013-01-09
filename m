Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tt1fY-00063X-HB
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 20:50:38 +0100
Received: from mail-ea0-f200.google.com ([209.85.215.200])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 11:35:22 -0800
Received: by mail-ea0-f200.google.com with SMTP id j13so1824889eaa.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 11:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=gGbi2fC3+QnOrhMMlkJ0Ge20BInnfEJSUi+t2c/5pYk=;
	b=RVFUS1gyq2OxKZubRe6QP+MMNaOez3/bQEq1O54T1NyikwF+Ir94BAxnjwhFgwfRrW
	q07pOr0YRHzAewWM+l61jsC882yBU737ImOLvga7z6ifkTZdYLLJJbR0Y49XVIfuCB63
	bZg0IbuB8cwSvcg0HK0Kgu8ei7gGaLJNDJO869ECp1zxEtsnmMHKn1PCGFODUqVfyEQp
	a4vpNMR1RPkV4tCWQ+A1sO6ZXfQuLKXagMQEm0wq37sq/yKNcH6Wmn35Yt6/h3/aZxtY
	wJJ/KfKav46Fja/KP2uU8WeWw0ErLQh0xzX18Zw5zPJBXu77kwTvljGO+h8fGrLOhMKS
	I43w==
X-Received: by 10.194.89.167 with SMTP id bp7mr109563880wjb.0.1357760121151;
	Wed, 09 Jan 2013 11:35:21 -0800 (PST)
X-Received: by 10.194.89.167 with SMTP id bp7mr109563867wjb.0.1357760121022;
	Wed, 09 Jan 2013 11:35:21 -0800 (PST)
Received: from [192.168.1.7] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm5210733wib.9.2013.01.09.11.35.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 09 Jan 2013 11:35:19 -0800 (PST)
Date: Wed, 9 Jan 2013 19:35:24 +0000
From: Ross Burton <ross.burton@intel.com>
To: =?utf-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Message-ID: <89ACB277BC7047D58E19B3BA98CE24F0@intel.com>
In-Reply-To: <CAEYzJUHQ8c4NDErbcjNyRLKg3NfENUrFo6JO1xdL71dZsXyzrA@mail.gmail.com>
References: <alpine.DEB.2.02.1301090752510.25391@oneiric>
	<CAEYzJUHQ8c4NDErbcjNyRLKg3NfENUrFo6JO1xdL71dZsXyzrA@mail.gmail.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQkedqvfNisyaIjdkAhYhQS+FxRxYASk3og5EfdwDauczEbB1RhOSPPDxNq05a0GC0iKHmfHTIeaMHrXGJMYYv6QVYTAIe/m4SFRDkVjGZrC93/vesuqYxtSLyEehk2YHK7O7F6WzBL3DS7xubaQx0eCxnPGeEJxdbRF6RNoIMCosu+u0sf21sabp/c8+igVVeIM/l0A
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: for a quad-core machine, shouldn't parallelism be set to 8?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 19:50:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday, 9 January 2013 at 18:42, Bj=C3=B8rn =46orsman wrote:
> > =23 =46or a quad-core machine, BB=5FNUMBER=5FTHREADS =3D =224=22, PAR=
ALLEL=5FMAKE =3D =22-j 4=22 would
> > =23 be appropriate for example.
> > =20
> > i thought the general rule was that parallelism should be *twice*
> > the number of cores. that's certainly what's suggested in the yocto
> > QS guide:
> =20
> =20
> =20
> Some time ago I wrote a script to build the linux kernel 3 times at
> each -jN level from 1 to 50. Then I averaged the build time on each
> -jN level. I got the fastest build with -jNCPUS. Going above NCPUS
> just added overhead, although very little. The overhead seemed to
> build up quite linearly from above -jNCPUS. Because the overhead is so
> little, having -jNCPUS*2 may not be noticeably slower than -jNCPUS.
> =20
> I ran the same benchmark another machine and it showed the same trend
> curve. Note that NCPUS must include the hyperthread cores.

Of course if you set BB=5FNUM=5FTHREADS and PARALLEL=5FMAKE to NCPUS, the=
n you're actually potentially running NCPUS*NCPUS compile threads.  I'm n=
ot convinced that NCPUS*2 is useful with that considered.

Ross


