Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id D6C616CE9C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 14:30:14 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t61so8456913wes.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2013 07:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IHBFC2k8qQni+P1NPz7pOAIEgatVKDl459AyPIPBApc=;
	b=gdf3v810hPquw5cEe5cBnml2T97pfDggyCF9kEL569D/uzmpazWSAyOcNskOTmkvPS
	cvvIsYaU59SvuERGoaFPW3oz5K1qRpRnKykOmYOAklJjHbydSbi3Hw3MtJPAxOXcL+5h
	eWKTVHL6CeH+y83PkADCgixqbFw0nW1tJ/r6PyDNgG+qnwKoGBwrpGMFycaJd9bYI8Lq
	6WEw0FnW+jk+rX9RM4stL+3kNOFC42HXDdxGN2RFzL+JgQBQCdkg78cD6lBU7ItYnYLo
	zpPpdi2GSu6kTY/jqDRiSdw5GFIoXpjhGxted8OsPAtLn+uj/RtrgFviiA4rihdLuEYQ
	472Q==
X-Gm-Message-State: ALoCoQki1z/wk09BqoFVBga2TCeF46JAOuVANwyMMajqKK1Gd2qf5EJn/qKfgZPzL2AyURTnu/zW
X-Received: by 10.180.183.108 with SMTP id el12mr23751050wic.55.1381242615579; 
	Tue, 08 Oct 2013 07:30:15 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id gp9sm5678976wib.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Oct 2013 07:30:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2013 15:30:04 +0100
Message-Id: <1381242605-13393-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [RFC][PATCH] insane: configure option checking
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
X-List-Received-Date: Tue, 08 Oct 2013 14:30:16 -0000

Hi,

This is v2 of my unrecognised-configure-options sanity test, that checks for
warnings at the end of configure logs and will emit a warning if there are
unrecognised options.  Useful to detect typos or options that have been
removed/renamed.

V2 differs from V1 in that the whitelist can be extended, and defaults to the
options commonly used in oe-core classes.

As an example of extending it, xorg-proto-common.inc in my branch has this:

+UNKNOWN_CONFIGURE_WHITELIST += "--without-fop --without-xmlto"

I've also done a full build of core-image-sato with this test enabled, this was
the output earlier today: http://pastebin.com/7LCZF55Z.  Between some local
whitelist patches and the patches I just sent, that list has almost halved in
size.

Any thoughts, or does this look good to go?

Ross

