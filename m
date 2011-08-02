Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoDSb-0004lS-Tf for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 13:48:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72BiDNR015092
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 12:44:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14658-04 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2011 12:44:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72Bi6x7015086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Aug 2011 12:44:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
Date: Tue, 02 Aug 2011 12:43:50 +0100
Message-ID: <1312285430.2344.582.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Aug 2011 11:48:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 14:08 +0800, Dexuan Cui wrote:
> [YOCTO #671]
> 
> "readlink -f" in Ubuntu 10.04 is buggy: it doesn't ignore a trailing / (e.g.,
> "readlink -f /tmp/non-existent-dir/" returns nothing, but according to
> http://www.gnu.org/s/coreutils/manual/coreutils.pdf it should do that --
> hence we get bug 671. It seems Ubuntu 10.10 or even later Ubuntu 11.04,
> and other Linux distributions(e.g., Open Suse 11.4) haven't such an issue.
> 
> So I think we should detect this and ask Ubuntu 10.04 users to avoid supply
> a path with trailing slash here.
> 
> Moreever, I also add the detection of non-existent path, e.g.,
> source oe-init-build-env /non-existent-dir/build
> can be detected and we'll print an error msg.
> And, if we get errors in oe-buildenv-internal, we should stop the script
> and shouldn't further run.
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>

Merged to master, thanks.

Richard



