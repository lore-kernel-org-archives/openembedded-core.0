Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7E79E77E9A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 10:43:06 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id z6so56412iob.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 02:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RnvbFe4qn8svZB8hN/kRKFxJkmGh5DCfmBDbiz+BRh8=;
	b=mBlKnkPUNykr70ADAitgouiW94x/g6O2evWUGu0znnHf9knCRRF6TgXhxMpcD02Z0d
	sEcVPq9hcMD3EpeNRpkszEfgJQhJkWWlpMCrMbOazezow4SKZQwyIMTBaz+5/BJ30O8h
	5fZGM0Odp4L3caaPZ6kBN1v1WsGnnTSUbSZf67pFLUAZDJhDPMfZHfzm89twtUnkUL/l
	iiE+w9sTCWv+EnWtlbd1ceKlBhy4Soy+jzjOZdZXkyVGywkeyXroMANJP1plFCT7fZVf
	ZdC+kMaOv4ntqZbR1c+ECu092joFHN23DRMtN9kfikoKSVPOAMHl9MDprNLvpp03T2eU
	fdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RnvbFe4qn8svZB8hN/kRKFxJkmGh5DCfmBDbiz+BRh8=;
	b=Ro11WZn3dPPZOS1EJowfKfJe2EwnuDTazZw/TRHMPATMjyya6wG0p8AhYQkRMts/1/
	zL49n4IqUY67HmgeKba34xLtDS2I0lGkBG0d9lMsVILYpTFKZ619m//MuREBCATApolw
	8qBBus8vgu3GiUBwRmZANLQk1b81oi/ynd3OU+N1na4M6jfVBBfk12rlYmkjEii4qLXo
	V5DCZm5LVBTze7M2IUAwelRnipXwCX96Tx+CN0p3XUWAyersewP/byzpTcsOFFJJs5aD
	IZAqqXmlsjmGC3WQJ5d8xRACyAaDTErGSa87GGpni7wn+Pl+h1xbAJZS2kITrG3zJhfP
	bd0A==
X-Gm-Message-State: AKwxytfSkxaXnPIdphGxMEcFrpGurEGQgK0kr4plscsSh4WpKi3NErMN
	LKeln1Zsu9H+zgBJdjbvr3MFSXdIa7dxXNqtqMaZqg==
X-Google-Smtp-Source: AH8x224sM/H2ZjrwDVh+Dh/c3vTfFsT0kblZ/LEWHO1bk1okXU4bOLB3fd3EfaI6MYIQZ5tqvS7XiJWIM5Ocy9l0L0E=
X-Received: by 10.107.133.75 with SMTP id h72mr15210670iod.227.1516963387542; 
	Fri, 26 Jan 2018 02:43:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 26 Jan 2018 02:42:47 -0800 (PST)
In-Reply-To: <1516957210-15531-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516957210-15531-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1516957210-15531-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jan 2018 10:42:47 +0000
Message-ID: <CAJTo0LaXYaJ=FQqz0aYUTN6gBh5vBva4fooKLDDtW4fxPFD8TQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] man-pages: 4.11 -> 4.14
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
X-List-Received-Date: Fri, 26 Jan 2018 10:43:06 -0000
Content-Type: multipart/alternative; boundary="001a113ec5e4da30130563ab8f36"

--001a113ec5e4da30130563ab8f36
Content-Type: text/plain; charset="UTF-8"

On 26 January 2018 at 09:00, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> 1.Upgrade man-pages from 4.11 to 4.14.
> 2.Update the checksum of LIC_FILES_CHKSUM, since README has been changed.
>

By using beginline/endline you can specify where in the README the license
text is, which would make this a lot less fragile.

Ross

--001a113ec5e4da30130563ab8f36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 26 January 2018 at 09:00, Huang Qiyu <span dir=3D"ltr">=
&lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangq=
y.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">1.Upgrade man-page=
s from 4.11 to 4.14.<br>
2.Update the checksum of LIC_FILES_CHKSUM, since README has been changed.<b=
r></blockquote><div><br></div><div>By using beginline/endline you can speci=
fy where in the README the license text is, which would make this a lot les=
s fragile.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113ec5e4da30130563ab8f36--
