Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Ruduc-0003UM-8M
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 06:48:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q175eEen010593
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 21:40:14 -0800 (PST)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 6 Feb 2012 21:40:14 -0800
Message-ID: <4F30B93F.9060704@windriver.com>
Date: Tue, 7 Feb 2012 13:40:15 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1328509284.git.xiaofeng.yan@windriver.com>	<35ca94a06bec973665a15cc14c0abccae890154a.1328509284.git.xiaofeng.yan@windriver.com>
	<CAMKF1sowvLoRAkhrntdHK1oHyJ-zqXpxtUAwhbi8+FkqE=WnDw@mail.gmail.com>
In-Reply-To: <CAMKF1sowvLoRAkhrntdHK1oHyJ-zqXpxtUAwhbi8+FkqE=WnDw@mail.gmail.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q175eEen010593
Subject: Re: [PATCH 2/2] glib-2.0: Add patch	"no-check-qsort_r.patch"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 05:48:18 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B402=E6=9C=8806=E6=97=A5 23:33, Khem Raj wrote:
> On Sun, Feb 5, 2012 at 10:41 PM, Xiaofeng Yan
> <xiaofeng.yan@windriver.com>  wrote:
>> +           file://file://no-check-qsort_r.patch \
> really ?
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
I run qsort-test.c in core-image-lsb-sdk, The result is ok. I didn't=20
know how to resolve this bug. I think I need to apply this patch only in=20
core-image-lsb-qt3 and other images don't apply this patch.


