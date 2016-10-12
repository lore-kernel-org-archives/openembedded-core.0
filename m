Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5BF6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 19:12:15 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id o19so63657066ito.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 12:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=owy8RKmdg00oYHO/eiHock4QtjvdlqVHLvTvKdANAxc=;
	b=Cz5adoSWKb/Qk/h90eQLA1o/323c5vkazVOhpuLDJ+HYavoSCwY+vls/qoJbmtKPXq
	zcBYWzluYKkGmAiUrEJv5X7W0rfTeFNsaDkih72QbJyR0kLyuCIy3tbVhvCgXq80PIRL
	iYwKMebNbaUqhD9Glds61ayJ355/VlKAHhixycjhkw7afQbRtq0KMUhWsNI4WgIO+eIa
	4Vfs6nre1hGlWFwjpZl1TPmuSWpGbeIu3yJue9RNIFpmtOSwbWsocjh1Xh5a5B8ClbwV
	VHyP/eSstrNUbmTZoT1w5cFkklGR1CfeQ3wwPakobTQ6t6s2e1HrY2MSBx9TieIYteKu
	hqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=owy8RKmdg00oYHO/eiHock4QtjvdlqVHLvTvKdANAxc=;
	b=SLT4TtZ4ZlCa07ae99X5TLh0DSPCCRQspY0Ql495Q2dGoveK5tnIWNGqObPQBTUrV6
	nqmR0jO50kjxwY1YLVY/z/5hhfE+JBpkeSDaPCYN11D6hiApxEfNdrJAk8J8HYKCvkOv
	Nna7iqH0pEUJ6LMIahZgrQ6UWg2pW6TuUsTkHVLPzuAHty7p4PV35KokfW1hgM4bBEZW
	BcEv358IDU0aqTVECeCrSD11VQOCWfIbrFA0wCjS6Jvau7rLWYjyb+t+LUMPaM/sU9h3
	Q/XDUVEY3bfhk+SAli3HPw8NfNyL5nxi4bBc4GO5rEIpeLof48fvB+xNpn0MLnLSLCAj
	XcEA==
X-Gm-Message-State: AA6/9RnbC237WJbZFmQbA/1BAjLh/Il2i3QjyqedYoac6P5wkXDd8zegryaZOYsWCLJdb9qJ5eDPQptaVwRO4SCH
X-Received: by 10.36.153.194 with SMTP id a185mr3774736ite.70.1476299537517;
	Wed, 12 Oct 2016 12:12:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Wed, 12 Oct 2016 12:11:57 -0700 (PDT)
In-Reply-To: <20161012173025.GF2923@jama>
References: <1476291665.16008.59.camel@pbcl.net> <20161012173025.GF2923@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Oct 2016 20:11:57 +0100
Message-ID: <CAJTo0LaCUJpq5MV3kGtnOz53Mv1V1hr581A7=bBt2yFR8W5CKQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: File conflicts in DL_DIR
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
X-List-Received-Date: Wed, 12 Oct 2016 19:12:16 -0000
Content-Type: multipart/alternative; boundary=94eb2c08e518843e93053eafc58b

--94eb2c08e518843e93053eafc58b
Content-Type: text/plain; charset=UTF-8

On 12 October 2016 at 18:30, Martin Jansa <martin.jansa@gmail.com> wrote:

> Github archives are regenerated from time to time and then the checksums
> are changed, so 3rd option is to use git fetcher with SRCREV matching the
> has of v${PV} tag.
>

Note that Github maintain that this isn't the case for .tar.gz archives.

Ross

--94eb2c08e518843e93053eafc58b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 October 2016 at 18:30, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5yv" class=
=3D"a3s aXjCH m157b9f5303c529aa">Github archives are regenerated from time =
to time and then the checksums<br>
are changed, so 3rd option is to use git fetcher with SRCREV matching the<b=
r>
has of v${PV} tag.<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>Note that Github m=
aintain that this isn&#39;t the case for .tar.gz archives.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c08e518843e93053eafc58b--
