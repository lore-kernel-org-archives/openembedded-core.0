Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVO8g-00044X-Di for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 14:54:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATDlmQx013791
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:47:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13247-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:47:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATDlfPn013784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:47:42 GMT
Message-ID: <1322574468.6171.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 13:47:48 +0000
In-Reply-To: <1322572367-4246-1-git-send-email-agust@denx.de>
References: <1322572367-4246-1-git-send-email-agust@denx.de>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] qt4: qt-mobility: fix QML video player crash
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
X-List-Received-Date: Tue, 29 Nov 2011 13:54:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 14:12 +0100, Anatolij Gustschin wrote:
> Fix QML video player crash which happens when attempting
> to play OGG video files.
> 
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
>  ...stvideoconnector-fixed-buffers-allocation.patch |   32 ++++++++++++++++++++
>  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    3 +-
>  2 files changed, 34 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch

Merged to master but please send patches against master in future.

Cheers,

Richard



