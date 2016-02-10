Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7EEA76E630
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 16:00:41 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id ik10so17479071igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 08:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zaxQdRmKVlr9rgQluXke0Qr+rGZYDFoqORizJjJDel4=;
	b=i8F780ISlV+Q+enWUp+h0L3YAm+ObPR4z+SaVHJjbcEjPBYQcqYkVUnguFyLNMb4dd
	gsEMYuyAg8xdevz03G7AVo4i/lzmOKorznB2D9BTJ3R/ncq68Ppa8mZ/vufKedPIhflO
	uF88MQyqpswoPArZJT7mpZuLzgBfYzjvI65/cT+fbhfghb64F85Ch5ZHJnI7Q3JuzBWf
	+gL/sRshkqJQaVcQuPpNEcoOrzLsdnOJcWi5M884TImhu4E7O2lnehFteIUbrqXbCyp0
	aHRVjtaASEPogUh3iSJRHDJ5b4i/J1/pAU8HzbvNHwvkdvWDWbAHOXcK4pOWAxqP/KrI
	Lk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zaxQdRmKVlr9rgQluXke0Qr+rGZYDFoqORizJjJDel4=;
	b=GNeJGS692U2Odt/HlzcEQ7RwSVuXreSoTQuo8fkL2EO65ZQrgbDXPra8npFH74XvoG
	f/b/ewSGOSSbhKj5k+Xakag8I/n/oR0kB5xl1z7PpCzg1qrma8RSs1O9IQl3eDde+VVx
	Kd29cpNbLK6lcgSAZ0Eynx6odOJqCMayE7Q2lq8utQ7saCVoLX0t6JeEqRQBWAuaitNE
	VswvRjozIWiheWw5z7NLJ28FWqLD6IRk2ldwhsoMhzsw1Vm34XiF0+DaEJkvysy1su90
	DhpZgZNf5xiRsJaHvc6JfGXwAgVbHlGWhVmiPu+wAUKJOiq2TkjkKVqbqvA2vYyeHU5F
	lm2A==
X-Gm-Message-State: AG10YORhb8FIjwMdGrkNI0vYf3fsBQLzniJzszw9+JV9OhY0iVJFlWfqSyI5mpqgxKqr3hUaNJNraf0gSkDNj2yL
X-Received: by 10.50.160.7 with SMTP id xg7mr10144869igb.64.1455120041811;
	Wed, 10 Feb 2016 08:00:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 10 Feb 2016 08:00:22 -0800 (PST)
In-Reply-To: <CAHiDW_FsnjAnXJrjAdow+kfT7Bk12+W5ZE4_TB0V3ui2Oc-csQ@mail.gmail.com>
References: <cover.1448455166.git.jussi.kukkonen@intel.com>
	<b23c413682080d988bd163c6df0f439cd41ae7ad.1448455166.git.jussi.kukkonen@intel.com>
	<CAHiDW_FsnjAnXJrjAdow+kfT7Bk12+W5ZE4_TB0V3ui2Oc-csQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Feb 2016 16:00:22 +0000
Message-ID: <CAJTo0LZ=a3-1gUS5-32jbqVvKfWYhAt7ziNhDaM-_=7N4beT7Q@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] connman-gnome: rrecommend connman, don't rdepend
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
X-List-Received-Date: Wed, 10 Feb 2016 16:00:41 -0000
Content-Type: multipart/alternative; boundary=001a11339de832c217052b6c8904

--001a11339de832c217052b6c8904
Content-Type: text/plain; charset=UTF-8

On 10 February 2016 at 12:31, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> Ping? Please let me know if this was not actually a good idea.
>

Entirely my fault for the patch falling off page 1 of my mailbox.  Staged
locally, thanks.

Ross

--001a11339de832c217052b6c8904
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 February 2016 at 12:31, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"=
gmail_extra">Ping? Please let me know if this was not actually a good idea.=
</div><span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_ex=
tra"></div></font></span></blockquote></div><br>Entirely my fault for the p=
atch falling off page 1 of my mailbox.=C2=A0 Staged locally, thanks.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a11339de832c217052b6c8904--
