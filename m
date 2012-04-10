Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SHggz-00036K-2Z
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 21:25:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Apr 2012 12:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="127436324"
Received: from unknown (HELO [10.255.12.199]) ([10.255.12.199])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2012 12:16:09 -0700
Message-ID: <4F8486F9.7050807@linux.intel.com>
Date: Tue, 10 Apr 2012 12:16:09 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAK18fxFb3xkxbiyCDBncgpyvqOVCgOvzViveLa=aw3CyQPKiQA@mail.gmail.com>
	<20120410152244.GA2852@deadlock.dhs.org>
	<CAK18fxHsg0974jsk9yicybcqgCVBuj_qDAbj9R3v1LMsu0S2pw@mail.gmail.com>
In-Reply-To: <CAK18fxHsg0974jsk9yicybcqgCVBuj_qDAbj9R3v1LMsu0S2pw@mail.gmail.com>
Subject: Re: js 185 -> js186_1.0.0
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
X-List-Received-Date: Tue, 10 Apr 2012 19:25:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 10/04/12 09:02, Andrei Gherzan wrote:
> Thank you very much for this clarification.
>
> @Saul, about upgrading js. This upgrade will break web, web-webkit and
> maybe more. How do you want to solve this issue? I compiled js180.

Whilst web-webkit lists js in its DEPENDS I'm not sure it's actually 
required. It's not listed in the web-webkit configure.ac

We need to figure out what we want to do with web and web-webkit before 
we spend too much time avoiding breaking them.

Currently neither is actively maintained but web-webkit still makes a 
lot of sense IMHO.

Cheers,
Joshua

>
> @g
>
>
> On Tue, Apr 10, 2012 at 18:22, Sergey 'Jin' Bostandzhyan
> <jin@mediatomb.cc> wrote:
>
>     Hi,
>
>     On Tue, Apr 10, 2012 at 06:14:58PM +0300, Andrei Gherzan wrote:
>      > Have a problem while updating js to version 185. This version
>     renames the
>      > library in libmozjs185. What to do in order to avoid breaking
>     packages which
>      > need libjs? Another interesting thing is that js is now called
>     js185_1.0.0
>      > which seems to be actually another package / implementation? I
>     will try to test
>      > this using symlinks while compiling web package.
>
>     JS 1.8.5 is not backwards compatible! This is the reason why they
>     renamed the
>     libs, you can not link older software against JS 1.8.5 without
>     adaptions, the
>     new version has a new API.
>
>     Kind regards,
>     Jin
>
>
>
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Joshua Lock
         Yocto Project
         Intel Open Source Technology Centre


