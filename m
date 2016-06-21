Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id CBB1A7002B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:21:29 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u5LFLPJ6025892
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 21 Jun 2016 17:21:25 +0200
Received: from [139.16.77.141] (MD1FZU9C.ww002.siemens.net [139.16.77.141])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id u5LFLP39021007
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 21 Jun 2016 17:21:25 +0200
To: Martin Jansa <martin.jansa@gmail.com>
References: <fdf902fc-2f74-e750-7215-bd939cac4518@siemens.com>
	<20160621144029.GA14456@jama>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <faaab7d0-42d1-582e-3073-2dd2f11e1af4@siemens.com>
Date: Tue, 21 Jun 2016 17:21:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20160621144029.GA14456@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: rebuilding external kernel modules when kernel changed
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
X-List-Received-Date: Tue, 21 Jun 2016 15:21:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


> What version are you using?
I'm using poky, the latest krogoth branch
> Are you using rm_work?
No rm_work is not used.
>
> Check https://bugzilla.yoctoproject.org/show_bug.cgi?id=9352 
I think the issue is relate but not the same. For me the simplest solution i found was to make sure do_make_scripts of any kernel module was executed after the kernel was rebuilt.
But I didn't find a way to make bitbake do this automatically.


