Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 06E79756B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 04:07:42 +0000 (UTC)
Received: by qchk10 with SMTP id k10so23069034qch.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 21:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rxjchCIYSg2ZcEN1ksJ9+mCm/iA5sLdFluxIhAAywHE=;
	b=vxcKiyFpSVwwGEkmIKoo3nWZdNee3caOONesy2XIV1XjqoTU6xQEEiO7nNqmwBVpX6
	EBeQD1XufKbe5Z3ZbZptv2XLSzHdz8MEcJi6wqed6TP9OFJf6H/8A4Cg2R+PyZzVMxdg
	6OnvrMuKaYk4KNtWKUbtoRcmeVY8w9j/lSH7k8uH9GOokOArzeWrG7KcCbeVIAOFgV+p
	NnzzZzUwMLd/krXpGHEcEpELX1WexmTo2OSOfKzV2ZAr8bgHr36dy3npSXW7gPlzyBu3
	NzfQ7wXuWtobCZc6nplr2zq3Md1kB3vTPGn9xF/fBnhZDLX4an1Q3/0lkgP+jKFkGMU3
	EVLQ==
MIME-Version: 1.0
X-Received: by 10.140.147.134 with SMTP id 128mr7603203qht.97.1432872462986;
	Thu, 28 May 2015 21:07:42 -0700 (PDT)
Received: by 10.229.237.200 with HTTP; Thu, 28 May 2015 21:07:42 -0700 (PDT)
Received: by 10.229.237.200 with HTTP; Thu, 28 May 2015 21:07:42 -0700 (PDT)
In-Reply-To: <36f457602f1854379a8b3c75c36d9c14@hcubed.com>
References: <36f457602f1854379a8b3c75c36d9c14@hcubed.com>
Date: Thu, 28 May 2015 22:07:42 -0600
Message-ID: <CACS+7ZS9Q3iYDJd114HXymNvUJnani5QkqrqO2M5E1wOkUGd-w@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: grant@hcubed.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multi-Lib Address Sanitizer
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
X-List-Received-Date: Fri, 29 May 2015 04:07:45 -0000
Content-Type: multipart/alternative; boundary=001a11354af02a35c70517309e1c

--001a11354af02a35c70517309e1c
Content-Type: text/plain; charset=UTF-8

On 26 May 2015 7:10 am, <grant@hcubed.com> wrote:
>
> I have a need to have GCC's address sanitizer work in a 32-bit and a
64-bit environment. The current address sanitizer only produces the base
library. Does someone have patches that would allow the address sanitizer
to produce the libraries for both architectures?
>
> Thanks,
> Grant Haidinyak
> --

I hadn't really considered the multilib case for the sanitizers. It should
be pretty straightforward to build the multilib varieties, but since it
works for my case I likely won't look at it myself for a while.

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a11354af02a35c70517309e1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 26 May 2015 7:10 am, &lt;<a href=3D"mailto:grant@hcubed.c=
om">grant@hcubed.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I have a need to have GCC&#39;s address sanitizer work in a 32-bit and=
 a 64-bit environment. The current address sanitizer only produces the base=
 library. Does someone have patches that would allow the address sanitizer =
to produce the libraries for both architectures?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Grant Haidinyak<br>
&gt; -- </p>
<p dir=3D"ltr">I hadn&#39;t really considered the multilib case for the san=
itizers. It should be pretty straightforward to build the multilib varietie=
s, but since it works for my case I likely won&#39;t look at it myself for =
a while.</p>
<p dir=3D"ltr">&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a11354af02a35c70517309e1c--
