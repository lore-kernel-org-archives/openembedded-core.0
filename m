Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 251FD6D5B0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 15:33:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA8FX3uK007194
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 07:33:03 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 07:33:02 -0800
Message-ID: <527D042E.1050209@windriver.com>
Date: Fri, 8 Nov 2013 09:33:02 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1383866326.6271.286.camel@ted>	<CAJTo0LYq5PmQtBdwghmDGLs2ccTO6BBwJNGw7s37Yt+zjkWU6Q@mail.gmail.com>	<CAAQYJAuMoE6gOMmM2trSN1MY7weCF+07JAJuhQu1K=p5KxO=Yg@mail.gmail.com>
	<1383904061.6271.297.camel@ted>
In-Reply-To: <1383904061.6271.297.camel@ted>
Subject: Re: [PATCH] bitbake.conf: Default DISTRO to nodistro
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
X-List-Received-Date: Fri, 08 Nov 2013 15:33:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/13, 3:47 AM, Richard Purdie wrote:
> On Fri, 2013-11-08 at 10:33 +0100, Andrea Adami wrote:
>> On Fri, Nov 8, 2013 at 10:25 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 7 November 2013 23:18, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> +DISTRO ??= "nodistro"
>>>
>>> Wouldn't "oe-core" be a better name, considering that's what
>>> DISTROVERSION becomes if DISTRO is unset?
>>>
>>> Ross
>>
>>
>> Agreed, we already have DISTRO_VERSION = "oe-core.0"
>> This sounds also the right name for THE default distro.
>
> I disagree and I feel quite strongly about this. OE-Core is not a
> distro. The whole idea was that OE-Core should build with sane defaults
> without any distro set. This is a dummy placeholder value and it really
> does mean to say that no distro is set.
>
> We did put a value into the DISTRO_VERSION field so you could tell what
> was being used but again its a placeholder.
>
> So in my view "nodistro" is clearer about what is meant.

I agree as well.  The thought back when this started was -if- there was to be an 
OE distribution, it could come from a component of meta-openembedded.

--Mark

> Cheers,
>
> Richard
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


