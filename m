Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id EABC177E8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 18:43:37 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id m68so18544466ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=YycIaWr3tTPdR1jYczl5qws2qwN6L7lRl3w8j8WNVf8=;
	b=uRXOxPeT/JVgDnbVnALMBN6tgYQDWkrSmUxFRzh6qUwnbSLTuyKlcOV0qvVEhLERtv
	MCO7zC6vxK07YmuE1mjwN6GT5F+I2fa5FLSj3Jbtr02/pgHvdWdAmwV5TpGXyl0FZaMZ
	cnWMa7DkBj6yVS73n0civO9EO/bCSthqcptGiuHmbrSdWMnUAEPkjO2/nHmO17pj3PUH
	LOU/2/TbaI8ZGbzZwGnCkOksjIlOTlY94UxSFBR/CqiXcNqA4Y0gowcrcok+Uu2iFnMk
	WZEjaYmS3DiYdn6zzfW3/za5ldtmeTvwZL2ke643CyHRT+0Q754P/IxRSIuqX2wiPt+B
	gCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=YycIaWr3tTPdR1jYczl5qws2qwN6L7lRl3w8j8WNVf8=;
	b=ZmA9HNU8ASkR0uRqs8PLL7NWusd+3DRtqgvmJhmCOp5eyTdUw7sXDgqMSqp1mOTSws
	ls7KDRNwWNy3xTTGr7gcl1jxb2MgX4/QhAqbeYPagfRX2ST1ntO+8MHFm4b4WSt8sDPT
	c0xSSkCoarQF6xcFWct7ZQYd6yVK7luisq+Z7m4e/1fSpQ/RWLqFWBEPemEZNaveCPhF
	tundAGZWVur3EQcnoD1bMFwNzV0oGIlC8ho7wvRrnS+N4U6apFAQx6xMDmKjJbbZrmjH
	D+Kmz58io7H1q0utdbwefbzVPuKBJFkzn1HTYt+quWcstXe9Qm9OveJDZNMMDQAc3tWW
	rimA==
X-Gm-Message-State: AKS2vOxxLDT5WoAM8D2gpAo12FBZaOgJ7AAfFpsksf32mi1ewX/lj0md
	5r6u4Y6cLHidztl1
X-Received: by 10.36.1.205 with SMTP id 196mr3887311itk.33.1498589018721;
	Tue, 27 Jun 2017 11:43:38 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB9F.dip0.t-ipconnect.de. [93.232.251.159])
	by smtp.gmail.com with ESMTPSA id 128sm1950642ioe.6.2017.06.27.11.43.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 11:43:37 -0700 (PDT)
Message-ID: <1498589015.7464.60.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Tue, 27 Jun 2017 20:43:35 +0200
In-Reply-To: <20170627163020.22521-1-anibal.limon@linux.intel.com>
References: <20170627163020.22521-1-anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 1/2] oeqa/selftest/{context, case}: Handle KeyboardInterrupt/SIGINT and SIGTERM
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
X-List-Received-Date: Tue, 27 Jun 2017 18:43:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-27 at 11:30 -0500, Aníbal Limón wrote:
> In order to avoid corrupt local.conf and bblayers.conf adds
> signal handler for SIGTERM and use try/finally (KeyboardIntrrupt) block
> to restore previously backuped configuration.

Thanks for pointing out that SIGTERM isn't going through the "finally"
block - I thought it would, hence my previous question.

However, in this incarnation of your patch there's now cleanup code in
various places. Would it be perhaps cleaner to just raise a suitable
exception in the signal handler and leave all the cleanup code in the
"finally" block?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




