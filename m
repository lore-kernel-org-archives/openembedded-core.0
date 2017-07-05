Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4577780E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 15:42:18 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id d78so192385229qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LaS7H7AUpEyCTvsqoCMkMd+ndTt0R/MNbZotaDCs0BM=;
	b=w3u2po1NLotn71XTvSGBTz/ipL6Trhe1q6d/qdmyocnOapnLyyuWUWYkXsY/4mE0qt
	Crzh89RJlne4eYe9UD44ok1FQZ7FoGeFVd3ldg7e5EdAk36NOUNBFqWuWnw4Aub0H8uM
	Ehr302kCklKx0ERlYetWNr4qxDU7i+iew+cq+dVxvDh5ZGOOGDYzs3IE/PrxGyFz/wzW
	w4b0ZpE6IRfG/TQLtkykFnp+Uw7F49Km0iEcuHLEjrQZnQ1DHNF5g877eD0CzdPg3+m6
	F9zRctPWVCawuLy++ie2JvXaNuP+BEFsLS5MgSrFXROJ7dmHozv7DrlnV/v0Yhcz+oIp
	9/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LaS7H7AUpEyCTvsqoCMkMd+ndTt0R/MNbZotaDCs0BM=;
	b=HN81KrGTL5B734ZbkuGt+Dwl3g35ydGjyFzvbspQQhh6luh0OwcmGJjBbHaCi0mxkw
	SMUQop0QkmYg0Oh9Ap89Q+DGim0KG82XFr60vhxhapxVtAIEETXZwrgkcQ0eDxooqAm5
	JkT392HgmP4CIC3FkbuQWfkQ3NygPzlQHv5HN49qOermA5LBGOmWk+7dHbd6c6i+8Ztz
	C6jLq44MWjEaOqJ3IdoDskKhSnbi0nSmQ11F+db6tQNq6eZqDs1hayTyahm8YYEk3xiF
	Syst/s4AHcoLSfQoAUIWco2PFOyYbiSPaTNZ9IYMO60v0kb4xbvEdRwp0PkURU6EEKZm
	OMuw==
X-Gm-Message-State: AKS2vOwU5J3ApxqqEaHc1yZA40/PpCu9AlEEutRwxHsC35L1BtdY/hOu
	m+6klAqcMIEulW+p/5I2X7c1BTZPoAjE
X-Received: by 10.55.100.130 with SMTP id y124mr55952923qkb.54.1499269339273; 
	Wed, 05 Jul 2017 08:42:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Wed, 5 Jul 2017 08:41:58 -0700 (PDT)
In-Reply-To: <1499267003-20382-13-git-send-email-maxin.john@intel.com>
References: <1499267003-20382-1-git-send-email-maxin.john@intel.com>
	<1499267003-20382-13-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Jul 2017 16:41:58 +0100
Message-ID: <CAJTo0LaA_q-6p3+M6TSX980_2gKBDjeOSMB7kNE6xNM42B1jeA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/12] libva: upgrade to 1.8.3
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
X-List-Received-Date: Wed, 05 Jul 2017 15:42:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c0585ae63f839055393d8f8"

--94eb2c0585ae63f839055393d8f8
Content-Type: text/plain; charset="UTF-8"

On 5 July 2017 at 16:03, Maxin B. John <maxin.john@intel.com> wrote:

> +RDEPENDS_${PN} =+ "${PN}-utils"
>

Whilst this makes sense from a compatibility sense, I like that the
binaries are no longer packaged with the libraries so I don't think we
should have this dependency.

Ross

--94eb2c0585ae63f839055393d8f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 July 2017 at 16:03, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":17l" class=3D"a3s=
 aXjCH m15d13483de9d211e">+RDEPENDS_${PN} =3D+ &quot;${PN}-utils&quot;<br><=
/div></blockquote></div><br>Whilst this makes sense from a compatibility se=
nse, I like that the binaries are no longer packaged with the libraries so =
I don&#39;t think we should have this dependency.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0585ae63f839055393d8f8--
