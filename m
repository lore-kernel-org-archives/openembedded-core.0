Received: from mail-ve0-f169.google.com ([209.85.128.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5NJG-00049d-JB
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 22:22:48 +0100
Received: by mail-ve0-f169.google.com with SMTP id 15so508054vea.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 13:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=6AMcY9b9Qv1paMIrtgeNTSoHa9xCdlCmNX6io97jTQE=;
	b=NeK8FBtsfMM9RFFuWbkLOA1KeuCEhGPBUrKs8MZ3PbD/FuOsgszUgvojX6VMCVnrwI
	e6IeGWfhj60g6V1s4EbmPh47+l58fFHg00nTEq67Jn8cxi9GnjeqgZ9VkOn2dFraGP6J
	yMhmUnAV1Pktt5LrSRYNqyCOzDnfMzNyyiGeG2Pij+7QTrZWtQnAvim/M2RY66XzQ0ce
	3rREznMu5zCCKHdUCaGTUBXA2WApT/9VukoEOUOuJtdWif0RmCdoiQ7/wd8o7RSVdi9A
	7h32GyjZHFHduh4kwT99ki7LV0YYwhVvX8KA/5f6PtKIj0wkid/qt3h6nKRMlYDOdcvL
	TVZA==
X-Received: by 10.52.23.18 with SMTP id i18mr22249092vdf.46.1360703198303;
	Tue, 12 Feb 2013 13:06:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Tue, 12 Feb 2013 13:06:18 -0800 (PST)
In-Reply-To: <CAMKF1srbNA_RLGC06zOC=Y4Av9ZGaL6G+Wk=u05-cCZtuRyMyA@mail.gmail.com>
References: <1360657337-7154-1-git-send-email-raj.khem@gmail.com>
	<C7C45274F728429FA76E2C1C47BACCDC@intel.com>
	<CAMKF1srbNA_RLGC06zOC=Y4Av9ZGaL6G+Wk=u05-cCZtuRyMyA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Feb 2013 21:06:18 +0000
Message-ID: <CAJTo0LZY8+eo6BHRfh-3536GK5VaEthrtMPYNGV3u03nBgsyJg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQkzM92jDlhwCxQnhEV+3ukuqDJ0UQQTN82Xnv9BXqJy1DjQWEj3rsHWfmI9dyDApooDKASl
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Add systemd package to PACKAGE var
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
X-List-Received-Date: Tue, 12 Feb 2013 21:22:51 -0000
X-List-Received-Date: Tue, 12 Feb 2013 21:22:51 -0000
Content-Type: text/plain; charset=UTF-8

On 12 February 2013 17:35, Khem Raj <raj.khem@gmail.com> wrote:
> Thinking about it from different perspective, I agree that probably
> adding an extra package is not right and having unitfiles as part of
> package proper is fine. but we should definitely have a check where if
> SYSTEMD_PACKAGES dont exist in PACKAGES then it should error out or
> warn about it.

Yes, throwing an error/warning does make sense, as the alternative
would be files mysteriously disappearing.  Can you send a patch for
that?

Ross


