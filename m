Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R6g1O-0000Z6-3m for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 11:56:46 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1R6fwG-0001TL-Ev for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 11:51:28 +0200
Received: from nat-rup.mentorg.com ([139.181.168.34])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 11:51:28 +0200
Received: from dbaryshkov by nat-rup.mentorg.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 11:51:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Thu, 22 Sep 2011 13:50:31 +0400
Message-ID: <4E7B04E7.1000204@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>	<1316670516.13622.30.camel@ted>	<CALT56yMOnRAYnGFozDaO6_sjN9=iReVrwyDzOUqwkLS6oZMS5g@mail.gmail.com>
	<201109221045.22340.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: nat-rup.mentorg.com
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
In-Reply-To: <201109221045.22340.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <public-paul.eggleton-VuQAYsv1563Yd54FQh9/CA@lo.gmane.org>,
	Dmitry Eremin-Solenikov
	<public-dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@lo.gmane.org>
Subject: Re: [PATCH 17/17] package.bbclass: make unshipped files a fatal error
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
X-List-Received-Date: Thu, 22 Sep 2011 09:56:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 09/22/2011 01:45 PM, Paul Eggleton wrote:
> On Thursday 22 September 2011 07:36:23 Dmitry Eremin-Solenikov wrote:
>> Nice idea! On the rights of a feature request:
>> It would be nice to allow user to:
>> 1) specify the severity of the QA problems (warn, error, fatal) on a
>> global + per-qa-check level
>
> To affect the severity of warnings on a global basis you should be able to use
> ERROR_QA / WARN_QA, although I have not tried this.
>
>> 2) specify an override for some of the checks, so that the packager
>> can specify that
>> e.g. QA check for .so links in a non-dev packages should be ignored
>> for cgroups-pam package for /lib/security/pam*.so lib.
>
> For per-package, you can set for example INSANE_SKIP_${PN} += "dev-so" to
> disable the .so links in non-dev package QA warning.
>
> More details (e.g. the name for each QA check) can be found in insane.bbclass.

This is a too big handle. Ideally I'd like to be able to whitelist on 
the file level, rather than on the package/test level.

-- 
With best wishes
Dmitry




