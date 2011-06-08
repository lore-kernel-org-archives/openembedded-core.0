Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QU86p-0008Bc-C0
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 04:03:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p581xilt017707
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Jun 2011 18:59:44 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 7 Jun 2011 18:59:44 -0700
Message-ID: <4DEED78F.7090909@windriver.com>
Date: Wed, 8 Jun 2011 09:59:43 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307438945.git.kai.kang@windriver.com>	<46fc6e81f626e87f30a0d0980ed2b8fc3747e6be.1307438945.git.kai.kang@windriver.com>
	<1307440436.2529.4745.camel@phil-desktop>
In-Reply-To: <1307440436.2529.4745.camel@phil-desktop>
X-Originating-IP: [128.224.162.154]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p581xilt017707
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Wed, 08 Jun 2011 02:03:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B406=E6=9C=8807=E6=97=A5 17:53, Phil Blundell wrote:
> On Tue, 2011-06-07 at 17:42 +0800, Kang Kai wrote:
Hi Phil,

Thanks for your comment.
>> -DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbho=
st wifi nfs zeroconf pci"
>> +DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbho=
st wifi nfs zeroconf pci \
>> +		libc-ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests li=
bc-catgets libc-charsets libc-crypt \
> I don't think it is a good idea to invent a new "libc-ipv6" feature; yo=
u
> can just use the existing "ipv6" one.  This is probably true for some o=
f
> your others too.

eglibc needs to support ipv6 by default, but if other application such=20
as iptables doesn't want to support ipv6, remove "ipv6" will also=20
disable eglibc ipv6 support=E3=80=82
If it is ok to disable or enable ipv6 at same time, I will update the=20
patch with "ipv6".

>> +        # try to fix disable charsets/locales/locale-code compile fai=
l
>> +        if 'libc-charsets' in distro_features and 'libc-locales' in d=
istro_features and 'libc-locale-code' in distro_features:
>> +            bb.data.setVar('PACKAGE_NO_GCONV', '0', d)
>> +        else:
>> +            bb.data.setVar('PACKAGE_NO_GCONV', '1', d)
> Does that actually work?

Yes, it works. I can build eglic after uncomment the line in=20
local.extended.conf to disable all configurable options. But remove the=20
codes above, it will fail.
> p.
>
>
Regards,
Kai
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



