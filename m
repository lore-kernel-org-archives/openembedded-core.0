Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3622A606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 07:46:31 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id c21so61872966ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 23:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=0bIXdk8JdkeSpe8dlMyQaOjcPeJ/9BbMgdRRMu5uOJc=;
	b=fNZj31v1v+r1FlRSwcqvpWhPaakPXQ9NVTGnRBj8jdvJmDGNO3z8unJb6zrJeOH4n3
	Sk9ZE5RvI5Bws5844EMHuU0SNj77LsGXnVywZBztwqaGd0AWqBV7fSYEeDleTqlg6Z1u
	ea1p5w5LSCnGkHhwES04yVmaQ3Tj5Dopd3H3YLGULhzpwwSIBWhoRivggbJERCTDub16
	X9mAE752rzQ9Fj01B8Pr5h20V7ceX59mDWHUS1iXYw48BvbIJRDlH74UF9XlVb7cxtbo
	3fUlf+tAi7w9QU8Llo41ZVoOBDPqDQR1o9hVhV2rLZOaS4eIiDQm1EghBDdGSgz9gkEA
	lyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=0bIXdk8JdkeSpe8dlMyQaOjcPeJ/9BbMgdRRMu5uOJc=;
	b=cF2bGxBa5wfZCJmJ1Sn63svGn456bKOniSHxmXQ7EmfI++mj/Yy52MA6JxfTBAIaCy
	UVL4ztRp4z5t0+2rx1Hysqu1LvyL2GZy4ptpp+5rgy1pEwKk0jKmhd8nI16ckr+gEpYx
	qLPjmc6wIDsyM5TwJ6Frt4PLM9Rqu5gErcpOcjn+DBu31bfCzISFujhw3vQqvVo1KQ8w
	xcVZMS50IE7Ix44CWA/Dap9IGYffMBn6gdWoWvV2rYMoSSOXffMoCiak+xoJA1YgKpO3
	EMecsAEIO+oiOPbiBJncg1RKMcVUjKOrxOOxt+BZi6TwBPqMySy147Z66I2PEBWE7tbj
	b90Q==
X-Gm-Message-State: AKaTC01Hl7pJPprEoNcrsldjLBRroQ7fzGB0MpwEv2nM54uid2lTy31zAGNHvEC8xlV8QNui
X-Received: by 10.36.194.70 with SMTP id i67mr875853itg.21.1479973592683;
	Wed, 23 Nov 2016 23:46:32 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D6D7.dip0.t-ipconnect.de. [93.232.214.215])
	by smtp.gmail.com with ESMTPSA id
	k198sm2323414itb.18.2016.11.23.23.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 23:46:31 -0800 (PST)
Message-ID: <1479973589.6873.15.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 24 Nov 2016 08:46:29 +0100
In-Reply-To: <27dbd493-5b76-657f-8a1d-57eabe9eebed@windriver.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<1479899811.31880.37.camel@intel.com>
	<adc8effe-1856-560a-a7fb-0d92138e1990@windriver.com>
	<1525289.rQK3S6YPkZ@peggleto-mobl.ger.corp.intel.com>
	<27dbd493-5b76-657f-8a1d-57eabe9eebed@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Thu, 24 Nov 2016 07:46:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-11-24 at 11:38 +0800, Robert Yang wrote:
> Currently, debug-tweaks is in EXTRA_IMAGE_FEATURES by default for poky, and
> there is no passwd, so that user can login easily without a passwd, I think
> that current status is more unsafe ?

Both well-known password and no password are unsafe. User "root" with
password "root" is not even "more" safe already now, because tools that
brute-force logins try that. Choosing something else would be a bit
safer for a short while until the tools add it to their dictionary.

Poky is also targeting a different audience than OE-core. Poky can
assume to be used in a secure environment, OE-core can't (because it
might be used for all kinds of devices).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




