Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id C842671AB9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 10:22:27 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id l15so12984186iol.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 03:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5DXjGx0pxamV4PA3dpxi9lVwm5pty3kxCAzC7xXz3EA=;
	b=bVGrV7o46yhauj+EudDzZOfaBFoD2k4Ha3ZAHjJQi9RXYAaiTKGwNvQ2SHmvv1t8jU
	A4WT7u5PrKLZ94JlXjwxk4nmxqmGorxXpgw9LEGN1f8ju7Qnhe8gcR83kCLD4yX7jHcs
	2XWjmHphbsnl/DJh51o/nDjUTHXsUkaBzIoHBm0WQ8BSXBgPjawUOSwUbNGQ3y0EMYfK
	EHhUaIyz1cUYnEDjCfJlkROpxSMXQjOlcm9JvNy7MDtkCLjJFvGbBwStgcHO7f8e1m3a
	GC0PHRI5MFlACWK6XTLhYxKcA41UeTLFlnXJ6/7kROT3fm+OSzfF98L7FuKrg394zFyD
	dJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5DXjGx0pxamV4PA3dpxi9lVwm5pty3kxCAzC7xXz3EA=;
	b=qFZFEdeqEAz/Zvv+J6rqh7U18B0mah6LRgxdHUKY3mziYwjk5PDVMJjXOQ/6p7AtHK
	kUFxR75HrLx7YDDlf6tD0Oilmg4VZvVwCdNA5Fb9iOQ/+Pw1CikmtxDrPKAWOipCPkAo
	MGvmfroIpz03Si4Nh0EToop5YFNgM1hZvCcDPOWXoWRJYdIh/TQHctlptD0w2mljeHbm
	vwWEYbG6i/2WqshjjFunJYf3nn21COH6tHW9S5Jj4zig3dXs0PLuSWFvh9xXV9+vyr7A
	5pAjKKryp4rys4UlTRD95tx3ONxhEPSdIunBmlem5AwyOXHUENj8B89K2QlFRSbyXe7T
	nCFQ==
X-Gm-Message-State: AMCzsaWw34/+rlHyLdBGd5YmNmhhBrqGdXNeWdHMgynBJ1KEVHpLglWj
	Q62KHACJZHB0KfPUhDF2u3gW5VFIpjmLBuXKhPeLug==
X-Google-Smtp-Source: AOwi7QDRfzOwjw9UAFG18sgI+WggVAq4zSGm5E7cuC/uZTU8myL41E/mc9EMDDMcdChME3Fj7RrmEV9r9nkkQA8eoHM=
X-Received: by 10.107.164.28 with SMTP id n28mr34901558ioe.175.1507198948909; 
	Thu, 05 Oct 2017 03:22:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.59.22 with HTTP; Thu, 5 Oct 2017 03:22:08 -0700 (PDT)
In-Reply-To: <1507175286-8225-1-git-send-email-liu.ming50@gmail.com>
References: <1507175286-8225-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Oct 2017 11:22:08 +0100
Message-ID: <CAJTo0LZ0oanPjJSh4a4qoUEDHoK7xb1MsFmcjvZ_aY-D5dGTHw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] argp-standalone: set ALLOW_EMPTY to PN
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
X-List-Received-Date: Thu, 05 Oct 2017 10:22:27 -0000
Content-Type: multipart/alternative; boundary="001a114223acf4b6ab055aca1972"

--001a114223acf4b6ab055aca1972
Content-Type: text/plain; charset="UTF-8"

On 5 October 2017 at 04:48, <liu.ming50@gmail.com> wrote:

> From: Ming Liu <liu.ming50@gmail.com>
>
> This ensures argp-standalone-staticdev package could be installed
> correctly(depending on argp-standalone) if it's being required during
> SDK population.
>

I'd prefer to remove the dependency on PN in PN-staticdev, as a
argp-standalone library package with nothing in it is more confusing.

Ross

--001a114223acf4b6ab055aca1972
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 October 2017 at 04:48,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>=
&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:liu.mi=
ng50@gmail.com">liu.ming50@gmail.com</a>&gt;<br>
<br>
This ensures argp-standalone-staticdev package could be installed<br>
correctly(depending on argp-standalone) if it&#39;s being required during<b=
r>
SDK population.<br></blockquote><div><br></div><div>I&#39;d prefer to remov=
e the dependency on PN in PN-staticdev, as a argp-standalone library packag=
e with nothing in it is more confusing.</div><div><br></div><div>Ross=C2=A0=
</div></div></div></div>

--001a114223acf4b6ab055aca1972--
