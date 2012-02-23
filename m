Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0ia2-0007GO-Ba for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 01:00:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1NNpkYR030700
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 23:51:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30202-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 23:51:41 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1NNpUWB030694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 23:51:39 GMT
Message-ID: <1330041085.25226.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 23 Feb 2012 23:51:25 +0000
In-Reply-To: <1330029973-15207-1-git-send-email-obi@opendreambox.org>
References: <1330029973-15207-1-git-send-email-obi@opendreambox.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] lib/oe/utils.py: use bb.utils.vercmp_string
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
X-List-Received-Date: Fri, 24 Feb 2012 00:00:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 21:46 +0100, Andreas Oberritter wrote:
> Fixes the following warning:
> 
> | WARNING: .../meta/lib/oe/utils.py:31: DeprecationWarning: Call to deprecated function bb.vercmp_string: Please use bb.utils.vercmp_string instead.
> |  result = bb.vercmp(d.getVar(variable,True), checkvalue)
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/lib/oe/utils.py |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



