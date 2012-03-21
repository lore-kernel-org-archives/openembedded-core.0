Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAMUG-0000Jk-Fz for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 15:26:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LEHBG5002553
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:17:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02454-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:17:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LEH4r2002547
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:17:05 GMT
Message-ID: <1332339426.9740.160.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 14:17:06 +0000
In-Reply-To: <cover.1332259383.git.paul.eggleton@linux.intel.com>
References: <cover.1332259383.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] buildhistory_analysis fixes
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
X-List-Received-Date: Wed, 21 Mar 2012 14:26:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-20 at 16:06 +0000, Paul Eggleton wrote:
> Some fixes for the buildhistory_analysis module to reduce the output
> and make it more readable when using the buildhistory-diff tool.
> 
> The following changes since commit 5d404fdb36b0535ce758d98408b02134cdbce4ee:
> 
>   xserver-kdrive: compile xserver without dtrace support (2012-03-20 15:21:18 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes5
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fixes5
> 
> Paul Eggleton (5):
>   buildhistory_analysis: use bb.utils.explode_dep_versions
>   buildhistory_analysis: hide version number increases in dependencies
>   buildhistory_analysis: skip FILELIST changes for dbg packages
>   buildhistory_analysis: report if all items removed from a list
>   buildhistory_analysis: avoid printing PE/PV/PR more than once

Merged to master, thanks.

Richard



