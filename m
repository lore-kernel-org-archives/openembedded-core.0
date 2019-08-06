Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A6DB96D6C4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 14:10:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v15so78379738wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=D1CIt/oBoqwkPpo0vJpaMftNiJNkgZVYLMK9psA7Tsw=;
	b=NNBx3svLMWY+wJnq2m/AgqOuOO+JyF/EVEaTCvqh6l9cWDNNXJHrnQqJIerIJcSX/T
	4WsKJl5X0DJK8xCwbiMSydGJ6xhA1+ykQaYAmySwIP7DoZyPTkiNJKmwIm8kjcHK09SV
	hOSjlIII9IOtmz1PmkpjAgWjvE5sgpQ814IZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=D1CIt/oBoqwkPpo0vJpaMftNiJNkgZVYLMK9psA7Tsw=;
	b=QRfvDElIkKNB9rQGPQPvZn8NN3Pi7AsnkYPsKVzHkmFsyCccha02NUb6qSVI8GE1R9
	G4dByuSDj7F+HZF4YcBGWT1kZ461ghKxV6vHBR/GKzaV57p3tPx0pF3Vr2VxZeRYp5Tt
	tOW/7GKcBqz2xbML3sygS0Cd0ZTknQRiefCk9DLIRbnJFCVIH8uM5MtlVV5C0cJRhAxT
	vuxeK7p5XfHRsrh2dMuC+lLi7gV2UzZKmd5mqvXGX1UFCas4wPUYqKTwqfA1wi+dt4r4
	4HuPmW9nzOqU3Ow+uGFqR8XOzIBRoh+mWcygDNtgMk3R20yMq6+3Ei8CVYD0TOMr3rLa
	nx9A==
X-Gm-Message-State: APjAAAVt/0eMXBLTedDZ3d1QkgKOauZpEMfGWsYMy6SXd84ehccpYhn/
	6ZTt67e3zMGq7nFjrKPa6WDcyQ==
X-Google-Smtp-Source: APXvYqwROZ5wbPoxMKTSFgnqlQsvtPur7ZU/Fl9PJSI6KiJ5Azr8sMx7WnX7DGrnQbgeevIwine+jA==
X-Received: by 2002:a7b:c212:: with SMTP id x18mr5017512wmi.77.1565100630435; 
	Tue, 06 Aug 2019 07:10:30 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k9sm587870wrq.15.2019.08.06.07.10.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 07:10:29 -0700 (PDT)
Message-ID: <da3a1a23fdb0b9c65a6701c1be3cfc7e17aa5d1a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 06 Aug 2019 15:10:28 +0100
In-Reply-To: <CANNYZj9iLsF0fBRCYp+_CbRakizOyN=CJuDdRtZ9OdnZ84rFbA@mail.gmail.com>
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
	<eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
	<CANNYZj-QUcKdw4BygFyfXLSm4L=89XC44u65LNFx2OiiqrQE0Q@mail.gmail.com>
	<CA+chaQfsQLEcxS9-XVQJT-7PR-JgtZ1cEFMdbJshmYMst6s2Lw@mail.gmail.com>
	<CANNYZj_YSBdctNSqewYy96qofF4A_XkVVWahU0wMw3nBV=q58Q@mail.gmail.com>
	<b25b0b717daa6dbeecd61255caf10bc49deb3509.camel@linuxfoundation.org>
	<CANNYZj9iLsF0fBRCYp+_CbRakizOyN=CJuDdRtZ9OdnZ84rFbA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 14:10:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-06 at 15:22 +0200, Alexander Kanavin wrote:
> On Tue, 6 Aug 2019 at 14:51, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > We now filter the pkgdata to the things a recipe can see in its
> > dependencies after:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=99206cb7b41be7a124ea8339bc891077f02128a2
> > 
> > Does that help? If not, is it because some code isn't using the
> > filtered copy? Or could we use this technique somewhere else?
> > 
> > I've not looked at the underlying issues enough to tell which code
> > is
> > actually triggering it but that kind of approach should help with
> > this
> > kind of problem and at least make it deterministic...
> 
> I think the issue might be actually in the QA check where it looks
> beyond the recipe's immediate RDEPENDS (and then fails or not
> depending on whether those indirect dependencies have been packaged).
> I need to better understand what happens there so will add some
> printouts first. The problem does happen with latest master.

I had a quick look and package_qa_check_rdepends() has a call to:

oe.packagedata.read_subpkgdata(pkg, d)

which effectively calls:

def get_subpkgedata_fn(pkg, d):
    return d.expand('${PKGDATA_DIR}/runtime/%s' % pkg)

(from packagedata.py)

I think that this should be changed to WORKDIR_PKGDATA, at least for
the purposes of insane.bbclass. The copy in WORKDIR_PKGDATA is limited
to the recipe's dependencies.

Its not quite that simple as we need to ensure that WORKDIR_PKGDATA
when the insane code runs but you hopefully get the idea...

Cheers,

Richard





