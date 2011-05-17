Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMMqf-0008KM-LK for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 18:10:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HG7KVO018257
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 17:07:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18079-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 17:07:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HG7Dxk018251
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 17:07:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305647579.2429.271.camel@phil-desktop>
References: <1305633118.2429.188.camel@phil-desktop>
	<1305633770.3424.229.camel@rex>
	<1305634164.2429.193.camel@phil-desktop>
	<1305647579.2429.271.camel@phil-desktop>
Date: Tue, 17 May 2011 17:07:13 +0100
Message-ID: <1305648433.3424.255.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v3] image-prelink: remove hardcoded path assumptions, don't generate cache file
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
X-List-Received-Date: Tue, 17 May 2011 16:10:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 16:52 +0100, Phil Blundell wrote:
> Pass -N option to prelink so that no cache file is generated (obviates need for deleting it afterwards).
> Use symbolic names, ${sysconfdir} et al., rather than hardcoded paths. 
> Pass explicit -c option to prelink in case ${sysconfdir} and ${sysconfdir_native} are different.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/image-prelink.bbclass |   13 +++++--------
>  1 files changed, 5 insertions(+), 8 deletions(-)

Merged to master (will be when it becomes accessible again), thanks.

Richard





