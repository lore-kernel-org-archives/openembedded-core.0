Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE1360069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:01:58 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id i145so9827114ita.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xXyxmjbNzC9W8kC353sRpxwYJ6kuc7jkvpzfc0bBYmo=;
	b=xUso7Lz2r/iQiXbPi2saxwtEbwFCsJshbh+Yl2l8vyAEBjyWeADBaExBve4CTwhtPp
	BZXFutE8XuIRLBWDSJSauxQm/F8JI19OBvNKRpAJv3yR7LH/iqIUMPGrGC3UeXlBv9nB
	ARaJRBDltB5Y1/DgNF+3Puol1trmVwbIjRDdseECtthuuP5YB1ZRiCbMPvYMscIMUzIX
	Ur5Ea+5BIuaPCx27hlp+gW4AUwT/nQ5W/7rpSlK6YdIcpJzfcYVM7d+Tngcvh+EvZLDW
	p3H7PObgT7e1OhGA/Wl9lVswk9VjnJXkd1GGHfyaiCFPPDyYi8BiRO9Q+Vbj8BYbepRl
	DLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xXyxmjbNzC9W8kC353sRpxwYJ6kuc7jkvpzfc0bBYmo=;
	b=Hw+SWVXaqia+Z+DQ9EssO5+XvVX8MwyJLeWn9k/F/rXIfwZMAGTZ9meMOW6k6R+tQt
	3FM7ZdxF/58AuMbK0LpsNBHIIoUexoniR62A/E0vZhP5+LUlkDLvPeXT2cAF9sEb4SOO
	2OBXXoMz1duDkyuhHBe6YBuehvzk9GPC/F4BejF9bY1N/hbMddlWg9ZBa8o/wdPQV6mY
	nUdx3i+pweCsyhEOCPQX+rZbJADX4zXe8tpoHc/i8pAB9K5ss1M2AASnB7glrqi/LqxJ
	0fGlXrU+vORBa2Pw7gKkN0LkV4M5fTwRbwE/nr5WmgY2B8aT+p6Chf7/hVRkqPV5uhFG
	ZtQw==
X-Gm-Message-State: AA+aEWazQQEAz/eATX0RTLiBHrOGbp0b8x+tRd0WaoJu1tLCxMjDaOsO
	0zvVXQ1CGTMrYQBe1F7fyQsiXxMIP3gIB/E+j2obLoDnpcM=
X-Google-Smtp-Source: AFSGD/UtDO45wRHFzIW6Sg17x3hZYvgYghjHsV0o0Oe6XTaMnQT198RJr848Km9BV3uUPj1/TrAP5K4+zp5X1xN3/Go=
X-Received: by 2002:a02:57c4:: with SMTP id b65mr3428014jad.79.1544806920109; 
	Fri, 14 Dec 2018 09:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20181214125225.3376172-1-enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <20181214125225.3376172-1-enrico.scholz@sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Dec 2018 17:01:49 +0000
Message-ID: <CAJTo0Lbe3Kq+xtEQu9YJAK+8kop6C1ffgTHmo6ODGL-i-wmu9A@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: updated acl + attr
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
X-List-Received-Date: Fri, 14 Dec 2018 17:01:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Dec 2018 at 13:27, Enrico Scholz via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:>
> Recent acl and attr package versions changed their buildsystem to
> standard automake so that previous buildsystem related patches are not
> needed anymore and recipes become very simple.

pseudo-native doesn't build anymore:

| In file included from pseudo_ports.h:15:0,
|                  from pseudo.h:171,
|                  from pseudo.c:37:
| ports/linux/xattr/portdefs.h:1:24: fatal error: attr/xattr.h: No
such file or directory
|  #include <attr/xattr.h>
|                         ^

Ross

