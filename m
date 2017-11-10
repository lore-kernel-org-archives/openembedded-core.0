Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id D42AB7865F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 16:05:20 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id r127so2201517itb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 08:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rSML0lvJZJ9HwbYBjlzhOdGfzVc+OmR2/HWNMCrQVcg=;
	b=iq90AUgo9ziZczcgNw5Uj0Ps9mhvtixIXbaTC4GZ0GMtSgKjrWhwLxhEAcWs9x2xDk
	OaYeWWeYNz+z+GKTbfdXLxZBCdk/8xrSWtovOF4kb4BzWTltuLfNa+N7GRJHUPquaPu6
	32bwuSicAy0aQ+xDGWQoEj4aN/4qzWyHIUUug7mH/U8sYKYI6c8idOmtQx2CxpqkuHF7
	jKgd8dbqRWd1TutvjIU6cZGyHLmUO5x8tbFsOXewb354mNzxtsmOpxD00Y/teghdTN8S
	5EKXOXr8UFC2s9luKznnfS6wZ9drYcSIulS6h4BFxP4/ClCaKoFj+Mw+egIcibPfPb0i
	LgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rSML0lvJZJ9HwbYBjlzhOdGfzVc+OmR2/HWNMCrQVcg=;
	b=DElFqxdyRyMZEpjEmyO+tG5QyIWynhoQ3HZQKYj9jL/NAIe/ZIcgKN4FQ+yEefni9o
	OFeYwbSZpUdYoW8UPP+di47UgsDQ1UbUhP2IKDcAr7qxrCzimZxkf4p1+/XYPP4Ovzbb
	zBSTsb9Tsv2hR+/XVrcyHGfPzna41OO9aBeQGNuJSvCCv1URSUaZvXbHRox6uA74QI1V
	eRseMj6A9tY7Fss9EFBLzPdFmX1BPUJQpjDaH0bqn5AggKCTylj8texF/7NjEGrW0J6F
	SAfiW0uthcTI5xz7H1Dz4bPIZnSccY4TDSzKz42uZ1yGDJFeO69tBkIuc8YK/x+VE8Vj
	d4BA==
X-Gm-Message-State: AJaThX5ooFRzINHGV4bdJ6Rq39ZLrZYD4nhCpgyqfT8VZ/KHoaCFgk9W
	tO2r7yuli9Ty1VK2JhMeOnzlC+FIpUvl+dTL7zGCFQ==
X-Google-Smtp-Source: AGs4zMZ6viI8T/qGiCF76pMLFuTcnahg8LasaZDe7o36Aoda4m633tIH/j3eAOQGPnIySUiBwsL+kaSHvYT+0NVgs2o=
X-Received: by 10.36.125.76 with SMTP id b73mr1044360itc.10.1510329921892;
	Fri, 10 Nov 2017 08:05:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Fri, 10 Nov 2017 08:05:01 -0800 (PST)
In-Reply-To: <20171109140310.659-1-patrick@advancedtelematic.com>
References: <20171109140310.659-1-patrick@advancedtelematic.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Nov 2017 16:05:01 +0000
Message-ID: <CAJTo0LYvfRJ_Abmp=jcUPhjJjiJ8PPx2mnV08b83MR_xpAwiAA@mail.gmail.com>
To: Patrick Vacek <patrick@advancedtelematic.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: Add /etc to SYSROOT_DIRS
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
X-List-Received-Date: Fri, 10 Nov 2017 16:05:21 -0000
Content-Type: multipart/alternative; boundary="001a114441747d0c5d055da31643"

--001a114441747d0c5d055da31643
Content-Type: text/plain; charset="UTF-8"

On 9 November 2017 at 14:03, Patrick Vacek <patrick@advancedtelematic.com>
wrote:

> +SYSROOT_DIRS_class-native += "/etc"
>

${sysconfdir}, surely, to cater for people who change the paths.

Ross

--001a114441747d0c5d055da31643
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 9 November 2017 at 14:03, Patrick Vacek <span dir=3D"lt=
r">&lt;<a href=3D"mailto:patrick@advancedtelematic.com" target=3D"_blank">p=
atrick@advancedtelematic.com</a>&gt;</span> wrote:<br><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+SYSROOT_DI=
RS_class-native +=3D &quot;/etc&quot;<br></blockquote><div><br></div><div>$=
{sysconfdir}, surely, to cater for people who change the paths.</div><div><=
br></div><div>Ross=C2=A0</div></div></div></div>

--001a114441747d0c5d055da31643--
