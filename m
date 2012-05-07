Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1SRSdR-0000ua-VI
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 20:26:14 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 642A3215C0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2012 14:10:12 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute3.internal (MEProxy); Mon, 07 May 2012 14:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:in-reply-to:references:content-type:content-transfer-encoding
	:mime-version; s=smtpout; bh=7B7Zf2fkls9QuXsW93KDxlGkt4A=; b=SQW
	tMF3Bi/Xgd3lUXPbrNbIdJjSWiDCkjpfTwnRSbZUk69eQ2WWI4X7RAVmLWRP14wK
	9rNtgY9EKiKQBCAdPa5PpoC/yfqnwKZF3/BZi8eLGLL42DUgDPOyxAFFjThC/w/A
	vhyRS7lwLecer1sLe71nVJwAkun/PzmyZ9Jw1/6I=
X-Sasl-enc: IO9nLGZq+bsDRKCLAl79WIN2aWkqTYfg0DnLsNIHEtSv 1336414212
Received: from [192.168.43.202] (64.sub-166-248-6.myvzw.com [166.248.6.64])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 0FB5A8E01A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2012 14:10:11 -0400 (EDT)
Message-ID: <1336414182.2902.26.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 07 May 2012 14:09:42 -0400
In-Reply-To: <1336384326.23777.70.camel@ted>
References: <1336384326.23777.70.camel@ted>
X-Mailer: Evolution 3.2.3 (3.2.3-3.fc16) 
Mime-Version: 1.0
Subject: Re: [PATCH] glib-2.0: Fix issues with libelf dependency creeping in
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
X-List-Received-Date: Mon, 07 May 2012 18:26:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-07 at 10:52 +0100, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
> new file mode 100644
> index 0000000..e9b3b26
> --- a/dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
> @@ -0,0 +1,37 @@
> +Ideally there would be configureation option for this but there is not. We
> +can't allow this code since it could detect the host system's libelf with
> +disasterous effects when cross compiling.

Random request - could you guys also CC patches to GNOME stuff to me?  I
do review patches to GLib fairly actively.

As far as removing the libelf support; note this means GResource won't
work which in turn means gtk3 won't work (at the moment).

Anyways, a patch to add a configuration option is really, really trivial
if one has a checkout of git, if someone files a bug with a rationale I
can do a patch.







