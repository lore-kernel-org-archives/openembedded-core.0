Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC4871AC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:05:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7PB54cm005418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 25 Aug 2017 12:05:05 +0100
Message-ID: <1503659104.32591.220.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
	openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 12:05:04 +0100
In-Reply-To: <1503659012.5806.9.camel@andred.net>
References: <20170824091924.25945-1-git@andred.net>
	<1503569930.32591.188.camel@linuxfoundation.org>
	<1503659012.5806.9.camel@andred.net>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 25 Aug 2017 12:05:05 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] bitbake.conf: Add run-parts to HOSTTOOLS
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
X-List-Received-Date: Fri, 25 Aug 2017 11:05:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-08-25 at 12:03 +0100, André Draszik wrote:
> On Thu, 2017-08-24 at 11:18 +0100, Richard Purdie wrote:
> > We definitely should not be doing this, there is clearly a
> > dependency
> > missing somewhere else. ca-certificates should depend on whatever
> > provides that...
> In OE, run-parts is provided by debianutils, or by busybox, both of
> which
> don't have a native version in OE.
> 
> ca-certificates seems to always have relied on run-parts from the
> host
> environment. OE even carries a patch to make it work with run-parts
> from
> Fedora.
> 
> What would be the preferred way to resolve this so?

The patches I have in master-next which enable a native version of
debianutils and then add it as a dependency from ca-certificates?

Cheers,

Richard

