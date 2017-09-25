Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2EFE678241
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 10:51:09 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id q11so9324205ioe.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 03:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZRKmgqjYryCCaEe4n+mFxPObafZy6K7rGQYgegiiZHs=;
	b=CaNnCwypL39New0mfNXMWuweexfLKQpXFNqIBDU5F/+bhQ3EQJXlYn9twGOE7toZRi
	ZkcCSMXkITc97jIAgr/tjUhHF1GGsFm2Q+Y6s+BuIR01IDuR9VWp/aU0THn6/VC1TAHZ
	ckJpEKpiCQbbaL5LGTjTBgSA5r3NUElk3Bdg0DCDbgVtOAGyIAzvGjGoPw8iRu2NSTXy
	1TYXeteYlXnk87NPexPJbCUiY2aC/a1pLa0NhW22/ti+BRmC8h3D8dH8UhkRvf7XrAQf
	1+6GxnMHLX+owBdIuT8wyzocEDr24nhXPQgcyJJlDcJ5o06qbdsTuCE0IN+hkRH6z31Y
	vBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZRKmgqjYryCCaEe4n+mFxPObafZy6K7rGQYgegiiZHs=;
	b=cyhw+hmcIJwwD/3XcUZ8bz6OCn05pNdgKT0V69Lz1osXvVTCtDv9UC7ndTeKRNGMpR
	l12pcMmEu8a1MqHoutlAoVkthVwHilK3Tjwcii+PBqF2NmzqnUg8pJhHRrS5yt6gRwG7
	xzi3rm+5bTjlJ/pOMQ4ZAREjKmG/T4G1FNWjLeyPTpYw+FYp6DPdE7J3woy5/cC7Pmxa
	6rpeVQx7Ph+HAMxckMnGISRGbwGkGtcEsBeJviT6jZWG6SnVxDqTzsts0yHsm0hOjdPX
	HXEnowGawk1IeA8ntkBjUbKPVZNUBWz1jQcJBxQKExyYgiblzAVz3ov/Dd3XuG1xGVsc
	zMnA==
X-Gm-Message-State: AHPjjUgUTLdweED/4kh+YvkJd4+YaejVs3pa9eQNd8CVjdAj2xnwF3/4
	0cYkm+J6Rj/SUDRJ5+ylQlp6Ky3btmLC2ED34rm1bg==
X-Google-Smtp-Source: AOwi7QCkl5MMHiXAuDR9i+266p344nu0WluxeZ3ImOuAa8cDT2R4xBaKkGgCUjF25ckSgiBnCk117F/2pO+oYf8+Sbo=
X-Received: by 10.107.32.70 with SMTP id g67mr9295051iog.77.1506336671221;
	Mon, 25 Sep 2017 03:51:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 25 Sep 2017 03:50:50 -0700 (PDT)
In-Reply-To: <e5549bcc-f314-9cd9-841c-24fff45d0d6b@linux.intel.com>
References: <1506284473-40990-1-git-send-email-maxin.john@intel.com>
	<e5549bcc-f314-9cd9-841c-24fff45d0d6b@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Sep 2017 11:50:50 +0100
Message-ID: <CAJTo0LZOsmG8xYBvjKtYyPC3sxRM3o4Z1ezLOUOL=MTH+e1FmQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] default-providers: set pkgconf as the preferred provider for pkg-config
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
X-List-Received-Date: Mon, 25 Sep 2017 10:51:10 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2c335c09055a0156a5"

--001a1140ae2c335c09055a0156a5
Content-Type: text/plain; charset="UTF-8"

On 25 September 2017 at 11:44, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 09/24/2017 11:21 PM, Maxin B. John wrote:
>
> @@ -53,6 +53,6 @@ PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
>>   PREFERRED_PROVIDER_openssl ?= "openssl"
>>   PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
>>   PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
>> -PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
>> -PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconfig"
>> -PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
>> +PREFERRED_PROVIDER_pkgconfig ?= "pkgconf"
>> +PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconf"
>> +PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconf-native"
>>
>
> Why not simply replace one with the other outright? Is there a benefit in
> providing both, or known issues with the newer implementation?
>

Phased migration.  We can run with this for a while (post Rocko, obviously)
and then drop pkgconfig and add PROVIDES to pkgconf if it proves stable.

Ross

--001a1140ae2c335c09055a0156a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 25 September 2017 at 11:44, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On 09/24/2017 11:21 PM, Maxin B. John wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
@@ -53,6 +53,6 @@ PREFERRED_PROVIDER_getopt ?=3D &quot;util-linux-getopt&qu=
ot;<br>
=C2=A0 PREFERRED_PROVIDER_openssl ?=3D &quot;openssl&quot;<br>
=C2=A0 PREFERRED_PROVIDER_openssl-nat<wbr>ive ?=3D &quot;openssl-native&quo=
t;<br>
=C2=A0 PREFERRED_PROVIDER_nativesdk-o<wbr>penssl ?=3D &quot;nativesdk-opens=
sl&quot;<br>
-PREFERRED_PROVIDER_pkgconfig ?=3D &quot;pkgconfig&quot;<br>
-PREFERRED_PROVIDER_nativesdk-<wbr>pkgconfig ?=3D &quot;nativesdk-pkgconfig=
&quot;<br>
-PREFERRED_PROVIDER_pkgconfig-<wbr>native ?=3D &quot;pkgconfig-native&quot;=
<br>
+PREFERRED_PROVIDER_pkgconfig ?=3D &quot;pkgconf&quot;<br>
+PREFERRED_PROVIDER_nativesdk-<wbr>pkgconfig ?=3D &quot;nativesdk-pkgconf&q=
uot;<br>
+PREFERRED_PROVIDER_pkgconfig-<wbr>native ?=3D &quot;pkgconf-native&quot;<b=
r>
</blockquote>
<br></span>
Why not simply replace one with the other outright? Is there a benefit in p=
roviding both, or known issues with the newer implementation?<br></blockquo=
te><div><br></div><div>Phased migration.=C2=A0 We can run with this for a w=
hile (post Rocko, obviously) and then drop pkgconfig and add PROVIDES to pk=
gconf if it proves stable.</div><div><br></div><div>Ross</div></div></div><=
/div>

--001a1140ae2c335c09055a0156a5--
