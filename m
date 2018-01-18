Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2482787EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 16:47:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0IGlfsn008328
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Jan 2018 08:47:41 -0800 (PST)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 18 Jan 2018 08:47:41 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Chen Qi <Qi.Chen@windriver.com>
References: <cover.1515461823.git.Qi.Chen@windriver.com>
	<a320979ef8fb138981c66b8c0ead607a9804cee0.1515461823.git.Qi.Chen@windriver.com>
	<CAJTo0LayZCc=psjBv7QjsXNi3drktBT4wmZcXd37cVGHYbAJcg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <5377d8ea-0b83-a972-eece-a0dbd3129f31@windriver.com>
Date: Thu, 18 Jan 2018 11:47:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LayZCc=psjBv7QjsXNi3drktBT4wmZcXd37cVGHYbAJcg@mail.gmail.com>
X-Originating-IP: [172.25.44.3]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] coreutils: upgrade to 8.29
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
X-List-Received-Date: Thu, 18 Jan 2018 16:47:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 2018-01-11 11:18 AM, Burton, Ross wrote:
> On 9 January 2018 at 01:40, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
> 
>     * hostname is explicitly enabled to keep the same with previous recipe's
>        behaviour.
> 
> 
> But buildhistory-diff:
> 
> packages/corei7-64-poky-linux/coreutils/coreutils: FILELIST: added 
> "/usr/bin/hostname"
> 
> So the old coreutils wasn't building hostname at all (we use 
> /bin/hostname from busybox).

Ross,
Are you asking Chen to package coreutils.hostname and
use the alternatives mechanism with busybox's hostname as the default?
(busybox hostname has annoyed me in a past life!)

../Randy

> 
> Ross
> 
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

