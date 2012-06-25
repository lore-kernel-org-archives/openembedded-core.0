Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sj6D8-00037l-JI
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 12:07:58 +0200
Received: by eekd49 with SMTP id d49so1215033eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 02:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=FYRX+b+VLyClJ3kzkWJCBr3NGp1bSVBh6vBd3njtX/Y=;
	b=d+SL46LOs+5Jec7gljUKxMyLr5Vs15EKjYh1FEs09nNBjoMmIy51kcibizEt7YTHTe
	0x3Q1DStmtXFUQd5EK222GZUJffjJKCS3gBOXZb78VdkQOkbS9pSE0av0jg3gWNYkSvn
	15D3YNTmuNjVYSaeD2TWZdZKB5PvlsDpd7ufljhw17M1kbWofHcE2mmH9PX3/qBBXB3K
	z3qYVtnMNdiCnGOq4Q9ZUg9tD0YV/L0cYVaDaSwt2TmPtPiHdbkPZLtEdIYA2hzAAxnl
	Y5rFG3Mvpe3wyAIghQrgLf4zWdot+UJygGLqwv4/AMUKK3qNCOZ8Estb2jaRs2HJx36B
	iefQ==
Received: by 10.14.95.201 with SMTP id p49mr2234037eef.103.1340618227933;
	Mon, 25 Jun 2012 02:57:07 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e45sm137049155eeb.6.2012.06.25.02.57.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jun 2012 02:57:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1340615583-21184-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Mon, 25 Jun 2012 11:56:58 +0200
Message-Id: <4A01B739-F944-4715-8585-5DA41F7EA52E@dominion.thruhere.net>
References: <1340615583-21184-1-git-send-email-marcin.juszkiewicz@linaro.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlJXfOIjdvK63WKLVGCwn5LsEgC2swABS23NZPZvI6qztQFexzmosy50Khni/eSMddQ3+ov
Subject: Re: [PATCH] lighttpd: fix FastCGI configuration for PHP
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
X-List-Received-Date: Mon, 25 Jun 2012 10:07:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 jun. 2012, om 11:13 heeft Marcin Juszkiewicz het volgende =
geschreven:

> /usr/local/bin/php was set as PHP interpreter so lighttpd failed to =
run.
> Also uncommented FastCGI configuration block to make mod_fastcgi
> enablement easier for user.
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> meta/recipes-extended/lighttpd/files/lighttpd.conf |   16 =
++++++++--------
> meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |    2 +-
> 2 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-extended/lighttpd/files/lighttpd.conf =
b/meta/recipes-extended/lighttpd/files/lighttpd.conf
> index 3342470..0838da8 100644
> --- a/meta/recipes-extended/lighttpd/files/lighttpd.conf
> +++ b/meta/recipes-extended/lighttpd/files/lighttpd.conf
> @@ -211,14 +211,14 @@ static-file.exclude-extensions =3D ( ".php", =
".pl", ".fcgi" )
> #### fastcgi module
> ## read fastcgi.txt for more info
> ## for PHP don't forget to set cgi.fix_pathinfo =3D 1 in the php.ini
> -#fastcgi.server             =3D ( ".php" =3D>
> -#                               ( "localhost" =3D>
> -#                                 (
> -#                                   "socket" =3D> =
"/tmp/php-fastcgi.socket",
> -#                                   "bin-path" =3D> =
"/usr/local/bin/php"
> -#                                 )
> -#                               )
> -#                            )
> +fastcgi.server             =3D ( ".php" =3D>
> +                               ( "localhost" =3D>
> +                                 (
> +                                   "socket" =3D> =
"/tmp/php-fastcgi.socket",
> +                                   "bin-path" =3D> "/usr/bin/php-cgi"
> +                                 )

How does this work with DISTROs that set ${prefix}=3D""?

regards,

Koen=


