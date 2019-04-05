Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6E37D23A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 12:18:36 +0000 (UTC)
Received: by mail-it1-f180.google.com with SMTP id y10so9118533itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 05:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ldSu0h4KcCxGgIMdqKHb9/hi9hgyfNjyuPvhEDG5gBY=;
	b=UNdbqmOIY93PfpoNaASdhRbD6QsxlQl2Y+hy8s1aoAVv47Q3xfw7YFrOY16KvlzQcl
	ZSqvdKRzKBiKhOS9R+2e3KdxAlNQ2hzwH/Vb1bExqiCVawVyYrZVSSptUXWuTImmB9ix
	MoW4dM5b4a2p3Fg6Ir5CJQLwyvlWUTLdA17DCTYGHNclqll8uschZRnBuiToV+scFwEN
	4ByCdYcyNDWu6yWKYCLep2OwHD0U5QAGQRjqP98Lg07jCdV2vhWz4aFdVHgJGOiDUXw5
	IFhzcXQV48oxqCMAplxqEd6tSVBerUVZuMLf05ph0Sb+TJB5/kG1dgv4P4RIhP4dn86y
	5EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ldSu0h4KcCxGgIMdqKHb9/hi9hgyfNjyuPvhEDG5gBY=;
	b=o3WSThLoIj4CK+0kVC+pVf/LY1hDyJQtWRXFtf696rWHg9ts1p1h0WEOfJTMAQi4T1
	VjeDi3k+rWSDhm9Nwac6T5CZaR9SfapORByelDuGHeEyIjN3/E+1PKAWUbl6yULiFF4M
	neIHErzeUooXSh5F55y0n4o9ErlywxTchHuBZuxxYb1Zc1TefZiIjO1yMIn73y8mIAgt
	By5u+7ayyvVzChR99XYKoa5m349C4mE8REYjwJCOI5/m+j5/K4vZhN19d93GsKzRcuBm
	59EPTPmMR0vd52vtTt4jKSYteRMXSaGZIOXwAtdj0xnY2NTfLp/RmO5ustL0JrWXYdfI
	RQGA==
X-Gm-Message-State: APjAAAXHfwkAjhlrRgweFN8jr1PEekF8Ml7wqYVd+4veVt1N4C3Xyqfv
	Ie+RSFEh6K77XCB9dx+5VagHlL1MWJGKKi3X6ThZEQ==
X-Google-Smtp-Source: APXvYqxpOE8HHBNukqoNZ/+x6WBwfMBrwPQ9LcHvaeJdq3qk9HxYm53AkXKA3t6uyt3lVcgFLLTkKdOdmYOP7JJVT70=
X-Received: by 2002:a02:b78e:: with SMTP id f14mr8776659jam.43.1554466717803; 
	Fri, 05 Apr 2019 05:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Apr 2019 13:18:26 +0100
Message-ID: <CAJTo0LbBw=vgL8h8_K0diPKf8-UXeEqRoCUjasM2u7R0onXuyA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/13] meson/gobject-introspection rework
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
X-List-Received-Date: Fri, 05 Apr 2019 12:18:37 -0000
Content-Type: text/plain; charset="UTF-8"

ERROR: gstreamer1.0-python-1.14.4-r0 do_configure: QA Issue:
gstreamer1.0-python: configure was passed unrecognised options:
--enable-introspection [unknown-configure-option]

