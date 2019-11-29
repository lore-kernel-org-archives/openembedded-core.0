Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
	[209.85.217.48])
	by mail.openembedded.org (Postfix) with ESMTP id A77597C37F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 21:28:29 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id t12so1405174vso.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 13:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EQyjss/5QIhYdGq5XLmrJtp6+VXrAZu/b6bxG+KMl7I=;
	b=D8xTFAWDO1tSRGxPaWTXeYUPysKy81tnSqtmil2ozycn1LyVKEX/6xqoH4bxDh3vGa
	cqhgohIRR3zXH4I5mBpWM5LpgOImlttRE9DG4CtJrqwdpajS5OQvMMYPF6NDiYkPYlU1
	IgakPeInDYV0OInBY0dLYJzJCVzQ88IZpS3V4ssu7JBedWn5LTwxe9cLbnE7M7ekKBOm
	SySQmE+4RlUszejk+X7s+vyqkUJUEfmsUxTAv1h/edcT11bw7eJkD57G5XOU4g1CU6Mk
	hh9uOzsFOLilJoinGJZ6fcN16Wo1ddlqquJVC9zZpB+L8W98x2DOuTRbnkKokIo6KADw
	i8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EQyjss/5QIhYdGq5XLmrJtp6+VXrAZu/b6bxG+KMl7I=;
	b=bmgOTzasE95Pdfm/StWnHp/GXHr1/RcifxLIIh7TUu1fle6/sHEL9t92wnJeFRXgR2
	mwV74uVP/xpCAzBwQjLnxBc5Q8Wxg9eqKLYDboZgVWZ6PN5ExamPm7eepbjzeM1mXQhj
	f2urglqZ5xDuYr5YVBWp1byOz4wvZQZ5VkUj4kecvx055ReVHpL9rgxgFw5bnZXbCwT1
	1ulUXC6c6qiezcyruFhpsCMimTuXwefihHht0FpdhRxLYtk+WMxoTPIZmlsNnhqpVnpB
	K1UUAtwn+JthYKTBEDYmGhtqjNrbsDhlBn5DMv4uP72T0PyXJYVCcpJ4ep9SDBXCFp/X
	3MrQ==
X-Gm-Message-State: APjAAAXBO9G3Q13KNFL2FFytFWRbkkiMac8fr44zJ61YRuWHA+5TRkvf
	bfKkn+meOOybTDtYulUA9FuyDtg4Sx054YVV/MM=
X-Google-Smtp-Source: APXvYqxitEAmlNkax8BASfrZlu+0eQZX+IqOztPtPb7/nKCoAJY6GW9Yks66zQHY+kUilbpocIedCBqciaLzO3dgt8E=
X-Received: by 2002:a67:ed88:: with SMTP id d8mr7633160vsp.35.1575062910474;
	Fri, 29 Nov 2019 13:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<1b6971c1-ce0d-5cda-862b-d0a84b5be20a@intel.com>
In-Reply-To: <1b6971c1-ce0d-5cda-862b-d0a84b5be20a@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Nov 2019 22:28:19 +0100
Message-ID: <CANNYZj-b0Ufwum+4vA5aqNm+=E+a+HM0vso=61UPERm57QrCDw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/15] rpm: upgrade to 4.15.1
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
X-List-Received-Date: Fri, 29 Nov 2019 21:28:29 -0000
Content-Type: multipart/alternative; boundary="000000000000472188059882e96b"

--000000000000472188059882e96b
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2019 at 21:52, Ross Burton <ross.burton@intel.com> wrote:

> This is reliably crashing for me when running rpmdeps:
>
> Exception: bb.process.ExecutionError: Execution of
> '/data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r29/temp/run.BUILDSPEC.1481'
>
> failed with exit code 139:
> Building target platforms: corei7_64-poky-linux
> Building for target corei7_64-poky-linux
> Processing files: systemd-compat-units-1.0-r29.corei7_64
> Processing files: systemd-compat-units-dbg-1.0-r29.corei7_64
> Processing files: systemd-compat-units-dev-1.0-r29.corei7_64
> Checking for unpackaged file(s):
> /data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r29/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/check-files
>
>
> /data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r29/package
> Segmentation fault (core dumped)
> WARNING: exit code 139 from a shell command.
>

Here it's been robust. Can you produce a backtrace?

Alex

--000000000000472188059882e96b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 29 Nov 2019 at 21:52, Ross Burton=
 &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">This is reliably crashing for me when running rpmdeps:<b=
r>
<br>
Exception: bb.process.ExecutionError: Execution of <br>
&#39;/data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1=
.0-r29/temp/run.BUILDSPEC.1481&#39; <br>
failed with exit code 139:<br>
Building target platforms: corei7_64-poky-linux<br>
Building for target corei7_64-poky-linux<br>
Processing files: systemd-compat-units-1.0-r29.corei7_64<br>
Processing files: systemd-compat-units-dbg-1.0-r29.corei7_64<br>
Processing files: systemd-compat-units-dev-1.0-r29.corei7_64<br>
Checking for unpackaged file(s): <br>
/data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r2=
9/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/check-files <br>
/data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r2=
9/package<br>
Segmentation fault (core dumped)<br>
WARNING: exit code 139 from a shell command.<br></blockquote><div><br></div=
><div>Here it&#39;s been robust. Can you produce a backtrace?</div><div><br=
></div><div>Alex<br></div></div></div>

--000000000000472188059882e96b--
