Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B8D056EF8A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 15:47:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1EFkwMT017727; Fri, 14 Feb 2014 15:46:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eNxoXB38drpR; Fri, 14 Feb 2014 15:46:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1EFkrQ4017721
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 14 Feb 2014 15:46:55 GMT
Message-ID: <1392392807.14081.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Fri, 14 Feb 2014 15:46:47 +0000
In-Reply-To: <CF225582.6D067%dvhart@linux.intel.com>
References: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
	<1392250819-10123-3-git-send-email-joaohf@gmail.com>
	<1392291238.14081.10.camel@ted> <CF225582.6D067%dvhart@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] cml1.bbclass: Add fragmentconfig task to cml1
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
X-List-Received-Date: Fri, 14 Feb 2014 15:47:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2014-02-13 at 11:00 -0800, Darren Hart wrote:
> On 2/13/14, 3:33, "Richard Purdie" <richard.purdie@linuxfoundation.org>
> wrote:
> 
> >On Wed, 2014-02-12 at 22:20 -0200, João Henrique Ferreira de Freitas
> >wrote:
> >> fragmentconfig() is a new task that makes a diff between the
> >> old and new config files and writes to the fragment.cfg result file.
> >> menuconfig() always copy the original config file, so the user
> >> doesn't need to copy it.
> >> 
> >> Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
> >> ---
> >>  meta/classes/cml1.bbclass | 35 +++++++++++++++++++++++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >> 
> >> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> >> index e292ecb..2053361 100644
> >> --- a/meta/classes/cml1.bbclass
> >> +++ b/meta/classes/cml1.bbclass
> 
> One more thought on this. As this is currently linux-yocto specific, does
> it belong in cml1.bbclass? It may make sense in busybox as well, so maybe
> this is the right place.
> 
> RP, do you have a preference?

Its starting to head in a direction we could probably use a
kern-tools.bbclass to keep the code in a common place.

Cheers,

Richard



