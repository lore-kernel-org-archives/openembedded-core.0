Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RJpBx-0007f5-Rr
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 18:22:02 +0200
Received: from mail-ey0-f180.google.com ([209.85.215.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 28 Oct 2011 09:15:58 -0700
Received: by eyg5 with SMTP id 5so3948063eyg.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 09:15:56 -0700 (PDT)
Received: by 10.213.112.200 with SMTP id x8mr429029ebp.12.1319818556154;
	Fri, 28 Oct 2011 09:15:56 -0700 (PDT)
Received: from [10.192.4.215] ([85.13.70.251])
	by mx.google.com with ESMTPS id s43sm11988723eef.4.2011.10.28.09.15.54
	(version=SSLv3 cipher=OTHER); Fri, 28 Oct 2011 09:15:55 -0700 (PDT)
Message-ID: <4EAAD539.8000300@intel.com>
Date: Fri, 28 Oct 2011 18:15:53 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1319780499.10032.46.camel@localhost.localdomain>
	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
	<1319785517.10032.48.camel@localhost.localdomain>
	<CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
In-Reply-To: <CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
Subject: Re: how to set time zone
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
X-List-Received-Date: Fri, 28 Oct 2011 16:22:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/2011 10:22 AM, Andrea Adami wrote:
> On Fri, Oct 28, 2011 at 9:05 AM, Ni Qingliang
> <niqingliang@insigma.com.cn <mailto:niqingliang@insigma.com.cn>> wrote:
>
>     THANKS!
>
>     I still want the native support by oe-core/yocto:-). If no, I will try
>     by myself.
>
>
> I've asked three or four time the oe-core crow to improve the
> recipe...last one:
>
> On Wed, Oct 19, 2011 at 12:24 AM, Joshua Lock <josh@linux.intel.com
> <mailto:josh@linux.intel.com>> wrote:
>
>     Per mailing requests, here are updates to the tzdata and
>     gst-plugins-good recipes.
>
>     Joshua
>
>     The following changes since commit
>     95d0ff5e070c690314ab87665200099a52d37ebf:
>
>       tzdata: updated SRC_URI and update to 2011k (2011-10-18 11:16:58
>     -0700)
>
>
> Thanks for the tzdata fix.
> Now, we have the same recipes in meta-oe with a slightly different
> do_install and packaging: I'm referring to /etc/localtime and
> /etc/timezone: which package do provide those in oe-core?
>
> (We'll remove the tzdata/tzcodes from meta-oe once the recipes are matching)
>
I would welcome such a patch.

Thanks
	Sau!
> Regards
>
>
>
> Andrea
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



