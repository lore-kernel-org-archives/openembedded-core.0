Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 93B646CBAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 15:06:22 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id ks9so4533728vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 08:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xMfftsKEILTlBNkz3/3mO5pKAOIllFSen4xdTcyeV94=;
	b=iCduKVAO1Bhvs2VALC7puj9CuFO1RCq9pNLel8sxwyLkdX+I8N76yp6ut/u4NLMTOx
	tWsYR5QUD5kT1X6i5Yst8+V5PMjqBB7e6wYOHyIhNNYNlwkr7JUMVZCJ1Tsz96wmgxT+
	KIcgpjXmErRc1r0mLVYYTiXvC/8+ki6t5LhDu64FG/VNGOn5f/WKEdnoPXaJOFiRF5de
	gG49vQqLOEc482200qg22m2FHZBg3SzxfcWmH4nlH+Eimmba95WBythzH8Fb59sGQZv+
	bFjt7cUTUH/nHhoag1RI3De9yo+IPP/HzdLa95OifspjkXsrgQYPTGgotFk7sPOcN4ej
	/nXg==
X-Gm-Message-State: ALoCoQmTKkgXrQ6b7IKNAseLpMFLrRZ2YFs1Fldo1icPdLUtdZ+PFHbsksF2Rh2zFrAGHOvX7L1K
X-Received: by 10.220.105.199 with SMTP id u7mr34351146vco.1.1381763184180;
	Mon, 14 Oct 2013 08:06:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 14 Oct 2013 08:06:04 -0700 (PDT)
In-Reply-To: <1381759718-11554-2-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
References: <1381759718-11554-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
	<1381759718-11554-2-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Oct 2013 16:06:04 +0100
Message-ID: <CAJTo0LasHVynEnzxQiQqruVm=GeG2h1BHfNaW+mgsiV24ZsFTw@mail.gmail.com>
To: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/3] Weston : Bump to 1.3.0 version
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
X-List-Received-Date: Mon, 14 Oct 2013 15:06:23 -0000
Content-Type: text/plain; charset=UTF-8

On 14 October 2013 15:08, Ewan LE BIDEAU-CANEVET
<Ewan.LEBIDEAU-CANEVET@eurogiciel.fr> wrote:
> Removed useless patches

Phrasing that as "upstreamed" instead of "useless" would make it clear
why they're being removed.

> added new --enable-demo-clients feature), and added new --with-cairo=image/gl/glesv2 feature

The option is called --with-cairo, the user has to pass either image,
gl, or glesv2.  Tristate isn't easy with PACKAGECONFIG but luckily the
default is image, so this should be two packageconfig options:
cairo-gl (--with-cairo=gl) or cairo-gles (--with-cairo=glesv2).

Ross

