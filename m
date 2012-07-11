Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Sp029-0000GF-Gc
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 18:45:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6BGXlXX023378
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Jul 2012 09:33:47 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 11 Jul 2012 09:33:46 -0700
Date: Wed, 11 Jul 2012 11:33:33 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120711113333.76632780@wrlaptop>
In-Reply-To: <1342023149.11939.22.camel@ted>
References: <cover.1342022120.git.peter.seebach@windriver.com>
	<22e5e5adc39fb855badc6d1260fbd4b30d966530.1342022120.git.peter.seebach@windriver.com>
	<1342023149.11939.22.camel@ted>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] package.bbclass: Allow overriding of debugedit starting path
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
X-List-Received-Date: Wed, 11 Jul 2012 16:45:01 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 11 Jul 2012 17:12:29 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> I think I at least would find this slightly less confusing as:
> 
> workparentdir = d.getVar("DEBUGSRC_OVERRIDE_PATH", True) or
> os.path.dirname(workdir)

Wait, LESS confusing?

I appear to have tragically misunderstood the design goals of
package.bbclass.  :P

But yes, that's a good improvement. Applied locally.

Speaking of confusing: If purely hypothetically I wanted to
submit a patch which standardized the indentation in package.bbclass,
would anyone be interested in that?  I ask only because while I can
accept either 8-space or 4-space indentation, I find it comforting when
any given file full of Python source uses one or the other.

And while there's currently only a couple of blocks of 4-space
indentation in the file, we *normally* use 4-space, that's the
quasi-official Python community norm, and a LOT of the "too long" lines
in that file would be much more readable at 4 spaces.

(This would be a totally separate patch, and I'm not super happy about
the idea of a patch which updates half or more of the lines in the
file, but it's not as though it'll be less painful to fix later.)

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


