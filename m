Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id D9C0D7829C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 19:26:24 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id m47so2419862iti.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=UaVqOWbyID+25LHVudXphtCbBw2WtxcYakaV0lPXjsM=;
	b=leUZq3G5JaQhpL9vj/R+qsakbVnEwCNx4JN17jICwlbzJiv1pVemPK3I4nOi1SLiN6
	klvbNxFNk+mRD2fqBh7xNuYYeno2hhrtZdnO8bQ2Sk//OEkrifiukG6EDIOlQzzLHZLv
	oO4dXpckjo82sWzvg8aQx+dBPGyEaydpcnih3u5a8Hgqd2D6LPmkNZe6OfTo3MOtnhue
	zRCLBk/cyvKiLRv9TpRh7YQ9kDyrUrUh0ayYk45UVlmmymIwqgL/umjM2hRdo53+c1dO
	piJcDpyuK/Nx0enWpGxDwIbBsINl/1zhvAXJgmHbwwSUBdNgMDynZsP/kWdWGNwnKLYx
	VSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=UaVqOWbyID+25LHVudXphtCbBw2WtxcYakaV0lPXjsM=;
	b=uYE3zUTC+2ZKoTC+/tC/sifErxW2+xl80Ls5ijubBsehUVTxR5AvpIxEguhAFJdVRt
	mwfVELV3SQ7TPASpHDd46XHFYE5dbqaxJfXrrPg4p8Vk3buvdypHDGr80QHrI5UNvpXT
	fdaC0O454sQnI23ufr+3ZV5ILP1hTJMsi3IS2qMcArAerzhV1lls7dhIwxuADnDZ/Km5
	YcHAV1np9mB93nfWtKJ4hev3LgYtObxuJaPyICKwKfUXsW4cmZWLRdeULySHK7E/jGyL
	1MHsaY7UTXt5bTwWxBy1qjI+GtqI1iUbh218YvRGSJ4CbStT6JBg2UkVBaDY0MzhOujs
	ex5Q==
X-Gm-Message-State: AODbwcCuQEyoxjX3XfM7xp6036FRHlTtODKzoFWd4x52iVapNi9ljs6P
	KOIz1BpnQ+EzJ+G4
X-Received: by 10.36.211.69 with SMTP id n66mr1121739itg.36.1497036385430;
	Fri, 09 Jun 2017 12:26:25 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C0DE.dip0.t-ipconnect.de. [93.232.192.222])
	by smtp.gmail.com with ESMTPSA id w14sm260976itb.28.2017.06.09.12.26.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 12:26:23 -0700 (PDT)
Message-ID: <1497036380.30163.221.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Date: Fri, 09 Jun 2017 21:26:20 +0200
In-Reply-To: <1496638270-4482-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1496638270-4482-1-git-send-email-fan.xin@jp.fujitsu.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] acpica: Upgrade 20150515 -> 20170303
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
X-List-Received-Date: Fri, 09 Jun 2017 19:26:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-06-05 at 13:51 +0900, Fan Xin wrote:
> -@@ -569,6 +574,8 @@ FlOpenMiscOutputFiles (
> +@@ -607,6 +611,8 @@ FlOpenMiscOutputFiles (
>   
>       if (Gbl_DebugFlag)
>       {
> -+        int fd;
> ++      int fd;

Looks like you (accidentally?) also changed whitespaces while rebasing
the patch...


> +@@ -635,6 +641,8 @@ FlOpenMiscOutputFiles (
> +             exit (1);
>           }
> -+        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle = stderr;
>   
> ++        Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Handle = stderr;
> ++

... and added lines.

Not a big deal, but you diff could have been smaller if you hadn't made
these unnecessary changes.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




