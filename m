Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1Qbwp9-00008K-NI; Wed, 29 Jun 2011 17:37:07 +0200
Received: by pvf24 with SMTP id 24so915953pvf.6
	for <multiple recipients>; Wed, 29 Jun 2011 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=3DqjJqBx5b2uXQEC2EJIsZ0edH6kWiZfTsv+1diMF2Q=;
	b=eodBnybzOJZy08CXlFC0RwoNjQjo2kr1+KdoqU7Kki9Bg3EIYD0pSuC+Dm3tYuDw/7
	3DaOHsedcl7TI92aigNxtKuXI7OffcYiXXK0xuACdi9jSa3dmMqaq7VVTw6DcRFd269G
	HYjsv0qIqszuU7UsUDGP0aU5WSGPwG8YDT9QU=
Received: by 10.68.36.234 with SMTP id t10mr1173331pbj.361.1309361604175; Wed,
	29 Jun 2011 08:33:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Wed, 29 Jun 2011 08:32:54 -0700 (PDT)
In-Reply-To: <201106291728.47032.schnitzeltony@gmx.de>
References: <201106291728.47032.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jun 2011 08:32:54 -0700
Message-ID: <BANLkTin06jiHrgrf2C3eEbkdVrtcYyOShQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] In which meta/layer is a home for not yet supported machines
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
X-List-Received-Date: Wed, 29 Jun 2011 15:37:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 29, 2011 at 8:28 AM, Andreas Mueller <schnitzeltony@gmx.de> wrote:
> Hi,
>
> just started to collect first oe-core experiences and would like to get the
> hardware on my (or friend's) desk supported. To check already available I did
>
> find -name "*.conf" | grep machine
>
> and miss
>
> o gumstix overo ( http://www.gumstix.com/store/index.php?cPath=33 )
> o tx28 ( http://www.karo-electronics.com/tx28.html / have prepared support for
> oe but would like to get this to oe-core )
> o mx28evk (
> http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=MCIMX28EVKJ&fr=g
> )
>
> In which meta/layer is the first place for configurations/bootloader/kernels?


you would need meta layer for the new machines. There already are some layers
checkout angstrom if the machines do not fit into those existing you
can create a new
layer something like meta-gumstix
>
> Regards
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


