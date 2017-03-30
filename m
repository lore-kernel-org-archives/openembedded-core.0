Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0168277D25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:13:44 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id z13so22474293iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=ODtNVAU14BCFhRKVjNb3DKSbFBdImCRiOrup81byYUA=;
	b=dLW0VAr99J1DmCB2Lj7uZPijjak6LIU1ztGW25e6YE+8nl1cvxdJ7vdaIpdKJE6ZbV
	KYXLvMzPcqal9nL6+l20Z48V8ZOM9MYQ4Zb1zXOJdClNGiwWdE1X6ZEk4cnWSLSMAqZE
	dDcPx9aW367ZSi4cKbvv2+js9ShHPDRp/g73k+mwEh3eS84MlH6ET0lYeWq2Nj9J0kjo
	JUmKd/b4PWF4kowfgV+fKmYa080yPbyRwfTS0dtSCPCon/DvcHHUs3kyzdCb0nmXtYyj
	904WMxix3es122dzyrCFTu+4WLabtERN82vV24oYBqizUgOupqhA5ruwkYk2wpj18R98
	tnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=ODtNVAU14BCFhRKVjNb3DKSbFBdImCRiOrup81byYUA=;
	b=a6V7uAsQC1tSkTtBoJ8sGidg95TT1YA5lDbDrIDJwE6wxG5rxbQ8ZJV832gYNo9YbN
	Q+ljqlsOtudrd5SNZD9c9c17cNNg9jCAsWcpvFMRyjri+RVvcGItdGJKZ20YJeXkSN0v
	Vjg8gGSPYtjg+n/b4f118M2xX22pu4vR6eymjHrMRwx0iBehcHYwmZ/F1jE8TurZtTK/
	jdciq/+yQ0e8gYV2/le6WuW74gKgdWp7Uq3ZIIhIZDSKjw7NFDxpmJAtLnK1VXDg/zze
	/5aKoTiyNPfp2uxHjPN4IkSLtwRHX7UHbIvKy5ZiI1aWCsQkmoz+LxxEWHbonTU0wOrl
	9G2g==
X-Gm-Message-State: AFeK/H1ieqiiDOMIsehZiJkRhAQhIexMhzBBOcd1QvLY5DfRi+kbg1eVpVvOPtrE2A5e8pBx
X-Received: by 10.107.59.22 with SMTP id i22mr1297696ioa.177.1490890426059;
	Thu, 30 Mar 2017 09:13:46 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE63.dip0.t-ipconnect.de. [93.232.206.99])
	by smtp.gmail.com with ESMTPSA id m124sm600077itd.3.2017.03.30.09.13.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 09:13:45 -0700 (PDT)
Message-ID: <1490890422.6396.459.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Thu, 30 Mar 2017 18:13:42 +0200
In-Reply-To: <58DD2C5B.8010704@linux.intel.com>
References: <1490823850-20782-1-git-send-email-anibal.limon@linux.intel.com>
	<1490823850-20782-2-git-send-email-anibal.limon@linux.intel.com>
	<1490853745.6396.439.camel@gmx.de> <58DD2C5B.8010704@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>,
	saul.wold@intel.com
Subject: Re: [PATCH 2/2] scripts: Add yocto-compat-layer-wrapper
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
X-List-Received-Date: Thu, 30 Mar 2017 16:13:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-30 at 10:03 -0600, Aníbal Limón wrote:
> 
> On 03/30/2017 12:02 AM, Patrick Ohly wrote:
> > On Wed, 2017-03-29 at 15:44 -0600, Aníbal Limón wrote:
> > ...
> >> +show_help() {
> >> +	printf "Usage: %s [-o output_log] [-h] LAYER_DIR ...\n" $0
> >> +}
> >> +
> > ...
> >> +env_dir=$(mktemp -d -t yocto-compat-XXXX)
> >> +echo "The environment will be setup at $env_dir"
> >> +echo ""
> > 
> > The directory gets created, but not removed.
> 
> I didn't remove the temp directory because may be the user wants to
> access the dir after the check.

I think that this should be something that the user explicitly needs to
request. As it is now, accumulating directories in /tmp when invoking
the script is just unexpected and not the normal behavior of tools
creating something in /tmp.

> >> +echo "Cloning oe-core..."
> >> +git clone $oe_core_repo $env_dir
> >> +if [ $? -ne 0 ]; then
> >> +	echo "Failed to clone oe-core repository"
> >> +	exit 1
> >> +fi
> >> +
> >> +echo "Cloning bitbake..."
> >> +git clone $bitbake_repo $env_dir/bitbake
> >> +if [ $? -ne 0 ]; then
> >> +	echo "Failed to clone bitbake repository"
> >> +	exit 1
> >> +fi
> > 
> > Cloning bitbake and OE-core each time the script runs will be fairly
> > slow. There's also a chicken-and-egg problem: if you don't have bitbake,
> > where's the script?
> > 
> > I'd prefer to use an existing checkout of both, just as for the layers
> > which are to be tested.
> 
> I choose to clone the oe-core/bitbake to ensure there are a clean
> environment, without any previous layer added.

I don't quite get that argument. When using existing bitbake and OE-core
directories, how can they have layers added to them? I understand that
the existing checkout might contain additional modifications and/or
might not match current master, but I consider that a feature. As it
stands now, the caller of the script cannot test against Yocto 2.3 once
it is released, because the script will always check out master.

Control over that can of course also be added to the script, but I just
don't see the need for all this additional complexity. Just my 2 cents.

> I could add an option to
> specify a oe-core/bitbake dir if isn't set then clone.

At the very least please do that.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




