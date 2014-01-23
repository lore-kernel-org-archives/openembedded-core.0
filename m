Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DBEA96DC8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:21:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0NCLdNa004568; Thu, 23 Jan 2014 12:21:39 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Zmn-82y8kQ9X; Thu, 23 Jan 2014 12:21:39 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0NCLVIH004560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 23 Jan 2014 12:21:33 GMT
Message-ID: <1390479686.17424.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Thu, 23 Jan 2014 12:21:26 +0000
In-Reply-To: <1390460640.24755.11.camel@e130.pbcl.net>
References: <1390459814-15764-1-git-send-email-sgw@linux.intel.com>
	<1390460640.24755.11.camel@e130.pbcl.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boot-directdisk: fix the support of vmdk
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
X-List-Received-Date: Thu, 23 Jan 2014 12:21:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-23 at 07:04 +0000, Phil Blundell wrote:
> On Wed, 2014-01-22 at 22:50 -0800, Saul Wold wrote:
> > +IS_VMDK = '${@base_contains("IMAGE_FSTYPES", "vmdk", "true", "false", d)}'
> > +
> > +	if [ "${IS_VMDK}" ]; then
> 
> Does that really work?  I can't quite see how it would, but I might be
> overlooking something.  Presumably you did test this, right?

I've merged this since I really would like to try and get the builds
stabilised. I did fix the patch since it would always evaluate as true
the way it was...

Cheers,

Richard


