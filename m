Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UIjEA-0000cV-LT for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 18:24:41 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LHGXXY017508 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 17:17:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id he5AFqJsgsrL
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 17:17:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LHGvlW017549
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 17:17:00 GMT
Message-ID: <1363885647.16482.141.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 17:07:27 +0000
In-Reply-To: <1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: Re: [PATCH 15/16] distro: Add separatebuilddir.inc
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
X-List-Received-Date: Thu, 21 Mar 2013 17:24:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-21 at 15:55 +0000, Richard Purdie wrote:
> Going forward its going to be useful to separate build data from source data
> in those autotooled projects which support it. Unfortunately there is a lot
> of breakage so for now, this starts the creation of an opt in list which
> we can iterate over enable more recipes over time.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/defaultsetup.conf            |    1 +
>  meta/conf/distro/include/seperatebuilddir.inc |  772 +++++++++++++++++++++++++
>  2 files changed, 773 insertions(+)
>  create mode 100644 meta/conf/distro/include/seperatebuilddir.inc

I should note that when we take this, it will break existing build
directories due to the way autotools handles external builds. I can't
find a good way to avoid this, hence waiting until I'd done a complete
pass over the OE-Core tree before sending it out.

I have tested world builds with this patch applied and either disabled
out of tree builds for broken recipes, or where possible fixed things
up.

Cheers,

Richard




