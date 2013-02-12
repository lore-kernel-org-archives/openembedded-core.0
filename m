Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>)
	id 1U5Bd4-0003KF-9x; Tue, 12 Feb 2013 09:54:30 +0100
Received: from ad.chargestorm.se (212.181.101.5) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 12 Feb 2013 09:37:14 +0100
Date: Tue, 12 Feb 2013 09:38:20 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20130212083820.GA5968@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <2760168.9kFd94gL1F@helios>
	<CAP9ODKpa99P4ZKu+JyPXfruLjAV01Oo2G-MTZOc83g0d5JN1uQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpa99P4ZKu+JyPXfruLjAV01Oo2G-MTZOc83g0d5JN1uQ@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 08:54:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Otavio Salvador <otavio@ossystems.com.br> [130211 18:50]:

> On Mon, Feb 11, 2013 at 3:09 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> ...
> > * meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> > * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> > These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see this
> > as a distro policy decision; these should move to the layers for whichever
> > distros want this. FWIW, this is particularly egregious if you've already
> > built Qt, then add meta-oe and find Qt is being unexpectedly rebuilt.

> Yes; I think I agree also because *most* people won't use these
> backends so better to handle this in the specific
> layers/distros/whatever needs it.

Definitely in favour of this.

That would simplify my own bbappends a lot, by letting me remove quite a
few oe_filter_out's...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


