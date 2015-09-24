Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 524D573D17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:56:06 +0000 (UTC)
Received: by qgt47 with SMTP id 47so41669848qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 04:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Pgg8/TWWoWWVQTd2KJ5Lla1cp88VTW+BZVepDQjXl18=;
	b=PsVl4cvMDiaeuH4T2AdGCqyM+/uVxuNEURMEUVawIQbWQmd/N7AIKOC2+8wrjK4u5Z
	xrVtPRjtYTdRm5FAv15bmuDh2DNoxzpFHPkTSuE/qp8dkNZjwAf4uDHWq6IZh9qrPT3Y
	T28O6z7fOaIizKTJWGv70ElWY2e7KAi90pQyTa+R6XdQIrSKhtWS/v+btfRqGdGu8VQF
	2WEHjcDRIcIvYlWsjBewWty6dZgvON7vntr8iVTlgr/dgkfw4bwWOJENzqASnHj2orwA
	3/RuMSpGssw70MR6oTTfLbwWHM87l1VpktFKwrDFbuOeL5PnsT1QLSPnqqntyPLg6kE8
	+LYg==
X-Gm-Message-State: ALoCoQlo0HTsQqeAEDbt9UFoOI3jDuepqx5Vd8iDRKh+VliYEzs2rFbfkWaS696T3AsiED6jGgMH
X-Received: by 10.140.232.150 with SMTP id d144mr44860388qhc.17.1443095766460; 
	Thu, 24 Sep 2015 04:56:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 24 Sep 2015 04:55:46 -0700 (PDT)
In-Reply-To: <CAHiDW_FZtt9v_tGJT-m_LcEqBS-YThPTE=zoFpr=aQVt7aGPtQ@mail.gmail.com>
References: <1443092679-216053-1-git-send-email-wenzong.fan@windriver.com>
	<CAHiDW_FZtt9v_tGJT-m_LcEqBS-YThPTE=zoFpr=aQVt7aGPtQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Sep 2015 12:55:46 +0100
Message-ID: <CAJTo0LaJeeLRqmADYQ2DNGWs9VxwJMCRViwSvEX84FEbqVVTYA@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnutls: cleanup buildpaths from gnutls.pc
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
X-List-Received-Date: Thu, 24 Sep 2015 11:56:07 -0000
Content-Type: multipart/alternative; boundary=001a11354852899bac05207ceabd

--001a11354852899bac05207ceabd
Content-Type: text/plain; charset=UTF-8

On 24 September 2015 at 12:49, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> I'm not seeing this problem and gnutls.pc.in file looks ok to me. Any
> idea how I could reproduce this?
>

Also, just sedding them out of the resulting file seems suboptimal compared
to finding out where the path is coming from and fixing that, so it would
be good to see an analysis as to where the path comes from.  Last timeI
fixed a number of those it exposed real problems or bad assumptions in the
makefiles.

Ross

--001a11354852899bac05207ceabd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 September 2015 at 12:49, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I&#39;m n=
ot seeing this problem and <a href=3D"http://gnutls.pc.in" target=3D"_blank=
">gnutls.pc.in</a> file looks ok to me. Any idea how I could reproduce this=
?</div><span class=3D"HOEnZb"><font color=3D"#888888"><div></div></font></s=
pan></blockquote></div><br>Also, just sedding them out of the resulting fil=
e seems suboptimal compared to finding out where the path is coming from an=
d fixing that, so it would be good to see an analysis as to where the path =
comes from.=C2=A0 Last timeI fixed a number of those it exposed real proble=
ms or bad assumptions in the makefiles.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a11354852899bac05207ceabd--
