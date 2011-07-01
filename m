Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>)
	id 1Qcfs1-0008Cd-61; Fri, 01 Jul 2011 17:43:05 +0200
Received: by bwf20 with SMTP id 20so3132344bwf.6
	for <multiple recipients>; Fri, 01 Jul 2011 08:39:17 -0700 (PDT)
Received: by 10.204.156.25 with SMTP id u25mr3337217bkw.43.1309534757633;
	Fri, 01 Jul 2011 08:39:17 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id ek1sm3123047bkb.9.2011.07.01.08.39.15
	(version=SSLv3 cipher=OTHER); Fri, 01 Jul 2011 08:39:16 -0700 (PDT)
Message-ID: <4E0DEA22.1040308@dresearch-fe.de>
Date: Fri, 01 Jul 2011 17:39:14 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
Followup-To: openembedded-devel@lists.openembedded.org
To: openembedded-devel@lists.openembedded.org
References: <4E0C4BF3.2050701@dresearch-fe.de>
	<1309428937.2551.107.camel@phil-desktop>
In-Reply-To: <1309428937.2551.107.camel@phil-desktop>
X-Enigmail-Version: 1.2
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [oe] Any reasons not to use "newer" ppp?
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
X-List-Received-Date: Fri, 01 Jul 2011 15:43:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.06.2011 12:15, Phil Blundell wrote:
> On Thu, 2011-06-30 at 12:12 +0200, Steffen Sledz wrote:
>> The current oe-dev master contains recipes for 2.4.4 and 2.4.5, but both are DEFAULT_PREFERENCE = "-1", so 2.4.3 is used by default.
>>
>> We hit a problem in LCP open/close handling which is fixed in the newer versions.
>>
>> Is there any reason *not* to go to 2.4.5?
> 
> Oe-core is using 2.4.5 and presumably it works OK there.  Judging from
> the commit messages there is no good reason for 2.4.5 to have been set
> D_P=-1 in oe.dev, so I think you should be safe to upgrade.

While making some investingations in this i hit another problem.

The recipe *ppp_2.4.5.bb* in *oe-core* contains lines like these:
------------------>snip<-------------------
FILES_${PN}-dbg += "${libdir}/pppd/2.4.3/.debug"
FILES_ppp-oa       = "/usr/lib/pppd/2.4.3/pppoatm.so"
FILES_ppp-oe       = "/usr/sbin/pppoe-discovery /usr/lib/pppd/2.4.3/rp-pppoe.so"
FILES_ppp-radius   = "/usr/lib/pppd/2.4.3/radius.so /usr/lib/pppd/2.4.3/radattr.so /usr/lib/pppd/2.4.3/radrealms.so"
FILES_ppp-winbind  = "/usr/lib/pppd/2.4.3/winbind.so"
FILES_ppp-minconn  = "/usr/lib/pppd/2.4.3/minconn.so"
FILES_ppp-password = "/usr/lib/pppd/2.4.3/pass*.so"
------------------>snip<-------------------

I can't imagine that it is intentionally to have hardcoded pathes with *2.4.3* in it here.

The ppp_2.4.5.bb recipe in oe-dev looks much cleaner. Is there someone who feels as a maintainer of ppp and can do some housekeeping here?

Regards,
Steffen

PS: Fup set to the original thread in openembedded-devel list.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


