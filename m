Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SXS3k-0006Ea-8y
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 09:02:08 +0200
Received: by eekd49 with SMTP id d49so2770118eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 23:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=19+FJWFk0KWtUzGUHjbxNbFEEV7bP0DLatZZdaAB4Sk=;
	b=azX/WwFmb+ouUJYvAV/vax41kWMGKUnNknlMos5NfcRaMom1lW1eSS/iBVYxUxr0IH
	eFH/X9JEI4h2149TKfwbMkURA6Nzjz08B6N/6asKFN+qCGN+f2n3TkoifNkpwh+iApq0
	+4u39g2QPO8NzrCK9b5TKPF2jLXv7XJ+B8l4DDQemlg+gaAoCmPg/B8ADJ9Jh50FkmTA
	zlvccQcK80h1L7XQTz45AN1Sj/vKF+QgCONwydnUb+7PM26ezpFw21xy6cMyHVgFh4IB
	+n1S7yl9ChKihU1oS+4mw3dTC7ruzza5v4gAiNI5vJflA2t6bdG9jbAJ2pj7c/LTO/ae
	RoJA==
Received: by 10.213.108.146 with SMTP id f18mr2017399ebp.60.1337842317397;
	Wed, 23 May 2012 23:51:57 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z47sm134632730een.5.2012.05.23.23.51.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 23:51:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FBDB2F2.7080303@linux.intel.com>
Date: Thu, 24 May 2012 08:51:52 +0200
Message-Id: <1292CD95-3C8D-4D0C-BE7C-2DD99199F6B7@dominion.thruhere.net>
References: <4FBDB2A1.7010509@linux.intel.com>
	<4FBDB2F2.7080303@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmPkxiuuzNc6RiJBAaY9n+nz+8eCKFtXBcR4QKsMNWNaoVDvjK1p9cKQ+JXtML/PYlnuwBP
Subject: Re: Buildhistory diff for package reordering
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
X-List-Received-Date: Thu, 24 May 2012 07:02:08 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit


Op 24 mei 2012, om 06:02 heeft Saul Wold het volgende geschreven:

> On 05/23/2012 09:01 PM, Saul Wold wrote:
>> 
>> This buildhistory also included the change from xserver-kdrive to
>> xorg-xserver.
>> 
>> This was from 2 back to back builds without reordering and then with.
>> 
>> Comments?
>> 
> Helps if I actually attach the file!

At least gcrypt broke:

-gst_plugins_good_souphttpsrc -> libgcrypt11;
+gst_plugins_good_souphttpsrc -> libgcrypt;

-gst_plugins_good_souphttpsrc -> libgpg_error0;
+gst_plugins_good_souphttpsrc -> libgpg_error;

Have you tried running Pauls scripts to generate a more automated summary?


