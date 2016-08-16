Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 04DFA7318F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 16:00:55 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id x131so19305612ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/+J1ibKX80CTpB+y1hQ+p46OzBIUZtOrg0VZ1g3jJrk=;
	b=BvWZnkPryQtAss4oXA6GbUGriWqxMC0CeEHaDMJe6UVPWT2mUlFu5ivJEd31PFnbsw
	hYI/troy+yuJVIc6kI5I4iV6nxLqxmUZZ7lK3hudzYi6lJMmTG1RfwCgwk3frfotGD+O
	y5gOfV4eep96U3jQoJ302EZNIJR7dnPM80/rc+7rUyna/2Psd+v8t5mM799Kb8dwL1X3
	nwQoI3UVmwGHXKBQw38J/QfnSbA8C9d0IXXqQjW1iBijpC9mprBK1I83CWZjLdORw+EK
	Ea6e+XUNvgjO5TLR1Qs+NdFGHgmyjXZUYs6DnNLAPqiwcTS1diDFwBRVmXHNVHoor1+g
	3fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/+J1ibKX80CTpB+y1hQ+p46OzBIUZtOrg0VZ1g3jJrk=;
	b=e3hKN5qWTnRH5Lkkv5v2gWXTaoMvi2NFE3Omr4ctqDXA7gL7dD3jZdks+c4CYLPQUi
	IwZUI5yCcCt8Djs4CzrTrZAHkZ6VtEhXZn9Y2+LaJdaZICIK8fh3N8bXThbFU9vFcm9j
	IrTSFrpDeJRNPH5kuAVTIrvGwazPhh4KmN2jDa63GcrOUNvHIygOOjwKqH5OlnCt/+4N
	Wn4Zzd36JBcAGkeuO7a5xI9pBa0mvSHwIKymoC81MUjauyDs1WdzGErmoAf+76Awj0n9
	HQ+N/tCQvm+t3HcvSf4KmP4rCBafUZqYG2/VNG3otvUI7oYYokoS/ahbs1daCWwEgTn2
	LvaA==
X-Gm-Message-State: AEkooutEWI0sHV/OUXGs+nhDlM6COpAVCy+g7eCZ5WJSEVLPNsDGIYMrJP3uDhXIVSTXIWXp72qMZU2J/fDY4tJh
X-Received: by 10.36.216.138 with SMTP id b132mr22999502itg.38.1471363256082; 
	Tue, 16 Aug 2016 09:00:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 09:00:35 -0700 (PDT)
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 17:00:35 +0100
Message-ID: <CAJTo0LZC5wZ7yY=bb5EouWZEqR4ta0s4Oe07vkzQXzFGMjOp6w@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 16 Aug 2016 16:00:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c05ae92371d9e053a32742a

--94eb2c05ae92371d9e053a32742a
Content-Type: text/plain; charset=UTF-8

On 15 August 2016 at 19:26, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> Are the important part of this series, and a significant contribution to
> the
> fall release. I've been testing these for some time, and we've run the
> kernel lab and yocto-bsp scripts against the tools. We haven't found a
> regression yet, but I'm sure there are some lurking. These definitely need
> cycles on the autobuilders.
>

qemux86 throws these warnings at me:

WARNING: linux-yocto-4.4.15+gitAUTOINC+b030d96c7b_ddab242999-r0
do_kernel_configcheck: [kernel config]: specified values did not make it
into the kernel's final configuration:

---------- CONFIG_BT_6LOWPAN -----------------
Config: CONFIG_BT_6LOWPAN
From:
/data/poky-master/tmp-glibc/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_6LOWPAN=y
Actual value:

Config 'BT_6LOWPAN' has the following conditionals:
  BT_LE && 6LOWPAN (value: "n")
Dependency values are:
  BT_LE [y] 6LOWPAN [n]

---------- CONFIG_BT_CMTP -----------------
Config: CONFIG_BT_CMTP
From:
/data/poky-master/tmp-glibc/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_CMTP=m
Actual value:

Config 'BT_CMTP' has the following conditionals:
  BT_BREDR && ISDN_CAPI (value: "n")
Dependency values are:
  BT_BREDR [y] ISDN_CAPI [n]

Ross

--94eb2c05ae92371d9e053a32742a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 August 2016 at 19:26, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D=
"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":2qp" class=
=3D"">Are the important part of this series, and a significant contribution=
 to the<br>
fall release. I&#39;ve been testing these for some time, and we&#39;ve run =
the<br>
kernel lab and yocto-bsp scripts against the tools. We haven&#39;t found a<=
br>
regression yet, but I&#39;m sure there are some lurking. These definitely n=
eed<br>
cycles on the autobuilders.</div></blockquote></div><br>qemux86 throws thes=
e warnings at me:</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra"><div class=3D"gmail_extra">WARNING: linux-yocto-4.4.15+gitAUTOI=
NC+b030d96c7b_ddab242999-r0 do_kernel_configcheck: [kernel config]: specifi=
ed values did not make it into the kernel&#39;s final configuration:</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">---------- C=
ONFIG_BT_6LOWPAN -----------------</div><div class=3D"gmail_extra">Config: =
CONFIG_BT_6LOWPAN</div><div class=3D"gmail_extra">From: /data/poky-master/t=
mp-glibc/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/fe=
atures/bluetooth/bluetooth.cfg</div><div class=3D"gmail_extra">Requested va=
lue: =C2=A0CONFIG_BT_6LOWPAN=3Dy</div><div class=3D"gmail_extra">Actual val=
ue:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Co=
nfig &#39;BT_6LOWPAN&#39; has the following conditionals:</div><div class=
=3D"gmail_extra">=C2=A0 BT_LE &amp;&amp; 6LOWPAN (value: &quot;n&quot;)</di=
v><div class=3D"gmail_extra">Dependency values are:</div><div class=3D"gmai=
l_extra">=C2=A0 BT_LE [y] 6LOWPAN [n]</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">---------- CONFIG_BT_CMTP -----------------=
</div><div class=3D"gmail_extra">Config: CONFIG_BT_CMTP</div><div class=3D"=
gmail_extra">From: /data/poky-master/tmp-glibc/work-shared/qemux86/kernel-s=
ource/.kernel-meta/configs/standard/features/bluetooth/bluetooth.cfg</div><=
div class=3D"gmail_extra">Requested value: =C2=A0CONFIG_BT_CMTP=3Dm</div><d=
iv class=3D"gmail_extra">Actual value:</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Config &#39;BT_CMTP&#39; has the following=
 conditionals:</div><div class=3D"gmail_extra">=C2=A0 BT_BREDR &amp;&amp; I=
SDN_CAPI (value: &quot;n&quot;)</div><div class=3D"gmail_extra">Dependency =
values are:</div><div class=3D"gmail_extra">=C2=A0 BT_BREDR [y] ISDN_CAPI [=
n]</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div></div>

--94eb2c05ae92371d9e053a32742a--
