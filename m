Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id B0FBD700F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 18:09:28 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id g90so4019219wrd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 11:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xhujmT6Us/Fj+IWCX4vbk8m5uZA+1WNegWYS10hXXQM=;
	b=nVr3hq9/4UgxttEvQwusN0GyHJAjgJ2hELECSwSL3Qg2AbQAnbmIgJjBQOOl8/cHEP
	4Y0X6bSMM1XiWEDCPgVoYa4mSXjo57T2xrj4furmsAuDotbMvzFr7u2GFp1/BdBsfr4g
	bsGBmTQpPCln0TUFSlzA3HuRFm9ShmQJm3yFVPGq/7rbpdwr2/r2DSRY/gMoh9qXaH1s
	zZTti5QDRkWG3OS/T4cEM+zLQYsP5KNr16VCnGwqbYQuiDndUydCv1+ArGlHDzo4xP6q
	bApw96iXzB0RcaBe7vDebguKqS9qXu8l9MOfovNft9aNxWdhlFFhx9SPdG3/TOVkwLZT
	g4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xhujmT6Us/Fj+IWCX4vbk8m5uZA+1WNegWYS10hXXQM=;
	b=mrTCngYzSe5PFvlcYGX/KHJzVQpcHTTjtIobuzbBZtIQYjCNxwhXm90fZMpP9YFb6d
	kbhLYtLoAPxKegwp5Jbs/czhFX2hIJRNf4P+Av1qNG9VD+V8jDTrXY1ruVpVNvWxLdf7
	m/6WKpDS+sCm8iOjnsnJIREYYz36BXQvRdra0LCrwbtnfHXX9nmn7fZrhJ8Nge+agaMM
	czaPKilh00wMBUwcfHMjiKj4mxyWJnrqajkjZ+zmAbjmDXiFrRqSRBGIIzyH0BRKYT4/
	WLScTaZ2q1UIUjl4PVqi3ivFWn7V6Bo/eiEwqWE3nrbnmHxLXxvMwvr28r8f50hrDlk1
	ykPw==
X-Gm-Message-State: AMCzsaX1aoSDHM4ACN3rAFxvuuwIo+EI3fU/L3zBvdwgRna8dgmNh6zN
	juPo7kTX28N2ueIPGKu970s4AO2k07ZjcLXf6Tx+kA==
X-Google-Smtp-Source: ABhQp+RePPCnPCjLkY3vCmbbQMFSFH+3FlKXRM9LeAIq+/zkdPiLk3kZFvr4UJvqt2adhHNpeKqhoFPPk3Xu0L32HF0=
X-Received: by 10.223.186.140 with SMTP id p12mr5859875wrg.235.1509041369399; 
	Thu, 26 Oct 2017 11:09:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Thu, 26 Oct 2017 11:09:28 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF43876F@ALA-MBC.corp.ad.wrs.com>
References: <20171024232359.63328-1-jslater@windriver.com>
	<CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
	<52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
	<CAJ86T=UV_XVjq6SEvc_9-46b1W+N_v6aBjvJOEorov5NYpTLcQ@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF437C9D@ALA-MBC.corp.ad.wrs.com>
	<007BD92917A2324FA403BCF9A464CF84CF43876F@ALA-MBC.corp.ad.wrs.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 26 Oct 2017 11:09:28 -0700
Message-ID: <CAJ86T=XbzgBuJgs4s=8MphbTM4OLU5JqBA_pL7ABCkM49u80vA@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Thu, 26 Oct 2017 18:09:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 26, 2017 at 10:15 AM, Slater, Joseph
<joe.slater@windriver.com> wrote:
> Okay, I don't know why, but at the time of backfilling the CONSIDERED list is empty!  This is not true if I use "=" to set it unconditionally in arch-mips.inc, but it IS true if I try to set it via anything involving an override (including append).
>
> Isn't getVar() supposed to expand the variable?  Put print msg's in meta/lib/oe/utils.py to see this behavior.

features_backfill() is called from meta/classes/base.bbclass ->
base_eventhandler() in response to bb.event.ConfigParsed (ie "when the
base configuration; which consists of bitbake.conf, base.bbclass and
any global INHERIT statements; has been parsed") so anything assigned
to DISTRO_FEATURES_BACKFILL_CONSIDERED or
MACHINE_FEATURES_BACKFILL_CONSIDERED after that event won't be seen...

