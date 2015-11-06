Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id DB59D73D46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 20:39:30 +0000 (UTC)
Received: by qkcl124 with SMTP id l124so49742768qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 12:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1PeB1eOEnwup1yGlne9aLFomPJSpfID1P361V+R1q+s=;
	b=ssYuBhGAC6mqjHFgyw55st7cakTt0zlA++9DvEIy15M/S0VNXlW7WvIPgOenIjqv11
	QfHF4P2BpZP8QTm4WL4UKzHvxvciDPesjM919TLmOn248fWIccTAR8lb23DxxVsb9W+U
	hwaaQ5wyq+ORVweN1k5sn1de1p9RINnOnXGhH4SSH6XlAfl/Il/GMJ6vDqJipCht90hA
	vd8Go3RBqOficMNqPiQyL5vN/NFCt0okPIIHGHjo8vpzIFgoXB3++TQ13nqnTspw32Bo
	5fI2+OkZYPIHtJrEvcDZLOdP6WDJf1M3py0OVewf7Zhzg9RgLSgGc4ha6HetfBTy1UOW
	ZPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1PeB1eOEnwup1yGlne9aLFomPJSpfID1P361V+R1q+s=;
	b=DRLn3FF5LfZFGyADW9rqnCPSHwK/zgdWONDFBkwCETteFqLxJBQuuzCuaYLOtj1cmf
	Hmg6opYN8EaFLs6Ow+x4aGLJf1BGB97VlAHfsQQ2c+bS5UDFN8bXzRT09jx8tG869SBu
	Bq+s9CkwE4rbmavIQudbv0WSSVYJtHwRO1gCR1dACKoP5L3oSz2D3AFNQzmMkmO8dBd+
	PPVNlXqp5KBOovu74A088SqWJSCaq/nncmtEpsE5F0JT1BdoFL0hkjnSkFgXNydwYebr
	sY5SbvNyu/Q4mHUIV/Wbx2NWp2VioZTCS9WUO2i/sOd8As+C+4wYR4quFmeXQN1CgXqb
	susQ==
X-Gm-Message-State: ALoCoQnfEutVdEGL4KVxnQUNhtqoXstiMYjsZyNuTGnnyRphaXnuincoJ+efLriO6gZ9qoRqSJvN
X-Received: by 10.55.73.144 with SMTP id w138mr15667355qka.104.1446842370747; 
	Fri, 06 Nov 2015 12:39:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Fri, 6 Nov 2015 12:39:11 -0800 (PST)
In-Reply-To: <824e863ff0a986c0c812f25fbe5bebcf060bde02.1446729162.git.jussi.kukkonen@intel.com>
References: <cover.1446729162.git.jussi.kukkonen@intel.com>
	<824e863ff0a986c0c812f25fbe5bebcf060bde02.1446729162.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Nov 2015 20:39:11 +0000
Message-ID: <CAJTo0LZqCNP+rQWdzr_piCrEjwkezPbo-tdw7pVG0jGsvR=uXg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] glib-2.0: Upgrade 2.44.1 -> 2.46.1
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
X-List-Received-Date: Fri, 06 Nov 2015 20:39:32 -0000
Content-Type: multipart/alternative; boundary=001a114a9f448e226f0523e53d10

--001a114a9f448e226f0523e53d10
Content-Type: text/plain; charset=UTF-8

On 5 November 2015 at 13:29, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> +data.gresource is not built when cross-compiling: Don't
> +add it to test_data in that case.
>

If we're building glib we've already built glib-native, so wouldn't it be
better to build the resources instead?

Ross

--001a114a9f448e226f0523e53d10
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2015 at 13:29, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":39=
r" class=3D"a3s" style=3D"overflow:hidden">+data.gresource is not built whe=
n cross-compiling: Don&#39;t<br>
+add it to test_data in that case.<br></div></blockquote></div><br>If we&#3=
9;re building glib we&#39;ve already built glib-native, so wouldn&#39;t it =
be better to build the resources instead?</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a9f448e226f0523e53d10--
