Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qjppt-0004Q4-0k
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 11:46:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6L9gLOS003945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 02:42:21 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 02:42:20 -0700
Message-ID: <4E27F484.1020700@windriver.com>
Date: Thu, 21 Jul 2011 17:42:28 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<32d1cb41db60871d067df99d7b24b46a3fe8297e.1311234759.git.kai.kang@windriver.com>
	<1311239216.30326.78.camel@phil-desktop>
In-Reply-To: <1311239216.30326.78.camel@phil-desktop>
X-Originating-IP: [128.224.162.154]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p6L9gLOS003945
Subject: Re: [PATCH 07/10] sudo: add pam support
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
X-List-Received-Date: Thu, 21 Jul 2011 09:46:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B407=E6=9C=8821=E6=97=A5 17:06, Phil Blundell wrote:
> On Thu, 2011-07-21 at 16:00 +0800, Kang Kai wrote:
>> +do_install_append () {
>> +	install -D -m 664 ${WORKDIR}/sudo.pamd ${D}/${sysconfdir}/pam.d/sudo
>> +}
> As with openssh, you don't want to install and ship this file if pam
> isn't enabled.
>
> p.

ok, we'll try to do that.

Thanks,
Kai
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



