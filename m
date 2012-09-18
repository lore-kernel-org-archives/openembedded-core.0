Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TDtzj-00035C-5A for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 11:21:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8I98kgp026203;
	Tue, 18 Sep 2012 10:08:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25975-02; Tue, 18 Sep 2012 10:08:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8I98dPG026197
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 18 Sep 2012 10:08:40 +0100
Message-ID: <1347959319.13596.90.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 18 Sep 2012 10:08:39 +0100
In-Reply-To: <505837BA.2040305@linaro.org>
References: <505837BA.2040305@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Best way to update gnu-config?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 09:21:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-18 at 10:58 +0200, Marcin Juszkiewicz wrote:
> I am working on meta-aarch64 layer to add 64-bit ARM support.
> 
> For that I have to update gnu-config to newer version. Currently I am
> using gnu-config_git.bbappend to move to 20120814 one. OE-Core is using
> tarball prepared by Yocto Project so update is not so easy for outside
> developer.
> 
> Attached are files which I am using (including updated uclibc patch).
> Please reply with information how I can get it fully merged.

The trouble was that upstream was in cvs. It was the only reason we
still had a dependency on cvs and we decided we wanted to kill it which
isn't something I regret.

Can you share a tarball of the updated (unpatched) upstream version and
we'll put it into place alongside the other tarball on the server.
Michael (cc'd) should be able to do this. Once that is done you should
be able to send a patch as usual to update to the new version.

I appreciate this is a pain but a dependency on cvs is worse IMO ;-).

Cheers,

Richard





