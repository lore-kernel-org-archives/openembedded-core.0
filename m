Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2B98460088
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 23:41:09 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b14so145698065wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 15:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=w5eO16ZoUyK783rbw8qRD+KdmkUafAAd8RRfcflHQas=;
	b=wVfPW2TaZ09YahJAGC/Iad+DqlQsx6QkhkGXpkJZrKxcQMFF6EqpUeFghzn+v1uNOI
	CU3BKG48ani2oy7F0+nkUjvTpDFg+Sg7pzy4pLCjEY3oBdHg/0M+l4rz0tVOzpSxNkoF
	XzWYm7vRDvtynIXSDmoY+faQSOUMNXA7OIdbQ2ZgeQJvkuxKVkqyrA6afta3boVz2U0x
	vJEXekz2uhKRA1PHuzMeuwj4WZFAPHluxRjcH0koNbT8VZBLsOLCKtBU4xHFWwp0B4yN
	eRa3k/xS7UDE2wMLSmUjDun+yHS9alRugV2KZjBZLOpUxv77wny1QMgTfJhxCq/fq/aD
	l/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:mime-version:content-transfer-encoding;
	bh=w5eO16ZoUyK783rbw8qRD+KdmkUafAAd8RRfcflHQas=;
	b=Dibk/HIjnEX6Xnl2JWkYCk789/HsGr2DoIjWRQJGDoI3XStHGjG25AljMHRy2W1K/o
	KdFvT2ctBEjOSh1KWsxk9svW8CCzP299NQsbUkXXXuXVXZFO/l1GWH8iiWNxxgyoShQt
	YuaD5nYBVWt9KZJI0HaVCdptMDR1KwZOBL874CWqnry+BlNrW2Iddu5X2lR8AWuiB3Og
	+bjsHM9n0LwpX8jRB+UX65nQvYIX9Vzto7XTodkOUh9OsNAFQ28k9AO+BjoOPBkPogTQ
	NLvvIU3NuO2vSjkjgrPe7WvtinAcHtw1xKxtAnD3HeJqFNUzyr1bJLqqWWSs4pypk4kB
	hJFQ==
X-Gm-Message-State: ALoCoQlJ3e2pMpcqAMm3tkgr1PwXwR16tvszofjpdAHiLxBQ7Idwlk5G3n0UFKPABMdrWjpgn5GzpUq4VDrdhWpVbEsjpGrd3g==
X-Received: by 10.194.123.167 with SMTP id mb7mr31809454wjb.0.1453160469517;
	Mon, 18 Jan 2016 15:41:09 -0800 (PST)
Received: from Saturn.local.all (212-41-124-249.adsl.solnet.ch.
	[212.41.124.249]) by smtp.gmail.com with ESMTPSA id
	cv10sm25747696wjb.17.2016.01.18.15.41.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 15:41:08 -0800 (PST)
Message-ID: <1453160467.2577.15.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Tue, 19 Jan 2016 00:41:07 +0100
In-Reply-To: <CABcZANnHb700FZynO=aTXmzcJ-1k2S_v7hWXDGeL96mc427kJg@mail.gmail.com>
References: <CALbNGRTiMGfhtvtt+q_SFsKMpMMP-Y7XKQHUc2upqTNXnYrEmA@mail.gmail.com>
	<1448017370.2788.16.camel@Saturn.local.all>
	<CABcZANnHb700FZynO=aTXmzcJ-1k2S_v7hWXDGeL96mc427kJg@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Lots of [host-user-contaminated] warning
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
X-List-Received-Date: Mon, 18 Jan 2016 23:41:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Am Sonntag, den 17.01.2016, 19:55 -0700 schrieb Christopher Larson:
> On Fri, Nov 20, 2015 at 4:02 AM, Max Krummenacher <
> max.oss.09@gmail.com>
> wrote:
> 
> > Am Dienstag, den 17.11.2015, 09:46 +0100 schrieb Andreas Müller:
> > > Hi,
> > > 
> > > this bugs me for a while and I wonder if I am again the only one
> > > facing this: I get floods of warnings for sourcecode files as
> > > 
> > > WARNING: QA Issue: qtserialport:
> > > /qtserialport-dbg/usr/src/debug/qtserialport/5.5.99+5.6.0-alpha1
> > +gitAUTOINC+2575d33fab-r0/git/src/serialport/qserialport_p.h
> > > is owned by uid 1000, which is the same as the user running
> > > bitbake.
> > > This may be due to host contamination [host-user-contaminated]
> > > WARNING: QA Issue: qtx11extras:
> > > /qtx11extras-dbg/usr/src/debug/qtx11extras/5.5.99+5.6.0-alpha1
> > +gitAUTOINC+d64ee96f0d-r0/git/src/x11extras/qx11info_x11.cpp
> > > is owned by uid 1000, which is the same as the user running
> > > bitbake.
> > > This may be due to host contamination [host-user-contaminated]
> > > WARNING: QA Issue: qtxmlpatterns:
> > > /qtxmlpatterns-dbg/usr/src/debug/qtxmlpatterns/5.5.99+5.6.0
> > > -alpha1
> > +gitAUTOINC+94136d4280
> > -r0/git/src/xmlpatterns/type/qbuiltintypes.cpp
> > > is owned by uid 1000, which is the same as the user running
> > > bitbake.
> > > This may be due to host contamination [host-user-contaminated]
> > > 
> > > I checked PACKAGE_DEBUG_SPLIT_STYLE is not set globally - few
> > > recipes
> > > set PACKAGE_DEBUG_SPLIT_STYLE to debug-without-src.
> > > 
> > > Help appreciated
> > > 
> > > Andreas
> > 
> > I see this also in my builds. The warnings clutter the build output
> > in a
> > way that makes the warnings mostly useless. Who will spot the one
> > important new warning in the hundreds of host-user-contaminated
> > ones?
> > A fresh build of core-image-minimal today gave me 54 of these
> > warnings.
> > All but one (glibc-locale) complaining on source files.
> > 
> > I checked a few recipes and most of them were not even using a
> > custom
> > do_install but autotools generated 'make install' with something
> > like
> > 'cp -p src/* dest/' or so.
> > 
> 
> Yes, this is the most common case. Usage of cp -a or cp -p means the
> build
> ownership is retained, and no chown is run to fix it.
> 
> 
> > Even if I know how to do it I think we should not patch upstream
> > sources
> > to suppress a warning introduced by the downstream build system
> > with
> > loads of false positives and then have to maintain the patches as
> > upstream is progressing.
> > 
> 
> Either we're calling the upstream buildsystem and not running cp
> directly,
> in which case it's a bug in the upstream buildsystem, since make
> install
> will result in non-deterministic behavior in the ownership of the
> installed
> files, or it's a cp -a case, which doesn't require altering upstream
> with a
> patch at all, only recipe modification.
> 
> 
> > I haven't looked into how one does it but I'm inclined to switch of
> > the
> > warning globally, e.g. in local.conf.
> 
> 
> Blindly disabling them will just result in ignoring a problem. Files
> in the
> target filesystem are owned by your build user, who most likely
> doesn't
> even exist on target.

Don't you get me wrong, fixing the issues are a good plan. My point is
that currently there are so many [host-user-contaminated] warnings,
more or less all with -dbg packages, that I fear to overlook a warning
which is more likely to indicate a bug that is going haunt me.

Regards
Max

