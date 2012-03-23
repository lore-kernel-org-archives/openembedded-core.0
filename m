Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB3V6-0000qj-Em for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 13:21:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NCCqL6026436
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:12:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26101-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:12:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NCCjCu026429
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 12:12:46 GMT
Message-ID: <1332504768.9740.399.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 12:12:48 +0000
In-Reply-To: <1332440445-21028-1-git-send-email-obi@opendreambox.org>
References: <1332440445-21028-1-git-send-email-obi@opendreambox.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gst-plugins: remove obsolete orcc hack
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
X-List-Received-Date: Fri, 23 Mar 2012 12:21:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-22 at 19:20 +0100, Andreas Oberritter wrote:
> * The sed script replacing ${bindir}/orcc with
>   ${STAGING_BINDIR_NATIVE}/orcc causes orcc to not be found.
>   It may have been a workaround for older versions of pkg-config
>   or older gst-plugins. Removing it makes gst-plugins use
>   orcc from 'orc-native' successfully, if available.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> * v2: Added --disable-orc to gst-plugins-{base,good,base,ugly}_*.bb.
>       Removed unused PR from gst-plugins.inc.
> 
>  .../gstreamer/gst-plugins-bad_0.10.23.bb           |    5 +++--
>  .../gstreamer/gst-plugins-base_0.10.36.bb          |    4 ++--
>  .../gstreamer/gst-plugins-good_0.10.31.bb          |    5 +++--
>  .../gstreamer/gst-plugins-ugly_0.10.19.bb          |    5 +++--
>  meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   10 ----------
>  5 files changed, 11 insertions(+), 18 deletions(-)

Merged to master, thanks.

Richard



