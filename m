Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 18DD36C71D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 22:09:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86MMae8007015; Fri, 6 Sep 2013 23:22:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7TaRPWMhCy4p; Fri,  6 Sep 2013 23:22:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86MMWAP007011
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 6 Sep 2013 23:22:35 +0100
Message-ID: <1378505349.3484.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Fri, 06 Sep 2013 23:09:09 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF843C509B06@ALA-MBB.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF843C509B06@ALA-MBB.corp.ad.wrs.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: audit & oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2013 22:09:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-06 at 20:01 +0000, Slater, Joseph wrote:
> Hi,
>  
> Several packages in oe-core have PACKAGECONFIG[] info, or the
> equivalent, concerning
> explicitly disabling audit support.
>  
> Some people believe that PACKAGECONFIG[] data concerning features not
> in oe-core
>
> should not be in oe-core.  I do think it should be there unless the
> package requires special
> patching to implement the feature support.
>  
> Is there an oe-core policy about this type of thing?
> 
I think it makes sense to be in OE-Core unless as you say it needs
excessive patching or something to implement. The defaults should work
with OE-Core though and not require other layers.

Cheers,

Richard



