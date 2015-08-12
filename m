Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 291EF76777
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 10:33:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7CAXPqP013449
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Aug 2015 03:33:26 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Wed, 12 Aug 2015 03:33:24 -0700
Message-ID: <55CB2106.4070908@windriver.com>
Date: Wed, 12 Aug 2015 18:33:42 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Jack Mitchell <ml@communistcode.co.uk>,
	<openembedded-core@lists.openembedded.org>
References: <55CB2008.4020101@communistcode.co.uk>
In-Reply-To: <55CB2008.4020101@communistcode.co.uk>
X-Originating-IP: [128.224.162.211]
Subject: Re: making /var/log persistent
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
X-List-Received-Date: Wed, 12 Aug 2015 10:33:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2015 06:29 PM, Jack Mitchell wrote:
> I'm trying to make /var/log persistent and I'm having trouble. I've 
> made a bbappend to base_files which contains:
>
> dirs755_append = " \
>         /var/log \
> "
>
> volatiles = "tmp"
>
> Looking in the resulting image, /var/log is indeed now a directory and 
> not a symlink to volatile storage, however when the image is flashed 
> to target and booted it is reverted back to being a symlink; I assume 
> by some init script?
>
> Can anyone shed any light on what more is required to get a persistent 
> log directory.
>
> Cheers,
> Jack.

I sent out a series of patches regarding this area.
The patch title is "[OE-core] [PATCH 0/4] Support persistent /var/log".

Regards,
Chen Qi

