Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id F31066013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 00:43:09 +0000 (UTC)
Received: by yhle43 with SMTP id e43so8557702yhl.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 17:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=IhktHDnhxPdlxMUjv98rp6sIKNzzdNFd6lql6naTBV0=;
	b=KkzgzSVypT0HC7UKk5UipnAhkRQF0c6TBaqz1EgSy9xrF5mHr1jjKjVv0e3EhvTsCG
	n3nyxfMZ6YDO29/BoRSnoS8UkOro1hbzLp5ql8Vd9jdHiksbzvuy8dEfdVPNsrkmAJT4
	6c8L0keryExysUsC6rb8JBHEyPt4fG89T+SupRGClQEdiYdcu6ontAGyZDojuVRU2ykK
	LgZ+kKjk8/N48hrpqwisgPykmGuSIOYe7T80gGjc+xjAs3zH+Y0wXjk8tGAKvaQVaAtk
	e2sX+nsCmmN3YKAoWMY9Oufb3WDZww8wPuequjM8IQ4pufk9PbUzaMOPajd/k0Amn66z
	JcgQ==
MIME-Version: 1.0
X-Received: by 10.170.124.210 with SMTP id q201mr34710417ykb.70.1426725790563; 
	Wed, 18 Mar 2015 17:43:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Wed, 18 Mar 2015 17:43:10 -0700 (PDT)
In-Reply-To: <21a24c032ec5e2f5feffc593f7995fc086d14556.1426695976.git.anibal.limon@linux.intel.com>
References: <cover.1426695976.git.anibal.limon@linux.intel.com>
	<21a24c032ec5e2f5feffc593f7995fc086d14556.1426695976.git.anibal.limon@linux.intel.com>
Date: Wed, 18 Mar 2015 21:43:10 -0300
X-Google-Sender-Auth: JWYyJAuDZdi4iO55q-w3FUjofX4
Message-ID: <CAP9ODKrSS_+1TUVG0WGU_75cGvOZrQk9J1X4yGrdipn+pFE6Bw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] initscripts: Add changetodefaultvt for 2, 3, 4 runlevels
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2015 00:43:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2015 at 1:31 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> When change between runlevel 5 to another non-graphic runlevel
> the console stays in the tty where X was launched.
>
> This patchs add a default switch to tty1.
>
> [YOCTO #5336]
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>

If not using X this is pointless. Make this dependant of X distro
feature please.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

