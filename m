Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id ABB6F73180
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 07:45:55 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id r185so60504311ita.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jan 2017 23:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=PUAe3rfIHnBVy+F6sAFhcp4PIfNYx3lQ2Pm/dV/ZfAM=;
	b=zjQbUhdMkhQiFcbVyNsplEH7pzMtEXbJL4lTMfJRHw2krF+nCWCRd/QC3FEMjzm/Yn
	inyCOV+0nGqMbulWgUHO0sVbE9tkzLGQEnaJhNzheGvfvp6H2bIgGEOrAchBzCgPLHTx
	9+FlUD4RH+b8HT5K24d5cMx0wmGeSHPMXMCZxBE1sOfFtkhrjSKYozAuYo1qZoMA9wpG
	HbrYC/ceE+zPvJg3Wsws9Gv4ueHzxPZIVk4e0yLl58Pm3e+JgptYfS2ZyAAkdl6ruLE9
	GO7KZ6hUvN5UEn055FwVd2pxOrfr8dmtbfZQ+5tVmE6sKCT9HHG1LoGjh0ST0k09uuij
	fPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=PUAe3rfIHnBVy+F6sAFhcp4PIfNYx3lQ2Pm/dV/ZfAM=;
	b=nJ4jJT+wZn5x0ZG5MCL+mIOLhRPVq0umnxuEhjW9Lmp8urfy6U5og74Y/KEnDMNEco
	/NmJFUpAT0kymj4lViqCREaRX5fUDMoL+XMo4S13YSg6wtQiiZ8P53ULQoj9vQNcIAme
	Qyl74xRyefFrSrRSQdnQPeiANvMlREaGCfLIeH/ZySex/afdOCJGSyIEMrOhJ10W/7N3
	+oUN19ka6jw0sk3DnbTSLD7NiVYB8nHIixEqsUjP3j3GTOtS6JXR+q5bDo3ms647SU0x
	iosN+FLt5tN6P96lBRiGF5LxQn9y4ci7XlkPkFOgAEdLjm9z9zELe+eKlNtUzH3rBOpb
	jQsg==
X-Gm-Message-State: AIkVDXJIGn5ZAU/mDfaMcLKeIBzHlplkaYYx772AJXDx4CWxGIZEjbwnUN279py8rGY7ggGQ
X-Received: by 10.36.112.146 with SMTP id f140mr13313140itc.51.1485157555698; 
	Sun, 22 Jan 2017 23:45:55 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FC12.dip0.t-ipconnect.de. [93.232.252.18])
	by smtp.gmail.com with ESMTPSA id z13sm9201709ioz.3.2017.01.22.23.45.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Jan 2017 23:45:54 -0800 (PST)
Message-ID: <1485157551.20333.14.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Mon, 23 Jan 2017 08:45:51 +0100
In-Reply-To: <1485156197.41148.8.camel@ranerica-desktop>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
	<9d68428a1d2b7234a1a7ea6057e3b027e454db61.1484921498.git-series.patrick.ohly@intel.com>
	<1485156197.41148.8.camel@ranerica-desktop>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 05/12] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Mon, 23 Jan 2017 07:45:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2017-01-22 at 23:23 -0800, Ricardo Neri wrote:
> On Fri, 2017-01-20 at 15:12 +0100, Patrick Ohly wrote:
> > The traditional usage of ovmf via the qemu bios parameter is no longer
> > supported
> 
> I don't see dropping support for this option in this series.
>
>  Is part of
> another series? I just checked the poky repo and I still the the option
> supported. Or do you mean that only the ovmf recipe will not support
> exporting bios.bin?

Yes, the latter.

> > and therefore it is not necessary to create a "bios.bin"
> > file in the target sysroot.
> 
> Wouldn't this particular part of the patch break the existing runqemu.
> If this is the case, perhaps the last patch (or a patch towards the end
> of the series) can remove this functionality in both places.

Could be done, but personally I prefer to add something new before
taking away the old approach. This might not be applicable here (because
there is no other bios), but it still "feels" safer.

> On the other hand, this is a new recipe and this may not be super
> critical. Especially if you meant that only OVMF will not support
> installing bios.bin in sysroot. Maybe all is needed is some
> clarification in the commit message.

Care to suggest something? ;-) To me, "traditional usage of ovmf ... is
no longer supported" already says that this is a statement about ovmf,
not the bios parameter, so I'm not sure how to reword this.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




