Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 320976B574
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 10:42:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0AAg87x019748; Fri, 10 Jan 2014 10:42:09 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mHABqFP9aMlf; Fri, 10 Jan 2014 10:42:08 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0AAg2wv019743
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 10 Jan 2014 10:42:03 GMT
Message-ID: <1389350516.19102.206.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 10 Jan 2014 10:41:56 +0000
In-Reply-To: <52CF90CB.3010300@windriver.com>
References: <cover.1389003637.git.Martin.Jansa@gmail.com>
	<52CF90CB.3010300@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][PATCH 0/2] Dora backports
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
X-List-Received-Date: Fri, 10 Jan 2014 10:42:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-01-10 at 14:18 +0800, Robert Yang wrote:
> Hi Martin,
> 
> Thanks, please see my comments in line.
> 
> On 01/06/2014 06:21 PM, Martin Jansa wrote:
> > The following changes since commit e86622a932bbd0acdea67ecfb15c8b06c27353d8:
> >
> >    libsoup-2.4: add intltool-native to DEPENDS (2013-12-19 14:59:47 +0000)
> >
> > are available in the git repository at:
> >
> >    git://git.openembedded.org/openembedded-core-contrib jansa/dora-backports2
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/dora-backports2
> >
> > Martin Jansa (1):
> >    ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
> >
> 
> I will take this.
> 
> > Richard Purdie (1):
> >    eglibc-initial.inc: Drop duplicate include
> >
> 
> 
> It seems that this is a trivial fix, I don't think it's a good idea to merge
> it to dora.

Thanks to one of the bitbake patches we backported, this "trivial" issue
is now putting warnings in peoples builds so I think it might be a good
idea to fix it.

Cheers,

Richard


