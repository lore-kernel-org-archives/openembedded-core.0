Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BB0E66BD60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 06:53:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7T6r5Ww029996
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Aug 2013 23:53:05 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 28 Aug 2013 23:53:03 -0700
Message-ID: <521EEFB1.4040809@windriver.com>
Date: Thu, 29 Aug 2013 14:52:33 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Li Zhijian <lizhijian@cn.fujitsu.com>
References: <521EA7EC.80302@cn.fujitsu.com>
In-Reply-To: <521EA7EC.80302@cn.fujitsu.com>
Cc: Yocto list discussion <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [Question] libxml: How about add --with-catalog to EXTRA_OECONF ?
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
X-List-Received-Date: Thu, 29 Aug 2013 06:53:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


I took a look at the libxml's git log, didn't see the explicit reason
that why use the --without-catalog, so it seems reasonable to use the
--with-catalog which will make the xmlcatalog work (if it can be built
well with the option.)

// Robert

On 08/29/2013 09:46 AM, Li Zhijian wrote:
> Hi,
>
> I had build libxml and executed xmlcatalog
> It shows follow messages
> # xmlcatalog --help
> libxml was not compiled with catalog and output support
>
> meta/recipes-core/libxml/libxml2.inc: 32
> EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
>
> Is it reasonable to add --without-catalog EXTRA_OECONF ?
>
> Thanks
>
> Best regards.
> Li Zhijian
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

