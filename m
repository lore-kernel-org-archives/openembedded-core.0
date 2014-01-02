Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E64536B5E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 06:59:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s026xLhn029976
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Jan 2014 22:59:21 -0800 (PST)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 1 Jan 2014 22:59:21 -0800
Message-ID: <52C50E55.10906@windriver.com>
Date: Thu, 2 Jan 2014 14:59:33 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <52C222A1.6030705@windriver.com> <20131231094559.GB3705@jama>
In-Reply-To: <20131231094559.GB3705@jama>
X-Originating-IP: [128.224.162.164]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why do we allow empty -dev/-dbg packages ?
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
X-List-Received-Date: Thu, 02 Jan 2014 06:59:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/31/2013 05:45 PM, Martin Jansa wrote:
> On Tue, Dec 31, 2013 at 09:49:21AM +0800, ChenQi wrote:
>> Hi All,
>>
>> This might be a dummy question, but it has been puzzling me for some
>> time. So if someone could give me some explanation, that would be really
>> appreciated.
>>
>> In bitbake.conf, we have:
>> ALLOW_EMPTY_${PN}-dev = "1"
>> ALLOW_EMPTY_${PN}-dbg = "1"
>>
>> That means we allow emtpy -dev/-dbg packages. But what are the benefits
>> of these empty -dev/-dbg packages?
> In some cases it's useful to satisfy default dependcencies:
> bitbake.conf:RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
>
> and -dev needs ${PN} even when it's empty in some recipes where all
> files are split into separate packages
> bitbake.conf:RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
>
> Not sure about -dbg one.
>

Hi Martin,

Thanks for your explanation.

If I understand it right, the above two RDEPENDS are the default for 
most recipes and are expected to be overridden in some special recipes, 
right? For example, if a recipe is separated into several packages, it's 
possible that we need to override the RDEPENDS_${PN}-dev.

Here's another question. If a -dev package is empty, does the default 
RDEPENDS on "${PN}" still make sense?

Best Regards,
Chen Qi

