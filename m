Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id BA14E77317
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 17:19:30 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ho8so16306788pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 09:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=s2uDGabDqwEM8pJWZv6C+Z1o26gTJyzhZB/soA5p554=;
	b=NNRIUJkTlvJxnMnziuAU8juKvo2sXdjyodMPAeky/DGDvlOH/7qGE7kt52eJx1gH+M
	QfBGMRinmhKZIQs5k7whsBlm1F/oXnc6CcxRuUpGqT7VzTCxOgV1Tlcz725zmloz16HH
	WgHqxetn/ZbOH5TJ6nPM3S+vOGZ0EFndJkMV7FBcvOhbk6Tthgef6T+/BwprtgVYepUa
	7wghBC15jOY7P78WeXrB5vsXseS5NuhD4HPffJGJ3ffwOlADV96T6cRa6QU9MB/22K4k
	HEcivVqUrs0Z2RX/z66yzfVuOmC3QgTnGs86UzN6/zmQDNUPiBtS7y2YZj/QaqU3pSTb
	+hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=s2uDGabDqwEM8pJWZv6C+Z1o26gTJyzhZB/soA5p554=;
	b=KHqy/pBWzs4yDL5y5r/6h08cOxLIb4snh7cHNu+XCaumdlg2F709FrGX0Mh6XQiwVO
	/q5n9C7i08xq4sxUUPKjoWmPJRlM4nhJOjuMrdZMmWJZKAaC9XPpwvfbJV9yqb1WTX91
	/7eVypXnWsMcrOWe5DmA1nurDV4xa9TSW688Pn7/pGb3+5qvXtM0IAnXyh1BIQtMmLi0
	pMbSdvaClmirx2Ngcd8pVK/YHXZqkVeQgKanI9b7sDSH52mosPNTR+BMlwTIsVMm05GC
	RJKFDXNqG4z4Qfp15aWYZauX6tYp7dJwDmq+j4xIR1IOB2Ei65x3p+EN8etJyhbX3ast
	+wKQ==
X-Gm-Message-State: AG10YOS9n+fAlJHB+2rjxYdqCgCfrifNdcE/GofgU3ox4KFtbwQeqUl/jF2RoHZ2qWOrkg==
X-Received: by 10.66.235.9 with SMTP id ui9mr56383905pac.135.1456334371210;
	Wed, 24 Feb 2016 09:19:31 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:19b5:9f2e:548a:2a85?
	([2601:202:4000:1239:19b5:9f2e:548a:2a85])
	by smtp.googlemail.com with ESMTPSA id
	k14sm6406533pfj.0.2016.02.24.09.19.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Feb 2016 09:19:29 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<6ebf64ba55b2abcb17cfaf487d412a7072d9034b.1455107972.git.alexander.kanavin@linux.intel.com>
	<56BCDC10.8050901@gmail.com> <56C33375.4040200@linux.intel.com>
	<56C3465B.7020702@gmail.com> <56CD9A1F.2060101@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56CDE61F.7020808@gmail.com>
Date: Wed, 24 Feb 2016 09:19:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56CD9A1F.2060101@linux.intel.com>
Subject: Re: [PATCH 6/7] webkitgtk: update to 2.10.7
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
X-List-Received-Date: Wed, 24 Feb 2016 17:19:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 02/24/2016 03:55 AM, Alexander Kanavin wrote:
> On 02/16/2016 05:55 PM, akuster808 wrote:
> 
>>> Yes, which means that jethro (which has 2.8.5) needs the same update.
>>
>> there is a bug open for that 8877. there are a huge number of CVE's that
>> need fixing.
> 
> I wrote a comment in that bug, but I think it bears repeating here:
> 
> Please read this, it's a bit long, but worth it:
> 
> https://blogs.gnome.org/mcatanzaro/2016/02/01/on-webkit-security-updates/
> 
> Summary: the upstream will not backport CVE fixes, and they will not be
> making point releases in old branches with any kind of lifecycle
> guarantee. Providing ongoing updates to the latest stable release of
> webkit is the only way to stay secure.
> 

Many vulnerability notifications will make the same statements.

Updating a package that other packages depend on can cause a cascading
set of failures. Now you have a bigger set of problems to contend with.

> So I believe that you indeed have to update webkit to 2.10.7, or
> whatever is the latest stable release, and keep doing this for as long
> as a yocto release needs to be supported.

From the commercial side you just can't move your install base to the
latest package versions for every security issue. The Yocto maintenance
policy operates very close to this too.

Yeah, Backporting fixes to stable branches is a lot of work once it
moves away from a simple cherry-pick from master.


regards,
- armin

> 
> Regards,
> Alex
> 

