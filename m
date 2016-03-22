Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5393A605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 21:27:57 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id o5so174133748iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 14:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JLpdoZduuG7lowJCYYZzEPAPOEkqn7IMBmCDTpYyulY=;
	b=o/kLTiaG12r7YFi1nseCjEpU1BP/sAE4hjfEZjIbUgmkT8j+ilaHR6g3LZsMAaqGLS
	LrzxegyIE8KjlnLeR9eWDQ2bojua96VfDuZVIj86Yt5v8vn+yIHcFtrxUR7NL8GMrVgY
	+zWQsSwFcufabkgr0AXYJLJAWuf7Rbh6HoXNv7mU+Cr+ZGb0BMiKxyCxh5cpo4Me5bVM
	0xwjxrr9sz00maemXXZ+7HP/t724MyJy8E3H5/ISq1NBkbrWODQb6WAdbUF9VxuowcaN
	y9R/LTk3+Rn3JnSAkRZNEnG+z7IXsP9XSUcK0CoJ0TZoylt81tDk86FoBqHaP/M0xnfl
	EfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JLpdoZduuG7lowJCYYZzEPAPOEkqn7IMBmCDTpYyulY=;
	b=DkowUag2cgOFArF2mN65vZPA/Hlr1eIL2a+P67VaoVDzKGE+/goRH1od43Q2B4+5Oo
	133sIWR+KI4nQIESN7PNLLbD9ktoCBljDnPP3ogoYZ6SCn5bq0rXA/9KMlUx77NH+SbG
	VTKbO/sHQ7cLYccAu3ggLTpqNtphA0oMOb26fcgWxksN0/1iFLLD1u5myyrFV2Pyf6kJ
	dq+i5ddiw1swxcBiXOpyyDwW1pK50xl4tZVlaE2sWBv+9/6YXpAIIN3M1/GPQ7TkwiwJ
	HEQvoWnhgYBVCPbFcstnuL4kPjdXt7Xy/Wlx/lM69VPzYa6u/G3Y3qLXJHAk1A2VuOPK
	NGUQ==
X-Gm-Message-State: AD7BkJK4BS+yePyrVKqmyaee/E4YT3kIMuU4e7fMDpfzqqHKumu1yEp9C485Ls6cS53VDyr7D4raG92ye9ml4eoM
X-Received: by 10.107.137.38 with SMTP id l38mr39795273iod.133.1458682078635; 
	Tue, 22 Mar 2016 14:27:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 22 Mar 2016 14:27:39 -0700 (PDT)
In-Reply-To: <1458670391-26915-5-git-send-email-sgw@linux.intel.com>
References: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
	<1458670391-26915-5-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Mar 2016 21:27:39 +0000
Message-ID: <CAJTo0LYn1aCCqk5=QV1iug+Zqz1s-=c2iF=mhZSaU6EOPAeR4A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] linux-firmware: Break out some additional firmware
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
X-List-Received-Date: Tue, 22 Mar 2016 21:27:58 -0000
Content-Type: multipart/alternative; boundary=001a113ec522235d59052ea9e363

--001a113ec522235d59052ea9e363
Content-Type: text/plain; charset=UTF-8

On 22 March 2016 at 18:13, Saul Wold <sgw@linux.intel.com> wrote:

> +             ${PN}-iwlwifi-7265D ${PN}-iwlwifi-8000C ${PN}-iwlwifi-8265 \
>

opkg doesn't like this one bit:

| linux-firmware-iwlwifi-7265D
| *** Error: Package name  contains illegal characters, (other than
[a-z0-9.+-])

Also, what Otavio said about splitting out - is C vs D a model thing or a
version thing?

Ross

--001a113ec522235d59052ea9e363
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2016 at 18:13, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D":d86" class=3D"" style=3D"overflow:h=
idden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PN}-iwlwifi-7265D=
 ${PN}-iwlwifi-8000C ${PN}-iwlwifi-8265 \<br></div></blockquote></div><br>o=
pkg doesn&#39;t like this one bit:</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra"><div class=3D"gmail_extra">| linux-firmware-iw=
lwifi-7265D</div><div class=3D"gmail_extra">| *** Error: Package name =C2=
=A0contains illegal characters, (other than [a-z0-9.+-])</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Also, what Otavio said a=
bout splitting out - is C vs D a model thing or a version thing?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>=
</div>

--001a113ec522235d59052ea9e363--
