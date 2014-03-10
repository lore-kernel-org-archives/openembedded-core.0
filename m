Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 784E06E43F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 06:10:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2A6A6JR032306; Mon, 10 Mar 2014 06:10:07 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L9PDZKFYsJsg; Mon, 10 Mar 2014 06:10:06 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2A69xLH032302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 10 Mar 2014 06:10:04 GMT
Message-ID: <1394431792.7883.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Sun, 09 Mar 2014 23:09:52 -0700
In-Reply-To: <1394423288-11049-4-git-send-email-sgw@linux.intel.com>
References: <1394423288-11049-1-git-send-email-sgw@linux.intel.com>
	<1394423288-11049-4-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] bind: Update to 9.9.5
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
X-List-Received-Date: Mon, 10 Mar 2014 06:10:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-03-09 at 20:48 -0700, Saul Wold wrote:
> Remove CVE patches that are in bind
> Updated COPYRIGHT includes date changes the NetBSD Copyright
> Modifies the Base BSD License to 3-Clause (removes advertising clause)w
> Add patch to disable running tests on host
> bind: Add python-core for dnssec
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Judging from the autobuilder failures, this one could still use some
work :/

Cheers,

Richard


