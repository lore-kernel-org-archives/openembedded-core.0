Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S5jo0-0006mq-13 for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 21:19:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28KAg8v030126
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 20:10:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29725-05 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2012 20:10:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28KAUWN030120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2012 20:10:34 GMT
Message-ID: <1331237429.3006.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Mar 2012 12:10:29 -0800
In-Reply-To: <1331171042-11645-1-git-send-email-james@digitalmatter.com.au>
References: <1331171042-11645-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v3] gdk-pixbuf: Pick up ${NM} from the environment.
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
X-List-Received-Date: Thu, 08 Mar 2012 20:19:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-08 at 09:44 +0800, James Limbouris wrote:
> Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> ---
>  .../gdk-pixbuf-2.24.0/configure_nm.patch           |   21 ++++++++++++++++++++
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    3 +-
>  2 files changed, 23 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.24.0/configure_nm.patch

Merged to master, thanks.

Richard



