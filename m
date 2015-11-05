Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 27EFF75D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 22:00:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 3E266600A81
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <CAJ86T=W-yx=peF_w-g4U7hkZN2u+RR2wbY7eACDEKADLQ-r2jw@mail.gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <563BD16A.5070803@collabora.co.uk>
Date: Thu, 5 Nov 2015 22:00:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=W-yx=peF_w-g4U7hkZN2u+RR2wbY7eACDEKADLQ-r2jw@mail.gmail.com>
Subject: Re: fido backports to support SH4 + uclibc
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
X-List-Received-Date: Thu, 05 Nov 2015 22:00:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/15 18:16, Andre McCurdy wrote:
> Hi Joshua,
>
> Could you please consider backporting the following fixes to fido.
> They are required in order to successfully build for SH4 + uclibc +
> blacklist GPLv3.

Done. Pushed to my joshuagl/fido-next branch of 
openembedded-core-contrib and undergoing testing now.

Thanks,

Joshua

1. 
http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next

>
>    aa20c3d uclibc: backport upstream fix for SH4
>    898e9d7 libiconv_1.11.1: merge build and packaging fixes from libiconv_1.14
>    7d2da0e libiconv_1.11.1: fix LICENSE declaration, LGPL -> LGPLv2.0
>    d46333d gettext_0.16.1: add -lrt and -lpthread to LDFLAGS for uclibc builds
>    d95d92a gettext_0.16.1: remove obsolete uclibc specific patch
>
> Thanks.
>


