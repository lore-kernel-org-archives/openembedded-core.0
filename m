Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RvrBu-0001td-QV
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 15:11:10 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Rvr47-0007vT-3p
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 15:03:07 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 10 Feb 2012 14:03:06 +0000
In-Reply-To: <1440799.NqLiKZanR0@helios>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
	<6dd3f664169b2ffd249da4e86f5f16b8c4316c99.1328809777.git.paul.eggleton@linux.intel.com>
	<CAMKF1spuyaA4ZJTe1pH8qyRA0nXQfJ67hAKjs5daf_Lmxy=8Tg@mail.gmail.com>
	<1440799.NqLiKZanR0@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328882587.14363.87.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [RFC PATCH 1/4] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Fri, 10 Feb 2012 14:11:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-10 at 13:56 +0000, Paul Eggleton wrote:
> What the code is attempting to do is provide its own "nullptr" if it isn't
> being provided as part of the language:
> 
> ------------------------------
> #if __has_feature(cxx_nullptr) || (GCC_VERSION_AT_LEAST(4, 6, 0) && defined(__GXX_EXPERIMENTAL_CXX0X__)) || (defined(_MSC_VER) && _MSC_VER >= 1600 && !COMPILER(INTEL))
> 
> #define HAVE_NULLPTR 1
> 
> #else
> 
> namespace std {
>     class nullptr_t { };
> }
> 
> extern std::nullptr_t nullptr;
> 
> #endif
> ------------------------------
> 
> gcc 4.6 is preempting this and complaining about the use of the identifier. I
> don't think renaming it is going to be acceptable upstream either.

Does it work if you build with -std=c++0x?  If Qt is doing the above
then presumably it is at least attempting to be compatible with C++0X.

p. 



