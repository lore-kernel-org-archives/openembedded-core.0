Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD2C6DEDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 23:15:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2INFL4f022032; Tue, 18 Mar 2014 23:15:21 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tZCOb72Dk4D1; Tue, 18 Mar 2014 23:15:21 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2INFHvZ022020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 18 Mar 2014 23:15:19 GMT
Message-ID: <1395184511.3808.101.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 18 Mar 2014 23:15:11 +0000
In-Reply-To: <5328C8A0.1010100@linux.intel.com>
References: <b01b97b0f8a67d3aeae9ed01e24c5e6bace8e43b.1395068545.git.alexandru.damian@intel.com>
	<6f3acb92219b832f847d4e59342c8c4582ac5b78.1395068545.git.alexandru.damian@intel.com>
	<5328C8A0.1010100@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Alex DAMIAN <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] buildstats: use TaskBase time for elapsed time
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
X-List-Received-Date: Tue, 18 Mar 2014 23:15:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-03-18 at 15:28 -0700, Saul Wold wrote:
> On 03/17/2014 08:04 AM, Alex DAMIAN wrote:
> > From: Marius Avram <marius.avram@intel.com>
> >
> > To avoid any further inconsistencies between buildstats and buildinfohelper
> > from toaster, buildstats will measure task duration using the time field
> > from within the TaskBase events: TaskStarted and TaskSucceeded/TaskFailed.
> >
> 
> This patch seems to be causing some problems:

I suspect this is dependent on a bitbake change...

Cheers,

Richard


