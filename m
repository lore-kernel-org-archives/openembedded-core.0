Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 742956EEE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 12:35:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1BCZ0p3021629; Tue, 11 Feb 2014 12:35:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EowJFPZKJAcH; Tue, 11 Feb 2014 12:35:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1BCYrKr021606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 11 Feb 2014 12:34:55 GMT
Message-ID: <1392122088.7120.138.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 11 Feb 2014 12:34:48 +0000
In-Reply-To: <cover.1392067183.git.sgw@linux.intel.com>
References: <cover.1392067183.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Consolidated Pull 00/11] Kernel Update and more ptest support
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
X-List-Received-Date: Tue, 11 Feb 2014 12:35:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-02-10 at 13:26 -0800, Saul Wold wrote:
> Richard,
> 
> These are changes that went through the Autobuild, I reviewed them. 
> The ptest changes have been pending for a bit, is there a reason that
> you have not taken them?

Did you look at the results of the autobuild? Several items failed. 

Specifically on the ptest parts, did you read my reply to the previous
pull request you sent? Or my emails on the list about some of these
patches? There is a good reason I'm not taking the ptest ones. I was
discussed in the bug triage meeting too.

> The following changes since commit b5b4898cd409036161c62891e9618d9ab3f891f9:
> 
>   python-pycurl: upgrade to 7.19.3 (2014-02-08 21:03:27 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (3):
>   kernel: stop using -exec rm for deleting files

This version of the patch is broken and causes a build failure. There is
a fixed version out there. I'll take that instead.

>   linux-yocto/3.10: integrate LTSI
>   linux-yocto/3.10: add powermanagement config to 32 bit common-pc
> 
> Chong Lu (2):
>   acl: enable ptest support

This adds in perl as a dependency which breaks nightly-x32.

The big problem here is I can't trust what you're doing in these pull
requests :(

Please either make time to do this properly, or just don't do it but
please don't half do it.

Cheers,

Richard


