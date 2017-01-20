Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id AA3CE719AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:35:22 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id 203so17105195ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 03:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=VsomMFhTO+he076p0AKN6saOuL/Mzf7RI86wweKqXew=;
	b=tTnqHu5BdwAzUB6e4WO6ifk+QYOrglh6GKmxZLFnFamJUDaKG0NqWS58OgUNn+jve6
	cNQfDu/lN77MAhd5BNr4aVh/j2Fj5pR7rscnlbK1RknHyahFwwQwXwtEQp9dISn0TFsZ
	PZCkAVvtz/GU4lCOHg5FitTD5+t94egSgWLFe+DFtIwkReiAIyChh6Vq/L8tBmqyWsvz
	acW57er4/lXhvt3ZNy0vxiEYmeF6L13HyHeWVi7QbbvmgemvMnVsWCDtQbPhy+qZUtvf
	ZpWT17pLZDh4eMSuveblN0yRXIvwQCl/lil1w8VdU3Nt/BlSC1mVn1iwQQHgOSLSVkVY
	9qHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=VsomMFhTO+he076p0AKN6saOuL/Mzf7RI86wweKqXew=;
	b=HhUJupEoHz9BAzX/dG7n+CV9l+hGKLsNzjxPWE7FFqnpYzQXGnYPw+n8n6MHal2JPC
	Mh066y5St5Ttn3W9dbxucBUTpNd5oerO+GmUQV5prZw0+pY9DZsluLn+Ub0yhzprRdDo
	fpNjMrhoedRO2YmYt7/kDHSZNmERvXa6R1AuMM85uLbxBd5qZ/pkgwvpZCDoDXWJp5mb
	O0QzwMcODy53H9q3QHb1LzfW2gA/5LAihJ7Okoc9l5HTK6HN7lc8RnhWoww8CtuAkg9s
	dVXQcZeLKQ8InLBBbdk/oSTIl2ry9EVNAMK6HYr+aXa4JeaRVkUZsDLyMCkZtzJyHPd4
	ReYA==
X-Gm-Message-State: AIkVDXLQ2KQPK/Qs+BDtSONYwRxVjNmNW2ab5f97YfXmBGKbchlIVHJiJJCXbtTvdvbaSbND
X-Received: by 10.36.141.2 with SMTP id w2mr3067158itd.114.1484912122765;
	Fri, 20 Jan 2017 03:35:22 -0800 (PST)
Received: from pohly-mobl1 (p57A56DD5.dip0.t-ipconnect.de. [87.165.109.213])
	by smtp.gmail.com with ESMTPSA id y71sm1228336itb.1.2017.01.20.03.35.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jan 2017 03:35:20 -0800 (PST)
Message-ID: <1484912118.23233.113.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Fri, 20 Jan 2017 12:35:18 +0100
In-Reply-To: <1484866006-25611-1-git-send-email-anibal.limon@linux.intel.com>
References: <1484866006-25611-1-git-send-email-anibal.limon@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: Upgrade to 2.7.1
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
X-List-Received-Date: Fri, 20 Jan 2017 11:35:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-01-19 at 16:46 -0600, Aníbal Limón wrote:
>  SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
> -SRC_URI[md5sum] = "08d4d06d1cb598efecd796137f4844ab"
> -SRC_URI[sha256sum] = "326e739506ba690daf69fc17bd3913a6c313d9928d743bd8eddb82f403f81e53"
> +SRC_URI[md5sum] = "a315bc51ed443a08d2cf1416d76b9ab4"
> +SRC_URI[sha256sum] = "68636788eb69bcb0b44ba220b32b50495d6bd5712a934c282217831c4822958f"

_prepend without trailing space is broken. It just happens to work
because the SRC_URI it prepends to usually has a leading space.

I just ran into a situation where it didn't (due to some _remove
operation being interposed, which did a split/join, see YOCTO #10945).

I was about to send a fix, but it would just conflict with your version
update. Can you include a fix by revising your proposal, perhaps by
turning it into a patch series with two changes?

IMHO SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
should be fine. There's no need for the more complex _prepend.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




