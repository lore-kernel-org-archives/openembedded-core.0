Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.phycore.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA10787BA
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 15:58:14 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 54AB1A0025F;
	Fri,  5 Jan 2018 16:58:17 +0100 (CET)
Received: from [172.16.25.155] ([172.16.25.155])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2018010516581556-21811 ;
	Fri, 5 Jan 2018 16:58:15 +0100 
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Openembedded-core@lists.openembedded.org
References: <1515163072-18559-1-git-send-email-d.schultz@phytec.de>
	<1515165911.30291.31.camel@linuxfoundation.org>
From: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <1785cd4d-f6a9-36cb-4c53-91cd1baa1c60@phytec.de>
Date: Fri, 5 Jan 2018 16:59:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1515165911.30291.31.camel@linuxfoundation.org>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 05.01.2018 16:58:15,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 05.01.2018 16:58:15
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
X-List-Received-Date: Fri, 05 Jan 2018 15:58:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi,

On 01/05/2018 04:25 PM, Richard Purdie wrote:
> On Fri, 2018-01-05 at 15:37 +0100, Daniel Schultz wrote:
>> Commit message from the included patch:
>> "Linux kernel has added -Werror=3Ddesignated-init around 4.11
>> (c834f0e8a8b)
>> triggering build errors with gcc 5 and 6 (but not with gcc 4)"
>>
>> Backport from https://github.com/cryptodev-linux/cryptodev-linux
>> Based on commit f0d69774afb27ffc62bf353465fba145e70cb85a
>>
>> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> I'm a little puzzled. Which release is this against? We're using
> kernels newer than 4.11 so why aren't things breaking?
I use rocko and a v4.14 kernel.

Your right. The kernel patch was accepted in march.
I will build again with v4.12 and 13.

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen,
With best regards,
   Daniel Schultz


