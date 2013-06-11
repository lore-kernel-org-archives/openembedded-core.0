Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id D97CA6A990
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 17:11:48 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so3394242pab.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 10:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=pIeT2RI8WDHeE9N4K/Y+QYSpqWtIjY9rMVrPotEeCCs=;
	b=V9QKh6Vu0l0f6ynUIgJUtemq3yOXiqS95uTIWpLL0Ic75cdf1ignkvmyotA6QjOsS8
	dxqh4wPzHuUd48rp50ZdGXxjVopjzQIlSF6IsDqbsDYPHeADU38aNAtxYkfqtp9ukfjr
	6sF6GvCVFdSU/9DcQb4EEE4AZLh8quWLOmM6RGwxwX9ThMWTwygCc4S6mSD6Q1HfezfL
	7rgHqwKuHDUdVVvXj9ZOYVOP+MEiE84xtLXBoEoA2uMcchQOI/r8zt6uSHdT8/ypb91C
	X124R1kZhg+K3w7vH77cn2jxV4cbGyfy8Z/Nix0gSLesSIx1XbujRS6d6qojqkTvCjRu
	71oA==
X-Received: by 10.68.41.106 with SMTP id e10mr6458737pbl.136.1370970710008;
	Tue, 11 Jun 2013 10:11:50 -0700 (PDT)
Received: from sa-nc-common3-188.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id iq6sm10057153pbc.1.2013.06.11.10.11.48
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 10:11:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51B74CAA.9060203@windriver.com>
Date: Tue, 11 Jun 2013 10:11:46 -0700
Message-Id: <2CF72E14-1BCC-4CCC-8F98-8818788D95DA@gmail.com>
References: <1370015746-22465-1-git-send-email-mark.hatle@windriver.com>
	<7FC71AE1-8B85-4A2C-8E5D-A8A29DF05193@gmail.com>
	<51B74CAA.9060203@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] gcc: add build directory to include directories
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
X-List-Received-Date: Tue, 11 Jun 2013 17:11:49 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jun 11, 2013, at 9:13 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:

>> what happens if you use --disable-libunwind-exceptions
>=20
> As far as I know we have not tried that.  Doesn't this change some of =
the processing though for systems that use unwind as the only way to =
generate proper back traces?


we already disable it for gcc-runtime and libgcc recipes where it would =
matter too.=

