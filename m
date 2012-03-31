Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SE0SW-0005d8-GY for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 17:43:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VFY9Cd024604;
	Sat, 31 Mar 2012 16:34:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23140-06; Sat, 31 Mar 2012 16:34:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VFY1Q7024598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 31 Mar 2012 16:34:02 +0100
Message-ID: <1333208042.18082.234.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Date: Sat, 31 Mar 2012 16:34:02 +0100
In-Reply-To: <CAOSpxdYtrYctG3V=cKTvSPaNdimVDdP-MgCM0HQYdL3szAFVjg@mail.gmail.com>
References: <1333202821.18082.225.camel@ted>
	<CAOSpxdYtrYctG3V=cKTvSPaNdimVDdP-MgCM0HQYdL3szAFVjg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "sanil.kumar" <sanil.kumar@huawei.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Re-execution of tasks - test report and results
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
X-List-Received-Date: Sat, 31 Mar 2012 15:43:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-31 at 08:04 -0700, Steve Sakoman wrote:
> On Sat, Mar 31, 2012 at 7:07 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > As some people have noticed, there are some rebuild issues happening due
> > to sstate and the use of hashes in the stamp files. By this I mean the
> > case where due to some checksum change, some task gets rerun and the
> > task was not written to run a second time.
> 
> For the set of recipes I typically build with my autobuild script I
> found it necessary to add code to do a -c cleansstate on the following
> recipes:
> 
> shadow-native
> boost
> gcc
> git
> man-pages
> net-tools
> sqlite
> wget
> 
> There seems to be a good amount of overlap with your list, but there
> are a few that are not on your list.

Hmm, yes. We already have a bug open against git but I'd like to
understand shadow-native and sqlite. If you have the failure logs for
those two, I think it would be worth opening bugs for them.

Cheers,

Richard





