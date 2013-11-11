Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1076D76D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 02:18:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAB2INTl018328
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Nov 2013 18:18:24 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 10 Nov 2013 18:18:23 -0800
Message-ID: <52803E72.9010505@windriver.com>
Date: Mon, 11 Nov 2013 10:18:26 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<5bcdd19de289a55e7cc28a1d0d4f09ea6ec4be41.1383974819.git.Qi.Chen@windriver.com>
	<1384037660.3798.42.camel@x121e.pbcl.net>
In-Reply-To: <1384037660.3798.42.camel@x121e.pbcl.net>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] udev: fix dependency and location of udevadm
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
X-List-Received-Date: Mon, 11 Nov 2013 02:18:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2013 06:54 AM, Phil Blundell wrote:
> On Sat, 2013-11-09 at 13:28 +0800, Qi.Chen@windriver.com wrote:
>> +	install -d ${D}${base_bindir}
>> +	mv ${D}${bindir}/udevadm ${D}${base_bindir}/udevadm
>> +	rmdir ${D}${bindir}
> This will fail if ${bindir} and ${base_bindir} are the same.
>
> p.
>
>
>
>

In udev recipe, they are not defined as the same one.
And moving something from bindir to base_bindir doesn't seem uncommon in 
OE, you can grep the project using the following command.

grep -Ri 'mv.*bindir.*base_bindir' meta/*

Best Regards,
Chen Qi

