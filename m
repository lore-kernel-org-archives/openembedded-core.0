Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7oP5-0006Ue-Su for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 14:38:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDTPBr008116
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:29:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06829-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:29:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2EDTH5D008110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 13:29:18 GMT
Message-ID: <1331731757.18586.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 13:29:17 +0000
In-Reply-To: <8cc6388313595c314347bf98254a4c2489be69e4.1331709176.git.liezhi.yang@windriver.com>
References: <cover.1331709176.git.liezhi.yang@windriver.com>
	<8cc6388313595c314347bf98254a4c2489be69e4.1331709176.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1 V2] package.bbclass: do not split debug pkg when no debugsources.list
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
X-List-Received-Date: Wed, 14 Mar 2012 13:38:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 15:16 +0800, Robert Yang wrote:
> We don't have to split the debug pkg if it is null (No debugsources.list
> since the find-debuginfo.sh would not generate it for the null pkg).
> 
> Serval pkg's debug pkg is null, and there were a few errors: (53 pkgs
> had such errors in a core-image-sato build):
> 
> log.do_package:sort: open failed: debugsources.list: No such file or directory
> 
> [YOCTO #2076]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/package.bbclass |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)

Merged to master, thanks.

Richard



