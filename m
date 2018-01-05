Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A5CFF780FA;
	Fri,  5 Jan 2018 12:22:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w05CMa7b024631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 5 Jan 2018 12:22:37 GMT
Message-ID: <1515154956.30291.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>, "Burton, Ross"
	<ross.burton@intel.com>, Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 05 Jan 2018 12:22:36 +0000
In-Reply-To: <cad1f9fe-e682-a5f6-72ab-71a7738ea46a@dresearch-fe.de>
References: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
	<CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
	<6d1905cf-26d2-49cf-d0bb-248cbf4a071d@dresearch-fe.de>
	<CAJTo0LYWwMnj4Wb6JC1y7uw4ZrPv6=SynfkSc0TU0dwi9Dezjw@mail.gmail.com>
	<8926eabe-78fe-dfaa-d123-5d4ed39e0001@dresearch-fe.de>
	<9d1c1e79-5eab-941c-0d30-314f9df51de1@dresearch-fe.de>
	<1515076794.5525.196.camel@linuxfoundation.org>
	<cad1f9fe-e682-a5f6-72ab-71a7738ea46a@dresearch-fe.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: MS Windows machine?
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
X-List-Received-Date: Fri, 05 Jan 2018 12:22:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-01-05 at 12:29 +0100, Steffen Sledz wrote:
> On 04.01.2018 15:39, Richard Purdie wrote:
> > 
> > In basic terms, you need a machine which:
> > 
> > * Sets TARGET_ARCH to the right thing (i686 or x86_64)
> > * Sets TARGET_OS to mingw32
> > 
> > and then some distro config which sets up the toolchain when mingw
> > is
> > the target os to the values like meta-mingw/conf/machine-sdk/i686-
> > mingw32.conf sets.
> Do you have a sample distro config which we can use as a template?

No, sorry. As I said, I've not tried this before. Its not a trivial
thing to do, equally it shouldn't be too bad given what we already
have...

Sadly I don't have the time available to play with something like that
either, much as I do quite enjoy it...

Cheers,

Richard

