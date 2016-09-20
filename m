Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA3496079E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 20:33:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8KKXCv7027089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 13:33:12 -0700
Received: from soho-mhatle-m.local (172.25.36.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Sep 2016 13:33:11 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1474359109.git.hongxu.jia@windriver.com>
	<00a74627bbc662e9c42e0d2bc0a0d6b2adeaab4a.1474359109.git.hongxu.jia@windriver.com>
	<CAJTo0LZ=0_jwrZ=1FXnBHpd_9K=1qfnGijrXe62qSaaNenzUmQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <909061f7-cc26-9af1-a3c1-6e7de855d2a9@windriver.com>
Date: Tue, 20 Sep 2016 15:33:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ=0_jwrZ=1FXnBHpd_9K=1qfnGijrXe62qSaaNenzUmQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] rpm: make install with --nosignature and --nodigest work
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
X-List-Received-Date: Tue, 20 Sep 2016 20:33:13 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/20/16 10:00 AM, Burton, Ross wrote:
> 
> On 20 September 2016 at 09:15, Hongxu Jia <hongxu.jia@windriver.com
> <mailto:hongxu.jia@windriver.com>> wrote:
> 
>     -Upstream-Status: Submitted [Sent email to rpm-devel@rpm5.org
>     <mailto:rpm-devel@rpm5.org>]
>     +Upstream-Status: Rejected [Sent email to rpm-devel@rpm5.org
>     <mailto:rpm-devel@rpm5.org>]
>     +http://rpm5.org/community/rpm-devel/5655.html
>     <http://rpm5.org/community/rpm-devel/5655.html>
> 
> 
> Considering upstream has explicitly rejected this patch, why should we accept it?
> 
> Ross
> 
> 

I'm confused by what the patch is doing looking at it.

It sounds like from the description there is a bug that without the change,
packages with (intentionally) bad checksums and such are allowed to be installed.

The bug is caused by a previous patch that enabled nosignature, etc -- because
the comparisons turned out to be backwards.

So really nosignature, etc is already in place -- it's just not working properly?

What was rejected upstream is the use of nosignature in any context.  RPM5
maintainer believes it is unwise and unsafe to permit uses to install packages
that have failed basic validation.  (I tend to agree.)  Similarly, even being
able to run queries and other operations against them may be dangerous as well.

If fixing the problem is as simple as reverting the other change -- and that
doesn't cause other problems elsewhere...  I'd rather see that.

--Mark

