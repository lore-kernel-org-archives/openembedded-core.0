Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBE579AD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 21:42:08 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9CLg6K4016658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 12 Oct 2018 22:42:07 +0100
Message-ID: <d33798973eaad929a0ff674b3651c985ee684f36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 12 Oct 2018 22:42:06 +0100
In-Reply-To: <CAMKF1sqEBLiSmzJALVmvRep0jzAGpgqtuZZVaoWu69D-X3dktg@mail.gmail.com>
References: <20181012202823.4003-1-raj.khem@gmail.com>
	<CAJ86T=WjWNPB+upTuQN8EndUGFC_jBqSRO59Xy=7RZANoaSPdA@mail.gmail.com>
	<CAMKF1sqEBLiSmzJALVmvRep0jzAGpgqtuZZVaoWu69D-X3dktg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Do not use thumb1 ISA on armv6
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
X-List-Received-Date: Fri, 12 Oct 2018 21:42:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-12 at 14:13 -0700, Khem Raj wrote:
> On Fri, Oct 12, 2018 at 1:56 PM Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > 
> > On Fri, Oct 12, 2018 at 1:28 PM, Khem Raj <raj.khem@gmail.com>
> > wrote:
> > > This does not work and is unsupported so lets compile glibc in
> > > ARM mode
> > > always on armv6 SOCs
> > 
> > Note the comments in glibc-collateral.inc:
> > 
> >   # This needs to match with glibc.inc, otherwise glibc-scripts and
> > glibc-locale
> >   # will fail to find main glibc, for details see
> >   # 
> > http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100679.html
> >   ARM_INSTRUCTION_SET_armv4 = "arm"
> >   ARM_INSTRUCTION_SET_armv5 = "arm"
> > 
> > Either the two recipes need to be kept in sync or the comment no
> > longer applies?
> 
> I think we can delete comment in a followup

Looking at the link I'd have said that issue still applies?

Cheers,

Richard


