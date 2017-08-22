Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C2746782B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 19:55:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MJts5v028481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 20:55:55 +0100
Message-ID: <1503431754.32591.130.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, "Huang, Jie (Jackie)"
	<jackie.huang@windriver.com>
Date: Tue, 22 Aug 2017 20:55:54 +0100
In-Reply-To: <CAJ86T=U1Wp8heeowiTNTwQd9vjmbP6AvSFYe8V8UYuSGQrs7Mw@mail.gmail.com>
References: <20170822074219.8490-1-jackie.huang@windriver.com>
	<CAJ86T=U1Wp8heeowiTNTwQd9vjmbP6AvSFYe8V8UYuSGQrs7Mw@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 20:55:55 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: add python to default PACKAGECONFIG options
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
X-List-Received-Date: Tue, 22 Aug 2017 19:55:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-22 at 12:51 -0700, Andre McCurdy wrote:
> On Tue, Aug 22, 2017 at 12:42 AM,  <jackie.huang@windriver.com>
> wrote:
> > 
> > From: Jackie Huang <jackie.huang@windriver.com>
> > 
> > We want to provide python libs by default, and some other
> > popular Linux distributions like redhat/fedora does the same.
> Has something changed? Is there anything in oe-core or meta-oe which
> now needs boost python support enabled?

Does it even actually build on all arches?

I'm rather behind with patch review right now as people are putting so
many patches out there with what seems like minimal testing and
expecting me/Ross and the autobuilder to figure out the problems for
them.

Each time one fails, it blocks the queue with the rest of them in and I
have to retest until I get something clean.

Testing this change is quite a way down my priority list I'm afraid.

Cheers,

Richard



