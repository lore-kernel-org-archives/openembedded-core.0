Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE4C722DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 17:28:09 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id z20so5946624igj.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 09:28:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=BAKccU5XN+fkliQLrjFYNgXu4pMEE/ngkkqetqMkK9A=;
	b=Hn0eJZb6rnlVP9Iemyye9KkLxxdWGuFTfcNmH9eFVvEi02OoR0XQiV+/dgHrlqcgj1
	JYrrCFXvcxKAxy7OAvuRANKz7HgIlCBeSwdfaUmXWZvSjOHxhL4fhQCdGtqWFgRFL74A
	pHm2lBs4AH6i0irzzBTS/DzPoym3ZajAsUo477//fC+Oj60s1oCNaDHT6IDqA/wtu5kS
	PkWkHqTt3/JVeYhHty2N/9aHRlxvPJqb+qSDyM6vgHyG2fA/c8aNSGw9DNgr/7o4e4Un
	EY0rJ+UivOkHWSjUGmEeUPmyPBkDce8tbT2335jF42m6WM+8hcGS0Mcd5ShV/KAQoc5P
	X+sQ==
X-Gm-Message-State: ALoCoQlQi9VxRG6hvR8Pa7Mh0Ft5EiBARbKptjwZhBoaXCBYwZNV+/VzkikiLI3CjctCr78Pbryp
X-Received: by 10.107.26.193 with SMTP id a184mr25917399ioa.80.1417195690520; 
	Fri, 28 Nov 2014 09:28:10 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id n17sm8980723igi.2.2014.11.28.09.28.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Nov 2014 09:28:09 -0800 (PST)
Message-ID: <5478B0A0.80609@linaro.org>
Date: Fri, 28 Nov 2014 12:28:00 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Fri, 28 Nov 2014 17:28:11 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Paul,

These tools are really nice! Some thoughts/comments:

Maybe the "devtool.conf" that gets created could be placed in the
"conf/" subdirectory (along with the other configuration files such as
local.conf and bblayers.conf)?

Perhaps any recipe you're working on could be automatically included via
an IMAGE_INSTALL_append in conf/local.conf (or maybe that's too intrusive?)?

Do you envision users creating multiple workspaces? I'm wondering why
"devtool create-workspace" is required. Is there any advantage to
requiring users to create the workspace explicitly instead of just
having it be created implicitly?

Some of the commands to "devtool" include things like
    - extract
    - build
    - deploy
    - undeploy
but when a workspace is created, devtool (very intelligently) adds the
workspace to the set of BBLAYERS. So one could then just use bitbake to
build the recipe. Are there any advantages to using "devtool build
<recipe>" instead of "bitbake <recipe>"?

Best regards,
    Trevor

