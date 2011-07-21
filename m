Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qjpoy-0004Nq-Qv
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 11:45:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6L9fKcg003837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jul 2011 02:41:20 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 02:41:19 -0700
Message-ID: <4E27F446.6020001@windriver.com>
Date: Thu, 21 Jul 2011 17:41:26 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<4E27DDAC.1060707@windriver.com>
	<39A05AC0-9577-4EB1-83F6-DADB53725801@dominion.thruhere.net>
In-Reply-To: <39A05AC0-9577-4EB1-83F6-DADB53725801@dominion.thruhere.net>
X-Originating-IP: [128.224.162.154]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p6L9fKcg003837
Cc: scott.a.garman@intel.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] works of adding packages pam support
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
X-List-Received-Date: Thu, 21 Jul 2011 09:45:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B407=E6=9C=8821=E6=97=A5 16:53, Koen Kooi wrote:
> Op 21 jul. 2011, om 10:05 heeft Kang Kai het volgende geschreven:
>
>> On 2011=E5=B9=B407=E6=9C=8821=E6=97=A5 16:00, Kang Kai wrote:
>>> From: Kang Kai<kai.kang@windriver.com>
>>>
>>>
>>> Hi Scott,
>>>
>>> This is the current work of adding pam supports.
>>>
>>> After update libpam to 1.1.4, we enable the packages pam support. And=
 if the pacakge
>>> doesn't have a pam configure file, import from Fedora.
>>>
>>> The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37=
627a70:
>>>
>>>    bb-matrix: correct BB and PM number canonicalization (2011-07-14 2=
2:23:09 +0100)
>>>
>>> are available in the git repository at:
>>>    git://git.pokylinux.org/poky-contrib kangkai/distro
>>>
>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/pam-c=
ommits
>> sorry, the branch info is wrong, should be
>>
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/distro
> Is that against oe-core or against poky? If it's against poky please re=
base it against oe-core since that make it possible to test it.

Koen,

I rebase against oe-core and push to

http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai%2Fpam-reb=
ase-oe-core

Is that what you want?

Regards,
Kai



