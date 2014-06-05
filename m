Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57D8365EB4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 05:27:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s555RlLN009225
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Jun 2014 22:27:47 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 4 Jun 2014 22:27:46 -0700
Message-ID: <5390000A.4080901@windriver.com>
Date: Thu, 5 Jun 2014 13:28:42 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1401419076.git.Qi.Chen@windriver.com>
	<324a9842b540fda121d095b0e2f899969cd8fdb5.1401419076.git.Qi.Chen@windriver.com>
	<CAJTo0LYqV6JqUbJNvZ4C_ceO8iQza4GQsn0KR-1TAv=wBGzGMA@mail.gmail.com>
In-Reply-To: <CAJTo0LYqV6JqUbJNvZ4C_ceO8iQza4GQsn0KR-1TAv=wBGzGMA@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gawk: upgrade from 4.0.2 to 4.1.1
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
X-List-Received-Date: Thu, 05 Jun 2014 05:27:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2014 05:52 PM, Burton, Ross wrote:
> On 3 June 2014 02:41, Chen Qi <Qi.Chen@windriver.com> wrote:
>> +FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/* ${libexecdir}/*.so ${libexecdir}/*.la"
> .la files should *never* be installed in a non-dev package (and in
> general they can be ignored anyway).  Are the .so files symlinks, or
> runtime loadable modules?  I'm currently working on a patch to move
> libexecdir so can you check with the makefile to see if they're being
> installed into libexecdir, or libdir/gawk/
>
> Ross
>
>

Thanks for pointing this out.
I've updated my patch and sent out a V2.

Best Regards,
Chen Qi

