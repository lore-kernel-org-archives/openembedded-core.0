Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43792782CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 20:19:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5DKJKr5029636
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Jun 2017 13:19:20 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.60.199) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Jun 2017 13:19:20 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jun 2017 16:19:19 -0400
Message-ID: <2107717.czG0uAHZhm@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.10.0-22-generic; KDE/5.31.0; x86_64; ; )
In-Reply-To: <CAJTo0LZM24U_5KuSFbkXUrQnvEh0DWNsogUrPCHtoyHS1U_gVw@mail.gmail.com>
References: <1497377291-489-1-git-send-email-mark.asselstine@windriver.com>
	<4368246.Ra2jL4npuG@yow-masselst-lx1>
	<CAJTo0LZM24U_5KuSFbkXUrQnvEh0DWNsogUrPCHtoyHS1U_gVw@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: Fix build failure when image includes man-pages pkg
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
X-List-Received-Date: Tue, 13 Jun 2017 20:19:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, June 13, 2017 9:13:28 PM EDT Burton, Ross wrote:
> On 13 June 2017 at 19:46, Mark Asselstine <mark.asselstine@windriver.com>
> 
> wrote:
> > Yet the 'Upstream-status' is marked in the same way for both patches. So I
> > am
> > ingnoring this unless someone is able to see the issue which I can not.
> 
> The test is picky:
> 
> +Upstream-status: Backport
> 
> The correct string (as machines are stupid) is Upstream-Status.

I notice the case on the wiki pages now. I will send along a v2.

Mark

> 
> Ross



