Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SDSWC-0006Hs-Qg
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 05:28:53 +0200
Received: by pbcum15 with SMTP id um15so959527pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 20:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to
	:x-mailer:x-gm-message-state:content-type:content-transfer-encoding;
	bh=IXxctz+GRwiFIMjMboaT6vxZFSL6b1zpHE49T3K3cfs=;
	b=eq2tLjJLcJmsKevi4hhqF+EE1QwZuh6d/VhUhuesllyNsSEJkNTJcfrWEFzy+NimjZ
	ojrd26jHG86DrswAeR59AevwRrBaKAjAqr4qWXgmmZmUKVsIrQ+2QrBTYU7FJOO3gnhO
	FMr/3c1cD4TfqKLwAnThbyFxbpUQKLBw7JbDDTLR5EjPum/ohUvII3b3tWEuxwFsEiik
	qOTpDbfQ61gWw9O7oalgYpO62UaTSCsqbT9HO96hXCtJmVIBKF5D3dOJGEpFGuTklNPx
	gXNV4jzRZwaaumZMrztLQ8zOFCH/sbHbSsRbZkrFaMNQtlyxwkfEHwexAnLSVEupwFxi
	Z8LA==
Received: by 10.68.189.166 with SMTP id gj6mr5209860pbc.140.1333077587840;
	Thu, 29 Mar 2012 20:19:47 -0700 (PDT)
Received: from [192.168.1.30] (adsl-63-193-31-6.dsl.snfc21.pacbell.net.
	[63.193.31.6])
	by mx.google.com with ESMTPS id n8sm2093847pba.20.2012.03.29.20.19.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Mar 2012 20:19:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1333055971.18082.27.camel@ted>
Date: Thu, 29 Mar 2012 20:19:26 -0700
Message-Id: <728CD38D-BB84-4615-818F-F74C70BE13BA@dominion.thruhere.net>
References: <1333032004-16287-1-git-send-email-gary@mlbassoc.com>
	<1333055971.18082.27.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk/5fjZvizgjIy3TEvMkWOm3318CoHEujfDJr7Fd3QGFy+SvN1cDESB6XDLv2sOlfRDOFln
Subject: Re: [PATCH] gstreamer: Provide easy way to enable runtime debugging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 03:28:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 mrt. 2012, om 14:19 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-03-29 at 08:40 -0600, Gary Thomas wrote:
>> The gstreamer framework has a very useful debugging setup which is
>> essential for debugging pipelines and plugins.  This patch makes
>> it simple to enable this (disabled by default).  To enable debugging,
>> just add this line to local.conf
>>  GSTREAMER_DEBUG =3D "--enable-debug"
>>=20
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> ---
>> .../gstreamer/gst-ffmpeg_0.10.13.bb                |    3 ++-
>> meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    3 ++-
>> meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    3 ++-
>> .../gstreamer/gstreamer_0.10.36.bb                 |    3 ++-
>> 4 files changed, 8 insertions(+), 4 deletions(-)
>=20
> Merged to master, thanks.

Awesome, more magic variables. Where's the matching documentation for =
this one? And why isn't this using PACKAGE_CONFIG?=


