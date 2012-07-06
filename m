Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sn1RP-0002Df-9n
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 07:50:55 +0200
Received: by eaal1 with SMTP id l1so3397619eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 22:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ydwZnnrNmkEI4KfH7gGrRTt2doW73pNAr3PUp2ertTI=;
	b=lhS2sWw5iYnMnRfxmUzzNjR+Fq5kHGtTtuMHI/4f6u1AspaPp3WOdkWXXV2n8+jAMr
	/C1JQk5essAd3WJchzXP3tDC9zlrW4nPLwCunxKclmeH7qRZwrPr/8ssn2pesyyqmkwf
	g752FR/38vpczG6e4XgmYXSPkpJyWsQSzu0E23eQbIdcFdkpf+BG/qPB2HkMNOAnUZLs
	eMCNxPvqa6y+1iLTHsUqDZfiu+jxrv/rQeU5tk3P6KoF/kbjomg05yrtRfY5Xt5Kailx
	D+u7faha7KO+z2XJ2YRc84fMpQ7fAiCBvIdSK6RmnFLYAYJlB9NL7MXCfd05mT7v1Qkd
	hXWA==
Received: by 10.14.53.4 with SMTP id f4mr7046972eec.93.1341553190129; Thu, 05
	Jul 2012 22:39:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 5 Jul 2012 22:39:20 -0700 (PDT)
In-Reply-To: <4FF678A0.4040200@windriver.com>
References: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
	<CAMKF1sp-vCv1iP3YAgAbEP4=2ruAme+-JnCqxBLXGW5yJ3oyZw@mail.gmail.com>
	<4FEC0EC7.6050800@windriver.com> <4FEC807C.1040803@gmail.com>
	<4FF577CC.3040205@windriver.com>
	<CAMKF1sqqiaXyxxzrreU2+00mmdCAmtpSNXnrXVgF1F5a4b07_g@mail.gmail.com>
	<4FF678A0.4040200@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2012 22:39:20 -0700
Message-ID: <CAMKF1soZH9u+tkih94s276FQCE40gwrc1MKCHaLRX=HoYgv=aQ@mail.gmail.com>
To: Pascal Ouyang <xin.ouyang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpan.bbclass: Fix CCFLAGS.
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
X-List-Received-Date: Fri, 06 Jul 2012 05:50:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 5, 2012 at 10:33 PM, Pascal Ouyang <xin.ouyang@windriver.com> w=
rote:
> On 2012=E5=B9=B407=E6=9C=8805=E6=97=A5 22:57, Khem Raj wrote:
>>
>> On Thu, Jul 5, 2012 at 4:17 AM, Pascal Ouyang <xin.ouyang@windriver.com>
>> wrote:
>>>
>>>
>>> So, I still don't know what is your opinion of this patch.
>>
>>
>> I think we still need the CC and CFLAGS to appear in CCFLAGS since
>> they sometimes decide ABI etc. that we use and without that
>> the modules will be incompatible. So may be
>> appending to CCFLAGS would work instead
>>
>
> Exactly in my patch, this just appends CFLAGS to CCFLAGS.
>

seems ok I guess

>
> @@ -26,13 +26,14 @@ cpan_do_configure () {
>                         test -f $f2 || continue
>                         sed -i -e "s:\(PERL_ARCHLIB =3D
> \).*:\1${PERL_ARCHLIB}:" \
>                                 -e 's/perl.real/perl/' \
> +                               -e "s/^\(CCFLAGS =3D.*\)/\1 ${CFLAGS}/" \
>                                 $f2
>                 done
>         fi
>  }
>
> Thanks.
> --
> - Pascal
>
>


