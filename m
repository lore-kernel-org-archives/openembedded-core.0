Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA946072C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 20:15:14 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id zy2so10825923pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 13:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=acROxfE+IeJ7/loC/+mHgjR3t7bW/I7KGBLde3uFyvw=;
	b=mT/JhjpNbzKspj+TTgU0Q9KwiclyLd0C81lolFfsn7k6S50MGIClhXOHR69BMauOjQ
	ukxw6a4tsVT4Gfs0KvvzHieVL03/B5vJhNPHUx5NG5dP0eHU2cwMQhaiRxqGV3RAwnmp
	Xo4Np2+4LnIWLZTfermzdLLujKZNX/ICyeusFO1kyi7RqkFV1D2gnnpMiT6TMHhxN5kJ
	A0MNaCTCyxf84aSBCme6LFP6nZbXCyjNwMQB124dth5SlK8wLoeHCr8JkqQ+AolvFh9W
	loLi8abHCWmHmrgTI02qzjjxOFQUE85L6hyYaCHKz4ehr7OZkW7GNQ7nRYFRqkBr2Vkk
	S3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=acROxfE+IeJ7/loC/+mHgjR3t7bW/I7KGBLde3uFyvw=;
	b=B+us4Iy4lRnhy6c2g8uUaz7DaAgMQvcDfe9WoU0UiMb5U5O7nV5NOk+BIJXWTsAdAD
	lYPIvUfbpIhjMEc8pFFgTJJiw5Hb2WaQM3hMcgLXSvJKG9hA+6b0Cbqvo4FMRInyW1vm
	84UIaGc2cmKtTTYlelk24s403DjRTT4Ec8o6cWqRPEjH7kTO6JDgiAjVRXCINvB/foTm
	nbfYBVtbqFKwbecoG0FN+NW/vAfsrYDfUzt3woD6Av0+Xtlpowp05Nuts61fkIOZyg15
	823V+aqOB1nxemNIqVFRiHBW93nTsbi/hKRAI2lpPt6g1xfEx8kbMhGsoebmDoWvh/5h
	QJUQ==
X-Gm-Message-State: AOPr4FU4i2plRYZz8gG9ez2IWqoc6rradRRqMzhiJVPr7dd/JRr5fRGXdhkFHT8OsUy/ng==
X-Received: by 10.67.14.68 with SMTP id fe4mr25876399pad.93.1463170515588;
	Fri, 13 May 2016 13:15:15 -0700 (PDT)
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com.
	[209.85.220.44]) by smtp.gmail.com with ESMTPSA id
	nz6sm29388363pab.39.2016.05.13.13.15.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 May 2016 13:15:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f44.google.com with SMTP id qo8so1135978pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 13:15:14 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.172.165 with SMTP id bd5mr26294584pac.128.1463170513740; 
	Fri, 13 May 2016 13:15:13 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Fri, 13 May 2016 13:15:13 -0700 (PDT)
In-Reply-To: <6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
Date: Fri, 13 May 2016 17:15:13 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
Message-ID: <CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Fri, 13 May 2016 20:15:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 4:20 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> Support for multiple new protocols, many new features:
> https://lists.freedesktop.org/archives/wayland-devel/2016-February/027039.html
>
> Weston now depends on wayland-protocols (which is protocol
> collection split off from weston).
>
> Remove upstreamed patches, add a patch to fix the wayland-protocols
> path used during build.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

I am working on rework the weston recipes and it seems Weston 1.11 is
close of release. I think instead of adding 1.10 we could use 1.10.91
and upgrade it to 1.11.0 when it is out (end of May). This avoids
another cycle of rebase of patches during 2.2 development cycle.

What do you think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

