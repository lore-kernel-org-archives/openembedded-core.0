Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rivnf-00051r-NH for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 23:28:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05MLLGU011643
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 22:21:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11487-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2012 22:21:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q05MLFoa011637
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jan 2012 22:21:15 GMT
Message-ID: <1325802075.20759.78.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 05 Jan 2012 22:21:15 +0000
In-Reply-To: <7583e732bc226f24befcad605b4bfa0536a1ae3c.1325797875.git.scott.a.garman@intel.com>
References: <cover.1325797875.git.scott.a.garman@intel.com>
	<7583e732bc226f24befcad605b4bfa0536a1ae3c.1325797875.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] insane.bbclass: use bb.process.Popen instead of subprocess.check_output
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
X-List-Received-Date: Thu, 05 Jan 2012 22:28:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-05 at 13:12 -0800, Scott Garman wrote:
> subprocess.check_output was only introduced in Python v2.7, so we
> cannot use it. This refactors the QA test to use bb.process.Popen
> instead.
> 
> This fixes the error:
> 
> AttributeError: 'module' object has no attribute 'check_output'
> 
> It no longer checks the return status of prelink-rtld, as that
> case was simply adding noise. This QA test is intended to only
> warn about specific paths that binaries could be linking to, not
> handle the case where there is a missing library.
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/classes/insane.bbclass |   16 ++++++----------
>  1 files changed, 6 insertions(+), 10 deletions(-)

Merged to master, thanks for the quick fix!

Cheers,

Richard



