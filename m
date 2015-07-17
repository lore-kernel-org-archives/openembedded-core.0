Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8528175FD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 00:55:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H0tsnM010004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Jul 2015 17:55:54 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 16 Jul 2015 17:55:54 -0700
Message-ID: <55A85299.7060507@windriver.com>
Date: Fri, 17 Jul 2015 08:55:53 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1437009464-31315-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LakEKNqWhot2UKD6+wxECjMzTaLqOGPQD1E43v1NkOvqw@mail.gmail.com>
In-Reply-To: <CAJTo0LakEKNqWhot2UKD6+wxECjMzTaLqOGPQD1E43v1NkOvqw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: fix two building issue
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
X-List-Received-Date: Fri, 17 Jul 2015 00:55:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月17日 04:28, Burton, Ross wrote:
>
> On 16 July 2015 at 02:17, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     2. create tests dir and ivi-shell to fix the building rule
>     dependency issue.
>         sed "..." ivi-shell/weston.ini.in <http://weston.ini.in> >
>     ivi-shell/weston.ini
>         ivi-shell/weston.ini: No such file or directory
>
>
> I was watching another build happen so quickly fixed this too.   Does
> http://lists.freedesktop.org/archives/wayland-devel/2015-July/023468.html look
> right?
>
> Ross

it is fine to me, thanks


-- 
Best Reagrds,
Roy | RongQing Li

