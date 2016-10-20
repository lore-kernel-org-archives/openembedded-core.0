Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id CFA52719AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 11:13:39 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161020111338917_0685;
	Thu, 20 Oct 2016 04:13:38 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=15723 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bxBHv-0004Jx-CG; Thu, 20 Oct 2016 07:13:31 -0400
Date: Thu, 20 Oct 2016 07:12:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1476960354.2166.107.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1610200712130.14878@ca624034.mitel.com>
References: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
	<2130816.2i4mC23lpe@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191541370.14839@localhost.localdomain>
	<1542758.b0vWq7N0OP@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191733110.26015@localhost.localdomain>
	<1476915092.2166.105.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1610200514490.4275@ca624034.mitel.com>
	<1476960354.2166.107.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: how can i ask to keep all the generated "nativesdk" rpms?
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
X-List-Received-Date: Thu, 20 Oct 2016 11:13:41 -0000
Content-Type: multipart/mixed; BOUNDARY="587864349-579457113-1476961957=:14878"

--587864349-579457113-1476961957=:14878
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 20 Oct 2016, Richard Purdie wrote:

> On Thu, 2016-10-20 at 06:31 -0400, Robert P. J. Day wrote:
> >   just for fun, i'm going to do a fresh build right now, involving:
> >
> > * fresh "git pull" of poky
> > * MACHINE=mpc8315e-rdb
> > * bitbake core-image-minimal
> >
> [...]
> > $ ls -l
> > total 328
> > drwxr-xr-x. 2 rpjday rpjday   4096 Oct 20 05:54 all
> > drwxr-xr-x. 2 rpjday rpjday  40960 Oct 20 06:06 mpc8315e_rdb
> > drwxr-xr-x. 2 rpjday rpjday 286720 Oct 20 06:09 ppce300c3
> > $
> >
> > should i have expected a nativesdk directory?
>
> No, since you didn't build anything that uses nativesdk. Examples that
> do would be:
>
> bitbake buildtools-tarball
> bitbake core-image-minimal -c populate_sdk

  ah, now it becomes clear, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587864349-579457113-1476961957=:14878--
