Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QFNDf-00078y-GC for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 11:09:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S96Veg016146;
	Thu, 28 Apr 2011 10:06:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16094-02; Thu, 28 Apr 2011 10:06:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S96N1R016140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 28 Apr 2011 10:06:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <a34718a02b76e37c59ff67d9e182bd7b64c9f125.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<a34718a02b76e37c59ff67d9e182bd7b64c9f125.1303889119.git.sgw@linux.intel.com>
Date: Thu, 28 Apr 2011 10:05:52 +0100
Message-ID: <1303981552.21461.43.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>,
	Antonio Ospite <ospite@studenti.unina.it>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH 34/52] logging: add bb* logging mechanisms for bash recipe functions
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
X-List-Received-Date: Thu, 28 Apr 2011 09:09:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Darren,

On Wed, 2011-04-27 at 00:29 -0700, Saul Wold wrote:
> The following logging mechanisms are to be used in bash functions of recipes.
> They are intended to map one to one in intention and output format with the
> python recipe logging functions of a similar naming convention: bb.plain(),
> bb.note(), etc.
> 
> For the time being, all of these print only to the task logs. Future
> enhancements may integrate these calls with the bitbake logging infrastructure,
> allowing for printing to the console as appropriate. The interface and intention
> statements reflect that future goal. Once it is in place, no changes will be
> necessary to recipes using these logging mechanisms.

This looks good but could you do a search and replace of any existing
users of the oe* functions and then remove them from base.bbclass
please? At the very least they should be calling the bb* equivalents.
I'd like to clean up this kind of thing as we go.

Cheers,

Richard




