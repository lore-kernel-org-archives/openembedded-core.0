Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qw2eT-0001Ky-J7
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 03:53:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7O1mLc2023638
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Aug 2011 18:48:23 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 23 Aug 2011 18:48:22 -0700
Message-ID: <4E54585F.7070306@windriver.com>
Date: Wed, 24 Aug 2011 09:48:15 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4E522492.9050706@windriver.com>
	<201108221946.26036.paul.eggleton@linux.intel.com>
In-Reply-To: <201108221946.26036.paul.eggleton@linux.intel.com>
X-Originating-IP: [128.224.162.196]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p7O1mLc2023638
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: question about meta/class/qmake-base.bbclass
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
X-List-Received-Date: Wed, 24 Aug 2011 01:53:10 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B408=E6=9C=8823=E6=97=A5 02:46, Paul Eggleton wrote:
> On Monday 22 August 2011 10:42:42 Kang Kai wrote:
>> When I read the file  meta/class/qmake-base.bbclass, I find that that
>> are 2 lines:
>>       unset QMAKESPEC || true
>>       ${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile
>> $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Erro=
r
>> calling ${OE_QMAKE_QMAKE} on $PROFILES"
>>
>> I am confused that why unset QMAKESPEC first and then use it a argumen=
t
>> for qmake?
> It's not obvious, but think that the difference here is between $QMAKES=
PEC and
> ${QMAKESPEC} - the first one is a reference to an environment variable,=
 the
> second is a reference to an OE/BitBake variable. So "unset QMAKESPEC" i=
s just
> clearing out the environment variable; ${QMAKESPEC} would still have a =
value.
>
> Cheers,
> Paul
>
Hi Paul,

Thanks for your detailed answer.

Regards,
Kai


