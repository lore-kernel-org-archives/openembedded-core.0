Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56D766FE76
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 18:59:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6SIxLUl016113
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 11:59:21 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 28 Jul 2014 11:59:20 -0700
Message-ID: <53D69D88.8090009@windriver.com>
Date: Mon, 28 Jul 2014 13:59:20 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1406572002.git.peter.seebach@windriver.com>	<c49369320ca271d42175888f5b9daccf45c297bf.1406572002.git.peter.seebach@windriver.com>
	<CAMKF1so=YuEoE2vQgG_yZWLzeKg=71vYEdHnX0V8fNowL=95zg@mail.gmail.com>
In-Reply-To: <CAMKF1so=YuEoE2vQgG_yZWLzeKg=71vYEdHnX0V8fNowL=95zg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Add support for ld.so.conf.d
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
X-List-Received-Date: Mon, 28 Jul 2014 18:59:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/14, 1:47 PM, Khem Raj wrote:
> On Mon, Jul 28, 2014 at 11:39 AM, Peter Seebach
> <peter.seebach@windriver.com> wrote:
>> The default behavior for USE_LDCONFIG is to use an empty ld.so.conf.
>> In some cases, it might be desireable to have an ld.so.conf.d directory,
>> and inherit files from there. This is a common enough use case to
>> justify support in the recipe, but not common enough to make it the
>> default. So, eglibc gets a new USE_LDCONFIG_CONF_D value, default 0.
>> If it's set to 1, we create the directory and add an "include" line
>> for it to ld.so.conf.
>
> the patch is good but introducing another variable is not needed you
> can cover it under US_LDCONFIG itself, ldconfig with empty ld.so.conf
> will still parse standard lib search paths anyway
>
> Secondly when we use ldconfig it generates ld.so.cache under /etc
> so I hope we take care of this when we have ro-rootfs
>

In a read-only root case, the ld.so.cache is generated in the cross environment. 
  I don't know if the cross ldconfig knows about the includes though.  Someone 
will have to check that.

--Mark

