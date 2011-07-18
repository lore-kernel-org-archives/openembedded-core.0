Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QirWq-0000jJ-VI
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 19:22:49 +0200
Received: by yxi19 with SMTP id 19so1439658yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 10:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=OQfBU9kxhZ/D6lp6DukzNNrep93O4nfinw7mFNkPIZM=;
	b=b5/NiPSJQLnPeHHY5bYQeNKJR2FHNI1Jc07NZqEUmUweBbCafisLVxBxlY+lVxA22a
	3/yOTdiKKzCG7CLtabct7fr9JvHBeSmMvzyquD/TaAQq1tu9JaDqVTPn4ArvGZbVD4Rt
	NABx1Fj7qdhJPqJvC6+zXph2hIRTl3a0t080c=
MIME-Version: 1.0
Received: by 10.91.66.11 with SMTP id t11mr5796298agk.189.1311009524228; Mon,
	18 Jul 2011 10:18:44 -0700 (PDT)
Received: by 10.91.12.2 with HTTP; Mon, 18 Jul 2011 10:18:44 -0700 (PDT)
In-Reply-To: <E0F5D9BD-075B-439F-AE3E-247CF7F06D82@dominion.thruhere.net>
References: <2ACEB6D6-846E-479C-AAE1-5C43687FD581@dominion.thruhere.net>
	<E0F5D9BD-075B-439F-AE3E-247CF7F06D82@dominion.thruhere.net>
Date: Mon, 18 Jul 2011 13:18:44 -0400
Message-ID: <CADkTA4PztE+w+bbEY4tatf-m8sDVJgBPCxHgjdLuC+KZpuMgrw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Incomplete licensing in recipes
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
X-List-Received-Date: Mon, 18 Jul 2011 17:22:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2011 at 1:15 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 17 jul 2011, om 11:40 heeft Koen Kooi het volgende geschreven:
>
>> Hi,
>>
>> I was looking at the testlab output for licensing [1] and noticed that e=
glibc(-locale) and libcap2 just say (L)GPL and don't specify the version, w=
as that intended?
>
> Same for linux-yocto:
>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0GPL : kernel_2.6.37+git1+d5d3c6480d61f83503ccef7fbcd765=
f7aca8b71b_1+92232beb4e72fcf8d85abe79edba0cdf53f1ce41-r20_qemuarm.ipk

Easy update. Thanks for pointing it out, I'll take care of tightening this =
up.

Bruce

>
>
>>
>> regards,
>>
>> Koen
>>
>> [1] http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/tree/h=
awkboard/eglibc/systemd-image/installed-package-licenses.txt?h=3Dyocto&id=
=3Dff185d46e0da70dba80a540a9d7d6757cd213931
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


