Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PzhdJ-00084n-GC
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 04:42:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2G2ALlW019933
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Mar 2011 19:10:22 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 15 Mar 2011 19:10:21 -0700
Message-ID: <4D801C0B.1040809@windriver.com>
Date: Tue, 15 Mar 2011 21:10:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20110316015133.GA7694@sakrah.homelinux.org>
In-Reply-To: <20110316015133.GA7694@sakrah.homelinux.org>
X-Originating-IP: [172.25.36.231]
Subject: Re: User repos on openemebdded-core-contrib
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
X-List-Received-Date: Wed, 16 Mar 2011 03:42:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 3/15/11 8:51 PM, Khem Raj wrote:
> Hi
> 
> The policies on openembedded-core-contrib repo right now does not allow
> me to either delete or do a git push -f on the branches I have pushed
> for pull requests.
> 
> The problem becomes suppose when you have feedback on a pull request
> and you do version 2 of the patch and subsequent versions then with
> current policies we will have to create separate branches for each
> request. I thought it would be better if one could delete/rewrite his
> own branches on the contrib repo.
> 
> How does yocto manage the contrib repo in this regard?

The yocto project allows push -f's for the contrib repository.

--Mark

> Thoughts?
> 



