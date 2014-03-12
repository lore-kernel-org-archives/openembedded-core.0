Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3396F799
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:14:10 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id w7so11287412qcr.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 08:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=u4ZpkseWLRtrJXhktcA3aCBUqDezX8JX3rc913qKJ6I=;
	b=gviHQtEpGH1ELzFGvNiwRm5Uqa0MxnQiP67ADCHkndkHoW0zaMs+WzMIc6BeMTD9pJ
	Dr6qUq28l4Sh5O3KQqeWnDwaLlLLcK6WDFEcewSB6GCUn/tTOL0p235nb6HXcZmIzqk3
	o1tymexkNXDzU+qfe2TtQmZP82XNbKaB/ppQPwVlkb8fkN/MwfIhVRCD4CE5qoenohhT
	6BmgWd5SWO4CCpYHLN7z+WTGdf5VsMWR1DY+VCueAEczzXhKAHX6Ish5+jOOp2idqoHQ
	8V/DBl3SAhR1Ov0PzgDriHliGQaTJannsoEFR4Xrd2eQSzCZerJyiLyNbnybZ6PppWln
	CwHA==
X-Gm-Message-State: ALoCoQlDKtMUjtbmPGXIjtTgnE2wIOuIDA5JAxgtj9leZd/VckW/AcUBHJAnloxNAXXwtv1uwwEP
X-Received: by 10.140.98.203 with SMTP id o69mr2800921qge.102.1394637251073;
	Wed, 12 Mar 2014 08:14:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 12 Mar 2014 08:13:50 -0700 (PDT)
In-Reply-To: <1394627248-13097-2-git-send-email-alexandrux.palalau@linux.intel.com>
References: <1394627248-13097-1-git-send-email-alexandrux.palalau@linux.intel.com>
	<1394627248-13097-2-git-send-email-alexandrux.palalau@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 15:13:50 +0000
Message-ID: <CAJTo0LYRtxcNtE-kGUA-gM7Fz6B95-Pq19Vc7LgbRxWpqohZOQ@mail.gmail.com>
To: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] gnome-desktop: removed gconf inheritance
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
X-List-Received-Date: Wed, 12 Mar 2014 15:14:10 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2014 12:27, Alexandru Palalau
<alexandrux.palalau@linux.intel.com> wrote:
> +inherit gnomebase mime gtk-icon-cache

Just gnomebase, there are no MIME types or shared icons installed in
this recipe.

Ross

