Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id D517B65CED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 09:44:40 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id q107so5329586qgd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 02:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rgoHn7dxSPc67wSsW+Ux0zjUXsatUcIivO3Dv1UujrE=;
	b=hUJrKAzV0YXdvUM9g6FFsxGOag79u/9QJ/GILPmHQeAaYbGTF/pJhoYrxp9NFDg6+J
	pyr+lhPA3vWa6XOQN4Iw9QM8dYaTqAT2C7fXUSE+VO+sy3MFEK5HO/I45jy7TqroGc+t
	a30k+D3C5yBSs/Lwr4TJpmHd3wUjH9HEEjY7lYHVJSOomD747mFQ2KA3IAKGwm0jC0iK
	gcFP3Oi6vxRwYwOuf93HZSSHlkaOsz4p36H4LdxZIcbBJeH8TWFuZ49q8BRsvGKo5FJp
	asfcAF4qqCd51hOS85BLdbnIHiUcfEgSftJ2F+AdZgz3JMAnMWlfCVMrbCKPdn3JEq/g
	ZkAA==
X-Gm-Message-State: ALoCoQnnH/yNrU9hEqXq3Zsdhm5eyjhbMXhXRMwTAl1rKlZWpDQF7n6EIrjnxrrgkvX7k8wX0Yzv
X-Received: by 10.224.28.68 with SMTP id l4mr33817108qac.22.1414748680960;
	Fri, 31 Oct 2014 02:44:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 31 Oct 2014 02:44:20 -0700 (PDT)
In-Reply-To: <1414571901-17418-1-git-send-email-fathi.boudra@linaro.org>
References: <1414571901-17418-1-git-send-email-fathi.boudra@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Oct 2014 09:44:20 +0000
Message-ID: <CAJTo0LY+r2qFgFmOmEXda1brymM8wpAfYFywsDAfWNtuedC+Ng@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: update to 20140828 release
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
X-List-Received-Date: Fri, 31 Oct 2014 09:44:42 -0000
Content-Type: multipart/alternative; boundary=001a11c2c3ce935c8c0506b4d8e7

--001a11c2c3ce935c8c0506b4d8e7
Content-Type: text/plain; charset=UTF-8

On 29 October 2014 08:38, Fathi Boudra <fathi.boudra@linaro.org> wrote:

> bump SRCREV to 20140828 tag
> drop automake-foreign patch - fixed upstream (commit 18594de and edbae29)
> update realtime tests fixes upstream status from submitted to backported -
> merged upstream
>

This doesn't build on the autobuilders, see for example
https://autobuilder.yoctoproject.org/main/builders/minnow/builds/84/steps/BuildImages/logs/stdio

There are hundreds of compiler warnings, and a missing header.

Ross

--001a11c2c3ce935c8c0506b4d8e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 October 2014 08:38, Fathi Boudra <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.org</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div id=3D":17s" class=3D"" style=3D"=
overflow:hidden">bump SRCREV to 20140828 tag<br>
drop automake-foreign patch - fixed upstream (commit 18594de and edbae29)<b=
r>
update realtime tests fixes upstream status from submitted to backported - =
merged upstream</div></blockquote></div><br>This doesn&#39;t build on the a=
utobuilders, see for example=C2=A0<a href=3D"https://autobuilder.yoctoproje=
ct.org/main/builders/minnow/builds/84/steps/BuildImages/logs/stdio">https:/=
/autobuilder.yoctoproject.org/main/builders/minnow/builds/84/steps/BuildIma=
ges/logs/stdio</a></div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">There are hundreds of compiler warnings, and a missing header.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a11c2c3ce935c8c0506b4d8e7--
