Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0yAW-0005Td-E1 for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 17:38:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OGUShq008644
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:30:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08112-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:30:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OGULYN008638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 16:30:22 GMT
Message-ID: <1330101022.5477.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 16:30:22 +0000
In-Reply-To: <82a1c80968b74bba31763add47f217d84043546e.1330091038.git.dexuan.cui@intel.com>
References: <cover.1330091038.git.dexuan.cui@intel.com>
	<82a1c80968b74bba31763add47f217d84043546e.1330091038.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] task-self-hosted: add hicolor-icon-theme and socat
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
X-List-Received-Date: Fri, 24 Feb 2012 16:38:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-24 at 21:44 +0800, Dexuan Cui wrote:
> python-pygtk depends on libgtk and libgtk's recommends have
> gdk-pixbuf-loader-{png,jpeg,gif,xpm}, so we have the warnings.
> We can add hicolor-icon-theme to fix the warning:
> Configuring gdk-pixbuf-loader-png.
> gtk-update-icon-cache: No theme index file.
> Configuring gdk-pixbuf-loader-jpeg.
> gtk-update-icon-cache: No theme index file.
> Configuring liberation-fonts.
> Configuring gdk-pixbuf-loader-xpm.
> gtk-update-icon-cache: No theme index file.
> Configuring gdk-pixbuf-loader-gif.
> gtk-update-icon-cache: No theme index file.
> 
> Add socat for to faciliate proxy setting.
> 
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  meta/recipes-core/tasks/task-self-hosted.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



