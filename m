Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TZRVU-0005M5-2r
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 20:23:16 +0100
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id B31E02141E;
	Fri, 16 Nov 2012 11:09:18 -0800 (PST)
Message-ID: <50A68F5D.6050100@windriver.com>
Date: Fri, 16 Nov 2012 11:09:17 -0800
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1351792979-6672-1-git-send-email-andy.ross@windriver.com>
In-Reply-To: <1351792979-6672-1-git-send-email-andy.ross@windriver.com>
Subject: Re: [PATCH 0/1] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs
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
X-List-Received-Date: Fri, 16 Nov 2012 19:23:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2012 11:02 AM, Andy Ross wrote:
> We hit a problem trying to exclude L/GPLv3 recipes where
> INCOMPATIBLE_LICENSE could only match exactly one license.  The older
> wildcard syntax had been broken by a more recent SPDX change
> (specifying a string without a SPDXLICENSEMAP entry could crash), so
> "*GPLv3" wouldn't work.

Ping



