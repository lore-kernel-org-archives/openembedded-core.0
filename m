Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9SXE-00013h-1K
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 05:13:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q86318KC011315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2012 20:01:08 -0700 (PDT)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Wed, 5 Sep 2012 20:01:08 -0700
Message-ID: <50481202.8000901@windriver.com>
Date: Thu, 6 Sep 2012 11:01:22 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <cover.1346406022.git.kai.kang@windriver.com>
	<504617C7.7090905@linux.intel.com>
	<70CC66F5C30A414DADDA6973E4CA391A653064@039-SN1MPN1-003.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A653064@039-SN1MPN1-003.039d.mgd.msft.net>
X-Originating-IP: [128.224.162.164]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q86318KC011315
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"Zhenfeng.Zhao@windriver.com" <Zhenfeng.Zhao@windriver.com>
Subject: Re: [PATCH 0/8] Patches for LSB perl test
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
X-List-Received-Date: Thu, 06 Sep 2012 03:13:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B409=E6=9C=8806=E6=97=A5 10:47, McClintock Matthew-B29882 w=
rote:
> On Tue, Sep 4, 2012 at 10:01 AM, Saul Wold<sgw@linux.intel.com>  wrote:
>> On 08/31/2012 03:00 AM, Kang Kai wrote:
>>> The following changes since commit
>>> b4c5725af4cd85d5644f0373e2674e903c4eab2b:
>>>
>>>     yocto-bsp: add missing xserver-xf86-config .bbappend for qemu
>>> (2012-08-25 14:47:07 +0100)
>>>
>>> are available in the git repository at:
>>>     git://git.pokylinux.org/poky-contrib kangkai/lsb
>>>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/l=
sb
>>>
>>> Kang Kai (8):
>>>     libclass-isa-perl: add it
>>>     perl: package modules Pod-Html and Tie-Hash-NamedCapture
>>>     libpod-plainer-perl: add it
>>>     libdumpvalue-perl: add it
>>>     libenv-perl: add it
>>>     libfile-checktree-perl: add it
>>>     libi18n-collate-perl: add it
>>>     task-core-lsb: add packages
>>>
>>>    meta/recipes-devtools/perl/perl-5.14.2/config.sh   |    2 +-
>>>    .../perl/libclass-isa-perl_0.36.bb                 |   32
>>> +++++++++++++++++++
>>>    .../perl/libdumpvalue-perl_1.16.bb                 |   20 ++++++++=
++++
>>>    meta/recipes-extended/perl/libenv-perl_1.03.bb     |   22 ++++++++=
+++++
>>>    .../perl/libfile-checktree-perl_4.41.bb            |   33
>>> ++++++++++++++++++++
>>>    .../perl/libi18n-collate-perl_1.02.bb              |   22 ++++++++=
+++++
>>>    .../perl/libpod-plainer-perl_1.03.bb               |   24 ++++++++=
++++++
>>>    meta/recipes-extended/tasks/task-core-lsb.bb       |    9 +++++-
>>>    8 files changed, 162 insertions(+), 2 deletions(-)
>>>    create mode 100644 meta/recipes-extended/perl/libclass-isa-perl_0.=
36.bb
>>>    create mode 100644 meta/recipes-extended/perl/libdumpvalue-perl_1.=
16.bb
>>>    create mode 100644 meta/recipes-extended/perl/libenv-perl_1.03.bb
>>>    create mode 100644
>>> meta/recipes-extended/perl/libfile-checktree-perl_4.41.bb
>>>    create mode 100644
>>> meta/recipes-extended/perl/libi18n-collate-perl_1.02.bb
>>>    create mode 100644
>>> meta/recipes-extended/perl/libpod-plainer-perl_1.03.bb
>>>
>> Kang,
>>
>> Given that LSB 5.0 is coming out that removes many of these requiremen=
ts,
>> does it really make sense to add these and then remove them again in a
>> future release. I understand we are trying to be as
>> compliant as possible to LSB, but this may best be in a meta-lsb layer.
> Is a meta-lsb layer coming? Will it be apart of poky?

I send a patch to create meta-lsb layer in poky, and I think that is=20
what Saul wants.

Regards,
Kai

>
> -M
>
>> Sau!
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



