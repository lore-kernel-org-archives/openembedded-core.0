Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE50610F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 02:58:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBB2wY7f016722
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Dec 2013 18:58:34 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 10 Dec 2013 18:58:34 -0800
Message-ID: <52A7D50D.2000907@windriver.com>
Date: Wed, 11 Dec 2013 10:59:25 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1386232830.git.Qi.Chen@windriver.com>
	<f728bc59095fc51372c8771356ca7fef2ed71bb5.1386232830.git.Qi.Chen@windriver.com>
	<52A1011A.8080809@linux.intel.com>
	<52A128B8.9050300@windriver.com> <1386675463.4332.5.camel@ted>
	<CAJTo0LYKS7g6R96973EYm48YvJJnVxc0w3+qC3Zi2VDb4LWFyA@mail.gmail.com>
In-Reply-To: <CAJTo0LYKS7g6R96973EYm48YvJJnVxc0w3+qC3Zi2VDb4LWFyA@mail.gmail.com>
X-Originating-IP: [128.224.162.213]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libgcrypt: fix compile error with '-O2' in sysroot path
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
X-List-Received-Date: Wed, 11 Dec 2013 02:58:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2013 07:40 PM, Burton, Ross wrote:
> On 10 December 2013 11:37, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>> I thought it would do no harm. And I will send this patch to upstream,
>>> so it might be a little strange that I only modify the Makefile.am file
>>> even if Makefile.in has the same problem.
>> It can actually be harmful since the modification time of Makefile.in
>> can be after the time for Makefile.am and things can go "very wrong"
>> with autotools when that happens :(
> Another good reason not to modify the Makefile.in is that being a
> generated file, updating automake can change how it is generated, so
> the patch doesn't apply anymore.
>
> Ross
>
>

Hi All,

Thanks for your explanation. I'll send out a V2.

Best Regards,
Chen Qi

