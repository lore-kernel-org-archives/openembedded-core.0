Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0E134601DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 14:32:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 22 May 2015 07:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="698911745"
Received: from cestaunt-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.15.40])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2015 07:32:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: thomas.perrot@tupi.fr
Date: Fri, 22 May 2015 15:32:32 +0100
Message-ID: <8187173.h5mEVg1DiL@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <CAGXeWgn1jDsCLAA-F8zvPCZ+qyGyfQtmbwe-AvF5kAuir6Z-8w@mail.gmail.com>
References: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
	<4841436.ZzPOYoFhDl@peggleto-mobl.ger.corp.intel.com>
	<CAGXeWgn1jDsCLAA-F8zvPCZ+qyGyfQtmbwe-AvF5kAuir6Z-8w@mail.gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-serialgetty: Remove SERIAL_CONSOLE definition, because it depends of machine definition. Set it, here, can be make the value is not good.
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
X-List-Received-Date: Fri, 22 May 2015 14:32:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 22 May 2015 16:27:05 Thomas PERROT wrote:
> On Fri, May 22, 2015 at 4:06 PM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> > On Friday 22 May 2015 15:58:58 Thomas PERROT wrote:
> > > Sorry, I meant systemd-serialgetty.bb from meta instead of meta-systemd.
> > > So replace "?=" by "??=" should be a better solution.
> > 
> > You still haven't described the actual problem, because what you did
> > describe (the machine config being overridden by this) shouldn't be
> > possible. Again, did  you check bitbake -e systemd-serialgetty | less ?
>
> Attached the result of the command bitbake -e systemd-serialgetty

So from what you've just sent, the final value is "115200 ttyAMA0" which is the 
value set by the machine config - so it seems like it's working as it should. 
How are you determining that there is a problem?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

