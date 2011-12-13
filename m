Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RaZAq-0005iw-5m
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 21:42:04 +0100
Received: by lami14 with SMTP id i14so42880lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=6vwQtF0vnMhiG+FS3ghI8bbdthYgvrvqKPJ00eK4QT8=;
	b=iopimcSfJmT1cv/2ViybNoF+5gCj/fwWbBrw7f8oja+hD98/WQ065a7xUmVeyvznb3
	4qhCsQRa2JaAcYRPdKKaI8u6qwugoM1naIegiWIJTVdgiXwpnYh2j9v/A3abIMsjKqM1
	qWd1zr6pmo0IHdMKIWzjFDmCwYG/VpLrrO1cc=
Received: by 10.152.103.51 with SMTP id ft19mr16452928lab.42.1323808508324;
	Tue, 13 Dec 2011 12:35:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Tue, 13 Dec 2011 12:34:37 -0800 (PST)
In-Reply-To: <ae691bf123b40864556a105f325aff26a6878cdb.1323807692.git.josh@linux.intel.com>
References: <cover.1323807692.git.josh@linux.intel.com>
	<ae691bf123b40864556a105f325aff26a6878cdb.1323807692.git.josh@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Dec 2011 12:34:37 -0800
Message-ID: <CAMKF1soA84UGCpx12gsTU_aL0uGSYau_=qoLDXkj9fRrhtGLmQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] clutter_git: update to 1.8.2 tag
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
X-List-Received-Date: Tue, 13 Dec 2011 20:42:04 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 13, 2011 at 12:24 PM, Joshua Lock <josh@linux.intel.com> wrote:
> -SRCREV = "39db46123ed6bbbc3e6ad359a64d4d344ca9e11b"
> -PV = "1.8.0+git${SRCPV}"
> +# the 1.8.2 tag
> +SRCREV = "9041ea42655dfc1422ce88eab931382dd400d13a"
> +PV = "1.8.2+git${SRCPV}"

you could also use the tag name instead of SHA for SRCREV I think


