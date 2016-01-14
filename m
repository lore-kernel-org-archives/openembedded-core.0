Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B328731CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:27:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0ELRLcP025958
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jan 2016 13:27:21 -0800 (PST)
Received: from seebs-worktop (172.25.40.229) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 13:27:20 -0800
Date: Thu, 14 Jan 2016 15:27:19 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20160114152719.528e3065@seebs-worktop>
In-Reply-To: <CAJ86T=USrxx9LmAHpZXC9wnMDCZ1s-NT+Fq+H=ovLApjU8ks1A@mail.gmail.com>
References: <cover.1452805356.git.peter.seebach@windriver.com>
	<f6baa71e96dbb72af5d9a48fcea142544bc47795.1452805356.git.peter.seebach@windriver.com>
	<CAJ86T=USrxx9LmAHpZXC9wnMDCZ1s-NT+Fq+H=ovLApjU8ks1A@mail.gmail.com>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Use TUNE_CCARGS for target compilation
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
X-List-Received-Date: Thu, 14 Jan 2016 21:27:24 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 14 Jan 2016 13:24:22 -0800
Andre McCurdy <armccurdy@gmail.com> wrote:

> Could that PPC64 issue be solved in the same way that the default arch
> is set in gcc-configure-common.inc for the various MIPS targets?

Huh. That might be a better choice. I hadn't noticed that default arch
selection thing. It would make sense to use that. I'll give it a look and see
whether it works.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

