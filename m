Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U4b1H-0007xr-8l
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 18:48:53 +0100
Received: from localhost ([127.0.0.1]:50898)
	by astoria.ccjclearline.com with esmtpa (Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>) id 1U4alr-00072w-MQ
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 12:32:55 -0500
Received: from 65.160.229.33 ([65.160.229.33]) by crashcourse.ca (Horde
	Framework) with HTTP; Sun, 10 Feb 2013 12:32:55 -0500
Message-ID: <20130210123255.51643nyx1esfqeck@crashcourse.ca>
Date: Sun, 10 Feb 2013 12:32:55 -0500
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.11)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: any way to list *all* possible sources across the current layers?
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
X-List-Received-Date: Sun, 10 Feb 2013 17:48:53 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

   hoping this question makes sense -- i use own-mirrors.bbclass to point
at a sizable directory of tarballs (almost 12G worth) that i've been
collecting over many months and, after every OE layer upgrade, whatever
newer sources are pulled in, will generate the corresponding tarball and
i'll copy that into my tarballs directory.

   predictably, at this point, there's a *lot* of old, irrelevant cruft in
that directory, but i know of no automated way to get rid of any of it.
for instance, i currently have five versions of automake (1.11.2, 1.12.1,
1.12.3, 1.12.5 and 1.12.6) taking up space.  doesn't hurt, of course, but
it would be handy to be able to generate a list of all possible,
potentially necessary versions of a source -- that is, any version for
which any recipe still lists it as PREFERRED_VERSION.

   does that make sense?  obviously, that would have to be done in the
context of a given set of layers and all the corresponding recipes in
those layers.  is there a way to do that already?  if not, i'm sure i
could whip up a simple script that would do the job.  thanks.

rday



