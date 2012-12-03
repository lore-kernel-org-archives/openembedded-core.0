Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TfbO8-0004sX-Oq
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 20:09:09 +0100
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 9F7E320216;
	Mon,  3 Dec 2012 10:54:47 -0800 (PST)
Message-ID: <50BCF576.8080507@windriver.com>
Date: Mon, 03 Dec 2012 10:54:46 -0800
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1354208369.git.elizabeth.flanagan@intel.com>
	<037305f0450c08ec555f5588ad6f3600d2d4a2c8.1354208369.git.elizabeth.flanagan@intel.com>
	<50B83691.5040800@linux.intel.com> <50B8E33D.8000101@windriver.com>
	<50BCF3C9.5040007@linux.intel.com>
In-Reply-To: <50BCF3C9.5040007@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs
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
X-List-Received-Date: Mon, 03 Dec 2012 19:09:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2012 10:47 AM, Saul Wold wrote:
> I think this needs to be rebased since some other patches have been applied, please verify and rebase against master.

It applies cleanly for me on top of what seems to be the current oe-core HEAD:

commit 24b954253dd1aa626835352c4dc8d085a19aae35
Author: Ross Burton <ross.burton@intel.com>
Date:   Wed Nov 28 15:28:48 2012 +0000

     xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions



