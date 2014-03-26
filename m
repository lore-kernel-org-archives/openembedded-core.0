Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4A02E6EC83
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 16:52:04 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id w7so2865112qcr.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=H2SQX+VgFNyL5/UTFMWF8/3ZKVgckjOmgkthTe2VQ9g=;
	b=doo7iohmpEa7Pfus4guiszhzN9+7bT+Jyng/C/5xA3yAtdywhPda6zJ2NadLKtStwi
	pjbRIGDyF2dbErzWhS2YXa79X0krQBcQ5IsNKxtgO67tvHpW2FMfYBFK6oyAVgdJuyuu
	oKclJ2FSgUTFbeCCosUfW8yV4si6EgbM0/UuEzOvgjo7jLfBJezxeVhX7h2nUFaaKoX6
	nTPSpnbxPdZv3ILe1/uhTQ1vcBD95veH6KXM4k+hs2P95WeOOUs1aQ2T1kIsS65vU0Xw
	9E4DkjMK7j9QdSurcKhO+dzY9jr3+qtZ7dAnXXAaVsoIXOUVqMCvzKPVhcfOp/FU614p
	hhxw==
X-Gm-Message-State: ALoCoQkE3yZf13Drwn7lw8db5+mdYd1CgWwW2FKUmG7irtELjhxI5ggozKorX2R3u5sYOdjEqJUD
X-Received: by 10.224.160.142 with SMTP id n14mr92590662qax.17.1395852724934; 
	Wed, 26 Mar 2014 09:52:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 26 Mar 2014 09:51:44 -0700 (PDT)
In-Reply-To: <CAP9ODKo+iWPY0Mb9ptxmhVBXCO5czW=dMC9839DaTU=fU3cDsA@mail.gmail.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<20140326145102.GB3709@jama>
	<CABcZAN=qBmEp4nzWwKc0=3_sb_oPk1mUWqP-M3Y8tQ6xRZJB0w@mail.gmail.com>
	<CAP9ODKo+iWPY0Mb9ptxmhVBXCO5czW=dMC9839DaTU=fU3cDsA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Mar 2014 16:51:44 +0000
Message-ID: <CAJTo0Ladg4Un7KnOnApc5wS1r4P=R7oN=PNcksyOen2AqhbezA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Chris Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] Change all bluez4 references to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 16:52:08 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2014 16:33, Otavio Salvador <otavio@ossystems.com.br> wrote:
> I don't know if someone is tracking the packages which uses the D-Bus
> API of BlueZ to be check if there are available patches for it.

So the big problem is PulseAudio.  It finally supports Bluez5 with the
latest release but migrating to Bluez5 right now means a regression in
bluetooth headset support, IIRC.

Ross

