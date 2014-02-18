Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 6A55B6E8DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 21:24:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,503,1389744000"; d="scan'208";a="64617440"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 18 Feb 2014 21:24:42 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1WFs9i-0005pS-Qc; Tue, 18 Feb 2014 21:24:42 +0000
Date: Tue, 18 Feb 2014 21:24:42 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140218212442.GA22168@mcrowe.com>
References: <20140218205346.GA21359@mcrowe.com>
	<CAMKF1sr1Aa86Bpbkas6rBh_XPQtLLeraHO17jMDtggsZUh7-7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr1Aa86Bpbkas6rBh_XPQtLLeraHO17jMDtggsZUh7-7w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: boost: Ineffective compileflags and linkflags in user-config.jam
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
X-List-Received-Date: Tue, 18 Feb 2014 21:24:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 18 February 2014 at 13:01:31 -0800, Khem Raj wrote:
> On Tue, Feb 18, 2014 at 12:53 PM, Mike Crowe <mac@mcrowe.com> wrote:
> > or should users of this recipe be given a convenient ability to override
> > the compileflags, with perhaps something like:
> >
> >  'using gcc ; 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" ;'
> 
> this one. care to send a patch ?

Hi Khem,

I can do once I've tested it against current master.

Thanks.

Mike.

