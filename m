Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E2C8A6D89C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:49:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAICms1C031129; Mon, 18 Nov 2013 12:48:54 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id p7mlKYVLoyRW; Mon, 18 Nov 2013 12:48:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAICmnHn031115
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Nov 2013 12:48:50 GMT
Message-ID: <1384778925.6460.229.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Nov 2013 12:48:45 +0000
In-Reply-To: <CAJTo0LZZg3tsdVCSFQBzb_J2bSmCcJY9PwuXRuiGW3ZX2y6q_w@mail.gmail.com>
References: <1384776180.6460.218.camel@ted>
	<CAJTo0LZZg3tsdVCSFQBzb_J2bSmCcJY9PwuXRuiGW3ZX2y6q_w@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg in svn?
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
X-List-Received-Date: Mon, 18 Nov 2013 12:49:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-11-18 at 12:33 +0000, Burton, Ross wrote:
> On 18 November 2013 12:03, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > recipes-sato/puzzles/puzzles_r9765.bb:SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
> 
> Seems like a pretty good reason to ditch puzzles, IMHO.

Somehow I knew you'd say that. I still maintain those make a great
demo/test app. I'm sure we could just point at a tarball by default for
this ;-).

Cheers,

Richard


