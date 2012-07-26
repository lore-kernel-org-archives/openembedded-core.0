Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTG6-000765-Qp
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 20:58:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2012 11:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="177965324"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2012 11:46:30 -0700
Message-ID: <50119086.6030205@linux.intel.com>
Date: Thu, 26 Jul 2012 11:46:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343200454.git.sgw@linux.intel.com>
	<5f5ffa09c545046fc2e798494c61022574424645.1343200454.git.sgw@linux.intel.com>
	<CAMvUbCwxD=W4sVhrGJHgedpBbdmmmtOZ_6mHqToUKTjEohFZ0g@mail.gmail.com>
In-Reply-To: <CAMvUbCwxD=W4sVhrGJHgedpBbdmmmtOZ_6mHqToUKTjEohFZ0g@mail.gmail.com>
Cc: "Garman, Scott A" <scott.a.garman@intel.com>
Subject: Re: [CONSOLIDATED PULL 06/28] kernel.bbclass: fix external module building
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
X-List-Received-Date: Thu, 26 Jul 2012 18:58:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2012 10:21 AM, Leon Woestenberg wrote:
> Hello Saul,
>
Please check with Scott Garman (cc'ed) he is the stable maintainer for 
1.2.1 (Denzil).

Sau!

> On Wed, Jul 25, 2012 at 9:19 AM, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>> wrote:
>
>     +       # Necessary for building modules like compat-wireless.
>     +       cp include/generated/bounds.h
>     $kerneldir/include/generated/bounds.h
>     +
>
>
> Thanks, can we get this merged into the Denzil branch as well?
>
> In general, how are commits selected for release branches?
>
> Regards,
>
> Leon 'likewise' Woestenberg
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



