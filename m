Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38B6D6D897
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 02:56:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAE2uWfj006761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 18:56:32 -0800 (PST)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 13 Nov 2013 18:56:33 -0800
Message-ID: <52843BDF.9070505@windriver.com>
Date: Thu, 14 Nov 2013 10:56:31 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1384164392.git.wenzong.fan@windriver.com>
	<52810032.3020608@windriver.com> <1384242446.22454.71.camel@ted>
In-Reply-To: <1384242446.22454.71.camel@ted>
Subject: Re: [PATCH 0/1] udev: remove libudev-dbg and libgudev-dbg
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
X-List-Received-Date: Thu, 14 Nov 2013 02:56:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2013 03:47 PM, Richard Purdie wrote:
> On Mon, 2013-11-11 at 10:05 -0600, Mark Hatle wrote:
>> On 11/11/13, 4:10 AM, wenzong.fan@windriver.com wrote:
>>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>>
>>> We don't support multiple -dbg packages, so just remove the libudev-dbg,
>>> libgudev-dbg and put all debug stuffs to 'udev-dbg'.
>>
>> I'm a bit confused, we do support package that want to provide multiple -dbg
>> files to generate them.
>
> No, we do not. We don't support multiple -dev packages either. Yes
> packages can generate them but the system does not correctly handle them
> and never has.

Ok, a V2 patch was sent for removing extra -dev/-dbg packages for udev.

Thanks
Wenzong

>
> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

