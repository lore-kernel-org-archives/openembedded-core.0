Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 58CE8607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 07:26:55 +0000 (UTC)
Received: by oiax193 with SMTP id x193so25708160oia.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 00:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YcUJIn1MTAjpBWRR9G7L2A5WtcYQVrDe7WMhGtmY+Jk=;
	b=my8BHFkoTmtB+uEMB+/9hKtJ8roGAPrisFubZRK5TVnGyFMD06AdtMhsdsKrtEhY8b
	WIlVQR5UdpNKDqNuuVarJSdXeCVaZ5zIxtkDHX6KALupM9aJhHMmrVrmkBlLPtPN/Qk7
	ercRpCimWDWyoKCvE5nZ9UKcw7YfK3IZx+XBDoEy0iMZGmEcjmzUK8W4XYrx8pObDWfs
	h2fu/S5H7Fn7uXYDew1RzD9c15oN8lySkon/6TPSroRtHzjY/6siORedML0cx+RJVQtX
	i7b3+62bg1nZSq6xeX80zDPi0xc3visVqWaERbxoKQZ+uqBu/UXEsF+Q0XMUuQgfUEKh
	M4xw==
X-Gm-Message-State: ALoCoQm+0y4qB9hOnbQB7QjeV/nzSYl3qtiCEvuHaR8WrrNgE/zVZS+LzLHvB0pw+0iTJn2eCvnS
X-Received: by 10.202.108.142 with SMTP id h136mr22664653oic.5.1435735615543; 
	Wed, 01 Jul 2015 00:26:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Wed, 1 Jul 2015 00:26:26 -0700 (PDT)
In-Reply-To: <CAJTo0LZLWUA34KpL683ZSuu4Rb861YotwJUGWaVU9_4c+eCuLw@mail.gmail.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
	<9445f8200ebe59ee467ee0af8763fbc886f579d7.1434464336.git.jussi.kukkonen@intel.com>
	<CAJTo0LZLWUA34KpL683ZSuu4Rb861YotwJUGWaVU9_4c+eCuLw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 1 Jul 2015 10:26:26 +0300
Message-ID: <CAHiDW_GR2_2X+que3GHq=d1BOfmgG9ha+5NeUD28zKptg1jcCg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/6] gtk+3: Upgrade to 3.16.3
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
X-List-Received-Date: Wed, 01 Jul 2015 07:27:02 -0000
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 18:55, Burton, Ross <ross.burton@intel.com> wrote:
> On 16 June 2015 at 15:22, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> * Package new binaries gtk3-icon-browser and gtk-encode-symbolic-svg
>
> Should encode-symbolic-svg be in the -dev package?

That does sound better.

Thanks,
  Jussi

