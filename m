Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RsU46-0004pX-LH
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 07:53:10 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Jan 2012 22:45:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="102569638"
Received: from unknown (HELO [10.255.14.168]) ([10.255.14.168])
	by orsmga001.jf.intel.com with ESMTP; 31 Jan 2012 22:45:14 -0800
Message-ID: <4F28DF7A.6010207@linux.intel.com>
Date: Tue, 31 Jan 2012 22:45:14 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1328057677.git.josh@linux.intel.com>
	<e2b46859bfa16f03f06e0368857740a549a1c33c.1328057677.git.josh@linux.intel.com>
	<CAP9ODKpG8L222QfS7usbp1Y9X8pi5qb2=SMiehvccBw9J7xjpw@mail.gmail.com>
In-Reply-To: <CAP9ODKpG8L222QfS7usbp1Y9X8pi5qb2=SMiehvccBw9J7xjpw@mail.gmail.com>
Subject: Re: [PATCH 2/3] sysklogd: various fixes so it starts/stops cleanly
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
X-List-Received-Date: Wed, 01 Feb 2012 06:53:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 31/01/12 18:06, Otavio Salvador wrote:
> On Tue, Jan 31, 2012 at 22:58, Joshua Lock <josh@linux.intel.com
> <mailto:josh@linux.intel.com>> wrote:
>
>     @@ -46,12 +46,18 @@ do_install () {
>       pkg_preinst_${PN} () {
>             # all this is needed to avoid sysmlink errors,
>             # because update-rc.d runs before pkg_postinst
>     -       if [ -e ${sysconfdir}/init.d/syslog -a ! -L
>     ${sysconfdir}/init.d/syslog ]; then
>     +       if test "x$D" != "x"; then
>     +               ETC=$D/${sysconfdir}
>     +       else
>     +               ETC=${sysconfdir}
>     +       fi
>
>
> You might use
>
> ETC=$D${sysconfdir}
>
> and avoid the if block as a whole.

Quite right. That is cleaner, updated commit pushed to the same branch:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=josh/fixes&id=937acf5b59e5a1de2cc334b069390b3ccdb055a0

Thanks for the review.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


