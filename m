Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id B0B5F6057B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 21:26:36 +0000 (UTC)
Received: by ioc74 with SMTP id 74so66356060ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xZhUR82jd6Kqf4Qyd5n07siK/LNEFg3oMP14gwnhp28=;
	b=OHYJDLUr0gA//9Qcyl4Wsxr8Zy1cEYJFu5eukqsdz2aDZKnscKf2rAFG9BrsALs4TL
	uC4hPSV0bUYeaVNX14jx9NYbBQzquOMZkUpnpdGZ+GOBE4QtJQ44z255vzEf66ZC3a1r
	oyKyrfqHGh4iCQLzqU/OkqXhSlLHbGzWy/+3Vykl7EFtOxNZVnBwSZpjJPcuW8WliRZ/
	K4DzqAOmPnvI1V3H2Ye3h/6KAmeh1LA4jFb5ZnSNaCa9/bMJENYtBuKjLUEEJ84qh/R/
	XZ2dnu63OzCeKxPyPPLsRn9HTzocMN02rfKTbq9qxPEZGTk+KJGIcp4HOmuQH9rB31Nl
	P33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xZhUR82jd6Kqf4Qyd5n07siK/LNEFg3oMP14gwnhp28=;
	b=ChZSkmPgP6WIFYhEpsI0JLir5Z4FvL9cAe7IpOqqABGPPkcHfktlMLIpruqTysM8vE
	wuTlFgGGbEQ5Z7ciivjnSmDmYQW0e2ypWzSIQh5M4284kINmu2G+1UsskBUKkR6RGsw4
	DVi4C93s8sK6N2PCKflWpsDr8dhVq/s7kF8iDYfy0pH3w/VykhfM4ySVjyqK/cZv4GEM
	P5rqNtMx2Xsh7PwPTwNMIBc5/TrzLGpMKdfwx/vhem61n39a2BsMsoc93C37sseaTTgB
	UYYuX+MPl4QRGZuZ8a8ZeYF8RsQ0YrbEC3p6FkekTqumgYjYpz1qGCp7I8KxoooGcagI
	E8HQ==
X-Gm-Message-State: ALoCoQmUHpZQF055kXagwjw83n3otu/xYXMZuuB9X6W++fpO/7Y9YztXJ0twhKXOyFCQFkV438/C
X-Received: by 10.107.130.155 with SMTP id m27mr42229094ioi.133.1448486795933; 
	Wed, 25 Nov 2015 13:26:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 25 Nov 2015 13:26:16 -0800 (PST)
In-Reply-To: <1448484269-132667-1-git-send-email-mark.hatle@windriver.com>
References: <1448484269-132667-1-git-send-email-mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Nov 2015 21:26:16 +0000
Message-ID: <CAJTo0LabcacC1K9SWicuFnNQ445Up7ah_g9tngggPdYOFcnRSg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] [jethro/master] Misc fixes
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
X-List-Received-Date: Wed, 25 Nov 2015 21:26:37 -0000
Content-Type: multipart/alternative; boundary=001a113ecd94ef0cc30525641c8c

--001a113ecd94ef0cc30525641c8c
Content-Type: text/plain; charset=UTF-8

On 25 November 2015 at 20:44, Mark Hatle <mark.hatle@windriver.com> wrote:

> The following fixes have been tested on Jethro, I believe they are
> also applicable on master.
>

As we generally want to ensure fixes go to master before jethro, can you
rebase these to master (at least 1 and 2 don't apply anymore).

Also is the python2 fix applicable to python3 too?

Ross

--001a113ecd94ef0cc30525641c8c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 November 2015 at 20:44, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":acg" cl=
ass=3D"a3s" style=3D"overflow:hidden">The following fixes have been tested =
on Jethro, I believe they are<br>
also applicable on master.<br></div></blockquote></div><br>As we generally =
want to ensure fixes go to master before jethro, can you rebase these to ma=
ster (at least 1 and 2 don&#39;t apply anymore).</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Also is the python2 fix applicab=
le to python3 too?</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a113ecd94ef0cc30525641c8c--
