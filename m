Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1DQE-0002gd-Cv
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 11:00:50 +0100
Received: from mail-qa0-f69.google.com ([209.85.216.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 01:44:52 -0800
Received: by mail-qa0-f69.google.com with SMTP id hy16so718356qab.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 01:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=G4rAU6+sgmPqPKRs5dYfpNVM5HUDVgCDKfFQGmYCUyQ=;
	b=QFbrmGM5Cabxlzd/Ga9FNSo3Nls0Dl+P/8RUeFB5l4JAF11Z9CEL15rFKKS6t9h5k/
	hkEIQrSmAX5yOCgRA9Hhajh0dZagyCWRmGCvuYBJmRLX+FG/VXu67FUIWRv1/AhOPIKg
	tU+G6vXSyr93+Bst3Lo5mYIwqNMjR9nF1nR1/AMs2n9crBbBbLqGdMpNmlR4MadUMnry
	qq9tgjIcZfWxF+o+XS4G2K/S4BoLUW70fzbyFRrMoaRukg9aWfCmapRswJsReZV0Zlis
	EzUfls3/zbQvrm5PKlD+meuOG142z0jiZewibcUgOxXJ4qel+5n60W2o87Kc9QWqtZz2
	DYNw==
X-Received: by 10.52.23.18 with SMTP id i18mr9430768vdf.46.1359711891890;
	Fri, 01 Feb 2013 01:44:51 -0800 (PST)
X-Received: by 10.52.23.18 with SMTP id i18mr9430764vdf.46.1359711891834; Fri,
	01 Feb 2013 01:44:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 01:44:31 -0800 (PST)
In-Reply-To: <1359710522-26839-1-git-send-email-radu.moisan@intel.com>
References: <1359710522-26839-1-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 09:44:31 +0000
Message-ID: <CAJTo0LZ3tvB6t13utWrzXhqE7mx58ypkFosUdtwj=XuMbPXRNw@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQksadXPtdcbYyuDOizkGr6P3DOfdQqmPCbAQp2Wm0F5O6YofbCsIEhERmhPZL6Fe0ae/NUb0AtrU6fbiNUxPL/HHV1478Sn3QN5mvZJVO0b30Y7NKvQxvQ41sE2ypRxxSrzYoQWpyRmNdlQZuvqRv5mwBTVEt2SPgRcm+dO+EXaMYMOVD0BvPhomp427Y3o6+qrOzed
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] polkit: Enable systemd support
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
X-List-Received-Date: Fri, 01 Feb 2013 10:00:59 -0000
Content-Type: text/plain; charset=UTF-8

On 1 February 2013 09:22, Radu Moisan <radu.moisan@intel.com> wrote:
> enable/disable support as relevant

Please write a more verbose comment, something along the lines of
"systemd is auto-detected unless disabled explicitly, potentially
contaminating sstate".

> +# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to DEPENDS

It's not picked up by shlibs because it's a dbus call not a library
call, and that's *RDEPENDS* not depends.

Ross


