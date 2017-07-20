Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F677781C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:07:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6KE7I3G023980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jul 2017 07:07:18 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 07:07:17 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Andre McCurdy
	<armccurdy@gmail.com>
References: <cover.1500470150.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=UaW2W6h47H-yVw=8q1rk23ZTj1an220VKrGitOx5Y1dA@mail.gmail.com>
	<3e05e420-d979-3f24-8b72-b032d8ec1870@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <f6405d6b-e55d-78f8-cfab-bb39f89b408d@windriver.com>
Date: Thu, 20 Jul 2017 09:07:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <3e05e420-d979-3f24-8b72-b032d8ec1870@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Add openssl 1.1
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
X-List-Received-Date: Thu, 20 Jul 2017 14:07:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/19/17 12:37 PM, Alexander Kanavin wrote:
> On 07/19/2017 07:55 PM, Andre McCurdy wrote:
>>> Openssl 1.1 is an opt-out; it has the same recipe name as openssl 1.0 had, and so
>>> all dependencies are compiled with it by default. If there's an API issue, please
>>> fix it, or adjust the recipe to depend on 'openssl10' (which is a lesser solution,
>>> and subject to openssl 1.0 eventually being removed from oe-core).
>>
>> Are there any -native recipes which still need 1.0? Or could support
>> for openssl10-native be dropped as part of this patch set?
> 
> There are also other layers out there which may need 1.0-native, and so 
> this would cause unnecessary breakage. Let's just leave 1.0 alone and 
> drop it altogether when time comes.

I would agree with this as well.  I've seen various SDK signing apps and such
that need to be linked to OpenSSL 1.0, so if it was removed it would like need
to be re-added by people to support their custom infrastructures.

--Mark

> Alex
> 


