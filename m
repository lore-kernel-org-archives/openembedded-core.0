Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SgYOR-0001dm-HO
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 11:37:07 +0200
Received: by eekd49 with SMTP id d49so1479406eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 02:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=RRgMGP45LINo+n4TPWBWneQnsAXZzUcr7cRePUWauF8=;
	b=MDdKeGn75SHUy59D37nxetQbaa16925hEMIXMAbK0qTdTfkij0RNG51GJTA3HvT7k8
	HK61a2xFr6wk0WX4blVOhnNWjul6V6GI19985lJyzCFpg4mohnHPTZaU9sp2ts0QT2nN
	I4hJTDmJUSaxgGGLmMAsy3gx7lFYxom6ChywtHFZxm04wfEZvvIF9zHpk6at2N6S9a9z
	yOK4mQSzc7buHKdjszut+a3CPHvRGdktun3pbGLERbh/ybLzb7xmHSbqkLx7wRO/u5yl
	nvLM9AF2+mvs0ezyOrMDlxTjZxtTokOQOXqnqQ8U2Nrvewty53qu3i2nePQQCuTzHIys
	ew0w==
Received: by 10.14.97.137 with SMTP id t9mr3455862eef.73.1340011585495;
	Mon, 18 Jun 2012 02:26:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c42sm59103175eeb.2.2012.06.18.02.26.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jun 2012 02:26:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7661818.rLLbVEY8n5@helios>
Date: Mon, 18 Jun 2012 11:26:22 +0200
Message-Id: <F8DD14C2-FF05-4503-8006-B6BCC3BE5A81@dominion.thruhere.net>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<2995235.0tdnUIKyVU@helios>
	<282073B0-0EB0-4DCA-9042-151F7003BC46@dominion.thruhere.net>
	<7661818.rLLbVEY8n5@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlSeoGzP7vZL9/g94eG2G7S68nmjpfXkQIkCLE5dzdumvinvUl8ngxnfiYQrV0qEptiaSd2
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
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
X-List-Received-Date: Mon, 18 Jun 2012 09:37:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 18 jun. 2012, om 09:58 heeft Paul Eggleton het volgende geschreven:

> On Monday 18 June 2012 07:00:19 Koen Kooi wrote:
>> it does force the distro bbappends onto everyone, messing up /etc/hostname
> 
> So it did. Now it's fixed.

Thanks! I'll add it to the angstrom layer stack later this week.


