Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 23EF76B4FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 10:08:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7FA8UEW028019
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Aug 2013 03:08:30 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 15 Aug 2013 03:08:29 -0700
Message-ID: <520CA8A3.6050709@windriver.com>
Date: Thu, 15 Aug 2013 18:08:35 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com>
	<520B1595.3060909@windriver.com> <20130814065609.GQ17945@jama>
	<1376477217.22952.5.camel@ted> <20130814105915.GU17945@jama>
	<520CA4AF.4040403@windriver.com>
	<1376560519.17787.16.camel@phil-desktop.brightsign>
In-Reply-To: <1376560519.17787.16.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Thu, 15 Aug 2013 10:08:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/15/2013 05:55 PM, Phil Blundell wrote:
> On Thu, 2013-08-15 at 17:51 +0800, Rongqing Li wrote:
>> OK, But your issue is not related to me.
>>
>> I can reproduce my issue by two simple script.
>
> If tar is deciding that the file has "changed" just because the link
> count on the dentry has increased, that sounds like it is probably a bug
> in tar and ought to be fixed there.
>
> That said, I can't immediately think why autotools_copy_aclocal couldn't
> use a symlink rather than a hard link which would avoid this whole
> problem.  If the file is in the sysroot then there should be no risk of
> it going away underneath its user.
>

Good idea, use a symlink in autotools_copy_aclocal,
when tar makes a archive file, use -h parameter.

   -h, --dereference
            follow symlinks; archive and dump the files they point to




-Roy



> p.
>
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

