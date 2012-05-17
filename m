Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SV5ap-0005xo-NN
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 20:38:31 +0200
Received: by eaal1 with SMTP id l1so585302eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 11:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=MffmVKPUwYz43RJM34gMUDJV4CMAArh9OHP/aheeR5A=;
	b=sznU2t8iCO0uzooJ8Sfxd3UzJKu/Ic/pSjajupWK41s18BWkgVYV/bAfTpngPrnIkF
	VoXSTSj/Zqm/+WXDSbHIPPEQSMjz/T0cSzPBNFfeDITXup52VLSUWOSHUpKqydRG3Nzv
	GKWoim29Cg/s/7zX6pTVCNSl5XYpQ94c4ZDPE98K3RPELdqfCy2giy+Ia5+G0SL8vwVg
	DfdL9y+q/SrMRlp8jQZ3O+KU7s51l4voN14JlxBmTwJ94MeOSruGwSvHbdlcUgcRAEnM
	km9Vu76IrBvuxd9F3wHqjBeUpT65CrX/7Zdt+bdf9dk8fRIJinOG6tynNKiPuynTzPB4
	alcA==
Received: by 10.14.53.67 with SMTP id f43mr1761770eec.3.1337279309111; Thu, 17
	May 2012 11:28:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 17 May 2012 11:27:58 -0700 (PDT)
In-Reply-To: <6152dc105c0eecec81a65b329a3a5a0820eeed26.1337278931.git.mark.hatle@windriver.com>
References: <cover.1337278931.git.mark.hatle@windriver.com>
	<6152dc105c0eecec81a65b329a3a5a0820eeed26.1337278931.git.mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 May 2012 11:27:58 -0700
Message-ID: <CAMKF1sofgso3eS-AuwFMHh+DBhqgThi6PVDvepeyyaqQW_r7JA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] rpm: Upgrade RPM to 5.4.8 (db to 5.3.15)
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
X-List-Received-Date: Thu, 17 May 2012 18:38:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 17, 2012 at 11:25 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> RPM 5.4.8 requires db 5.3.x, so both are upgraded together.

is it also fine to upgrade this on existing devices ? or do databases have to be
updated too ?


