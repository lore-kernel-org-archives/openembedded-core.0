Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB3C775FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 22:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2VMnwsx023647; 
	Fri, 31 Mar 2017 23:49:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UG1GbhMVLUrF; Fri, 31 Mar 2017 23:49:58 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2VMntHi023644
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 31 Mar 2017 23:49:57 +0100
Message-ID: <1491000595.13980.375.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 23:49:55 +0100
In-Reply-To: <CAMKF1sp=tgkByXMiELBa+K1=mQ5=ggr-7TwkTdK9m7ieGeeEPg@mail.gmail.com>
References: <1490995693-19005-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sp=tgkByXMiELBa+K1=mQ5=ggr-7TwkTdK9m7ieGeeEPg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] ncurses_6.0: Improve reproducibility
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
X-List-Received-Date: Fri, 31 Mar 2017 22:50:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-03-31 at 22:27 +0000, Khem Raj wrote:
> 
> On Fri, Mar 31, 2017 at 2:29 PM Juro Bystricky <juro.bystricky@intel.
> com> wrote:
> > Build static libraries without the binutils "ar" -U option.
> > This option deliberately breaks deterministic mode.
> While this patch is ok it would be better if we configured binutils
> with enable-deterministic-archives option please file a ticket for
> it 

ncurses is specifically asking binutils to make a non-deterministic
archive here so I'm not sure that would help in this specific case.

Cheers,

Richard

