Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2446D000
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 12:12:38 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hu8so3199481vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 04:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9IG3j2q565sQmYoygwnLr7hActV2B2vBF+quO6d3v0U=;
	b=bmOKuiM+Wo4neK0pRIPMLYsAnYZvj0qsGybpSma6mWY/moEQDy+d2VTuFXi/+efImg
	/1fPANthwbq7XQ16MmrbEsvODKIn3iDkavOIxBe6SMfo1tfMXhOMhb7UL8/4Qnfrl4a3
	8bNbtyuq+O64BG4JPJ2CRfZGtZt4lnT5OQKdtZ2b2reztgDXco78bbNWVJAczDc4b1Da
	43K6XaoUl4cmop4G7voPXw9wdXlW/1Ug/tLdbYJ6gKEQu4PvHuidvH4xDhNLKksOgY8Y
	SVYe6QBlc6y+SlD6GrqxrKwv3FSc2Kb4H9Rs2Y7+zzbyIZv0+aZ2FpIkpPjoFjoSTDBd
	4hXg==
X-Gm-Message-State: ALoCoQkDjAE/KrLPIei/xsdkfVXoWPlDVyoTRAWFuNOGnQlZoG2WX+pLIeSP9WMRqFstD+G9We+W
X-Received: by 10.52.118.73 with SMTP id kk9mr20039764vdb.13.1384171960022;
	Mon, 11 Nov 2013 04:12:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 11 Nov 2013 04:12:19 -0800 (PST)
In-Reply-To: <52804662.1090605@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<74d67107ced2e10a00bc2ff9b84d42a7376fabae.1383974819.git.Qi.Chen@windriver.com>
	<1384038034.3798.46.camel@x121e.pbcl.net>
	<52804662.1090605@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Nov 2013 12:12:19 +0000
Message-ID: <CAJTo0LZ3UVtckp+FV+_GC6y48L3XrU33W-xVTkH5AE9_E+Agcg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] initscripts: add setup-commands.sh
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
X-List-Received-Date: Mon, 11 Nov 2013 12:12:39 -0000
Content-Type: text/plain; charset=UTF-8

On 11 November 2013 02:52, ChenQi <Qi.Chen@windriver.com> wrote:
> The problem here is that the init scripts under /etc/rcS.d/ need to execute
> commands like awk, dirname, and readlink which are from /usr.

Yes.  So why do you really need to support split /usr, and why isn't
an initramfs a suitable alternative?  People seem to insist that split
/usr is trivial but these patches are clearly showing it's not.

Ross

