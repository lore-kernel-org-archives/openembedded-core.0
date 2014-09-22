Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 95BB871493
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 12:22:31 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id w7so6055697qcr.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 05:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9gDjSN4ShVpA7n5TmWHrbGzMUjRdqf/7pIf226eHnl8=;
	b=F1YtlCuVXZv7h8h2fdVuFuUigCuDWWWoKUViZns+4ud7Sr9z1jL2ofYDRCeGwJHw9s
	7RXlX6oOhZWedKYaJEBJZCkd4vOYeqmNbFckV9pn+M3rW08rvn0Q7oxYgXWz/jXwEy/9
	mfb4LOhmspgGnt8yk3B0gqON7fKtM+qMje+Say4bCPLU4cLCLy4+ov6XNeugBDoTyOLL
	c/C542G4r7oECFjCDEbTNh+NxyJB+oQcvDT3YpnjjCOq1cUUGspeviPVAVZZ78dB+i/9
	/wet9s2Noqusqn6Lb3NdmYBOJeW2YNqA4CWz/akvg9rFDSG9C+AAXLZ5yK8JOl6R8IFi
	qbEA==
X-Gm-Message-State: ALoCoQmZKklqHGl+67qdyd9YJvLDdIIRgmk86sv/corwI4qyeilb5rTe1LDVW9fzicc0xWs9MW5s
X-Received: by 10.140.27.139 with SMTP id 11mr20460978qgx.59.1411388552794;
	Mon, 22 Sep 2014 05:22:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Mon, 22 Sep 2014 05:22:12 -0700 (PDT)
In-Reply-To: <20140922120004.GD32340@gmail.com>
References: <1411109378-27850-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LYdghqD+V_0QDCV-dgsEtrU4vSPZjG60Da+BCogkwZ+gQ@mail.gmail.com>
	<541F6BE5.9000002@windriver.com> <20140922120004.GD32340@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Sep 2014 13:22:12 +0100
Message-ID: <CAJTo0LZy_eOe2TS9N99E9cB9VfjY7WDxVsVeqk99F3xcsHZtuQ@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gnupg: add pinentry RDEPENDS
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
X-List-Received-Date: Mon, 22 Sep 2014 12:22:33 -0000
Content-Type: text/plain; charset=UTF-8

On 22 September 2014 13:00, Paul Barker <paul@paulbarker.me.uk> wrote:
>> You also need the Pinentry package for most function of GnuPG; however
>> it is not a build requirement.  Pinentry is available at
>> ftp://ftp.gnupg.org/gcrypt/pinentry/ .
>>
>
> There are some uses of gnupg which never need pinentry. For example, managing
> the set of trusted keys for verifying package and feed signatures with opkg. I'd
> prefer pinentry to be in RRECOMMENDS so that I can add it to
> BAD_RECOMMENDATIONS and thereby disable it when I know it isn't needed.

Agreed.

Ross

