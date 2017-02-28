Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id ABF1472F7A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 20:09:31 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id y135so17043799itc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 12:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=9/Fxzzuymzmro5Grq1lWuzKW+8PrID/10MX8b23OxFE=;
	b=pXmvjlC8bmH4lpEmw+ehhHpR27ZOBSXpUA2blq23APoqhvsWab4gQRg9rBsab3f+l9
	IzF+9/2a8EfCgDB/ChRaFo8pGCqcFMd4SvRO0ySNs7ayg6q0ZrnYWFsmuvnGEkIFeQs0
	QOstzZlhMd8R5cO/fCX56VGQTiru5ry18KxqFk01oOdjbxkpw0zaWryipjvf6iAD/vrj
	GdkXBkSqdaMQKhFK7YIQQDnBwMJLyE309Y8ZR3g4pPW4CdOL9BbcHaK0gJTiXZQKy39a
	fLTgn9SJIb/WrlolHUtTzAtQ4OInIl/YfO3XIYvZZBwv2AnPnaCn/PLb1xMhXn+gltWg
	HxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=9/Fxzzuymzmro5Grq1lWuzKW+8PrID/10MX8b23OxFE=;
	b=A5iiusNEFW9OEW8eQcfu5f++CiyNf7htLNmIfYEv36gSR5i1mlYI1IMDEQ/VU/BSA0
	p780Ii5mfX8tnGDqUsS/CoS8srtFguxV7xnbx9n+IVt3ZhnTXVbP55JrVBHOKOxT29N6
	WFk/VHN3K/PcVwMZ2UrMf5VLBFE20DjSVbTVkK7JjVvxHG3/srHdCWxl76fCjUhwV3fH
	4EmlQHKUzQMJSaPSRbpM1yD9FTnhkz7mFnqkutKcDjknmJclgTLMtiNXRei3hgznJdEp
	iBS+OncHXxNH8UbZie6dnh+ZCAJHtV1/jRShq7iX1kjPLjAoJODnU0E1gVIRuNBQrnYO
	GZqw==
X-Gm-Message-State: AMke39kz4SXUYTVWAm7AkngolBxAJfYvrycK+p7+Fs7xWvQxvHaEH5V81lurjtN3csTIsLed
X-Received: by 10.36.33.72 with SMTP id e69mr468681ita.39.1488312572596;
	Tue, 28 Feb 2017 12:09:32 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D654.dip0.t-ipconnect.de. [93.232.214.84])
	by smtp.gmail.com with ESMTPSA id
	u206sm6009115itc.24.2017.02.28.12.09.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 12:09:31 -0800 (PST)
Message-ID: <1488312568.7785.73.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Tue, 28 Feb 2017 21:09:28 +0100
In-Reply-To: <1487625169-22282-1-git-send-email-anibal.limon@linux.intel.com>
References: <1487625169-22282-1-git-send-email-anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Tue, 28 Feb 2017 20:09:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-20 at 15:12 -0600, Aníbal Limón wrote:
> common.test_signatures: Test executed in BSP and DISTRO layers to review
>     doesn't comes with recipes that changes the signatures.

I have a question about the goal for this test: is it meant to detect
layers which incorrectly change the signatures of allarch recipes or
recipes which share the same tune flags with other machines?

Let's take MACHINE=edison as an example.

Modifying allarch creates a conflict with basically all other machines
in a distro. Example for something not allowed:
VOLATILE_BINDS_append_pn-volatile-binds_edison = " /var/volatile/foo /var/foo \n"

This can be detected by comparing against OE-core, but only when testing
with MACHINE=edison.

More difficult to detect is modifying recipes with the same tune flags,
which is the majority of the recipes. MACHINE=edison and
MACHINE=intel-core2-32 both compile for the same target architecture, so
something like this is incorrect:
do_install_append_pn-base-files_edison () {
    echo "Built for Edison" >>${D}${sysconfdir}/motd
}

This can only be detected when testing with both MACHINE=edison and
MACHINE=intel-core2-32 - at least I think MACHINE=qemux86 uses different
tune flags (haven't checked).

My point is, the test probably needs to be extended to run with a set of
machines, and that set of machines must be broad enough to cover a
variety of common tune flags.

The corresponding selftest, test_sstate_sametune_samesigs in
sstatetests.py, has the same limitation of its scope, i.e. doesn't
actually test with real machine definitions.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




