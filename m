Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0C69B6011D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 08:56:22 +0000 (UTC)
Received: by ioir85 with SMTP id r85so2262050ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 00:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HpcfJbGjmKAX5TuhoGckG2IRT2uqgbe0wpDv+TpA4Dg=;
	b=SYZUlnw0udjR/YjOxnegoGoKt9/xTooyK8VLzmrJGwDCOHcnzGpvzMQ1PWSjfqtCKR
	G0XuwOYe0Wz55e10+56sYcosXcybFoaXg/TBQWO7tiH78D4v6nt5vyw3PgCdaLkswaOs
	4761DqavAw4eSxYgej5o9vADP6rC1TFc0UFAc7Ycz7WD6GTFJ5U075EYzhOPrHv9PYxw
	sEwTzA0mJZNWUi4pCP0Glq33cSKpPyFWlmNyknw9Fqbco0y/oeChDV38I01plOM6vADs
	z5O6xgERgmg2xg3aF/MuyHYyUJdI2kCOa/RICC2Ou9n5En3kwNsrlmaFWXk5w4ngVEiJ
	raDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HpcfJbGjmKAX5TuhoGckG2IRT2uqgbe0wpDv+TpA4Dg=;
	b=c8uGFgd8Ygz8s5tf5ffsyCG/u+05OHN+wooLIlITZiCIlmqnVfBovkn9BdMtl4BvJn
	FjD90onnGvSkmJan5UYbrRvvmqFu3E7R0M89Dlhw4oVxErVvvL3+qaTHSp+ojlozEU1W
	kd3It+VnM4MQBa2WMT82PjnqYbJZzZNT+Cd9sc+VcJzAxyDjktfISaNpMjddMIImwhjG
	LULZ/yhG6VcCakdXQjY+5f/gG6fXlZuBdE5pHY8osCP3FZ9Mjl/wB/YicxSOQcT1rdVv
	TISfTtBkwWChobP+rB0DqNVG0qiSBBPcld0HGy4PzS2EuTZAy78PaIKEO4D9WI7eBNJX
	3lbg==
X-Gm-Message-State: ALoCoQnJTnm3mQehapyzPPjhE+omQIGjV+MgK0fy/VnZCRfDzSP5F72720vzBohK9KoO6KmjTrko
X-Received: by 10.107.130.155 with SMTP id m27mr69838416ioi.133.1448960183085; 
	Tue, 01 Dec 2015 00:56:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 1 Dec 2015 00:56:03 -0800 (PST)
In-Reply-To: <1448948830-9690-1-git-send-email-jackie.huang@windriver.com>
References: <1448948830-9690-1-git-send-email-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Dec 2015 08:56:03 +0000
Message-ID: <CAJTo0LYtfrPYpfYMDfmO=-CbFcO4=8_K0dWLChEq+AwgAcxYBQ@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] matchbox-desktop: sync with gio for the inotify-sub
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
X-List-Received-Date: Tue, 01 Dec 2015 08:56:24 -0000
Content-Type: multipart/alternative; boundary=001a113ecd9401c0900525d2555a

--001a113ecd9401c0900525d2555a
Content-Type: text/plain; charset=UTF-8

On 1 December 2015 at 05:47, <jackie.huang@windriver.com> wrote:

> matchbox-desktop builds with included libinotify which
> is very old (last sync was in 2008), if we compile glib-2.0
> with -fvisibility=default (the default is hidden for libglib
> and libgio), it will crash because of inconsistency of
> inotify-sub, so port the related parts to fix the issue.
>

matchbox-desktop is maintained by the Yocto Project, so this patch should
be applied there and then the recipe updated to the latest git revision.

There's a big rewrite of matchbox-desktop going on, so dropping that code
entirely is probably the best idea: just use GIO instead.

Ross

--001a113ecd9401c0900525d2555a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 December 2015 at 05:47,  <span dir=3D"ltr">&lt;<a href=3D"mailto:jacki=
e.huang@windriver.com" target=3D"_blank">jackie.huang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":w6" class=3D"a=
3s" style=3D"overflow:hidden">matchbox-desktop builds with included libinot=
ify which<br>
is very old (last sync was in 2008), if we compile glib-2.0<br>
with -fvisibility=3Ddefault (the default is hidden for libglib<br>
and libgio), it will crash because of inconsistency of<br>
inotify-sub, so port the related parts to fix the issue.<br></div></blockqu=
ote></div><br>matchbox-desktop is maintained by the Yocto Project, so this =
patch should be applied there and then the recipe updated to the latest git=
 revision.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">There&#39;s a big rewrite of matchbox-desktop going on, so dropping th=
at code entirely is probably the best idea: just use GIO instead.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a113ecd9401c0900525d2555a--
