Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id B120971B45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:29:45 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id c7so66576632itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=LJzpGiU4kLIqbOy92nCYULk2WTVDp45oi75uvIt64Vk=;
	b=ltHczyzxWkRMqliRdQVi9QjLWGrl2H5DlxeBYAlvMVZNpdsN598/peeiJKPC11a88x
	IJ8TXUhmQDMaBtK5oS1nbmPGW+VXZFXsH5rDjkhHfqyJNm0hWczTVbWnq6uWqYb+P6ff
	7kJ13oEW1topYbHSC3X7UBXQ5fg+2DyQyxwsqQFAAW8qvJS/fX4d/dfIGozeEP7BzCOW
	oryPTwFJPPRwkuCDGbvkDAbjFEUSgsZyS5UgAIvDdt7DVWOEIGhJDPnZlbt3tL4wn6jv
	gCq+R3WD20Kul8uxsO3GlLYgoVToHeCeiaBAHPsqp8ZAXDJhLhmPSP2An0jPBu5EZml0
	rrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=LJzpGiU4kLIqbOy92nCYULk2WTVDp45oi75uvIt64Vk=;
	b=YKsWa7rOo4ZI4K3Hmbm3NEgXDahjmguOApW+pgCHU5HPwwVQtCdqp59MlXKjkjo726
	/i+Lt4gJnZIL2D1I0YtsQfjeV3ghYuQmD1iAc7b8g69LUv2x+7hDQAa4/9+CSLVvIaIi
	5p/qO/dxfuUNnS1VjnoAmbPiZtXMEcewx/7myXUsBQCdWKCfp1m/YCGNuFo3HNAKShb2
	+68VsA6cFSTihSY4tsEQahBsrvTqIgyzNRiMEE06WoII+3b4l6JeLR3hTZCpZ/0bSqT0
	zD6O8h9UjyjboSwJs7TBbeXWosNeP1vjkv8+8GdV+537fwJwkHyQ4Cvw0Uuq3d2Vf1/p
	KJpQ==
X-Gm-Message-State: AIkVDXJwUc3cptBB1RJR3rZeQ0snXtyyM0s8gOgwU5/TwwoSynmzyVsWva9tw3QMZlHBwIZc
X-Received: by 10.36.108.205 with SMTP id w196mr14336604itb.96.1485181785623; 
	Mon, 23 Jan 2017 06:29:45 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FC12.dip0.t-ipconnect.de. [93.232.252.18])
	by smtp.gmail.com with ESMTPSA id
	x26sm4618920ita.11.2017.01.23.06.29.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jan 2017 06:29:44 -0800 (PST)
Message-ID: <1485181781.20333.39.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Mon, 23 Jan 2017 15:29:41 +0100
In-Reply-To: <8c0f5529-3dbb-1049-dc59-0cb368e04359@linux.intel.com>
References: <1484935979-328-1-git-send-email-anibal.limon@linux.intel.com>
	<1484941467.20333.3.camel@intel.com>
	<8c0f5529-3dbb-1049-dc59-0cb368e04359@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] qemu: Upgrade to 2.7.1
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
X-List-Received-Date: Mon, 23 Jan 2017 14:29:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-01-23 at 16:01 +0200, Alexander Kanavin wrote:
> On 01/20/2017 09:44 PM, Patrick Ohly wrote:
> 
> > In contrast to Alexander, I would also keep
> > http://wiki.qemu-project.org/download/${BP}.tar.bz2 in qemu_2.7.1.bb
> > with SRC_URI =+ because then there can be a qemu_git.bb with a different
> > URL than the one above.
> 
> I would discourage creation of such separate _git recipes, unless there 
> is a clear benefit to the whole of oe-core. They are almost always 
> untested and neglected, and eventually removed because they're outdated 
> and broken and no one cares.

I wasn't suggesting to add one, just using the possibility that one
might want to add one as the rationale for keeping the download URL for
the tarball out of the .inc file.

It's all rather subjective and hinges on the likelihood of adding a
_git.bb (don't include it in the .inc) vs. adding more than one
versioned .bb (then including the common download in the .inc reduces
duplication).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




