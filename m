Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QW3ao-0007a2-Vv
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 11:37:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5D9YYXB000980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 02:34:34 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 13 Jun 2011 02:34:34 -0700
Message-ID: <4DF5D9B6.1010100@windriver.com>
Date: Mon, 13 Jun 2011 17:34:46 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1307954821.git.kai.kang@windriver.com>	<5ffcb67a8acc41eeb36fe98aba6d38f3f1c67a88.1307954821.git.kai.kang@windriver.com>	<1307955932.6879.12.camel@lenovo.internal.reciva.com>	<4DF5D514.3030102@windriver.com>
	<1307957234.6879.22.camel@lenovo.internal.reciva.com>
In-Reply-To: <1307957234.6879.22.camel@lenovo.internal.reciva.com>
X-Originating-IP: [128.224.162.154]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p5D9YYXB000980
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
X-List-Received-Date: Mon, 13 Jun 2011 09:37:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B406=E6=9C=8813=E6=97=A5 17:27, Phil Blundell wrote:
> On Mon, 2011-06-13 at 17:15 +0800, Kang Kai wrote:
>> On 2011=E5=B9=B406=E6=9C=8813=E6=97=A5 17:05, Phil Blundell wrote:
>>> On Mon, 2011-06-13 at 17:01 +0800, Kang Kai wrote:
>>>> -DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usb=
host wifi nfs zeroconf pci"
>>>> +DISTRO_FEATURES_LIBC ?=3D "ipv6 libc-backtrace libc-big-macros libc=
-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
>>>> +					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg=
 libc-fstab libc-ftraverse \
>>>> +					libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-=
libm-big libc-locales libc-locale-code \
>>>> +					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug=
 libc-spawn libc-streams libc-sunrpc \
>>>> +					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-=
posix-regexp libc-posix-regexp-glibc \
>>>> +					libc-posix-wchar-io"
>>>> +
>>>> +DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usb=
host wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
>>> Why is ipv6 in DISTRO_FEATURES_LIBC rather than DISTRO_FEATURES?
>> Because eglibc has a feature libc-ipv6, and DISTRO_FEATURES has a ipv6
>> already. It is not needed to import a new feature name on the same
>> things, so use original ipv6. And eglibc still needs provide this
>> option, then put it in DISTRO_FEATURES_LIBC.
> I'm not quite sure I understood what you wrote above.  But I think what
> I was asking was, why doesn't eglibc just look at the existing ipv6
> DISTRO_FEATURE?

It seems DISTRO_FEATURE doesn't want to enable ipv6 by default, but=20
eglibc needs supports it.

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



