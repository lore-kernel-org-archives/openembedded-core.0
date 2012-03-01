Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3FME-0006Uo-R1 for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 00:24:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21NFq0U023799
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 23:15:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23259-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 23:15:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21NFgRv023793
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 23:15:44 GMT
Message-ID: <1330643746.14819.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 23:15:46 +0000
In-Reply-To: <1330623698-25148-1-git-send-email-gary@mlbassoc.com>
References: <1330623698-25148-1-git-send-email-gary@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2 0/2] Fix /etc/timestamp handling
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
X-List-Received-Date: Thu, 01 Mar 2012 23:24:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-01 at 10:41 -0700, Gary Thomas wrote:
> Recent changes have attempted to make consistant use of /etc/timestamp
> In particular
>   5aab665 initscripts: Make /etc/timestamp consistent again.
>   173a48f image.bbclass: Ensure timestamp matches format used in initscripts after recent changes
>   e32e236 busybox: Enable 64 bit shell tests, and disable non-standard date format interpretation.
> 
> However, this format of the timestamp is not directly compatible with
> the 'date' command line, so it must be reformatted for use.  Also,
> the busybox CONFIG_FEATURE_DATE_COMPAT needs to be enabled so that all 
> versions of 'date', whether from busybox or coreutils, agree on the format 
> when setting the date from the command line.
> 
> Gary Thomas (2):
>   initscripts: Properly format date when set from timestamp
>   busybox: Restore 'date' compatability

Merged to master, thanks.

Richard



