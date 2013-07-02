Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1C28C62062
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:54:14 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa11so6423002pad.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=b39sXjaLEeB+ma5Yq79demz1joTnjqsft9H3tMY5bak=;
	b=c8NxI4w7YXD1dB3HWhur6E5KJ7yxxsXb278663CAaq88K5djQ5qiD/AxRfY4LU3kdh
	Fo315vtr3cWqXxvcyrL0raJZJho+WoCaQD3PQiGIynDmvP/i9cok8RolRZN2V1l2RsnU
	k7ObDlfl6jAvINmT6qnQTYvCBlmsiXheZDAI+rTPww7Rb5oa9B52qcaXrikKXMyJUewk
	tVVgs5rjRcS5FWgKa+cvOv5SoWyecPZuvTzLm1dkZ0kfb2ZpS2Pa7Ijt5QOjMSIzbiUO
	q8HeIIJzG5xXrbpoILOEyo9gZABNu52CWcYvo6KQKs8kUZotw2VIt2MRpQLv4rqHInMB
	RaMQ==
X-Received: by 10.66.7.164 with SMTP id k4mr29220176paa.142.1372776855313;
	Tue, 02 Jul 2013 07:54:15 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	oy10sm29683951pac.9.2013.07.02.07.54.13 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 07:54:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKoCt6Gjd3s8wcGy8v0xy3kTQxYdKu1-gjeymN5Ruy59dQ@mail.gmail.com>
Date: Tue, 2 Jul 2013 07:54:13 -0700
Message-Id: <8E7C3DB4-FCF4-4D17-A0FF-B7ACBBD0678E@gmail.com>
References: <51C9CE42.8020207@linux.intel.com>
	<56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
	<CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
	<F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
	<51CB2164.5090102@linux.intel.com>
	<51D2E395.3000300@linux.intel.com>
	<CAP9ODKoCt6Gjd3s8wcGy8v0xy3kTQxYdKu1-gjeymN5Ruy59dQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1508)
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Tue, 02 Jul 2013 14:54:14 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jul 2, 2013, at 7:47 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:

> On Tue, Jul 2, 2013 at 11:28 AM, Saul Wold <sgw@linux.intel.com> =
wrote:
>>=20
>> Any updates on this issue?
>=20
> This is outside my skills :-) Khem did you have time to look at Saul =
file?
>=20

issue is narrowed down but fix is not coming soon. disable using neon =
for perf recipes on that old kernel
see http://gcc.gnu.org/bugzilla/PR57748

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


