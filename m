Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q8ZHt-0000eQ-At
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Apr 2011 16:37:21 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q8ZFn-0006G8-Nl from Tom_Rini@mentor.com ;
	Sat, 09 Apr 2011 07:35:11 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 9 Apr 2011 07:32:47 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Sat, 9 Apr 2011 07:35:10 -0700
Message-ID: <4DA06E92.9070506@mentor.com>
Date: Sat, 9 Apr 2011 07:34:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1302137428.git.tom_rini@mentor.com>
	<4D9FCF5D.8060202@linux.intel.com>
In-Reply-To: <4D9FCF5D.8060202@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 09 Apr 2011 14:32:47.0771 (UTC)
	FILETIME=[FF4FF6B0:01CBF6C2]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] v2: Update ncurses
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
X-List-Received-Date: Sat, 09 Apr 2011 14:37:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/08/2011 08:15 PM, Saul Wold wrote:
> 
> Tom,
> 
> I think your patch introduced the following problem when building
> qemux86 world build.
> 
> ERROR: -------------------
> ERROR: ncurses-tools is listed in PACKAGES multiple times, this leads to
> packaging errors.
> ERROR: Please fix the metadata/report this as bug to OE bugtracker.
> ERROR: -------------------
> ERROR: -------------------
> ERROR: ncurses-terminfo is listed in PACKAGES multiple times, this leads
> to packaging errors.
> ERROR: Please fix the metadata/report this as bug to OE bugtracker.
> ERROR: -------------------

I've been testing with meta-angstrom.  How do I get a poky setup (where
I assume you see this) similarly?

-- 
Tom Rini
Mentor Graphics Corporation


