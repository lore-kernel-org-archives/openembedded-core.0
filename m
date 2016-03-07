Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id D23A271957
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 12:17:14 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id bc4so127657058lbc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 04:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=kJ+XwtPdCgzZYOimx5iJpqyQ3ah42eJMYDFlWWIT2tk=;
	b=iyo+IWYOO0NeWC7pPW2092hE8rGZggp5/oxCuCK0QRYEEnzgdmC5lBZUkgJTxpbvg9
	CWSM3JBGglVlX1aGIGRlvKSXc1jXf6NnO91BZg75hkaZwt0kVkdQeNqQIv06nwi5WI0c
	WbUxZFdCpCDHMIgOfZ0NaLAzYxPMOGgEMMoPKQi/gFffoilHC9rd15aT6RGMKZwalKG5
	vYHOko0gt5/oizADkGYh56GmGBZvtCydDBtmaoY0NaLC08WV67jSIpcD3towwT6iUG5N
	6QNadzNRkAq/1+5vRgURcoUukVNWoYpLQOC4WR3JSzdGyUrWKVcTYph14wYRRtLHVvy7
	n3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=kJ+XwtPdCgzZYOimx5iJpqyQ3ah42eJMYDFlWWIT2tk=;
	b=IztQQjywP41nOJaZuWa89gMKU3ZwyQyHuojIxjr75bEzrvylonnMX+8RegVkfc0IbF
	EdfTh4I9GBt2aH1Ds31AyH4sFv5dfTZZvejQ+9yhiMvTzQEQIEs2GVUe5qugYvO9IV9+
	xm2Iq79CBipIDtqgMUxyjODoJdgSOo45PpZWdKwnhsH7um+b//U06DqJRfYxELY5u0Ju
	WsXBj9q4hBhbCwgdlhZbhZQCk08JDMm/wDZ9BT2IgIbmRXWs4+D8ZxL49aVGYyriPbhA
	s3zhfApPR01yiZhUaTr9l1lyO6akNflaRoLBUFSuS4vv5bqX+/8vVXVcJJaxDV3ChcOd
	oAdg==
X-Gm-Message-State: AD7BkJK3vmOe6rZr5YJ4nUoBZZRCsMl9gTmeZnhU0WLrt/vtnwlLJ46nj0erePKZxRkozA==
X-Received: by 10.25.134.70 with SMTP id i67mr5600698lfd.90.1457353034397;
	Mon, 07 Mar 2016 04:17:14 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	l129sm2765636lfl.18.2016.03.07.04.17.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2016 04:17:13 -0800 (PST)
Date: Mon, 7 Mar 2016 13:17:11 +0100
From: Anders Darander <anders@chargestorm.se>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20160307121711.GE6004@ad.chargestorm.se>
Mail-Followup-To: OE-core <openembedded-core@lists.openembedded.org>
References: <004901d1785c$fb27d0f0$f17772d0$@neuf.fr>
	<005801d1785e$07915900$16b40b00$@neuf.fr>
	<20160307114709.GD6004@ad.chargestorm.se>
	<008501d17869$0d5be340$2813a9c0$@neuf.fr>
	<CAJTo0LZOX2gzWBRF6Wf-EAGZ4uUR-bCA-NVG+oS+zr2sFPStCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZOX2gzWBRF6Wf-EAGZ4uUR-bCA-NVG+oS+zr2sFPStCA@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [systemd][PATCH] some dependencies in systemd seem not to be taken into account in systemd_229.bb
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
X-List-Received-Date: Mon, 07 Mar 2016 12:17:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Burton, Ross <ross.burton@intel.com> [160307 13:11]:

> On 7 March 2016 at 12:01, Herve Jourdain <herve.jourdain@neuf.fr> wrote:

> > For the gcrypt/resolved patch, I will rework it.
> > One thing, though, the idea was to add the --disable-gcrypt in the
> > EXTRA_OECONF, if neither gcrypt nor resolved are enabled.
> > Hence the removal of "--disable-gcrypt" in the PACKAGECONFIG[gcrypt]
> > line...
> > That seemed easier at the time, but I'll try to find a different way to
> > achieve this.


> Personally I prefer less magic in recipes, and if there are dependencies
> between PACKAGECONFIG flags then ensure that the default options actually
> build and that any dependencies are clearly commented.

That's my preference as well, as might be seen from my first reply. Look
at the importd feature as an example.

If we should have magic, then it should be on PACKAGECONFIG, though.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

