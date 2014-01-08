Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6426C7E4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 16:13:16 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id e9so1456206qcy.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 08:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4kSYonL3e9Uh718t7vuAiC6/g9UoGDpfW1Kt30hN9XQ=;
	b=lHt90gjLH5qpZw7gcoqTgzq/eXBPLLuGP0sP4TmKYdYm/ejMrrGdmtzgurheoaMj45
	NX1N5unmBpaf1+dLuWB5xv054d0egy0Tq3EyWmUSIqSwHo5p6QfKifukotC7OdmUV0B7
	Qr957S5L0z6QZ+h1pFEmJH90UWLdINzjS7zLQGD2lmECAZsJlvYJre4S1cbG/q759d1L
	s1Ht81GHBiVZcj9dshoA7GeaiAd4f90etia8MwkJlazYsIaqC/9Leq3FKpnfgFvZxEUZ
	447XvZxNhsWCdNtN72BKNAwVqCsWBVTIUr8RW2EiptARQMDO7P1a5THIWBcnEbG67NFz
	aV6A==
X-Gm-Message-State: ALoCoQmSr5SdBUCGrPrBJF09xlDY6JsVtVcvhkRVcVG+mEpsuPQR1d49220g0a/1iwq6yYXK5Fni
X-Received: by 10.49.59.83 with SMTP id x19mr16587160qeq.47.1389197595764;
	Wed, 08 Jan 2014 08:13:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Wed, 8 Jan 2014 08:12:55 -0800 (PST)
In-Reply-To: <52CBFBB5.8030009@windriver.com>
References: <cover.1388769973.git.liezhi.yang@windriver.com>
	<5b836adb7023cf075f9eb2246c7b2bbe420fd1cf.1388769973.git.liezhi.yang@windriver.com>
	<CAJTo0LY2hTEcqZyqrDsoBGEbWYwovCSu7+gZdo4av+9=0w_J5g@mail.gmail.com>
	<52CBFBB5.8030009@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Jan 2014 16:12:55 +0000
Message-ID: <CAJTo0LaMobezC+B7eNbXc-2NLnS2fxLid=xNvE_7hzMR5ntQnQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gconf.bbclass: remove --disable-schemas-install
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
X-List-Received-Date: Wed, 08 Jan 2014 16:13:16 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2014 13:05, Robert Yang <liezhi.yang@windriver.com> wrote:
>> *Some* packages have migrated away from gconf to gsettings.  Not all
>> packages have done this, so anything still using gconf is now broken.
>> Note that almost nothing in oe-core uses gsettings as we're still
>> using the GTK+ 2 stack generally.
>
> Hi Ross, which recipe is failed, please ?

A better question would be what package did you get this warning from?

As I said, any recipe that did inherit gnome and still used GConf
would be affected by your change.

Ross

