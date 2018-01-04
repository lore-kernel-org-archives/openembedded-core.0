Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8266E7780D;
	Thu,  4 Jan 2018 14:39:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w04EdsRG015078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 4 Jan 2018 14:39:56 GMT
Message-ID: <1515076794.5525.196.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 04 Jan 2018 14:39:54 +0000
In-Reply-To: <9d1c1e79-5eab-941c-0d30-314f9df51de1@dresearch-fe.de>
References: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
	<CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
	<6d1905cf-26d2-49cf-d0bb-248cbf4a071d@dresearch-fe.de>
	<CAJTo0LYWwMnj4Wb6JC1y7uw4ZrPv6=SynfkSc0TU0dwi9Dezjw@mail.gmail.com>
	<8926eabe-78fe-dfaa-d123-5d4ed39e0001@dresearch-fe.de>
	<9d1c1e79-5eab-941c-0d30-314f9df51de1@dresearch-fe.de>
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
X-List-Received-Date: Thu, 04 Jan 2018 14:40:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-04 at 07:31 +0100, Steffen Sledz wrote:
> On 21.12.2017 14:00, Steffen Sledz wrote:
> > 
> > On 21.12.2017 12:39, Burton, Ross wrote:
> > > 
> > > If you want to build for a Windows target then that should be
> > > possible but
> > > nobody as far as I'm aware has made the work public.  meta-mingw
> > > will
> > > contain most of the changes needed as that does build Windows
> > > binaries.
> > That's exactly what we like to to.
> > 
> > So has anyone tried this before?
> > 
> > What else would be needed to build e.g. for MACHINE=i686-mingw32?
> Is someone able to create a machine definition for this? I'm not
> really familiar with this job.

In basic terms, you need a machine which:

* Sets TARGET_ARCH to the right thing (i686 or x86_64)
* Sets TARGET_OS to mingw32

and then some distro config which sets up the toolchain when mingw is
the target os to the values like meta-mingw/conf/machine-sdk/i686-
mingw32.conf sets.

You'd need need to look through the bbappends which are in meta-mingw
and add them to the appropriate pieces you need for target binaries
rather than sdk binaries.

I did once do this for darwin so it is possible, I've never tried it
for windows though.

Cheers,

Richard

