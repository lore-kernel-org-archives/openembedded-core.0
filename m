Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id C47D8769F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:21:40 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160818162131368_0685;
	Thu, 18 Aug 2016 09:21:31 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=26535 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1baQ6F-0003Ir-VX; Thu, 18 Aug 2016 12:23:24 -0400
Date: Thu, 18 Aug 2016 12:21:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: =?ISO-8859-15?Q?Andr=E9_Draszik?= <git@andred.net>
In-Reply-To: <20160818161503.20738-4-git@andred.net>
Message-ID: <alpine.LFD.2.20.1608181216420.30892@ca624034.mitel.com>
References: <20160818161503.20738-1-git@andred.net>
	<20160818161503.20738-4-git@andred.net>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gettext_0.16.1: whitespace changes to align with v0.19.8.1
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
X-List-Received-Date: Thu, 18 Aug 2016 16:21:41 -0000
Content-Type: multipart/mixed;
	BOUNDARY="2071690107-1080945671-1471537281=:30892"

--2071690107-1080945671-1471537281=:30892
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 18 Aug 2016, André Draszik wrote:

> +LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "

  i'm not a big fan of doing the above; that is, adding *both* leading
and trailing space to a string, just to play it safe. i know it
doesn't hurt, but it's sloppy and might actually conceal incorrect
string values elsewhere.

  if you're "_append"ing, then the string should have only a leading
space; if you're "_prepend"ing, then only a trailing space. the reason
for that is that, if you're rigorous like that, you might actually
catch a string that *doesn't* have the appropriate spaces, but is
getting away with it only because a string elsewhere is being generous
and covering for it.

  and, yes, i *am* that pedantic.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--2071690107-1080945671-1471537281=:30892--
