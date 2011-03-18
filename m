Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q0QrE-00012h-O6
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 05:00:12 +0100
Received: by iwn10 with SMTP id 10so3637167iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 20:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=69TTa0zUvRiP+5y8AY6A0A4KNLv5mIRZBbsQ0745IfI=;
	b=aTG6PmOdGscU4dIzLZ7xfGYhsVhv0EdMDDkdzxpkTYj+Xy0dqs4dbrABOfSOg1uFAB
	POlNVJ4q/4M/YN3p58J/P2+VkDj3YNShLAn0COE5fx0rfAifZRCIlMvaAG/OkVjIuZpD
	zJtrtXStNJYNrnOFw8M7Lomn+XWgKizV0VABQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=IG2GJT97zFO6/sOdT0jLwG0q3tRLRQz2VROeA0q7Z/oTyB3h27XfKY9T7KkqccsVt6
	ocXW01r9mw/R7CT+KDELuhD1Hk64drY411pb/SskyGAVURtpYv6FqOL5grRBaADj4Ngt
	BJZ6LD9ptAnKDdhvzKGlVsaCczSBImEz0hX3I=
Received: by 10.42.138.129 with SMTP id c1mr762514icu.492.1300420707152;
	Thu, 17 Mar 2011 20:58:27 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id mv26sm148058ibb.57.2011.03.17.20.58.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 20:58:26 -0700 (PDT)
Date: Thu, 17 Mar 2011 20:59:22 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110318035922.GA4083@sakrah.homelinux.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: cleaning perl-native catch 22
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
X-List-Received-Date: Fri, 18 Mar 2011 04:00:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Ubuntu 11.04 decided to put libc in /lib/`uname -m`-linux-gnu/ so
perl-native failed and I patched it and all fine. But here is
interesting thing. When perl-native failed (this is build from scratch)
then I fixed it and as usual tried to do
bitbake -c cleanall perl-native

and it started to build perl instead since I guess its a dependency for
pseudo (may be) and pseudo is not build yet. So whats the way out here
so is it a catch-22

So I had to delete the whole tmpdir

Thanks

-- 
-Khem


