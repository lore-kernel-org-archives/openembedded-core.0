Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A63606E831
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 22:34:38 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0SMYJnf012540; Tue, 28 Jan 2014 22:34:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v_PezsyZQ6Nz; Tue, 28 Jan 2014 22:34:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0SMYGmO012536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 28 Jan 2014 22:34:17 GMT
Message-ID: <1390948450.24655.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 28 Jan 2014 22:34:10 +0000
In-Reply-To: <52E80A0F.5070003@linux.intel.com>
References: <1390931044-24421-1-git-send-email-ross.burton@intel.com>
	<52E80A0F.5070003@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pkgconfig: remove out-dated configure options and dependencies
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
X-List-Received-Date: Tue, 28 Jan 2014 22:34:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-28 at 11:50 -0800, Saul Wold wrote:
> Although not in this email a change to this patch seems to have removed 
> the glibconfig-sysdefs.h file but not the entry in SRC_URI for the _0,28 
> and _git recipes.
> 
> Not sure what happened with this, but master is not working and we 
> should either revert this change or clean up the issue.

Sorry, my fault, I messed with the commit and broke it. I've pushed a
fix.

Cheers,

Richard


