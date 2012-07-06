Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1Sn1LA-00026O-UD
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 07:44:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q665XKFv027947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jul 2012 22:33:20 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 5 Jul 2012 22:33:19 -0700
Message-ID: <4FF678A0.4040200@windriver.com>
Date: Fri, 6 Jul 2012 13:33:20 +0800
From: Pascal Ouyang <xin.ouyang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1340262834-27560-1-git-send-email-xin.ouyang@windriver.com>
	<CAMKF1sp-vCv1iP3YAgAbEP4=2ruAme+-JnCqxBLXGW5yJ3oyZw@mail.gmail.com>
	<4FEC0EC7.6050800@windriver.com> <4FEC807C.1040803@gmail.com>
	<4FF577CC.3040205@windriver.com>
	<CAMKF1sqqiaXyxxzrreU2+00mmdCAmtpSNXnrXVgF1F5a4b07_g@mail.gmail.com>
In-Reply-To: <CAMKF1sqqiaXyxxzrreU2+00mmdCAmtpSNXnrXVgF1F5a4b07_g@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q665XKFv027947
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
X-List-Received-Date: Fri, 06 Jul 2012 05:44:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B407=E6=9C=8805=E6=97=A5 22:57, Khem Raj wrote:
> On Thu, Jul 5, 2012 at 4:17 AM, Pascal Ouyang <xin.ouyang@windriver.com=
> wrote:
>>
>> So, I still don't know what is your opinion of this patch.
>
> I think we still need the CC and CFLAGS to appear in CCFLAGS since
> they sometimes decide ABI etc. that we use and without that
> the modules will be incompatible. So may be
> appending to CCFLAGS would work instead
>

Exactly in my patch, this just appends CFLAGS to CCFLAGS.

@@ -26,13 +26,14 @@ cpan_do_configure () {
  			test -f $f2 || continue
  			sed -i -e "s:\(PERL_ARCHLIB =3D \).*:\1${PERL_ARCHLIB}:" \
  				-e 's/perl.real/perl/' \
+				-e "s/^\(CCFLAGS =3D.*\)/\1 ${CFLAGS}/" \
  				$f2
  		done
  	fi
  }

Thanks.
--=20
- Pascal




