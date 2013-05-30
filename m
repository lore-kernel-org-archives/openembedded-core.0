Return-Path: <ross.burton@intel.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id D16EC6065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 08:32:57 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id g10so10217748pdj.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 01:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=vGL9sDtcc7DdhqP2AePj00DKBSky/M/tr4gKqYMKGmY=;
	b=Bj0uzJVTxIe+0Yhp1PXb3riGmtF0ZThzPwI84Md8Etooqj0Q5U4FdnSIpZ+g+M1ziX
	xkEY/YBHtjDSwoQrmwhS6GKMmrnSX5U1JdRs5iHw6ADfiw7GprdTRU4h0cUWZZWkkPjq
	dMUCdzZ8wHJ/6K634OforW39HRMI6YZBVtHMzPVkcSBZQZp4sKhRwq9nsa2qfSnHuZu8
	IlHyHANmguAuF58OrlxBDxn13uMRcuXLzSDZz/leHhvWDF2D77B6/iFzbrwQsM9/7DdM
	QCBoMr870vfQkh48ZwEZNgT9rcfncp0+dRAxcfwm4D2b6FvPyJOvIjn7nrSrC8+QHawr
	zD3w==
X-Received: by 10.66.26.52 with SMTP id i20mr7191796pag.209.1369902778770;
	Thu, 30 May 2013 01:32:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Thu, 30 May 2013 01:32:38 -0700 (PDT)
In-Reply-To: <CA+chaQeCTAq3dtUao2+oAmETHe5s7gkTjtd86fS2NBcyR=bmdQ@mail.gmail.com>
References: <1369899843-3318-1-git-send-email-eric@eukrea.com>
	<CA+chaQeCTAq3dtUao2+oAmETHe5s7gkTjtd86fS2NBcyR=bmdQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 May 2013 09:32:38 +0100
Message-ID: <CAJTo0LYDRHqO2kveMW4ftq3g4BNjLE_sJJ6mej2cNbaC3TKh6g@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQmwvUFXmJEgGdmtTUNRZB+El2RyxB0VwhOP9dRWcwCqd2q6KfVWRFMaaeh12xRMezGAbps0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] hicolor-icon-theme: keep inherited dependencies
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
X-List-Received-Date: Thu, 30 May 2013 08:32:59 -0000
Content-Type: text/plain; charset=UTF-8

On 30 May 2013 09:09, Martin Jansa <martin.jansa@gmail.com> wrote:
> Doesn't it depend now on something which isn't allarch? IIRC gnome.bbclass
> brings gconf.

gnome.bbclass is an abomination and should be gutted.  Yes, this will
mean the build dependencies are massive, and I can't see why this
recipe needs gnome.bbclass.  Then again it doesn't need gtk-icon-cache
either as it doesn't actually have any icons in.  I'd be interested in
seeing a buildhistory-diff between the current recipe and one with
both inherit gnome and DEPENDS="" removed.

Ross

