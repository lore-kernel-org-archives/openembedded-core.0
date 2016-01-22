Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBC073172
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 07:29:29 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id h5so48619706igh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 23:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=4gn9UlMKt25+kTMVLXSgXaV46mM42Dy77SJuJS1Cj0c=;
	b=kP9EQD5NcJl7Yfs2nZdpCq86gaH8BRVLefMR6SLN0cTeuJH98EGJbM18rmqYw41Nf2
	eb8VMsaWAW7FyTCJx3PEgqnc+56P3/GXHOgJysU2ttNa6fNyrqPXrj4ZIlJC6PM7xvtu
	m7pMD7qE265SvdO/t7swF2FHURkmxeiKlGRfSizc+4LOSNz5pJ4DPVoFH100xLQ+6JHU
	nsVllDdqlHLomDk2x2r/ESAQVd9V4F+y+LjvxZS24dSLsKwqNhjHGygSrmrrwrE1Ky/r
	RUxmhc/lyKxp1Yk3PKVwpbCpF9A6+R5RdGyHAb77XKmW4O12z3c4FuaXf3+90M5rj7r/
	6bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=4gn9UlMKt25+kTMVLXSgXaV46mM42Dy77SJuJS1Cj0c=;
	b=eNok8dnxGynWDQJZzRWQb72k4mAPfAbT7frMzcF9NCIQYHa2ldqdZNMIphbdTf83ii
	C3KpEDN8Gu9q0Agjr/f5cKob3lmiPMWzDT40+dspwoU6aHPkdj27zafr2HEasTBefE+Q
	p0obbJJda8SgRUVzSgEbTeXnQnn6LkAFfTf5SGVpaeAe9Qfarjll7Ywp/63T6WmfPOvK
	JuEe1ZARoTcsKECTzzzpTGn6eP93If6QXMlqMutCeiw8ZkV8hqq1cRgFXVvQIN8k1yjB
	Q97dhqki/PMiwzAfTOhrSXuVepmx7OOdbTYtou+cUlfM8Jx2VltRfuPQH3iI1zzJ6jWF
	P+Lw==
X-Gm-Message-State: AG10YORWGnpx4IIiesArxc+7WtfFGtwZGjHGnFX77Pv419iwh5gAOqxs+NgQrRAJmHxQocJT
X-Received: by 10.50.102.69 with SMTP id fm5mr2078615igb.24.1453447769503;
	Thu, 21 Jan 2016 23:29:29 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F6ED.dip0.t-ipconnect.de. [93.232.246.237])
	by smtp.gmail.com with ESMTPSA id oo7sm879681igb.5.2016.01.21.23.29.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jan 2016 23:29:29 -0800 (PST)
Message-ID: <1453447766.16442.32.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@intel.com>
Date: Fri, 22 Jan 2016 08:29:26 +0100
In-Reply-To: <1453382601-26628-1-git-send-email-patrick.ohly@intel.com>
References: <1453382601-26628-1-git-send-email-patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: support TMPDIR/DATETIME inside complex variables
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
X-List-Received-Date: Fri, 22 Jan 2016 07:29:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-01-21 at 14:23 +0100, Patrick Ohly wrote:
> Not replacing TMPDIR at all (from in OE-core:a8c377beadb85b0ff50)
> led to an expansion error when INITRD needs to passed to the image command:
>    ERROR: ExpansionError during parsing ....bb: Failure expanding variable INITRD, expression was ${@bb.utils.contains('MACHINE_FEATURES', 'intel-ucode', '${TMPDIR}/deploy/images/intel-corei7-64/microcode.cpio ', '', d)}
> 
> That's because the replacement of ${@ stops at the curly brackets after
> TMPDIR, leading to an incomplete Python expression. The right solution
> would be to enhance bitbake's data_smart.py such that it does not rely
> on a regular expression to find the matching closing bracket.

Richard proposed a different solution for this, which is an enhancement
for bitbake which stops expanding Python expressions when the problem
strikes:
http://lists.openembedded.org/pipermail/bitbake-devel/2016-January/006932.html

I'm fine with dropping my proposed patch and using the bitbake
enhancement instead. I checked that it also addresses the specific
problem that I ran into.

However, after thinking about it some more, I suspect that it leads to
situations where sstate hashes do not properly track variable
dependencies.

Suppose an image command is passed a variable like this:
  FOO = "${@ os.join.paths('${TMPDIR}', (bb.utils.contains('BAR', 'a', 'x', 'y', d)}"

If the entire expression was expanded, the result would change depending
on whether BAR contains a or not. But because expanding the Python
expression stops, FOO is essentially constant when checking sstate
hashes and only expands later.

So ultimately, a proper solution for matching brackets for Python
expressions in data_smart.py will be needed to cover all cases.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




