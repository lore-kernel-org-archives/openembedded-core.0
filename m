Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5029772EB7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Apr 2019 21:32:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r4so13982300wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 14:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=EPo6GMbsI0doRd+w6nSisurRodhrMzt0c97Gf0DgZ2o=;
	b=gvS05nM1+L5Mo1lfoCUTlGRyZqtZieb3ZeyL/ElGojgShG70kWDXzLKJT0aBuVxkRo
	QPA5TKo3Z3Yub8QLNAmqJ36GME6RL59o/IkXhTvHOYoKLaqQaCDHmCxIOmaQSBWe7TOA
	n+LTwsu9G3ntkNevL2GE7Z6qKPv7T/chGzHDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EPo6GMbsI0doRd+w6nSisurRodhrMzt0c97Gf0DgZ2o=;
	b=WpV+xi91NUTZFRo4Rb57pzBwNRzAn8uc7LOy+uNuvnkExiRBim2LNWFKD9VCF4PmxK
	uriXx7CBSL+uZbYQZBSzOt+SG1le2NgXs834BUkTitgts+hTiarnbPvWdIDMHJXQb7qD
	wXn4JTTj4evvCCVwiUemoX5eQrj2YNbaMiwCrrqnGe9PapgSp9K5U6EHTZbiGl4Pl3h6
	rjCKAQPwGaXcPchwq3kFrhLVaoFTh5lgS7NWi+0wnkO6zbHdogcqpuEo2WLhEbtWDE+F
	0cTgz+LGY63DHDImx1pfIicSqDnFdlYTv52Itb8Apt99/Kt1CCpDh7b9M4VlhUoNexUH
	x/mA==
X-Gm-Message-State: APjAAAUtP2a6RcvPhXl9QxAcu1LdSMkqPOgdLLHVlo4fs7l6NWfQx/5F
	yHmSbEGNyM1JFYnxc84ZEwa82g==
X-Google-Smtp-Source: APXvYqyR0A8KV+STGBHvwRKXNu62kUTRdYAviV+x+LUZIL+fx1FXcYaes34xJTFcfhQH0ZD2adcJxQ==
X-Received: by 2002:adf:f488:: with SMTP id l8mr15448452wro.213.1554672745010; 
	Sun, 07 Apr 2019 14:32:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w10sm18275283wrv.8.2019.04.07.14.32.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 07 Apr 2019 14:32:24 -0700 (PDT)
Message-ID: <475418a26ad41bf4dd50386badf97eab3b6004f6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mariano Lopez <just.another.mariano@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 07 Apr 2019 22:32:23 +0100
In-Reply-To: <694f59ce48ac5931431cd76f12d7bbe23d279fbd.1554656203.git.just.another.mariano@gmail.com>
References: <cover.1554656203.git.just.another.mariano@gmail.com>
	<694f59ce48ac5931431cd76f12d7bbe23d279fbd.1554656203.git.just.another.mariano@gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] update-alternatives.bbclass: Add function to get metadata
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
X-List-Received-Date: Sun, 07 Apr 2019 21:32:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-04-07 at 12:15 -0500, Mariano Lopez wrote:
>  python populate_packages_updatealternatives () {
>      if not update_alternatives_enabled(d):
>          return
>  
> -    pn = d.getVar('BPN')
> -
>      # Do actual update alternatives processing
> -    pkgdest = d.getVar('PKGD')
>      for pkg in (d.getVar('PACKAGES') or "").split():
>          # Create post install/removal scripts
>          alt_setup_links = ""
>          alt_remove_links = ""
> -        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
> -            alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
> -            alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name)
> -            alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
> -            # Sometimes alt_target is specified as relative to the link name.
> -            alt_target   = os.path.join(os.path.dirname(alt_link), alt_target)
> -
> -            alt_priority = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg,  alt_name) or d.getVarFlag('ALTERNATIVE_PRIORITY',  alt_name)
> -            alt_priority = alt_priority or d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg) or d.getVar('ALTERNATIVE_PRIORITY')
> -
> -            # This shouldn't trigger, as it should have been resolved earlier!
> -            if alt_link == alt_target:
> -                bb.note('alt_link == alt_target: %s == %s -- correcting, this should not happen!' % (alt_link, alt_target))
> -                alt_target = '%s.%s' % (alt_target, pn)
> -
> -            if not os.path.lexists('%s/%s' % (pkgdest, alt_target)):
> -                bb.warn('%s: NOT adding alternative provide %s: %s does not exist' % (pn, alt_link, alt_target))
> -                continue
> -
> -            # Default to generate shell script.. eventually we may want to change this...
> -            alt_target = os.path.normpath(alt_target)
> -
> -            alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
> -            alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
> +        updates = update_alternatives_alt_targets(d, pkg)
> +        for alt_name, alt_link, alt_target, alt_priority in updates:
> +           alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
> +           alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)

I think the above is three whitespaces, not four? I know its minor but
it jumped out as I was comparing the code before/after!

Cheers,

Richard



