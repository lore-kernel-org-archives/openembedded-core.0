Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJ0Bs-0007JF-0S
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 12:59:04 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TIzzL-0003vp-F2
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 12:46:07 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 02 Oct 2012 11:46:06 +0100
In-Reply-To: <38bec96fcbe89f8dc264c8889f69e4f5afff35ad.1323286080.git.elizabeth.flanagan@intel.com>
References: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
	<38bec96fcbe89f8dc264c8889f69e4f5afff35ad.1323286080.git.elizabeth.flanagan@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349174767.32611.79.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 7/8] OECore license fixes: meta/*
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
X-List-Received-Date: Tue, 02 Oct 2012 10:59:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 11:34 -0800, Beth Flanagan wrote:
> From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
> 
> This is a quick audit of only the most obviously wrong licenses
> found within OECore. These fixes fall into four areas:
> 
> - LICENSE field had incorrect format so that the parser choked
> - LICENSE field has a license with no version
> - LICENSE field was actually incorrect
> - LICENSE field has an imaginary license that didn't exist

[...]

> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> index f5b9ac1..14cd240 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> @@ -4,9 +4,9 @@ Huffman coding. Compression is generally considerably better than that achieved
>  LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
>  HOMEPAGE = "http://www.bzip.org/"
>  SECTION = "console/utils"
> -LICENSE = "bzip2"
> +LICENSE = "BSD-4-Clause"

This (and the corresponding change to busybox) doesn't seem quite right.
Although it is true that the bzip2 licence does have four clauses and is
approximately BSD-ish, these four clauses are not actually the same as
the ones in the traditional 4-clause BSD licence.

The four clauses that the bzip2 licence actually has are (to quote
LICENSE):

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. The origin of this software must not be misrepresented; you must 
   not claim that you wrote the original software.  If you use this 
   software in a product, an acknowledgment in the product 
   documentation would be appreciated but is not required.

3. Altered source versions must be plainly marked as such, and must
   not be misrepresented as being the original software.

4. The name of the author may not be used to endorse or promote 
   products derived from this software without specific prior written 
   permission.

Whereas, the four clauses from the original BSD are:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the <organization>.

4. Neither the name of the <organization> nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

Clauses 1 and 4 are clearly the same thing (or very nearly identical)
but clauses 2 and 3 are significantly different in both wording and
intent.  In particular the bzip2 license contains no equivalent to the
objectionable "advertising clause".

p.




