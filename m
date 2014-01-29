Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4146C6E9AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 14:44:22 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so3745110wgg.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 06:44:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
	:references:subject:mime-version:content-type;
	bh=n23e68Dmj5fhf6r7QT0x57LwfvFJt+Q/C9FqGvPfceE=;
	b=SuNkld9Y6APxohKsnJ4GxIFSoYqBzYblgCthrD1U48Gro4dFFi13AsboA7eoAiJ0u/
	j3rdJTW2qy2FHSSNozc+qS89hoYKxiHy6vNiX20sn8ErJDUr9IZuoC4Heububm93mwy+
	RRFihT/5Vhx5RfQeOEpp2v0fl1CDrO/hmlDGrdm8epzqZ8bby4316o/bVcL3t8Dvh5AA
	NgC64YW5g8beioxFRoAPLpo79nakomgRV1TRqg2S7K+r/jEffLmIf5bKbPbo0d5hbTaZ
	N8J66/1Ly0OpkL730aA8eb+U8VphALLscaMt8RvH7u+kVKpNFX/LE4+pZVX+Eps6Ljpu
	37fg==
X-Gm-Message-State: ALoCoQnoglWFzJHzKobFRQ08SHeV2Gvquz7nQTwfdbTpP1lCUV2IHg9xnosMp//iKPI2IY/+ySKk
X-Received: by 10.195.13.234 with SMTP id fb10mr1749829wjd.50.1391006662829;
	Wed, 29 Jan 2014 06:44:22 -0800 (PST)
Received: from blackadder.local (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f7sm5349825wjb.7.2014.01.29.06.44.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Jan 2014 06:44:22 -0800 (PST)
Date: Wed, 29 Jan 2014 14:44:19 +0000
From: Ross Burton <ross.burton@intel.com>
To: ulf@emagii.com
Message-ID: <etPan.52e913c4.3d1b58ba.1e2d@blackadder.local>
In-Reply-To: <52E902E4.1040607@emagii.com>
References: <1390833588.17424.254.camel@ted>
	<BEFD196E-8595-4DD1-BEAD-0183FBB61D55@dominion.thruhere.net>
	<52E8EF66.5040609@emagii.com> <1391000162.24655.67.camel@ted>
	<52E902E4.1040607@emagii.com>
X-Mailer: Airmail (223)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Wed, 29 Jan 2014 14:44:22 -0000
Content-Type: multipart/alternative; boundary="52e913c4_507ed7ab_1e2d"

--52e913c4_507ed7ab_1e2d
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

webkit, node are also not running in parallell in later part of the build=
=C2=A0
WebKit does parallel builds internally so what you=E2=80=99re seeing here=
 is everything that doesn=E2=80=99t depend on webkit has finished, so the=
 remaining tasks are blocking on the webkit build.

Ross

--=C2=A0
Ross Burton
Open Source Technology Centre
Intel Corporation

--52e913c4_507ed7ab_1e2d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html><head><style>body=7Bfont-family:Helvetica,Arial;font-size:13px=7D</=
style></head><body style=3D=22word-wrap: break-word; -webkit-nbsp-mode: s=
pace; -webkit-line-break: after-white-space;=22><div id=3D=22bloop=5Fcust=
omfont=22 style=3D=22font-family:Helvetica,Arial;font-size:13px; color: r=
gba(0,0,0,1.0); margin: 0px; line-height: auto;=22></div><div><blockquote=
 type=3D=22cite=22 class=3D=22clean=5Fbq=22 style=3D=22font-family: Helve=
tica, Arial; font-size: 13px; font-style: normal; font-variant: normal; f=
ont-weight: normal; letter-spacing: normal; line-height: normal; orphans:=
 auto; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; background-color: rgb(255, 255, 255);=22><span><div><span style=3D=22=
color: rgb(0, 0, 0); font-family: helvetica; font-size: 13px; font-style:=
 normal; font-variant: normal; font-weight: normal; letter-spacing: norma=
l; line-height: normal; orphans: auto; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; widows: auto; word-spacing:=
 0px; -webkit-text-stroke-width: 0px; float: none; display: inline =21imp=
ortant;=22>webkit, node are also not running in parallell in later part o=
f the build<span class=3D=22Apple-converted-space=22>&nbsp;</span></span>=
</div></span></blockquote></div><p>WebKit does parallel builds internally=
 so what you=E2=80=99re seeing here is everything that doesn=E2=80=99t de=
pend on webkit has finished, so the remaining tasks are blocking on the w=
ebkit build.</p><p>Ross</p> <div id=3D=22bloop=5Fsign=5F13910065796531200=
00=22 class=3D=22bloop=5Fsign=22><div style=3D=22font-family:helvetica,ar=
ial;font-size:13px=22>--&nbsp;<br>Ross Burton</div><div style=3D=22font-f=
amily:helvetica,arial;font-size:13px=22><span style=3D=22font-family: hel=
vetica; line-height: normal;=22>Open Source Technology Centre</span></div=
><div style=3D=22font-family:helvetica,arial;font-size:13px=22><span styl=
e=3D=22font-family: helvetica; line-height: normal;=22>Intel Corporation<=
/span></div></div></body></html>

--52e913c4_507ed7ab_1e2d--
