Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE37606CB
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 08:29:12 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 5C0C6A002A6;
	Mon, 29 Jan 2018 09:29:24 +0100 (CET)
Received: from [172.16.26.80] ([172.16.26.80])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2018012909291223-113080 ;
	Mon, 29 Jan 2018 09:29:12 +0100 
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Openembedded-core@lists.openembedded.org, akuster808@gmail.com
References: <1516984865-2976-1-git-send-email-d.schultz@phytec.de>
	<1517134890.3090.0.camel@linuxfoundation.org>
From: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <aa61842b-0256-2a21-cb4a-166d9d287603@phytec.de>
Date: Mon, 29 Jan 2018 09:30:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517134890.3090.0.camel@linuxfoundation.org>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 29.01.2018 09:29:12,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 29.01.2018 09:29:12
X-TNEFEvaluated: 1
Subject: Re: [PATCH] cryptodev: Fix build errors with v4.11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 08:29:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

ah sorry, I checked rocko-next instead of next! Thanks for applying. Can=20
you also backport this patch to rocko, please?

Daniel

On 01/28/2018 11:21 AM, Richard Purdie wrote:
> On Fri, 2018-01-26 at 17:41 +0100, Daniel Schultz wrote:
>> Commit message from the included patch:
>> "Linux kernel has added -Werror=3Ddesignated-init around 4.11
>> (c834f0e8a8b)
>> triggering build errors with gcc 5 and 6 (but not with gcc 4)"
>>
>> Backport from https://github.com/cryptodev-linux/cryptodev-linux
>> Based on commit f0d69774afb27ffc62bf353465fba145e70cb85a
>>
>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>> Acked-by: California Sullivan <california.l.sullivan@intel.com>
>> ---
>>  =C2=A0.../cryptodev/cryptodev-module=5F1.9.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 +
>>  =C2=A0.../0001-ioctl.c-Fix-build-with-linux-4.13.patch=C2=A0=C2=A0=C2=
=A0| 49
>> ++++++++++++++++++++++
>>  =C2=A02 files changed, 50 insertions(+)
>>  =C2=A0create mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl=
.c-
>> Fix-build-with-linux-4.13.patch
> This merged 10 days ago:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D1e5e38f1e7f09dd12a=
24e62142da747c760ce0c3
>
> ?
>
> Cheers,
>
> Richrd

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen,
With best regards,
   Daniel Schultz

- Entwicklung -
Tel.: 	+49 6131 92 21 457
d.schultz@phytec.de
www.phytec.de

Sie finden uns auch auf: Facebook, LinkedIn, Xing, YouTube

PHYTEC Messtechnik GmbH | Robert-Koch-Str. 39 | 55129 Mainz, Germany
Gesch=C3=A4ftsf=C3=BChrer: Dipl.-Ing. Michael Mitezki, Dipl.-Ing. Bodo Hube=
r |
Handelsregister Mainz HRB 4656 | Finanzamt Mainz-Mitte | St.Nr. 266500608,
DE 149059855
This E-Mail may contain confidential or privileged information. If you are
not the intended recipient (or have received this E-Mail in error) please
notify the sender immediately and destroy this E-Mail. Any unauthorized
copying, disclosure or distribution of the material in this E-Mail is
strictly forbidden.


