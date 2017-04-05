Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 86FEE71DD9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 18:10:35 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id 68so21332363itx.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 11:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=k1/oPAiowm8W00C248z8T4gsxs+p842pTQwJe2aTtmE=;
	b=VR4mmnwk2KNh/XzSmpZIMuV/1mQa3Z5nV/nbdTlXC54H1WYtVGnBZwdHDbfIpwWi7v
	xCCv9W7lIYyIprCjjeGJIVAdom0Wnz1ZtQm/ZrSH7zjTX1I03Is12nS3we5EFgg28ycM
	Xc5xXdivR/TR1r2hI2zu+hE10e52XKeEE1A/ix2VJ7Fqdbu9UWy42Gnmg0zWsnhrOSfD
	F2mlumbB0epd6yEsqI9HNU0YU9u1zYipd5mbUSw45R8634gUa9R4ClRVQfjeeLPJlXN9
	64bZtcN35Z9GN+SdkPLvoF2tgY7g93sOksp3h8HdPiDishKNInKxAnl1R0jLJHq3CbL0
	U2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=k1/oPAiowm8W00C248z8T4gsxs+p842pTQwJe2aTtmE=;
	b=b7DKExH7LT1pvWsC6ZU3o/zI/dMVmJAt7EQT4aX8mtu0xPj80VOE+O5KjVIFBZTnXe
	rWOX2DKog4IWuS4HIvE18sERIiynZEnTiZphdBOSAj7f6U7FoS+VzbW+27DIZnoZeu0Z
	ua0FHUs61+9g2gP34ffce/R1KF2iRJ2FJ6tJITVKT5nRzhHXoUwjswW1OJqZO5mc78Oz
	Frdrq8a8RNkVax/ZplgYNcJqbjVvbQHD+zD8AsSXXLYqlRrvttRjHEoCc18w8G3+n3Gg
	gqmuYuEJjiYJQIRQDZIuRL1PNMbPyw7ySFyBvZ0rsPTFbLqIkMCHmA8RgoJl36z7za3a
	P+aQ==
X-Gm-Message-State: AFeK/H3IAC4oFIybquBE+yKgU/1X9f8R5O9EvdVzLw9m7BgpQDxyBg+wvRqZ+02GSdbz/i92
X-Received: by 10.36.70.210 with SMTP id j201mr21297000itb.109.1491415836480; 
	Wed, 05 Apr 2017 11:10:36 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E12B.dip0.t-ipconnect.de. [93.232.225.43])
	by smtp.gmail.com with ESMTPSA id
	j102sm10902906ioo.40.2017.04.05.11.10.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Apr 2017 11:10:35 -0700 (PDT)
Message-ID: <1491415832.10884.35.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Wed, 05 Apr 2017 20:10:32 +0200
In-Reply-To: <1491405979.5062.33.camel@linux.intel.com>
References: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
	<b57ac90f02f18be863551ed630acc2d8007a0ffd.1491399200.git-series.patrick.ohly@intel.com>
	<1491405979.5062.33.camel@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] yocto-compat-layer: include bitbake-diffsigs output
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
X-List-Received-Date: Wed, 05 Apr 2017 18:10:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-04-05 at 10:26 -0500, Leonardo Sandoval wrote:
> > diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
> > index b91da9b..d909d5b 100644
> > --- a/scripts/lib/compatlayer/cases/common.py
> > +++ b/scripts/lib/compatlayer/cases/common.py
> > @@ -76,4 +76,14 @@ class CommonCompatLayer(OECompatLayerTestCase):
> >                         (self.tc.layer['name'], len(sig_diff)))
> >              for diff in sorted(sig_diff_filtered):
> >                  msg.append('   %s: %s -> %s' % diff)
> > +                try:
> > +                    recipe, taskname = diff[0].rsplit(':', 1)
> > +                    output = check_command('Determining signature difference failed.',
> > +                                           'bitbake-diffsigs --task %s %s --signature %s %s' %
> > +                                           (recipe, taskname, diff[1], diff[2])).decode('utf-8')
> > +                except RuntimeError as error:
> > +                    output = str(error)
> 
> Patrick, just a minor comment:  there is no need for the 'if' check,
> because the try and the except bodies set the output variable.

I added that for the case that the command prints nothing (output ==
''). It's unlikely, but I prefer explicit, easy checking over making
assumptions.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




