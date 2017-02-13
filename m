Return-Path: <patrick.ohly@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id BAE59731C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:24:18 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id w204so51644399oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 07:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=AEMGq5KQ3TJQPmJI58rrS9wbpr0C3NtjU9RcSKGhiGY=;
	b=0tf86BFHmasvu70CN1rzuOJHp3llsS2mVZ39JLHVgsWBqjEHYl4WtrtGjfkXbOLvbs
	atHrJEWOBUVrjYYkT4HxBOVa/BZK6+nRQ/RzR5ErwEe1MrpPCsoFDcJZtRO/gckEoUqj
	qWoAGFA8qYEpCgxxbDRJIdz0etCpLeTBv4jYYLUXKFBRC4JJflgn1cZZtoFU2ozEL/Nw
	oASaLuCJol8rJcAXB8UXzm1fFx+BLHmPcNdcTDdZMI+vWd3/AlC875PO5BZgOLLUOkvs
	7ChpxjA7HWOxnsKih2Mjkpc2Pb01RmVi4dtPuK7+nJ0aExVIi1UNgODdvt5FuJp74enm
	BpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=AEMGq5KQ3TJQPmJI58rrS9wbpr0C3NtjU9RcSKGhiGY=;
	b=VKwX20S3NWKVcPLeN0hic9vz3Ia11wbZFwBK5JTOcNyp7gUmQS0F/EhloNswrc7kf2
	rjXEXdBfIuRbgO54zycUuA/z+alR4dP4O7VCSK7TdGaIzmES62aiqPRyb8leVZvfBtof
	imG26sVaGdrYreFiVKv0lyHGWv0+WY2xAr1+KYPZDM26C6MQSqmvMFxIj2zFSbM87ngW
	ztP5PG6v6MOmD57vfwNZ9Dk3l//H6QnK4XFU3MvgSfS/jGGUmCKJp+qWcpP6gTNRBzId
	Q1VPfMuzgb2d3X4NF+IeSp0UqWFLlKF+bFAZkIv2W0uDV1O/Rj2B8foQvMbrwlqKeP5n
	3aYQ==
X-Gm-Message-State: AMke39mphUAKfDvnj6fIQdWlbafed8+WjNKZDimCKCYMbHz4bq+1sxp1bRXiDlrx55isg+G0
X-Received: by 10.107.146.139 with SMTP id u133mr23244255iod.173.1486999458801;
	Mon, 13 Feb 2017 07:24:18 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DB6A.dip0.t-ipconnect.de. [93.232.219.106])
	by smtp.gmail.com with ESMTPSA id 12sm1854146itl.31.2017.02.13.07.24.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 07:24:17 -0800 (PST)
Message-ID: <1486999455.13854.241.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 16:24:15 +0100
In-Reply-To: <CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 15:24:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-02-13 at 15:36 +0100, Martin Jansa wrote:
> Hi Andreas,
> 
> 
> I think it's feature which was already there, but almost never
> triggered (even in test-dependencies.sh tests), but with RSS it fails
> reliably.
> 
> 
> See:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124435.html

That's not quite the same, if I understand it correctly. In that email,
Richard was talking about "dependencies of that target are not needed
and not installed" and used "quilt-native" and "compiler/toolchain" as
example. In other words, if recipe foo DEPENDS on bar for getting foo
compiled, that dependency on bar gets ignored when installing "foo" into
the recipe specific sysroot because it shouldn't be needed anymore.

But the example here is a recipe foo which has a runtime dependency on
bar, so bar must be installed in addition to foo, otherwise foo will not
work.

This is where it gets tricky: do native recipes have RDEPENDS? They are
not getting packaged, so I suppose not. One could collect all RDEPENDS_*
values (regardless of the actual package), but that might be too broad
(for example, when "packaging" the native recipe wouldn't even produce
that package).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




