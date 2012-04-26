Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SNXV7-0008PT-On
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 00:49:25 +0200
Received: by wgbdr1 with SMTP id dr1so87207wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 15:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=MLVlpSaUlev5O22XmPub/y4PeuZVDyDVov5U5bX15t8=;
	b=EJtWNA1kiZd/q8sNHlNlYqEfUXPT6T2jVev0HB1pTBX/HnkKjx/aucBr3vbDDtHGvc
	p/YT8Di4Tnq5Hs53sxwnIUNgB/B/6iF5HZigL5jjhoKQTObJrra/Kg7pVXTuUofrQTHr
	fAJ9FfXh5hDopigP3wrMKcYw2sYtSFLAp+HI7DHQ7PZWKSuBB/RQMBjdKG/dOXT0/rx/
	qKsAW7/eT37C1zbRbvVsOkd3j6lNjlSUXhdEqdD2hyPO5IZL8ooRVapCnvXVTORYQDzc
	h8qL2IsaLgRosOKSNdXL4nVwEyDyj5SpuLnXVJWawSlaY4D4e5g4N0GSR/ETZg0iUVoE
	Z26A==
Received: by 10.180.100.230 with SMTP id fb6mr163110wib.3.1335479988239;
	Thu, 26 Apr 2012 15:39:48 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fz9sm217221wib.3.2012.04.26.15.39.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 15:39:47 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1335478762-14532-1-git-send-email-obi@opendreambox.org>
Date: Fri, 27 Apr 2012 00:39:44 +0200
Message-Id: <FCF33DC9-ABF3-42B2-BC2B-CE01C66083D3@dominion.thruhere.net>
References: <1335478762-14532-1-git-send-email-obi@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQl7TKYT4AYphDDX0yXboCQftKNmKhnLo5+fhXLdlRUq9+F9vS+isB+70lpoxBZ1HkN96oQu
Subject: Re: [PATCH] opkg-collateral: import fixes from OE-Classic
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2012 22:49:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 27 apr. 2012, om 00:19 heeft Andreas Oberritter het volgende geschreven:

> * Set lists_dir to /var/lib/opkg
> 
>  commit 16808bc4817492beba512f4e73bce8c232d1eafa
>  Author: Marcin Juszkiewicz <hrw@openembedded.org>
>  Date:   Mon Mar 17 23:40:48 2008 +0000
> 
> * Update new options sample and move the opkg.conf to correct place
> 
>  commit cc9825d97962287df75e164aec456901292e1b7f
>  Author: Tick Chen <ticktock35@gmail.com>
>  Date:   Mon Dec 29 19:41:47 2008 +0800

is this still needed? Angstrom hasn't used it in 4 years or so.


