Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SPOaI-0004EG-Qh
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 03:42:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q421WdN8024287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 May 2012 18:32:39 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 1 May 2012 18:32:39 -0700
Date: Tue, 1 May 2012 20:32:14 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120501203214.278264ea@wrlaptop>
In-Reply-To: <1335903448.7415.134.camel@ted>
References: <cover.1335815704.git.peter.seebach@windriver.com>
	<1a15132d9ff316a53f58764aad35bb09c5fbcf0e.1335815704.git.peter.seebach@windriver.com>
	<1335869234.7415.94.camel@ted> <20120501112318.6561f45d@wrlaptop>
	<1335903448.7415.134.camel@ted>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sanity.bbclass: Implement initial toolchain sanity checks
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
X-List-Received-Date: Wed, 02 May 2012 01:42:27 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 1 May 2012 21:17:28 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> Ah, I see what's happened here. This variable is used to append to
> BBCLASSEXTEND where there are other values like "nativesdk" and
> "native". Looking at the code, I think you should process
> MULTILIB_VARIANTS.

Ahh, okay.
 
> Another good sanity check might be to look at the BBCLASSEXTEND values
> and ensure they're in the list "native", "nativesdk", "multilib:xxx",
> "cross".

Hmm.  Adding that as a separate commit.
 
> I think its a packaging bug. I'd be interested to see the error.

I'll try to get it to show.  I'm still getting the x86_64x86_64 thing
first.  :)

Should have cleaned up versions of this "soon".

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


