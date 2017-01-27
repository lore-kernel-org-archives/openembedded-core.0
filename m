Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD937742F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 19:22:30 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id j18so68053886ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 11:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=PNspQcUjGJt+53BxFPBJ1QDy32BysQfUW/q3CwuECu8=;
	b=e9oo1RJQjN+lWH2YPibW6hwd27VBYkcWpw460KrDOEcYmMgOldyzRp8BPA8Tgf34cX
	NkNj7uX0tPnCk0m5qm5BKRFjFarMNdqecitT+vM0W9wABnh3gZ5jrtVbLh/uDOs1jtKH
	Yqw6OX4AuqVV5FwnI9wmeuG/X+H1UUSc0BA2QKGSyAIm0fX/llg7u2SAS3sCgNIxwrTe
	D+LvelFakYw4MoPMJAABeyCoe9dTVmXiyALA80Z/xcmYxe5Ftzd5WRinzkQPeTE5psKX
	L1obrskCOTFu/1x1Rt4JK3e3H1v6kqMwwhZp6oeRnpXBIRkhIVx73jqZ4yqFJNEZr1lV
	TgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=PNspQcUjGJt+53BxFPBJ1QDy32BysQfUW/q3CwuECu8=;
	b=hqMJZRNwuGbgkYpFv+r/Ev+Cc89fI7S6kSfPYpv39Id4HYeYhcwhSyAKUZfrm4yZdt
	VgcTkJPfiQbfj+B8bRiZ8n0zk8IxVIjwtDRGlwL+Bx3ejXGWS1X7uYxHP9dIQz5FUvkh
	kPjQvWJMea9AFAkFtJU7g88Ni29txzKtk2X7r6AR4QYmkDXZIuStZtcVoj59MEys1SfM
	9qlepfIcSsUby8dhDfhbEmVQ6yZxDJPmUt4ZXFxMLT4ULgzik1XB7YMSqaE+6qFrZy+K
	VbpZEz91IWUWTOnSV0Ea3CoBSqPmIzIHrvQ/vZObeRM13V/L8NKoyMG58z7Z3ORXYuwN
	YQzg==
X-Gm-Message-State: AIkVDXIYmKWtkxFBvZg+nNI0roHZstaK0NFoFtVYzCpsGj2o+7BEHjKmMrn5sN+EeCTEKVuG
X-Received: by 10.107.41.205 with SMTP id p196mr9346139iop.124.1485544951379; 
	Fri, 27 Jan 2017 11:22:31 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DB2E.dip0.t-ipconnect.de. [93.232.219.46])
	by smtp.gmail.com with ESMTPSA id
	n134sm1871243itg.19.2017.01.27.11.22.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 11:22:30 -0800 (PST)
Message-ID: <1485544947.20333.119.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Date: Fri, 27 Jan 2017 20:22:27 +0100
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6118F7EEC@ORSMSX112.amr.corp.intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	,
	<707323fc8105d9a1cf77fe340ebff387862c8e8e.1485530988.git-series.patrick.ohly@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B6118F7EEC@ORSMSX112.amr.corp.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 09/12] runqemu: also accept -image suffix for	rootfs parameter
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
X-List-Received-Date: Fri, 27 Jan 2017 19:22:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-01-27 at 16:54 +0000, Bystricky, Juro wrote:
> Just curious: is this test for "image" in file name really necessary?
> With qemuboot.conf the relevant files are already spelled out.
> I don't see a need to force "compulsory" names for images.
> If I comment out this test, everything works just fine. Am I missing something?

Some of the usages when checking for paths might have become obsolete,
but at least for distinguishing between machine and image base name
parameters it is still relevant:

    def check_args(self):
...
            elif re.search(r'-image-|-image$', arg):
                # Lazy rootfs
                self.rootfs = arg
            elif arg.startswith('ovmf'):
                self.ovmf_bios.append(arg)
            else:
                # At last, assume is it the MACHINE
                if (not unknown_arg) or unknown_arg == arg:
                    unknown_arg = arg
                else:
                    raise Exception("Can't handle two unknown args: %s %
s" % (unknown_arg, arg))

When removing the "if re.search(r'-image-|-image$', arg)" clause one
gets an error for:

$ runqemu core-image-minimal ext4 qemux86
runqemu - ERROR - Can't handle two unknown args: core-image-minimal qemux86
runqemu - ERROR - Try 'runqemu help' on how to use it

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




