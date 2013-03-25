Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1UJwzs-0005ci-Oo
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 03:19:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2P21sUO026100
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2013 19:01:54 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sun, 24 Mar 2013 19:01:53 -0700
Message-ID: <514FB058.5020805@windriver.com>
Date: Mon, 25 Mar 2013 10:03:04 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130219 Thunderbird/17.0.3
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1363658821-23679-1-git-send-email-sen.zhang@windriver.com>
In-Reply-To: <1363658821-23679-1-git-send-email-sen.zhang@windriver.com>
X-Originating-IP: [128.224.162.230]
Subject: Re: [PATCH] [RFC] Perl packages shouldn't be allarch
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
X-List-Received-Date: Mon, 25 Mar 2013 02:19:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ping. Anyone has comments?

jesse

On 03/19/2013 10:07 AM, Jesse Zhang wrote:
> Hi,
> 
> I recently found that perl packages are broken in multilib builds. On a lib32
> image, everything including perl is lib32 and installs to /usr/lib. These perl
> packages are "all" arch, which is fine except that they install to /usr/lib64.
> They won't work because the lib32 perl thinks its vendorlib is under /usr/lib.
> 
> Removing allarch seems to solve the problem, but I want to see if people have
> some comments.
> 
> I found the original commit that introduced the change, which was to fix an
> sstate related issue (https://bugzilla.yoctoproject.org/show_bug.cgi?id=1075).
> But I don't think these packages fit well with allarch, since they install into
> arch-specific dirs.
> 
> jesse
> 
> Jesse Zhang (1):
>   Perl packages shouldn't be allarch
> 
>  meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb         | 2 +-
>  meta/recipes-extended/perl/libtimedate-perl_2.30.bb             | 2 +-
>  meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb | 2 +-
>  meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb         | 2 +-
>  meta/recipes-extended/perl/libxml-sax-perl_0.99.bb              | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 


