Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RGvJq-0002rV-5U
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 18:18:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9KGCG9Q005984
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 09:12:16 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 20 Oct 2011 09:12:16 -0700
Message-ID: <4EA0485F.3080307@windriver.com>
Date: Thu, 20 Oct 2011 11:12:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAP9ODKp+c9sXx6A7Bw9VnRXOKgNP_3q2uJmJEpvBwWT=dgXdBQ@mail.gmail.com>
In-Reply-To: <CAP9ODKp+c9sXx6A7Bw9VnRXOKgNP_3q2uJmJEpvBwWT=dgXdBQ@mail.gmail.com>
Subject: Re: useradd class not working
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
X-List-Received-Date: Thu, 20 Oct 2011 16:18:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 10/19/11 11:26 PM, Otavio Salvador wrote:
> Hello,
> 
> I am using useradd in a recipe and it needs to add a group in the
> rootfs at build time. This doesn't work.
> 
> it seems groupadd does nothing.
> 
> Has someone used or tried it?
> 


http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb

That is the recipe that was used when testing this feature.  If it no longer
works properly then something has recently broken in the groupadd functionality.

--Mark


