Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.phycard.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB82785B8
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 16:32:48 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 800A6A0024F;
	Fri,  5 Jan 2018 17:32:50 +0100 (CET)
Received: from [172.16.25.155] ([172.16.25.155])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2018010517324881-21996 ;
	Fri, 5 Jan 2018 17:32:48 +0100 
From: Daniel Schultz <d.schultz@phytec.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Openembedded-core@lists.openembedded.org
References: <1515163072-18559-1-git-send-email-d.schultz@phytec.de>
	<1515165911.30291.31.camel@linuxfoundation.org>
	<1785cd4d-f6a9-36cb-4c53-91cd1baa1c60@phytec.de>
Message-ID: <fc7d407a-b851-59d6-c44a-ee9bf4cafe77@phytec.de>
Date: Fri, 5 Jan 2018 17:33:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1785cd4d-f6a9-36cb-4c53-91cd1baa1c60@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 05.01.2018 17:32:48,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 05.01.2018 17:32:48
X-TNEFEvaluated: 1
Subject: Re: [RFC] cryptodev: Fix build errors with v4.11
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
X-List-Received-Date: Fri, 05 Jan 2018 16:32:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Cryptodev only breaks with 4.13 and 4.14.
4.12 builds successfully with and without this patch.

Daniel

On 01/05/2018 04:59 PM, Daniel Schultz wrote:
> Hi,
>
> On 01/05/2018 04:25 PM, Richard Purdie wrote:
>> On Fri, 2018-01-05 at 15:37 +0100, Daniel Schultz wrote:
>>> Commit message from the included patch:
>>> "Linux kernel has added -Werror=3Ddesignated-init around 4.11
>>> (c834f0e8a8b)
>>> triggering build errors with gcc 5 and 6 (but not with gcc 4)"
>>>
>>> Backport from https://github.com/cryptodev-linux/cryptodev-linux
>>> Based on commit f0d69774afb27ffc62bf353465fba145e70cb85a
>>>
>>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
>> I'm a little puzzled. Which release is this against? We're using
>> kernels newer than 4.11 so why aren't things breaking?
> I use rocko and a v4.14 kernel.
>
> Your right. The kernel patch was accepted in march.
> I will build again with v4.12 and 13.
>

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


