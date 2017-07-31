Return-Path: <patrick.ohly@intel.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8EFBA7844C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 20:32:53 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id z129so85844590pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 13:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=QLe3AuVwIuKoO1HPCRvZHyhHAZYSf5+gtDCsfJ/QInM=;
	b=H6UAw86Mb0Oh7y4AI3L//4u99JoDxI3ryHQEKAiKmK3RglOsr432RQC0Pk77AuEs2t
	nlWVO6gp1szPGydNwrSSYYY+Oq96Zzer36qBMmJPj508ufkWXZVEYRtXWIht0EMWYDOh
	243Mgb5g5+1kD7uMnf6Aw6ZfMgrsFtLbItG0KylqyruiYlggLh8V50OlblO/PrBPMW1I
	Z+pbw+iLiJrz1KlEKbQslI4cmWDUZqHnD9CSJypYsoAdc1CNFJOnRTfzWI84q/5vzTBj
	cMruFkr7lgOXbGHN+SMkNzviKcUqoMLDtApEa7Nca4IFe4KxRJDgCbfs2dBCOJSl+8WI
	Bo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=QLe3AuVwIuKoO1HPCRvZHyhHAZYSf5+gtDCsfJ/QInM=;
	b=rRCN13/yfs6blVNDQ2S/zep/5GpUspSS+wn2NL8r5WvuIGd53BD1W/kLcbLEtSAPGH
	CM7TlBc8z88uS6it7siJ3PNVfHxROoFXBo0B/5Qjh86fhqvYfRzv6xaT3/Dk4WC2VAGY
	bmTxqfXt2y4LZ4fUadfeGg9Tbra7B/qClgJnR9POWbPfbXbkjlhCzj1TYQEx3FqZDahc
	+x8jNoNErs0+FADETPEa//XTnJtyjDMJ5w+PWXTiSFOWEyxLxVYDuOmGB7Pfm8elzCc9
	Vs8Yh3p8Svio7c1+wi+f5m8Dh+jx/DV0AHqULMmnJbe45OqXKlO/4s9IS6snDGTR3jTA
	ldmQ==
X-Gm-Message-State: AIVw11065MCCsTDutcI1YS7OfsblosM0HYGZduQeuqpI5AN8OoT1NNmb
	Fum7xL1k6fkP1hdETDs=
X-Received: by 10.99.128.194 with SMTP id j185mr16980061pgd.80.1501533174708; 
	Mon, 31 Jul 2017 13:32:54 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FE53.dip0.t-ipconnect.de. [93.232.254.83])
	by smtp.gmail.com with ESMTPSA id
	e79sm50650072pfl.40.2017.07.31.13.32.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 31 Jul 2017 13:32:52 -0700 (PDT)
Message-ID: <1501533167.18875.35.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: wei.tee.ng@intel.com, openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 22:32:47 +0200
In-Reply-To: <42ed3bedf773c1fee314a2e4194c9656c583cc9c.1499887221.git.wei.tee.ng@intel.com>
References: <cover.1499887221.git.wei.tee.ng@intel.com>
	<42ed3bedf773c1fee314a2e4194c9656c583cc9c.1499887221.git.wei.tee.ng@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH v6 1/1] initramfs-framework: module to support boot live image
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
X-List-Received-Date: Mon, 31 Jul 2017 20:32:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-07-12 at 12:29 -0700, wei.tee.ng@intel.com wrote:
> +SUMMARY_initramfs-module-setup-live = "initramfs support for setup
> live"
> +RDEPENDS_initramfs-module-setup-live = "${PN}-base udev-extraconf"
> +FILES_initramfs-module-setup-live = "/init.d/80-setup-live"

Same problem as with install-efi: this RDEPENDS in initramfs-framework
makes building the recipe more complicated than strictly necessary.

Please move setup-live to its own recipe.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



