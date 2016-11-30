Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 321D471A96
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 15:17:30 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id q130so25015373qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 07:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GTZ4a33F+Id8qIi6PQwtbG5BMwM0syKh2v8v8N68EsQ=;
	b=fnomFKC5HoE9SWMfwzkR9AL16lhae1SivWlVmOeeQYbJGZ/0luWvfPJrMx8khpKQS1
	p4+685xsQh1aTe66j5bhPeF9Mz85J1ofIGmrvXO1qSTcaPqt4i/bu17WFEDA8xRxAhLL
	uBOyKaL0AaxDAQ8B9z+DWBi50HwyZ7fLOc+0VAovx2LdwlcM0V8pbw3TKP4Rjum7AIRZ
	M4zLg79gN/oBF3dQl8RrSU5Yk7hZrMhDfFM6MJjlQddANdioT/37fK8MLtN6qacdl+kr
	yd1qO+fspoEA8h4YRrKcIfyno0pff2IA2wLu29jj0SrFM8/l1YYCvIzWgsVe2MSzGLSf
	BItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GTZ4a33F+Id8qIi6PQwtbG5BMwM0syKh2v8v8N68EsQ=;
	b=lmJvF7FDDQfvRptsHlJDdQPOgA76rcEQgPS+EKGmNd/+aE3CDC8w+JkKwOvvDD/2vt
	Ag71dnjrXyQucR24xgRXqDjRLc4Sq+tn7/dV5+eaTDTtESDoc6XfB2Cin3CtO0zh5oXp
	PBxcB6IJaYsEdrjuwksAPqsdBps67u3k3MhF377vzeGcGYih+Une8Bh5J7u39PNqWQft
	sVOvPQ8HCW/dqcZAbWftK2wWeH2yeto/2+VmjRd9F65LxkDMAiXzYVE8UIf2axQblSpo
	1WuK/wKfeprXi2YpYLnaa6y7aSJWAwoBZYvpCZP8w+HulNC/QGjgh0+JwQYRjBP6G+kb
	5dnQ==
X-Gm-Message-State: AKaTC03goeOizaOU7sD6Cs43i7IOnPVeTZhA1JYx2I3VOi+rSk55Ml+Kxkf7pukpCZAbPlrklUzNaNl4QEBtkbmS
X-Received: by 10.55.39.88 with SMTP id n85mr28308644qkn.244.1480519051960;
	Wed, 30 Nov 2016 07:17:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 30 Nov 2016 07:17:11 -0800 (PST)
In-Reply-To: <20161130073953.18166-1-raj.khem@gmail.com>
References: <20161130073953.18166-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Nov 2016 15:17:11 +0000
Message-ID: <CAJTo0LYHeb28My6Ek5wBr-dv8budpprpXwZ84T5TYqW_Uj3SFQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Upgrade to 1.10.1
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
X-List-Received-Date: Wed, 30 Nov 2016 15:17:31 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b162d2ab80542863438

--94eb2c094b162d2ab80542863438
Content-Type: text/plain; charset=UTF-8

Breaks if built from a empty sysroot with wayland enabled:

gst-plugins-bad:
| make[3]: *** No rule to make target 'viewporter-protocol.c', needed by
'all'.  Stop.

Also rtsp-server gains various runtime dependencies on util-linux, can you
verify that these are expected and in the depends?

Ross

--94eb2c094b162d2ab80542863438
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Breaks if built from a empty sysroot with wayland enabled:=
<div><br></div><div>gst-plugins-bad:</div><div>| make[3]: *** No rule to ma=
ke target &#39;viewporter-protocol.c&#39;, needed by &#39;all&#39;.=C2=A0 S=
top.<br></div><div><br></div><div>Also rtsp-server gains various runtime de=
pendencies on util-linux, can you verify that these are expected and in the=
 depends?</div><div><br></div><div>Ross</div></div>

--94eb2c094b162d2ab80542863438--
