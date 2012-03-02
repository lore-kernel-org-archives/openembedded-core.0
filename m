Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3bDJ-0003pn-6Z for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 23:44:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22Ma5gO007393;
	Fri, 2 Mar 2012 22:36:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06690-07; Fri,  2 Mar 2012 22:36:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22MZvmM007387
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 2 Mar 2012 22:35:59 GMT
Message-ID: <1330727761.309.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 22:36:01 +0000
In-Reply-To: <1330718323-17978-1-git-send-email-steve@sakoman.com>
References: <1330718323-17978-1-git-send-email-steve@sakoman.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH] wpa-supplicant: fix breakage during rebuild
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
X-List-Received-Date: Fri, 02 Mar 2012 22:44:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-02 at 11:58 -0800, Steve Sakoman wrote:
> Install phase currently edits files in $S with sed. This causes breakage
> if install is run a second time (due to sstate hash rebuild for example)
> 
> The result is hidden build breakage, in particular
> /usr/share/dbus-1/system-services/fi.w1.wpa_supplicant1.service now contains:
> 
> Exec=/usr/usr/sbin/wpa_supplicant -u
> 
> rather than:
> 
> Exec=/usr/sbin/wpa_supplicant -u
> 
> This patch does the sed edit after the files are copied to $D, which should be safe.
> 
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../wpa-supplicant/wpa-supplicant-0.7.inc          |    2 +-
>  .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



