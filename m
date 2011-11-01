Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLCS6-0000la-NK for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 12:24:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1BICPd027825
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 11:18:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27750-01 for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2011 11:18:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1BI2HG027819
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2011 11:18:03 GMT
Message-ID: <1320146282.15387.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 01 Nov 2011 11:18:02 +0000
In-Reply-To: <cover.1320097891.git.scott.a.garman@intel.com>
References: <cover.1320097891.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] distro tracking date format fix
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
X-List-Received-Date: Tue, 01 Nov 2011 11:24:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-31 at 14:53 -0700, Scott Garman wrote:
> Hi Saul,
> 
> This converts all of the dates used in distro_tracking_fields.inc to
> use the format you've been requesting. 
> 
> Scott
> 
> The following changes since commit ff13e06892f102d915855cde50896349b07b3717:
> 
>   clutter-gtk: add LIC_FILES_CHKSUM to include file (2011-10-31 10:46:59 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib sgarman/date-fmt-fix-final
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/date-fmt-fix-final
> 
> Scott Garman (1):
>   distro_tracking_fields.inc: standardize date format

Merged to master, thanks. I had to merge in some fixes as some changes
to that file had merged since you wrote the patch. Better to get a
change like that in sooner that later though!

Cheers,

Richard



