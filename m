Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QmFUt-00073T-CR
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 03:34:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6S1UQZL026684
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Jul 2011 18:30:26 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 27 Jul 2011 18:30:26 -0700
Message-ID: <4E30BBB2.9060309@windriver.com>
Date: Thu, 28 Jul 2011 09:30:26 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1311780091-10692-1-git-send-email-koen@dominion.thruhere.net>
	<1311780692.2344.391.camel@rex>
In-Reply-To: <1311780692.2344.391.camel@rex>
X-Originating-IP: [128.224.162.213]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p6S1UQZL026684
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpam 1.1.4: fix packaging
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
X-List-Received-Date: Thu, 28 Jul 2011 01:34:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B407=E6=9C=8827=E6=97=A5 23:31, Richard Purdie wrote:
> On Wed, 2011-07-27 at 17:21 +0200, Koen Kooi wrote:
>> | ERROR: QA Issue: non debug package contains .debug directory: libpam=
-xtests path /work/armv7a-angstrom-linux-gnueabi/libpam-1.1.4-r0/packages=
-split/libpam-xtests/usr/share/Linux-PAM/xtests/.debug/tst-pam_dispatch4
>>
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>   meta/recipes-extended/pam/libpam_1.1.4.bb |    6 ++++--
>>   1 files changed, 4 insertions(+), 2 deletions(-)
> Merged to master, thanks.
>
> Kai: Please ensure you watch for these warnings in future...
>
> Richard
>
Sorry Richard, I will more carefully with these warnings.

Thanks to Koen.


