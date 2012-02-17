Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RyWw5-0005dz-8s
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Feb 2012 00:09:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Feb 2012 15:01:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="109511520"
Received: from unknown (HELO [10.255.15.93]) ([10.255.15.93])
	by orsmga001.jf.intel.com with ESMTP; 17 Feb 2012 15:01:37 -0800
Message-ID: <4F3EDC4E.6050500@linux.intel.com>
Date: Fri, 17 Feb 2012 15:01:34 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1328920045.git.josh@linux.intel.com>
	<dfc93718c100209c9897317d2399da7691a41070.1328920045.git.josh@linux.intel.com>
	<CAP9ODKoSuGOiYeV9OEE2V3yX5mp3tpUk-YiFG0heMHGmQ3FwtA@mail.gmail.com>
In-Reply-To: <CAP9ODKoSuGOiYeV9OEE2V3yX5mp3tpUk-YiFG0heMHGmQ3FwtA@mail.gmail.com>
Subject: Re: [PATCH 1/1] base.bbclass: look in layers for SRC_URI with MACHINE overrides too
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
X-List-Received-Date: Fri, 17 Feb 2012 23:09:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/12 05:02, Otavio Salvador wrote:
> On Fri, Feb 10, 2012 at 22:30, Joshua Lock <josh@linux.intel.com
> <mailto:josh@linux.intel.com>> wrote:
>
>     The logic which looks for MACHINE overrides in SRC_URI and updates
>     PACKAGE_ARCH
>     accordingly doesn't account for SRC_URI overrides in layers.
>
>
> It seems to address the issue but I think we need to support bbappend
> with overrides.

Agreed, this patch adds hacky support for that. I am working on a more 
suitable patch to do this in a cleaner way.

If the layer doesn't use a machine override, then:
>
>   * it is not machine depdendant, or
>   * is a bug in the layer
>
> People agree with this point of view?

I do.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


