Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QozN5-0003cx-Rx
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:58:06 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1QozIs-0004jw-HY; Thu, 04 Aug 2011 16:53:42 +0200
From: Phil Blundell <philb@gnu.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
Date: Thu, 04 Aug 2011 15:53:41 +0100
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6B3046C9C11@shsmsx502.ccr.corp.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex> <4E38C941.30805@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
	<4E3A3562.1060907@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9A79@shsmsx502.ccr.corp.intel.com>
	<4E3AA24A.7050400@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9C11@shsmsx502.ccr.corp.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312469622.5417.1.camel@phil-desktop>
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>, Patches,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Thu, 04 Aug 2011 14:58:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 22:49 +0800, Cui, Dexuan wrote:
> +        BDIR=`readlink -f "$BDIR"`
> +        if [ -z "$BDIR" ]; then
> +            PARENTDIR=`dirname "$1"`
> +            echo >&2 "Error: the directory $PARENTDIR does not exist?"
>              return 1
>          fi
>      fi

Just out of curiosity, could you not just do "mkdir -p $BDIR" and avoid
this whole set of complicated tests?  Or is there some reason why it's
actually important to know whether the parent directory existed already?

p.




