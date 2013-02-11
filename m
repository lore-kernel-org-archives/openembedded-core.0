Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U4tai-00089b-3A for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 14:38:58 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1BDSJDr001727; Mon, 11 Feb 2013 13:28:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id I0Bc75KeZg96; Mon, 11 Feb 2013 13:28:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1BDSBU6001721
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 11 Feb 2013 13:28:14 GMT
Message-ID: <1360588938.6793.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 11 Feb 2013 13:22:18 +0000
In-Reply-To: <20130210123255.51643nyx1esfqeck@crashcourse.ca>
References: <20130210123255.51643nyx1esfqeck@crashcourse.ca>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: any way to list *all* possible sources across the current layers?
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
X-List-Received-Date: Mon, 11 Feb 2013 13:38:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-02-10 at 12:32 -0500, Robert P. J. Day wrote:
>    hoping this question makes sense -- i use own-mirrors.bbclass to point
> at a sizable directory of tarballs (almost 12G worth) that i've been
> collecting over many months and, after every OE layer upgrade, whatever
> newer sources are pulled in, will generate the corresponding tarball and
> i'll copy that into my tarballs directory.
> 
>    predictably, at this point, there's a *lot* of old, irrelevant cruft in
> that directory, but i know of no automated way to get rid of any of it.
> for instance, i currently have five versions of automake (1.11.2, 1.12.1,
> 1.12.3, 1.12.5 and 1.12.6) taking up space.  doesn't hurt, of course, but
> it would be handy to be able to generate a list of all possible,
> potentially necessary versions of a source -- that is, any version for
> which any recipe still lists it as PREFERRED_VERSION.
> 
>    does that make sense?  obviously, that would have to be done in the
> context of a given set of layers and all the corresponding recipes in
> those layers.  is there a way to do that already?  if not, i'm sure i
> could whip up a simple script that would do the job.  thanks.

The original idea was that you could do a "bitbake world -c fetch" and
it would touch the .done stamps of anything it used in DL_DIR.

You could then age out entries in there based on the timestamp of
the .done files.

I appreciate there is an issue with some files not being pulled in by
do_fetchall at the moment. I have some ideas related to that which would
fix it but haven't written the code yet, hopefully will get there soon. 

Cheers,

Richard



