Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuQif-0003vj-Aw
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 16:43:05 +0100
Received: by lahc1 with SMTP id c1so3102784lah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=r3wjMG0/Jv3Q3nd2y0EydE9S2fOU70YavbNT8XMqm0s=;
	b=SQH71N85o7yZHwEFYvnFJqG/9XzeHOdHBn81y3NLDo+rd7/4isa+5koEbhAI6y9p/Q
	ptNflBQPS5AxZe3bOvj/oUV6vyYm1t/33r6Gvp6r6dnrjLxSP+O3nrlE/dgQfHdLRr1C
	wTg/OKuifV5DnsoZyy9gVokrFAlcdL23vRsDs=
Received: by 10.112.101.34 with SMTP id fd2mr4902439lbb.16.1328542504255; Mon,
	06 Feb 2012 07:35:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 6 Feb 2012 07:34:34 -0800 (PST)
In-Reply-To: <1328519623.2716.208.camel@x121e.pbcl.net>
References: <cover.1328509284.git.xiaofeng.yan@windriver.com>
	<1624cca695c5baf08d376297f7278732dbcbfba6.1328509284.git.xiaofeng.yan@windriver.com>
	<1328519623.2716.208.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Feb 2012 07:34:34 -0800
Message-ID: <CAMKF1sqCO2Zz=4K=vSAAHZ1s8z=Hco7TQAWiFGMiXJLQB834pA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glib-2.0: Don't check function qsort_r
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 15:43:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 6, 2012 at 1:13 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2012-02-06 at 14:41 +0800, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>>
>> function "g_qsort_with_data" has two kinds of realization. One calls qso=
rt_r
>> from libglib, the other realize itself.
>> qsort_r from libglib cause sort error.
>> For fixing this problem no checking "qsort_r" in configure.ac.
>>
>> [YOCTO #1959]
>
> This description doesn't make much sense. =C2=A0libglib is part of glib-2=
.0
> itself; I guess you meant to say that qsort_r is from libc6. =C2=A0But, e=
ven
> leaving that aside, if qsort_r is broken then the appropriate patch
> would be to fix it, not just to hack glib to use a standalone
> implementation. =C2=A0So this patch seems like the wrong thing by any
> measure.
>
> Does glibc's own testsuite also have failures for qsort_r?

glibc one works ok last time I checked however uclibc does not implement it


>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


