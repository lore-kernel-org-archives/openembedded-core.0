Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3A59177B5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 19:03:26 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id 190so3304426itm.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Mg9C0FYkJ7FJRRY0OskzgmTJoJVpQq50mW18GYmzhXs=;
	b=t00gifYL+rCVEc+algr3OprvPI7x2N4P3bUCcpq1zlk/EEeHY18/B7vYxGMj2etMMN
	fjq2s6NgrNQmUxu8Vnho3bDoVZ40uQeHa9b09cNREIth2O4VeWkp5xUOXoEmxHpFUfDL
	+FO4XeZPzjM3G0roh33cTTA0RhvAGKLAdD/jYjaV5Dh77MoGSo4Ss6i9RWHUt60AH9UG
	sqc10FJ9yEWsaFVOrlT8zaYbF/OhmWnuUEn+lit4pq1GkY1zEywlv0uXVR1KlcFd8x/b
	PfmUgUKcBYbmUlfYqVv4gwgGuZS6XTCN6ew5RRZ4CasKWRRQfXy79CgP2cM0c+I6FYyo
	XGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Mg9C0FYkJ7FJRRY0OskzgmTJoJVpQq50mW18GYmzhXs=;
	b=oNFb0PoUtB/rWaAufW2vuEmUOREtJBSZJC20/vdtD3Y7Nw39p425AkHLUpERecNHhf
	frz97UQcIMBmECFWEGHACQ6o7iG9jkmQ4QPxdIgaFDLuHmhz1mP1dMrkjkYgfRh8f0eF
	+bSPtnSUN287IffMRrp+0kMc8UFWDsEi88+vl1xcHitHLTIGSBwvHEE6rbJraoTk+Sye
	+/oi6GjwZRFM0jWmsvrgQUzeVX2Lc70lA8mXsWicjo4lQjZdMRsJLUkPZnkDa9VqsoC5
	UdU1AbJrHEllVNTR9eTbBt4aSpVl//9+gWSr96/HyRQ5mPdmkf+tDBiq8mO23cN57kJt
	HnFQ==
X-Gm-Message-State: AFeK/H2MmMBijrwcTcg+WR5bM4YaoauiUY7BS5Oo81q//Elu+AWsmJPLo7OuQJ1kKXPu3Var
X-Received: by 10.36.211.67 with SMTP id n64mr14877139itg.13.1490295808249;
	Thu, 23 Mar 2017 12:03:28 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E879.dip0.t-ipconnect.de. [93.232.232.121])
	by smtp.gmail.com with ESMTPSA id
	s194sm2096200ita.12.2017.03.23.12.03.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 12:03:27 -0700 (PDT)
Message-ID: <1490295804.6396.252.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Daniel =?ISO-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>
Date: Thu, 23 Mar 2017 20:03:24 +0100
In-Reply-To: <1490293700-17717-1-git-send-email-daniel.diaz@linaro.org>
References: <1490293700-17717-1-git-send-email-daniel.diaz@linaro.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: resize only serial tty's in profile
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
X-List-Received-Date: Thu, 23 Mar 2017 19:03:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-23 at 12:28 -0600, Daniel Díaz wrote:
> Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>

Can you extend your commit message and add an explanation of why this
change is desirable?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




