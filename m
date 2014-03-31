Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id EEFC56BA1D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 10:14:55 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id m5so7803975qaj.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 03:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aMRyg6XA/xO4zcVarMPKnr/LoGKyYW0+aw+1sKIAiqM=;
	b=YqWnfRNOzohuTQa2zhTw/BT2wJYKRrzzdLctBrmFzMH7lwKymm1oSK3wWWKExWWaUC
	jRZJ7HKqbmQAaJKpykeaK3m04fhjltG8+QSIYIcabjfseVXiQA/PmxnDJV+sMbvxKSEq
	J8iOIslX1aEWi0MG1NbhGj4+tJ1zpLNXy2UQGnwoilNQTHQzfSWXKoiiE/QtkzjRsX32
	oydPnmqIDqFIAnRvqYyknbyX5a59adCJERun9JMOdQZLEwg6Y/9MtmX9YabivMwTlQI5
	XuhH139gUlqalRUBUGsf+m2tYS+Y3a7EdXIrVDPTMELaab8cUm7lZETTDg1QE7hJbEfp
	o8kw==
X-Gm-Message-State: ALoCoQkbml+Pb9MHnD74/U2gBUNbjhc4BnoMaD38QL/NX25SXvOtEE7P/4SEO6RB7ykrmiKb/728
X-Received: by 10.224.160.142 with SMTP id n14mr26876176qax.17.1396260896249; 
	Mon, 31 Mar 2014 03:14:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Mon, 31 Mar 2014 03:14:36 -0700 (PDT)
In-Reply-To: <1396123481-6064-1-git-send-email-otavio@ossystems.com.br>
References: <1396123481-6064-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Mar 2014 11:14:36 +0100
Message-ID: <CAJTo0LbBHoO-_M=C7rc8FPjfzeOQxM2PAXjXbenBXxCwGW2oGw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] packagegroup-core-tools-testapps: Move GLTOOLS to X11GLTOOLS
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
X-List-Received-Date: Mon, 31 Mar 2014 10:15:01 -0000
Content-Type: text/plain; charset=UTF-8

On 29 March 2014 20:04, Otavio Salvador <otavio@ossystems.com.br> wrote:
> piglit and mesa-demos are not buildable in x11-less distros so we must
> to add those only when opengl and x11 DISTRO_FEATURES are available.

I'm surprised that piglit needs libx11, waffle should be abstracting
that.  I'll have a quick look.

Ross

