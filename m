Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id C34B678344
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 10:32:05 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id m47so56486780iti.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=4iErDgOCb+70gO9QS34YzGLdbL8pnRU/6KH677bJ0yQ=;
	b=tfu/vgI5BTRkWW8mkprAPCMYhK85pQA55In3736QOlAXRq3vCzrgIMt/mG9gCZYLec
	wIhHD8CbFQcBnskwwLIr93kEfnswYNBul0uTbuFfk9O5pTioAJ5kpGKyM7iKhoBNHOM6
	+A0n8WMMRplf+86nmTJ5RHxQK+VWLlT3yC5nlf7eKRoENDzb6PoniubfPy4O9jBqiJ2q
	HYkz6tz2gHsN366Qe/l3xHOvVt4Cs7kVJ0htQJFohkGJwqBD4eJd/AIXZe9/qa9Ym50V
	3OTwWC0EMwZpY6JCHaO4St1ui6hUUVcQurmsmwgffoWMxNCc0KpTNB4kYsXFCwrZVzDf
	E7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=4iErDgOCb+70gO9QS34YzGLdbL8pnRU/6KH677bJ0yQ=;
	b=INXx5GMy7jAdMBjPq2EfVpV+nx02cvoNfKRP7FVcdOw1mdHpfLQkyL8xPLgD/5qlUN
	TkW390Xp80YOOIUVz6HgSgaaE/yUGBXFRc+XxN6ZfsNLttl/djX9noZLqYsO6ydVrdNG
	Wc+RnEU146jN5gBzwmPLMPh0hcIvDWakxs/KmhDAaxcYBclKTOSLrz3KEVvcj7EmcQL+
	HzDJjl9DByC4TzVz1pnttMF0YoW22eEwK5IBbDfeuSZ7+Up1w2tPOIxPcTv9SIQDGHS0
	7jCsBJmKuUlicITOPo6GsXR1Thbua6jN92HL/TYE+us0bXjU3CMKJbGVPxHOn4/GgraG
	LzeA==
X-Gm-Message-State: AKS2vOzfMsGkxvI3l0ZZKC9bCCYe0BYzb7HS9ZpkrHHgMI5fxiCRdyY3
	0K/+T0S5bRLOuJmA
X-Received: by 10.36.103.143 with SMTP id u137mr464858itc.118.1497436326483;
	Wed, 14 Jun 2017 03:32:06 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E312.dip0.t-ipconnect.de. [93.232.227.18])
	by smtp.gmail.com with ESMTPSA id x29sm180351ioi.14.2017.06.14.03.32.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 03:32:05 -0700 (PDT)
Message-ID: <1497436322.30163.375.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Wed, 14 Jun 2017 12:32:02 +0200
In-Reply-To: <1497338044.30163.324.camel@intel.com>
References: <cover.85d08ae286e0b2f8503f9e657148201e6b90edde.1497013310.git-series.patrick.ohly@intel.com>
	<9dfd9eff13b3831c7e88c97318f97d2daeac9a78.1497013310.git-series.patrick.ohly@intel.com>
	<20170612194635.GX28053@denix.org>
	<1497301519.30163.288.camel@intel.com>
	<20170612232345.GA28053@denix.org>
	<1497338044.30163.324.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] bitbake.conf: DISTRO_FEATURES as overrides
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
X-List-Received-Date: Wed, 14 Jun 2017 10:32:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-13 at 09:14 +0200, Patrick Ohly wrote:
> On Mon, 2017-06-12 at 19:23 -0400, Denys Dmytriyenko wrote:
> > On Mon, Jun 12, 2017 at 11:05:19PM +0200, Patrick Ohly wrote:
> > > On Mon, 2017-06-12 at 15:46 -0400, Denys Dmytriyenko wrote:
> > > > This now breaks parsing my distro config on these lines:
> > > > 
> > > > ENABLE_SYSVINIT ?= "0"
> > > > DISTRO_FEATURES_append = "${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)}"
> > > > 
> > > > 
> > > > Here's the log:
> > > > 
> > > > ERROR: Unable to parse /OE/arago-master/sources/bitbake/lib/bb/data_smart.py
> > > > Traceback (most recent call last):
> > > >   File "/OE/arago-master/sources/bitbake/lib/bb/data_smart.py", line 426, in DataSmart.expandWithRefs(s='${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)}', varname='DISTRO_FEATURES_append'):
> > > >                  except Exception as exc:
> > > >     >                raise ExpansionError(varname, s, exc) from exc
> > > >      
> > > > bb.data_smart.ExpansionError: Failure expanding variable DISTRO_FEATURES_append, expression was ${@base_conditional("ENABLE_SYSVINIT", "1", "", " systemd", d)} which triggered exception NameError: name 'base_conditional' is not defined
> > > 
> > > base_conditional() seems to come from utils.bbclass, which gets
> > > inherited by base.bbclass. Looks like DISTRO_FEATURES and thus this
> > > DISTRO_FEATURES_append end up getting expanded before these classes are
> > > fully parsed.
> > 
> > FWIW, replacing it with oe.utils.conditional() doesn't help.
> 
> How about the following patch? It solves the problem for me.

Richard had concerns about rewriting OVERRIDES in an event handler,
therefore we agreed to use the .bbclass approach that I originally
started with. I'm still testing that in refkit (blocked by trying to
move towards bleeding edge OE-core master-next, on which my patch was
based), but it should be ready at least for OE-core master-next, so I'll
post it now.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




