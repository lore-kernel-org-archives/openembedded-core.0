Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7156577BC5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 09:40:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w779dvgQ009645
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Aug 2018 02:39:58 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 7 Aug 2018 02:39:56 -0700
To: Mark Hatle <mark.hatle@windriver.com>, <richard.purdie@linuxfoundation.org>
References: <20180803014947.23598-1-kai.kang@windriver.com>
	<20180803014947.23598-2-kai.kang@windriver.com>
	<178d4c597dac03d0d39b55450f023c57bd6c7c3e.camel@linuxfoundation.org>
	<504e6f59-83c5-9019-f2df-a1ce88e9a9f4@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <a8d925bb-8463-ddd2-ea9b-aa74a5ed9394@windriver.com>
Date: Tue, 7 Aug 2018 17:37:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <504e6f59-83c5-9019-f2df-a1ce88e9a9f4@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] remove allarch from recipes which rdepends on TUNE_PKGARCH packages
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
X-List-Received-Date: Tue, 07 Aug 2018 09:40:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年08月06日 22:51, Mark Hatle wrote:
> On 8/3/18 4:28 PM, richard.purdie@linuxfoundation.org wrote:
>> On Fri, 2018-08-03 at 09:49 +0800, kai.kang@windriver.com wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> The following allarch packages rdepends on TUNE_PKGARCH packages. So
>>> remove allarch from these recipes.
>>>
>>> ca-certificates -> openssl
>> Should we reverse this, i.e. have openssl RRECOMMENDS ca-certificates?
> I believe this is what other distros do.  I think the dependency on
> ca-certficiates was there because there is a script included that uses OpenSSL
> to generate the certificates.  (Theoretically you can use this script post
> install to update the certs.)
>
> /usr/sbin/update-ca-certificates
>
> I suspect the others had similar dependencies.. some included script needed
> something from another package to run.
>
> Not sure if this changes the suggestion though...
>
> --Mark
>
>>> docbook-xsl-stylesheets -> perl
>>> font-alias -> font-util
>>> initramfs-module-setup-live -> udev-extraconf
>>> initramfs-framework -> ${VIRTUAL-RUNTIME_base-utils} (busybox by
>>> default)
>>> ppp-dialin -> ppp
>> ppp RRECOMMENDS ppp-dialin?

ppp-dialin installs script ppp-dialin which calls /usr/sbin/pppd.


>>
>>> resolvconf -> bash
>>> weston-init -> weston kbd
>> weston RRECOMMENDS weston-init?

weston-init install init file which calls weston or weston-launch from 
package weston and openvt from package kbd.

Regards,
Kai


>>
>> Not really sure about some of these but we should at least consider
>> it...
>>
>> Cheers,
>>
>> Richard
>>
>

-- 
Regards,
Neil | Kai Kang


