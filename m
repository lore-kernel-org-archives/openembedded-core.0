Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qc4hB-00046v-Hq
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 02:01:25 +0200
Received: by pzk36 with SMTP id 36so1490821pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 16:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=QC+9v7FC+gJ1RM9Pw7weUE7TGd64mE5fD8EfVrcS/GQ=;
	b=EhX3PVF4/fhWQFAwggqe+SPZRQzy7BQdXx+AvuucIKyEsUpl+GOcadgj2Y8EIon497
	NJ126A0E/wqfAKNcvriTPXbzQPWjDZawuF08WLR4BDNY1Tgx4MGatT2ybFEPRWrgMPs8
	ykY6oPEGWIIqFCYfzvriab0Nk1NqqxCXxCz0s=
Received: by 10.68.32.66 with SMTP id g2mr1925208pbi.26.1309391861322; Wed, 29
	Jun 2011 16:57:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Wed, 29 Jun 2011 16:57:11 -0700 (PDT)
In-Reply-To: <201106300102.16411.schnitzeltony@gmx.de>
References: <201106300102.16411.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jun 2011 16:57:11 -0700
Message-ID: <BANLkTinFsoG2YPbr+t2A--mAg=DzWyc+bw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to reuse code in oe-core environment
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
X-List-Received-Date: Thu, 30 Jun 2011 00:01:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2011 at 4:02 PM, Andreas Mueller <schnitzeltony@gmx.de> wro=
te:
> Hi,
>
> I am playing around with oe-core try to find a way of reusing code for mu=
ltiple
> recipes. In oe I did create foo.inc with
>
> foo() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# code to reuse
> }
>
> and called foo from several recipes. In oe-core the run.* scripts are muc=
h more
> stripped of unnecessary. =C2=A0All the code included by 'require' seems t=
o miss, so
> the function foo() will not be found.
>
> My searches for examples did not lead to a hook so what is the suggested
> solution for reusing code for multiple recipes in oe-core?
>

hmm do u mean something like what busybox recipe is doing as an example.

or did I misunderstand

> regards
>
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


