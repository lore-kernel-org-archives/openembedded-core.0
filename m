Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Uavdz-0000hq-M0
	for openembedded-core@lists.openembedded.org;
	Sat, 11 May 2013 00:18:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 May 2013 15:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,651,1363158000"; d="scan'208";a="335086380"
Received: from unknown (HELO [10.255.12.100]) ([10.255.12.100])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2013 15:00:18 -0700
Message-ID: <518D6DF1.6080903@linux.intel.com>
Date: Fri, 10 May 2013 15:00:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Joe Slater <jslater@windriver.com>
References: <1368054238-21389-1-git-send-email-jslater@windriver.com>
	<CAJTo0LZW4aw9eKoXg5zZhV9-ncSWpWD=AfgW45HQrQadqZatAw@mail.gmail.com>
In-Reply-To: <CAJTo0LZW4aw9eKoXg5zZhV9-ncSWpWD=AfgW45HQrQadqZatAw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sysvinit: modify bootlog location
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 22:18:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2013 02:42 AM, Burton, Ross wrote:
> On 9 May 2013 00:03, Joe Slater <jslater@windriver.com> wrote:
>> The default location for bootlog is volatile,
>> so we change it to something that is not.
>
> If this is a problem, why not make /var/log not volatile?  I never
> understood why the log directory was volatile to be honest.
>
How would we handle the Read-Only FS situation?

Sau!

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


