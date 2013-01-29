Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U0DoZ-0004vN-0J
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 17:13:48 +0100
Received: by mail-ve0-f170.google.com with SMTP id ox1so400100veb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Ag46sp3WucB6UngVZyTTKW8SjWFzGN9BVYR6BY6reGQ=;
	b=DqCbOeuOtru/aMBZVgsYg2FYyTX7Slidz+ja2U4RiutXhNxP7MPpAHQ2Fqhs85aCIt
	TqiHVShMnWFXWMVQuBWGjq5FNOlhU37dWJTT2PRovNZxmZe/M6+NxOLr7VRaavkN37Pq
	yg0PPIKmE9ddxBYHf5SOMDKQq9KdF4eOvSza8lejsPYMXCnYMk29pxDsCcOJbItU/CYg
	phzi9NgW+A/iD5lRnXPOEoWhocemScUri/m+DamUu3ZVwX5FQz6Rnh4xjuslicSjH3Cu
	MS/P2JeFi7zDrkzSyBovZ6d1o+gGwJlN/QkBX3hp5USFyvgU5SPK1QlJedOXXLyf1HMQ
	sF4g==
MIME-Version: 1.0
X-Received: by 10.52.70.205 with SMTP id o13mr1306466vdu.75.1359475078738;
	Tue, 29 Jan 2013 07:57:58 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Tue, 29 Jan 2013 07:57:58 -0800 (PST)
In-Reply-To: <1359473084-592-3-git-send-email-radu.moisan@intel.com>
References: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
	<1359473084-592-3-git-send-email-radu.moisan@intel.com>
Date: Tue, 29 Jan 2013 16:57:58 +0100
Message-ID: <CALbNGRRDFCD+NWh3+u93Wzcmu4UOQHCEtO36=LCOxieARN4pKg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] avahi: Remove -systemd postfix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 16:13:50 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 29, 2013 at 4:24 PM, Radu Moisan <radu.moisan@intel.com> wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  meta/recipes-connectivity/avahi/avahi.inc |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index d529b37..a02c8a5 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -64,9 +64,8 @@ do_configure_prepend() {
>  }
>
>
> -PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
> +PACKAGES =+ "avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"

I thought the discussion where to put systemd-files is still open.
Don't misunderstand me: I am fine with both but I think we should
decide to go this or that direction not by creating facts.

Andreas


