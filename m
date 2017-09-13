Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6D06478554
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:10:37 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id v19so875536ite.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E2/O7/rxOh0H8YJnCkUJOJ73NkWCALbjOfxmDEIkCJc=;
	b=WhbXcyxrHLqzLVT59ROSpVpEdgPFC1J+FU92Aj4mUrwp4cdVJK5kDK0jOsSI8qeivq
	PEgwjtagUnADf7jVhD2DttygDk7QmmCnZmH6irL5bdvrxIECVsQlMLgXlLdV0z0aVGg2
	Var/6PG784wLeJvoIjhyaovrofGnbUGwoHs3sSB/8HGglARBdQIyHOmG2GBJ+kBp+tMA
	vNrVTKcFRWBWRL+cI8yvwHIwf5uDfgT4Pg449R4Pg8AUMhWapqeRNCDaqO6hVpREf7nr
	Uh97jfekGDBo3LTtB77z9XVUTsZ75h7MKqePhKSj+LFT4mQeUr8yLsJVQ5Zu0pBjrc5S
	pl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E2/O7/rxOh0H8YJnCkUJOJ73NkWCALbjOfxmDEIkCJc=;
	b=Aj0bZH6vJnaE4pGyEQ6uhUq13E7uAeFfeDSUOnoWRItTksoRZyGn4f3bocT1eZNYv7
	+JHZnArE3WumDSSWmXnvDYjpOeH02bmlYiDWlMpCgt1eGCQ1PUYiF2t7S/PDYYpFImDQ
	jD7Ii/084cSKEU7GcQm5Torr8s6CMu6Zzeh+XKtECfxAMnwQDUrvVO7cwx7+cDrFuPxf
	OMVuGjLPgh9shzRSdGeBYybonOJsrsyj9mt7AvzR8k6KtrBdbNE1mjTfINRkt3UrJfS2
	FPQG75HT5aJckzbv65LAPsqMiLS2tSIg8e/SjTXaiSD824au3hjHMF1jZkPzVdDLiaUM
	29yQ==
X-Gm-Message-State: AHPjjUhlTn0a13+Log9nicywh5FNF0I2/dwPjTuaxB3qxRoWr8cTzI1K
	8e7E3mSRhKvbMMV3eQo2KSR5dTe8hExczR8VOvsiZw==
X-Google-Smtp-Source: AOwi7QA75fK6tbSHl79l8pFyU/ZDtpzWQP2a9wTMZjo3Q7wDy9JeCGPoPYV4HnGtCKcAMErOjiHiemE3xhUKmfSeCYI=
X-Received: by 10.36.237.204 with SMTP id r195mr3928099ith.48.1505297439360;
	Wed, 13 Sep 2017 03:10:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 13 Sep 2017 03:10:18 -0700 (PDT)
In-Reply-To: <1505261272-25017-2-git-send-email-stefan@agner.ch>
References: <1505261272-25017-1-git-send-email-stefan@agner.ch>
	<1505261272-25017-2-git-send-email-stefan@agner.ch>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Sep 2017 11:10:18 +0100
Message-ID: <CAJTo0LYWTA-t7bCcRoRP985hyRJQ9WQPD_6bvVE4mX=8-b7ikw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: dominik.sliwa@toradex.com, Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] linux-firmware: bump to latest linux-firmware git revision
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
X-List-Received-Date: Wed, 13 Sep 2017 10:10:38 -0000
Content-Type: multipart/alternative; boundary="94eb2c042c1627b9e905590f5f7f"

--94eb2c042c1627b9e905590f5f7f
Content-Type: text/plain; charset="UTF-8"

On 13 September 2017 at 01:07, Stefan Agner <stefan@agner.ch> wrote:

> +ERROR_QA_remove = "arch"
>

This doesn't remove it from WARN_QA so it will still produce a warning if
it is present.  However the typical way to do this is to set INSANE_SKIP
(which the recipe already does for another package with the same problem).
Of course you can't use INSANE_SKIP without setting a package currently, so
in the interests of scaling I wonder if we should extend insane.bbclass to
support recipe-wide assignments of INSANE_SKIP...

Ross

--94eb2c042c1627b9e905590f5f7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 September 2017 at 01:07, Stefan Agner <span dir=3D"l=
tr">&lt;<a href=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan@agner.c=
h</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">+ERROR_QA_remove =3D &quot;arch&quot;<=
br></blockquote><div><br></div><div>This doesn&#39;t remove it from WARN_QA=
 so it will still produce a warning if it is present.=C2=A0 However the typ=
ical way to do this is to set INSANE_SKIP (which the recipe already does fo=
r another package with the same problem).=C2=A0 Of course you can&#39;t use=
 INSANE_SKIP without setting a package currently, so in the interests of sc=
aling I wonder if we should extend insane.bbclass to support recipe-wide as=
signments of INSANE_SKIP...</div><div><br></div><div>Ross</div></div></div>=
</div>

--94eb2c042c1627b9e905590f5f7f--
