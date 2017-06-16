Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4C57B783B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 11:21:29 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id c10so58551158qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 04:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1BumFIUSthixNRekv0ncez+dBA+5Wr1twFVj/45I1TM=;
	b=FiEdbPdIyvGyZnWFm3F/s8eFsBkwQUS8LES7qH9niORYL0woSGlMQT80wSDymkE1RJ
	DqdnkfBpkuHIuXiGfm7xpYeaCGuh8pe3nuy+HMolGn90EG4CXb5gXaCT5sjWdzB1og+p
	sKFEACbou7+zTmzvALMl+f+03vzzrES9oK4Bhq0ysXmFsOwgsoEZplAMLsmRnQiKbd1L
	cCykWZYI7K9BgiUy/PX6tgh6G+4n7v7cqbhhzUENj+uNo2eubV9Ico3UkQJh1xnG4zLU
	4ntWM0OwRPOINJMhJIfuGqNx3A0kjNxjbo+ZqgMXz3MDkYz/SSaBnJijIu879cbddeu0
	JLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1BumFIUSthixNRekv0ncez+dBA+5Wr1twFVj/45I1TM=;
	b=moAID2nFaZcrZwYm7xOiIRYNnbh5ZNr9uEnrZkr9wwqobZRm58F6JO8n20nkbkiYHC
	XWcxV05QKd/IdH7M1aFsx4eMML9HuFFuEQtBIH7Jo/vnfeRT6XcQLpwjFUiOkI2XFAnR
	sTSCEH6nYPoxgMa7Zbf3vDOfl0zn4pvZbVLKfF2PZRLZhBw1qoM0gNcAlM5PnSqJxu+h
	QzPwk/9Mq7ODkaggAb2Ih3YqCaJPtSBz5sl/xOUJDaWOiUGCe2ikJNGRcjC17AzJlNqa
	KYLnSkujZtjFp4IWI73E5N+3PShBWu2rbMBROt/NSzdNzWfYmKaFhl8cUCdq6cpVfx82
	UyGA==
X-Gm-Message-State: AKS2vOyJrsiYjQmvWoXlQuQChXtDNU278pFhX8avJcAnpuOXz/SNaoET
	kqN+U/njC2mCfbtUSgXgA9p1BqIQ/Zq8
X-Received: by 10.237.52.33 with SMTP id w30mr11500737qtd.139.1497612091166;
	Fri, 16 Jun 2017 04:21:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 16 Jun 2017 04:21:10 -0700 (PDT)
In-Reply-To: <1497568647-2740-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1497568647-2740-1-git-send-email-alejandro.delcastillo@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Jun 2017 12:21:10 +0100
Message-ID: <CAJTo0Lab=4CGgXFoH3BNdXo12WdobaZ_MBb8NaWAhA7Cfm-6OA@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg-utils: bump PV to 0.3.5
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
X-List-Received-Date: Fri, 16 Jun 2017 11:21:34 -0000
Content-Type: multipart/alternative; boundary="001a114dc03eb4ace3055211fc2b"

--001a114dc03eb4ace3055211fc2b
Content-Type: text/plain; charset="UTF-8"

On 16 June 2017 at 00:17, Alejandro del Castillo <
alejandro.delcastillo@ni.com> wrote:

>  SRCREV = "1a708fd73d10c2b7677dd4cc4e017746ebbb9166"
> -PV = "0.3.4+git${SRCPV}"
> +PV = "0.3.5+git${SRCPV}"
>

As Martin said you're missing a srcrev bump.

Also if you're just tracking the release SHA, then for simplicity you can
rename the recipe to opkg-utils_0.3.5 and just have the SRCREV set.  No
need for a SHA in PV if it's the 0.3.5 tag.

Ross

--001a114dc03eb4ace3055211fc2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2017 at 00:17, Alejandro del Castillo <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">alejandro.del=
castillo@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":2jz" class=3D"a3s aXjCH m15cae5bbbb5a54ee">=C2=A0SRCREV =3D &quot;=
<wbr>1a708fd73d10c2b7677dd4cc4e0177<wbr>46ebbb9166&quot;<br>
-PV =3D &quot;0.3.4+git${SRCPV}&quot;<br>
+PV =3D &quot;0.3.5+git${SRCPV}&quot;<br></div></blockquote></div><br>As Ma=
rtin said you&#39;re missing a srcrev bump.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Also if you&#39;re just tracking the =
release SHA, then for simplicity you can rename the recipe to opkg-utils_0.=
3.5 and just have the SRCREV set.=C2=A0 No need for a SHA in PV if it&#39;s=
 the 0.3.5 tag.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a114dc03eb4ace3055211fc2b--
