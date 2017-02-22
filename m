Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3CEFA72FB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 22:22:49 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id x71so16646410qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JIUhQi+38BrE5BWltwhbGEbkyIzlOD02WZQ3cNEazFE=;
	b=y/aChFEP1U+ukY2U+iVEuqE83cExs6pZuviY54YtPswQFExPcSvpmYYpEkL7eIglNT
	gwKh5Kog7XJIpaqHAcpFCO8wXHykMNSuDvjxWil/rO2wZvNXQ0I76Ubp111vVSHWeeZ7
	QRCyyCqr5444kBWun367TCyegsnIRXn1c8/L3WXP3mG+ryLlZfU+THFPXGawq7jHkpPX
	3bg1XdvvK/ODq4A420uuJnQDsGIJKGyKGs2vWFnWs8C4s1Ck2I1PN2l2XnKFFDrHZ6k7
	erC8PFRbt2JpQurqleCIXs39XDSfbUEb1LVDQG7s3d99QoPDDMWPFmt4AaJEXI3dr+bs
	vp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JIUhQi+38BrE5BWltwhbGEbkyIzlOD02WZQ3cNEazFE=;
	b=CZaXKKzxLwzicp/BCKRMiD5k+qGJVwA/D2naCojt2jtpky65RXGCqBJOOuMQw+Gztx
	FJ8WI1O9UIxSn38o+JFjfhiUbxREVQsVwChFYls0zVJnhipA0J8EXlbqtZ/uJBLMLzPc
	JC/WPFSmCMNMKCxohlXBKssCihWRidhgquuLlHCE0Ml1ennzNQ/Am7bghkYVmaqgd+vM
	EAKD7jpsBXgqa93HudLtAMTXrT3dHVR2pMG7gFUcxhp31HXPvFuQ6xS3LHDsiASfDgpG
	7UnItxqNKzKwqY9frOm7WHZ12ADcrvMUscCHCfOh8lVMnLFqdwQKntqIax/8U/qAnqCh
	89vA==
X-Gm-Message-State: AMke39knwQuIeU83kUBNw1Hsjk8v8EeNRCUCIFh9rFdPwv9a0kUdHDhaglXwMy59ia0R/gqij2MGGekl3t16co3x
X-Received: by 10.55.40.67 with SMTP id o64mr37050393qkh.3.1487802171225; Wed,
	22 Feb 2017 14:22:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 22 Feb 2017 14:22:30 -0800 (PST)
In-Reply-To: <f6a8a61195fb454781e93c2dcf615e48a2fc8682.1487764904.git.jussi.kukkonen@intel.com>
References: <cover.1487764904.git.jussi.kukkonen@intel.com>
	<f6a8a61195fb454781e93c2dcf615e48a2fc8682.1487764904.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Feb 2017 22:22:30 +0000
Message-ID: <CAJTo0LZT-NukaBOgdA_Wajfu0pVkNCiNu18ZEE_CYGruXOz1ow@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] libdrm: Upgrade 2.4.74 -> 2.4.75
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
X-List-Received-Date: Wed, 22 Feb 2017 22:22:52 -0000
Content-Type: multipart/alternative; boundary=001a1140af28e9acab054925ef3f

--001a1140af28e9acab054925ef3f
Content-Type: text/plain; charset=UTF-8

On 22 February 2017 at 13:02, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> * Remove udev from depends (it's not actually used).
>

Is it not used by some of the tests?

packages/corei7-64-poky-linux/libdrm/libdrm-tests: PKGSIZE changed from
350048 to 225496 (-35%)
  * PV changed from "2.4.74" to "2.4.75"
  * FILELIST: removed "/usr/bin/dristat /usr/bin/updatedraw
/usr/bin/openclose /usr/bin/name_from_fd /usr/bin/setversion
/usr/bin/getstats /usr/bin/getclient /usr/bin/drmstat /usr/bin/getversion"

Ross

--001a1140af28e9acab054925ef3f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2017 at 13:02, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:2ch" class=
=3D"gmail-a3s gmail-aXjCH gmail-m15a65eb51a6cf538">* Remove udev from depen=
ds (it&#39;s not actually used).<br></div></blockquote><div>=C2=A0</div></d=
iv>Is it not used by some of the tests?</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">packages/corei=
7-64-poky-linux/libdrm/libdrm-tests: PKGSIZE changed from 350048 to 225496 =
(-35%)</div><div class=3D"gmail_extra">=C2=A0 * PV changed from &quot;2.4.7=
4&quot; to &quot;2.4.75&quot;</div><div class=3D"gmail_extra">=C2=A0 * FILE=
LIST: removed &quot;/usr/bin/dristat /usr/bin/updatedraw /usr/bin/openclose=
 /usr/bin/name_from_fd /usr/bin/setversion /usr/bin/getstats /usr/bin/getcl=
ient /usr/bin/drmstat /usr/bin/getversion&quot;</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a1140af28e9acab054925ef3f--
