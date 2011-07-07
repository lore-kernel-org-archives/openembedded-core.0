Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QeqlB-000146-TX
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 17:45:02 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QeqhT-0005BC-GE from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 08:41:11 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 7 Jul 2011 08:41:11 -0700
Received: from [172.30.80.250] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 7 Jul 2011 08:41:10 -0700
Message-ID: <4E15D389.9040906@mentor.com>
Date: Thu, 7 Jul 2011 08:40:57 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310027619.git.dexuan.cui@intel.com>
	<cb76f021571c5f35239192ff05eb89cab4713d04.1310027619.git.dexuan.cui@intel.com>
In-Reply-To: <cb76f021571c5f35239192ff05eb89cab4713d04.1310027619.git.dexuan.cui@intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 07 Jul 2011 15:41:11.0283 (UTC)
	FILETIME=[4BF5F430:01CC3CBC]
Subject: Re: [PATCH 1/1] powertop: inherit update-alternatives and use	a higher priority than busybox
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
X-List-Received-Date: Thu, 07 Jul 2011 15:45:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/07/2011 01:39 AM, Dexuan Cui wrote:
> busybox-1.18.4 installs /bin/powertop and the powertop recipe installs
> /usr/bin/powertop. So, in PATH, if /bin appears before /usr/bin, we would
> run the version offered by busybox, which has a very limited function (e.g.,
> no parameter is accepted) and this causes trouble to eclipse plugin.
> 
> We can use update-alternatives for powertop with higher priority to resolve
> the issue.
> 
> Fixes [YOCTO #1208]
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>

This fix seems a bit incomplete.  Why is busybox putting powertop into
/bin when it almost certainly belongs in /usr/bin like the real recipe
was placing it.  busybox needs a fix here too.

-- 
Tom Rini
Mentor Graphics Corporation


