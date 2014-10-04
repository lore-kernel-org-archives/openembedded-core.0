Return-Path: <mgloff@emacinc.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1888B65E1A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Oct 2014 18:00:57 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id rl12so1389505iec.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Oct 2014 11:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=9BNCFmsJAdu91RSsKlb3FSS/SBFVAx++Ld9mtJYBISY=;
	b=bKyCpWnGT2wDo8ZZwmUzHedW77CLoSPOY3uaJmsv71yoaiOAoKTEvk0qc9V2xuuK5k
	3X0WEGKkMqp+mX2vE66mrgVqxAcc4Lcx63TVPxUKCfrrFlJsrGga5jT07hxBteqXMRRM
	Zk0QpJQV0ABvsyOZDEk2CA8v1IUKmBWm+Z5XYpw4dURrUHCPP+2asH93Y8o436/DkFy6
	gngyuFLLcmgTPZd4Z6bqN/1YttfMgwZYiP0n3c7dU7b0dWts46pSmFRqxIq4A6mSSRty
	DRaQ5npwBns13U+gzeNTDSsrLa6YGFveCLqWpV0WmG2zW21Q6wsEchMYL/zBq4TEWB3r
	OA1A==
X-Gm-Message-State: ALoCoQnIm9bUvvSqRO709fEVBbpiAn16U37NjsqpluiVKTUAtMuPea/Ph9bIRX1dbXI/QsLhGCPF
MIME-Version: 1.0
X-Received: by 10.50.61.243 with SMTP id t19mr7792339igr.41.1412445657995;
	Sat, 04 Oct 2014 11:00:57 -0700 (PDT)
Received: by 10.107.157.8 with HTTP; Sat, 4 Oct 2014 11:00:57 -0700 (PDT)
Date: Sat, 4 Oct 2014 13:00:57 -0500
Message-ID: <CALXw4G59Kqjxo0RVmMVZzKztnjYd5XdZuGmaaEdNB42sJ2+f-g@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Subject: Busybox/RFKILL
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
X-List-Received-Date: Sat, 04 Oct 2014 18:01:07 -0000
Content-Type: multipart/alternative; boundary=047d7bdc0a4eb5ce3a05049ca172

--047d7bdc0a4eb5ce3a05049ca172
Content-Type: text/plain; charset=UTF-8

All,
I've run into a slight issue that when I enable RFKILL in busybox config,
my config gets overwritten by busybox.inc. I do not have wifi in
DISTRO_FEATURES. I believe that

busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'wifi', True, False, d),
'CONFIG_RFKILL', cnf, rem)

is not performing as intended and am unsure how to fix. I've tried a couple
of variations, but wound up just commenting it out for my local builds.

Basically, rfkill does not get configured in unless you have wifi
DISRO_FEATURES.


Michael Gloff

--047d7bdc0a4eb5ce3a05049ca172
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>All,<br></div>I&#39;ve run into a slight is=
sue that when I enable RFKILL in busybox config, my config gets overwritten=
 by busybox.inc. I do not have wifi in DISTRO_FEATURES. I believe that <br>=
<br>busybox_cfg(bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wifi&#39;=
, True, False, d), &#39;CONFIG_RFKILL&#39;, cnf, rem)<br><br></div>is not p=
erforming as intended and am unsure how to fix. I&#39;ve tried a couple of =
variations, but wound up just commenting it out for my local builds. <br><b=
r>Basically, rfkill does not get configured in unless you have wifi DISRO_F=
EATURES.<br><br><br></div>Michael Gloff<br></div>

--047d7bdc0a4eb5ce3a05049ca172--
