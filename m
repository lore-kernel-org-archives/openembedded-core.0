Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id BDF06784F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 08:24:31 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id y9so16741778wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 00:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=RMHMkE279TxmKkM4HN4HNyVjbZ32uCqlJh1ZFcOI+4U=;
	b=IWPn+xT7EIrmGwsYym0JQwlcbTh1kaEyof2kF1IfuKRhcXqdwrbm5fhA/nubcAXH8o
	2Nx0zvBxtcJzfHrKBfH2NqddbC4qYEDaXJWvvlWR+PZPSHKJwxIJo57jMvu8dLHlgsE/
	ahLBDLYxerFt5xWmEFVw4OjY58HHXFbdlOwmXzH1gQOeL7hKfatJZ1v21segdFKr5RO8
	gIIiHqxdO2mP42jtUY88YwQb9mYunVXwbur6IbqZzvYRJ9NJcVKXSi+qtBLZCqwh98cy
	23CHSqeUFqKCy+TlXllomQuy43MeDZV6NO07NwYMhkBPanS/8eYFcFjn1JDvERumipJA
	++EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=RMHMkE279TxmKkM4HN4HNyVjbZ32uCqlJh1ZFcOI+4U=;
	b=HwVGncHsi3sFS0Y7WzxIhX3Ok6DL26cuTafSdNMMfJqqYsUvt4XTNALPeWicnLSU/5
	qJVhei4us980AvYaejXDwolRFJ9V3o+6Im5HBc3fROZpoio+VXxLVNWSmbHCvGTebpt4
	kE0ace77hZigg+IVM+4NXiZvf8P57U/zZ3f5f2SeEKxGs1mbTAU7GtFzTwpud0pOZ2mo
	v6uDzSRrFvAyN8n7mxA37Q/LmnvK4dJ2FEf1ZesGnaoAfszmfJT87ni4Nv/JxtYS8QyS
	gFUmMtohYoRrcuaa2+LdeT/5bEyxMSPk3J1zKYUCKfJ83177kV1SJQYwjjy4Y0Y0l2CG
	CXnQ==
X-Gm-Message-State: AJaThX740wzKdjEtiXgTkrjEJkws9+YIJor/dLBzDvdKt4xrFfHMg+qp
	nB4deaLA1U72EVHtmAC2RGBu
X-Google-Smtp-Source: AGs4zMZ86Rm6WfOXX7V+oqes3FQd1xQNh8WuKjpAKYmfK4IVSorFgOpnEEHWa8KNG0cKcFPtQ5qKyQ==
X-Received: by 10.223.176.176 with SMTP id i45mr10054370wra.240.1510647872457; 
	Tue, 14 Nov 2017 00:24:32 -0800 (PST)
Received: from pohly-mobl1 (p54BD5874.dip0.t-ipconnect.de. [84.189.88.116])
	by smtp.gmail.com with ESMTPSA id
	p28sm22964574wmf.2.2017.11.14.00.24.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Nov 2017 00:24:31 -0800 (PST)
Message-ID: <1510647870.5979.4.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 09:24:30 +0100
In-Reply-To: <20171113181721.79781-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20171113181721.79781-1-leonardo.sandoval.gonzalez@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/2] scripts/oe-selftest: oe-selftest-internal wrapper scripts that isolates execution
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
X-List-Received-Date: Tue, 14 Nov 2017 08:24:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-11-13 at 10:17 -0800,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> The main idea is to isolate the oe-selftest execution so neither the
> current build dir nor the configuration data is touch/polluted. This
> approach uses a wrapper script (which is the one presented on this
> commit) which creates a unique directory and inside it copies all
> scripts and metadata, re-initializes the enviroment (re-sources oe-
> init-build-env) and finally launches the oe-selftest-internal (which
> used to be oe-selftest) command, passing command arguments to the
> latter.

This mode of operation may or may not be desirable. Can it be made
optional?

In refkit CI testing, several selftests run tests on build artifacts
(primarily the images) produced during the previous build and only
build them if needed, i.e. they run "bitbake some-image" and that is
usually fast because the image already exists. Reusing sstate and
download dir also is important for speed.

Forcing all tests to run in a clean environment would make the overall
CI run slower.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



