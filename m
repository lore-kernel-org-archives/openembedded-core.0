Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2518060703
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 03:02:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8932waR002534
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Sep 2014 20:02:58 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 8 Sep 2014 20:02:57 -0700
Message-ID: <540E6DE5.9060505@windriver.com>
Date: Tue, 9 Sep 2014 11:03:01 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <54092B32.501@windriver.com> <1409904255.12482.56.camel@ted>
In-Reply-To: <1409904255.12482.56.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Integrate texinfo-4.8 to oe-core
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
X-List-Received-Date: Tue, 09 Sep 2014 03:02:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/05/2014 04:04 PM, Richard Purdie wrote:
> On Fri, 2014-09-05 at 11:17 +0800, Rongqing Li wrote:
>> Hi:
>>      I would like to integrate texinfo-4.8 into oe-core,  it was
>> released on 2007, and too old, but it is a GPLv2 package. Does
>> anyone objects?
>
> With things that are this old, I'm wondering if its not time we started
> a dedicated layer for the old GPLv2 versions...
>
> Cheers,
>
> Richard
>
I assume you did not object the integration of texinfo-4.8.

there are 45 recipes files for old GPLv2 version packages under
oe-core, it maybe better to have a oe-core-gplv2 layer.

./meta/recipes-devtools/ccache
./meta/recipes-devtools/python
./meta/recipes-devtools/mtools
./meta/recipes-devtools/make
./meta/recipes-devtools/m4
./meta/recipes-devtools/bison
./meta/recipes-devtools/elfutils
./meta/recipes-devtools/gcc
./meta/recipes-devtools/patch
./meta/recipes-devtools/rsync
./meta/recipes-qt/qt4
./meta/recipes-extended/libidn
./meta/recipes-extended/ed
./meta/recipes-extended/gzip
./meta/recipes-extended/sed
./meta/recipes-extended/texinfo
./meta/recipes-extended/tar
./meta/recipes-extended/grep
./meta/recipes-extended/ghostscript
./meta/recipes-extended/which
./meta/recipes-extended/findutils
./meta/recipes-extended/diffutils
./meta/recipes-extended/cpio
./meta/recipes-extended/gperf
./meta/recipes-extended/gawk
./meta/recipes-extended/groff
./meta/recipes-extended/less
./meta/recipes-extended/xz
./meta/recipes-extended/mc
./meta/recipes-extended/bash
./meta/recipes-multimedia/gstreamer
./meta/recipes-bsp/grub
./meta/recipes-core/gettext
./meta/recipes-core/coreutils
./meta/recipes-core/readline
./meta/recipes-support/gnutls
./meta/recipes-support/gdbm
./meta/recipes-support/libiconv
./meta/recipes-support/libproxy
./meta/recipes-support/gnupg
./meta/recipes-gnome/gnome

-Roy

>
>

-- 
Best Reagrds,
Roy | RongQing Li

