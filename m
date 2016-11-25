Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 66F1B71A23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 10:33:15 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id c21so113952643ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 02:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=IV8SqOWIBhFOGq93gi4FrJzVpSfGYVpSrHb8+iOOH0Q=;
	b=XNZm77QQh5EO8PuThHss/sn61QonDVsAUJqnQuMCkKFk5OL50k0mXWl35b6uK26uq8
	tGATIlvTjZJSb5vbloLsA6TkCXy1k56qM3VBa45Ti5H3S2eAxFyKU1decY22nWLH7KFg
	HoUE89LLpOLXGEL2aaoeCO9LVKXDiBmJtYsUbvZBuHsp0ZaXVpY4cuMIeb8UvwQaV474
	99+TritsnC6FCoqnq9hvQlOO0zodi7DHqUFlAVrBp24NS5W8jo6VNG6MI95LoCY9HEmR
	Rq9TxOi23ovpMPTTMBq3+nB9Yy+GExSiW1IwMeYpNk+bHvuLQJB3jClgLSAmK+FqSPrG
	L6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=IV8SqOWIBhFOGq93gi4FrJzVpSfGYVpSrHb8+iOOH0Q=;
	b=C8HuwQDu3a68GXSQaouL5UWVAVWO+/vphOJCXKVizx4eSWXJ/cZM7lfijP4EvcPeKM
	vNhmGpgRquwzU8Y/ulZJ2NB+PPGWh6B0Rw9S0Iahuh/9FVHo4+sKI9NaAQGYpnmzUVfa
	Jxfn1EEDjsvwBALekY5Vxby5d2WfOV3voeHchKAIOAMWUK4k9aOLIPUaLIlqxOhLJOen
	PONP3ejW+BWOFQXRgxfZx7Xe/JPeLDX3k+G8PPuy3oATV95T73/YFTiQDy8TH3GFMvO4
	P/L1eXyZNaWEFGq/0DNTFJKC30eDk8o0og8W+lhnOejUH/fOO7esTp3dguBbebSTBTxq
	S+0A==
X-Gm-Message-State: AKaTC01snaFj7J3MgLarDhwvJuTZ7QlDeOjvL4Du7AUkNUbpfMzCHdCGswj85BLMkEG/coNc
X-Received: by 10.36.14.21 with SMTP id 21mr6080938ite.79.1480069997293;
	Fri, 25 Nov 2016 02:33:17 -0800 (PST)
Received: from pohly-mobl1 (p5DE8CE2A.dip0.t-ipconnect.de. [93.232.206.42])
	by smtp.gmail.com with ESMTPSA id
	124sm1556027itl.15.2016.11.25.02.33.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 02:33:16 -0800 (PST)
Message-ID: <1480069993.6873.98.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Date: Fri, 25 Nov 2016 11:33:13 +0100
In-Reply-To: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Fri, 25 Nov 2016 10:33:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi!

Wow, that was fast :-)

On Fri, 2016-11-25 at 11:15 +0100, Kristian Amlie wrote:
> +            if os.stat(real_rootfs_dir).st_dev ==
> os.stat(cr_workdir).st_dev:
> +                # Optimization if both directories are on the same
> file system:
> +                # copy using hardlinks.
> +                cp_args = "-al"
> +            else:
> +                cp_args = "-a"
> +            exec_cmd("cp %s %s %s" % (cp_args, real_rootfs_dir,
> new_rootfs))

Not a full review (I'll leave that to Ed), just one thing which caught
my eye: when the rootfs contains xattrs, they get lost here.

Use oe.path.copyhardlinktree() instead, it also does the hardlinking
trick.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




