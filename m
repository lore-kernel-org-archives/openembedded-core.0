Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QzZKK-0001Q0-U7
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 21:22:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p82JHwDx024785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Sep 2011 12:17:58 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 2 Sep 2011 12:17:58 -0700
Message-ID: <4E612BE5.1000900@windriver.com>
Date: Fri, 2 Sep 2011 14:17:57 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
	<1314895291.19905.197.camel@phil-desktop>
	<4E5FB8AC.1070007@windriver.com>
	<1314896288.19905.199.camel@phil-desktop>
	<4E5FBFEC.3060406@windriver.com>
	<1314906289.2958.7.camel@lenovo.internal.reciva.com>
	<1314914360.5939.574.camel@rex>
	<1314957057.19905.224.camel@phil-desktop>
	<1314972211.5939.604.camel@rex>
	<1314989034.17121.8.camel@lenovo.internal.reciva.com>
In-Reply-To: <1314989034.17121.8.camel@lenovo.internal.reciva.com>
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Fri, 02 Sep 2011 19:22:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/2/11 1:43 PM, Phil Blundell wrote:
> On Fri, 2011-09-02 at 15:03 +0100, Richard Purdie wrote:
>> Seriously, does opkg have the logic in it to run this stuff? If so
>> perhaps we need to teach opkg about offline postinstalls since it should
>> already know about dependencies?
> 
> Yeah, that might be a sensible plan.  I'm not entirely sure that opkg
> even gets the maintainer script ordering right itself during normal
> circumstances, but at least it does have a dependency graph so one could
> imagine how it might be made to work correctly.  I'll have a poke at
> opkg when I get a moment and see if I can figure out how much work would
> be involved in that.
> 
> How do the RPM-using folks deal with this; does rpm handle everything
> automatically?

RPM uses the dependency mappings that have the pre and post tags on them..
(Note, these are tags that we do not presently use in OE, as OE has no
equivalent to them.)  Without the pre/post dependency tags it assumes the
dependencies are met and can run through the scripts in an arbitrary order.

(For package_rpm.bbclass, we install w/o scripts and then post-process
everything to ensure the dependencies are there.. ordering is not guaranteed.)

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



