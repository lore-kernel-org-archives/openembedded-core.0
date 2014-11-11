Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 65CDC65CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 18:30:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sABIUIJO025946
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Nov 2014 10:30:19 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 11 Nov 2014 10:30:18 -0800
Date: Tue, 11 Nov 2014 12:29:56 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20141111122956.3e842de1@e6410-2>
In-Reply-To: <1415703324.2820.37.camel@linuxfoundation.org>
References: <cover.1415390286.git.peter.seebach@windriver.com>
	<d2ce73488a8afb7a8d10286da138810d30b4a4be.1415390286.git.peter.seebach@windriver.com>
	<1415457765.2820.21.camel@linuxfoundation.org>
	<1415703324.2820.37.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] eglibc-use-option-groups.patch: Several fixups
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
X-List-Received-Date: Tue, 11 Nov 2014 18:30:29 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 11 Nov 2014 10:55:24 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> > Whilst I haven't 100% confirmed it,
> > https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/102/steps/BuildImages/logs/stdio
> > looks like it may well be as a result of this change (which was included
> > in the master-next build in question)...  
> 
> It is 100% confirmed now, with the patch reverted there was a green
> build.

Drat. I'll study this more and try to figure out what I missed.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

