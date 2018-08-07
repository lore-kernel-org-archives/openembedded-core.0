Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 59E1F78CD2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 14:56:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w77Eui9G017462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 7 Aug 2018 15:56:46 +0100
Message-ID: <ca5558b48566d2b5eefa4c067966c284c30f415f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <Kai.Kang@windriver.com>, Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 07 Aug 2018 15:56:44 +0100
In-Reply-To: <0f9d0236ac43b464c8586d1b09505cddae0265b5.camel@linuxfoundation.org>
References: <20180803014947.23598-1-kai.kang@windriver.com>
	<20180803014947.23598-2-kai.kang@windriver.com>
	<178d4c597dac03d0d39b55450f023c57bd6c7c3e.camel@linuxfoundation.org>
	<504e6f59-83c5-9019-f2df-a1ce88e9a9f4@windriver.com>
	<a8d925bb-8463-ddd2-ea9b-aa74a5ed9394@windriver.com>
	<0f9d0236ac43b464c8586d1b09505cddae0265b5.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] remove allarch from recipes which rdepends on TUNE_PKGARCH packages
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
X-List-Received-Date: Tue, 07 Aug 2018 14:56:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-08-07 at 11:44 +0100, richard.purdie@linuxfoundation.org
wrote:
> On Tue, 2018-08-07 at 17:37 +0800, Kang Kai wrote:
> > On 2018年08月06日 22:51, Mark Hatle wrote:
> > > > 
> > > > > resolvconf -> bash
> > > > > weston-init -> weston kbd
> > > > 
> > > > weston RRECOMMENDS weston-init?
> > 
> > weston-init install init file which calls weston or weston-launch
> > from 
> > package weston and openvt from package kbd.
> 
> Agreed.
> 
> My worry is that this move effectively makes allarch usesless since
> any
> script using an interpreter will now need to be not allarch since
> most
> interpreters are not allarch.
> 
> I'm not sure this is a good move...

Thinking about this further, we could just disable allarch if multilib
is enabled? That would seem to address most of the issues, not entirely
satisfactorily but enough to make things work... ?

Cheers,

Richard


