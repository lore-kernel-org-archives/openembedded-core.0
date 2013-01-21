Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxCg3-00033r-PN
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 09:24:24 +0100
Received: from mail-vb0-f72.google.com ([209.85.212.72])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 00:08:54 -0800
Received: by mail-vb0-f72.google.com with SMTP id ft2so8853277vbb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 00:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=AdRBYRI0LxMgZgkc+8RBLUjKo5ggDPIkd0QIWpIsYt8=;
	b=eZ/b0ktPu3qUDsAz/FCih6StCPKVa+IYSrhxncsuXvyMv10EJjAAS4wgGQrpifPrLD
	x7bub8vYRjA85YY7fw2962BiSdZNJYl4GDu4AhVxjmf72BibR+8+j5NEAZE2tkMcIBJv
	2j+hlBL3fqudDwXqrz1ktHvG2SM2mrYAjq7OtEXDOAbEkJ001p2sVXX/zx+fKlc26D6k
	3buclI7azVnI492WT1dO34D18mIw7YwwcD63bP0aDCEKpupuWt1LgBTfPa/xxJrkQ8At
	TMn6xBs7i+WI07b1TA2025Jav615Fk0XgsYKI+Km/CInvi141ls2fEWULecD6xoo7pps
	NZ/w==
X-Received: by 10.52.66.71 with SMTP id d7mr16187613vdt.121.1358755733318;
	Mon, 21 Jan 2013 00:08:53 -0800 (PST)
X-Received: by 10.52.66.71 with SMTP id d7mr16187611vdt.121.1358755733206;
	Mon, 21 Jan 2013 00:08:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Mon, 21 Jan 2013 00:08:32 -0800 (PST)
In-Reply-To: <50FCBCB7.8060201@linux.intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FC3899.5000202@linux.intel.com>
	<50FCBCB7.8060201@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jan 2013 08:08:32 +0000
Message-ID: <CAJTo0LYU0-1EEZfE8LdTDSmGmgprHbmZ-g00O-8+Qv1MmcaQTg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQlsBTPQY3TrtH8RJEOoTT/iZFS67ub/R/AD7hAkmgxhYU9TUFGpTpH9M7cEGc+14bezfGYqum1bgmUnCC4TXLKJij94Yzvw47I+n5xKDKKophFxdSbOwPJjr2Gbe1haYiuynCRCXGDuipHAKgwwrNdmqFTY/+d+RqD9qAnFXX1Zc0vlTLXNysUBT9Km/YNsO88zeNrN
Subject: Re: [PATCH 00/10] Initial systemd integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 08:24:26 -0000
Content-Type: text/plain; charset=UTF-8

The autobuilder hit this last night:

ERROR: Multiple .bb files are due to be built which each provide udev
(/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-core/udev/udev_182.bb
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-core/systemd/systemd_196.bb).

Which I realised would happen not long after hitting send.   I'll sort this too.

Ross


