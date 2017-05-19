Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C5F30780AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 13:01:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4JD1HxL016401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 19 May 2017 14:01:18 +0100
Message-ID: <1495198877.27342.150.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Bruce Ashfield
	<bruce.ashfield@windriver.com>
Date: Fri, 19 May 2017 14:01:17 +0100
In-Reply-To: <CAJTo0LZmtYMT2Z2N19J85dXi5JnOfPxXBMX=rwEuwcaq1GeiAg@mail.gmail.com>
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1495146527-32073-2-git-send-email-jose.a.lamego@linux.intel.com>
	<1495149157.27342.142.camel@linuxfoundation.org>
	<CAMKF1so_wFUH=eNqBc_Qhach4+C1mW73ZFUuK=TqLaYZ81C=Hg@mail.gmail.com>
	<20170519090232.5z53crs2ocxbbvno@ad.chargestorm.se>
	<CAJTo0LZmtYMT2Z2N19J85dXi5JnOfPxXBMX=rwEuwcaq1GeiAg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 19 May 2017 14:01:19 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] conf/bitbake.conf: include ed in hosttools
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
X-List-Received-Date: Fri, 19 May 2017 13:01:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-05-19 at 12:56 +0100, Burton, Ross wrote:
> 
> On 19 May 2017 at 10:02, Anders Darander <anders@chargestorm.se>
> wrote:
> > As fas as I can (in a recent kernel), whoami is only used in
> > scripts/mkcompile_h. And there, it's only used if
> > $KBUILD_BUILD_USER is
> > empty. I'd rather see that we set $KBUILD_BUILD_USER to something
> > deterministic in our kernel.bbclass.
> > 
> Definitely this.

Agreed, I've mentioned this would be preferred already. I'm just living
in hope someone sends a patch!

-- 
RP

