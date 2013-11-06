Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id B0F306D145
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 15:47:31 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id g10so3541639vbg.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2013 07:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=egiZVubHCDc7N6sNtv/+Ju//C0z5rKtPUA7UEQTTp9g=;
	b=JBDn0QjPQCH8nd74FaSsP4jitin3PaaosSFyWTAmcvkf5op3l8D77sa1fUQM5/YQNJ
	tWR6rVKnZ8DVqtGziT00KQYPPnKkaB1Oa6nn5PtZONYeabDay3M5jHJxXZEWpgswhQSe
	YOOm6WdXPHuqIl3xQh1hGina11ymXKQh6zkwZs2n1O+hy1NcLWBoUXAF9NFs0zC8PWAp
	vpBCpKM+beCRNtvVXV0C3vTT80Z0+TQlEo68h2XBGG8OE5DTAPu5Gt9xKuCa1aGH3e2v
	JNMlblwLkpRUYqtlQNbo/GIO/TO48rsZyxhq2rNRNDQXAgKZ4wOmdaMfxjf9qgfLJ19F
	H45w==
X-Gm-Message-State: ALoCoQnjQDTdsOVcUy1ceS2io+m8DUlRq2aSMT8MtbSVpRFgrU6B0XM2cM5lpDsPm2ZgZcv/oHPG
X-Received: by 10.52.165.131 with SMTP id yy3mr2449400vdb.25.1383752853057;
	Wed, 06 Nov 2013 07:47:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 6 Nov 2013 07:47:13 -0800 (PST)
In-Reply-To: <527A5666.6040208@pseudoterminal.org>
References: <527A5666.6040208@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Nov 2013 15:47:13 +0000
Message-ID: <CAJTo0LZ6LpU88=gnD_xYJzvzC+xg34vmSKFR2h3TS2daOXbfKw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Request for moving Orc to OE-core
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
X-List-Received-Date: Wed, 06 Nov 2013 15:47:32 -0000
Content-Type: text/plain; charset=UTF-8

On 6 November 2013 14:47, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> As preparation for upgrading the gstreamer1.0 recipes to 1.2 , I would
> propose to move Orc into OE-core.
> Without Orc, key elements of GStreamer (audioconvert, audioresample,
> videoconvert, videoscale ..) are much slower.
> Currently Orc is in meta-oe . Its recipe uses the most recent version
> (0.4.18), which is the minimum Orc version that works with GStreamer 1.2. If
> Orc is in oe-core, it can be added to the
> gstreamer1.0-plugins-base/good/bad/ugly recipes' default PACKAGECONFIG
> lists.

I agree with this, and have wanted to do this for a while now.

Ross

