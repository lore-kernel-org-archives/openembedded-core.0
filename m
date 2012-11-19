Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TaUZm-000781-7x for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 17:52:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJGbxVw028689;
	Mon, 19 Nov 2012 16:37:59 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28236-02; Mon, 19 Nov 2012 16:37:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAJGboUO028683
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 19 Nov 2012 16:37:51 GMT
Message-ID: <1353343072.3709.183.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andy Ross <andy.ross@windriver.com>
Date: Mon, 19 Nov 2012 16:37:52 +0000
In-Reply-To: <50A68F5D.6050100@windriver.com>
References: <1351792979-6672-1-git-send-email-andy.ross@windriver.com>
	<50A68F5D.6050100@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs
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
X-List-Received-Date: Mon, 19 Nov 2012 16:52:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-16 at 11:09 -0800, Andy Ross wrote:
> On 11/01/2012 11:02 AM, Andy Ross wrote:
> > We hit a problem trying to exclude L/GPLv3 recipes where
> > INCOMPATIBLE_LICENSE could only match exactly one license.  The older
> > wildcard syntax had been broken by a more recent SPDX change
> > (specifying a string without a SPDXLICENSEMAP entry could crash), so
> > "*GPLv3" wouldn't work.
> 
> Ping

I'd like Beth to comment on this patch and she was out last week. I'm
not 100% if she is back this week :/.

Cheers,

Richard



