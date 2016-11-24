Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94E5771B1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 08:27:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAO8RBMo005236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Nov 2016 00:27:11 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 24 Nov 2016 00:27:11 -0800
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<1479899811.31880.37.camel@intel.com>
	<adc8effe-1856-560a-a7fb-0d92138e1990@windriver.com>
	<1525289.rQK3S6YPkZ@peggleto-mobl.ger.corp.intel.com>
	<27dbd493-5b76-657f-8a1d-57eabe9eebed@windriver.com>
	<1479973589.6873.15.camel@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <0fdf5fd0-9d39-c951-5885-10d13d3d0881@windriver.com>
Date: Thu, 24 Nov 2016 16:27:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1479973589.6873.15.camel@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Thu, 24 Nov 2016 08:27:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/24/2016 03:46 PM, Patrick Ohly wrote:
> On Thu, 2016-11-24 at 11:38 +0800, Robert Yang wrote:
>> Currently, debug-tweaks is in EXTRA_IMAGE_FEATURES by default for poky, and
>> there is no passwd, so that user can login easily without a passwd, I think
>> that current status is more unsafe ?
>
> Both well-known password and no password are unsafe. User "root" with
> password "root" is not even "more" safe already now, because tools that
> brute-force logins try that. Choosing something else would be a bit
> safer for a short while until the tools add it to their dictionary.

I meant add an interface to let user can set their password here.

// Robert

>
> Poky is also targeting a different audience than OE-core. Poky can
> assume to be used in a secure environment, OE-core can't (because it
> might be used for all kinds of devices).
>

