Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Thn29-0004W5-Kc
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Dec 2012 20:59:29 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:37806 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Thmo9-0006wd-3u; Sun, 09 Dec 2012 14:45:01 -0500
Date: Sun, 9 Dec 2012 14:44:58 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Scott Garman <scott.a.garman@intel.com>
In-Reply-To: <50C4E993.8050607@intel.com>
Message-ID: <alpine.DEB.2.02.1212091443010.16222@oneiric>
References: <alpine.DEB.2.02.1212090736560.4965@oneiric>
	<50C4E993.8050607@intel.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] documentation-audit.sh: Add/fix checks for skipped lines.
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
X-List-Received-Date: Sun, 09 Dec 2012 19:59:29 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 9 Dec 2012, Scott Garman wrote:

> On 12/09/2012 04:39 AM, Robert P. J. Day wrote:
> >
> > Have the script skip:
> >
> >    * "Recipe" lines.
> >    * Lines with 11 "=", not 12.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> Yeah, I haven't run this script since we switched to the knotty2
> interface. If you've tested this, I'm okay with the changes.

  as far as i can tell, its only effect is to remove those two lines
that shouldn't be there, that's what i verified.

rday


