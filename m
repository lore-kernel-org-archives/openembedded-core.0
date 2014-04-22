Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CACE606E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 06:01:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3M61UUO001911
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Apr 2014 23:01:30 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 21 Apr 2014 23:01:29 -0700
Message-ID: <535605FA.6080905@windriver.com>
Date: Tue, 22 Apr 2014 14:02:34 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <5352B5E0.3080509@topic.nl>
In-Reply-To: <5352B5E0.3080509@topic.nl>
X-Originating-IP: [128.224.162.218]
Subject: Re: nfs-utils does NOT rdepend on bash
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
X-List-Received-Date: Tue, 22 Apr 2014 06:01:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/20/2014 01:44 AM, Mike Looijmans wrote:
> To my surprise, a megabyte sized package "bash" was installed on 
> target when I installed nfs-utils to start the NFS server.
>
> Commit 664ae3dc52fd7fc8c6f64e6cf5e70f97dedd332d claims the package 
> needs bash.
>
> It's simply not true. It does not require bash at all, it runs just 
> fine with busybox's ash shell for example.
>

How about the start-statd script?
It begins with '#!/bin/bash -p'.
If you de-bash it, I think we can remove the dependency.

//Chen Qi

> I don't understand the reasoning behind that commit. There's nothing 
> in nfs-utils that really needs bash, it runs fine without it.
>
>
>
> Also, there is an error in the startup script, I can submit a patch 
> for that if you like. The script is needlessly complex too.
>
>


