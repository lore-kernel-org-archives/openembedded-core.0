Return-Path: <jefro.net@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5A21774E24;
	Mon,  7 May 2018 21:53:27 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id v5-v6so30224567wrf.9;
	Mon, 07 May 2018 14:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=LbxqLPsj4sffLPVls0GFh6s1Bsn/hzVsrEgwyEqdi1U=;
	b=Rn2T3v5lDI3l7zczmYDLGj8rWLp6GWS3KzojiLWpJbcZXkiWk0xrgw0238rEUYnIUl
	+Dzmqh2Pn/x2+j35heBE0D51QyECCBEviz5L4+39U4B/0lwdv1vkCiKiQM3S8MuqNqDo
	IzpmZ7IoPOdJxYQ5UuGmwPRlDVKN+5/AWnRyZb16T8Fa/37F7iEfgktynXB9XuJ+ltZz
	owopqJKAb2gWGCA8MlPA1RUDTpXDBjDcg+EACzNl9fZRwU8rZ86cALO1c0SGPpObyL8f
	KAfwb+SKbTsNJfbw0K6K9q9+Hq5T+ZeNFEr8vVcmIqTvhig6hayoFhza9pQREK7IKr6y
	QN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=LbxqLPsj4sffLPVls0GFh6s1Bsn/hzVsrEgwyEqdi1U=;
	b=g1FAA/BHQWlF5YRDElM1ZtSHp/UMO+UV12xgATMB2jZfyBzdEZA6hngGfUPmwRbBR4
	YELvm1fnHBjwFnj+08m+pQXoYvrvSI3YeTtxbnzRxVnWpo/KkbhnMoH236+n1Jjs2RXy
	gBTAIduUSn+4YP6v+s7ZkN2ebN9L9SxLe1sU+uUVuwfqZPSh1tQGjLfQYDvYxAXldAMb
	UQ2YpjKBbzvoJ0tUWfK8KX8u2XDWm/+Us8AE4bHPnBNy5tYT9slsGoisYdov/eR+s8O3
	qPzViK7gzXlr9/MmWvpEPfm3psR1iWn9joWb6TmH4tRrI2ClvoFG7HhkjZX4gBPVkDD2
	Rvog==
X-Gm-Message-State: ALQs6tAINcAkGC7l952jqPPquAkwzD1bVMPhSdtYaxjrtdiGV3ZU8odf
	jhT1k5whdiAZ+AIgWX6A1AS6D1h/NrpgultpZ3s=
X-Google-Smtp-Source: AB8JxZr/yU5n5oYgH1idDiRa5BwbYHQf3m+1qyhGB3Wpue2DfXZSWgBu10r+4y6tZeXlLmhq3GCsaz3X5iEshEWC0p0=
X-Received: by 2002:adf:e64b:: with SMTP id
	b11-v6mr30263344wrn.51.1525730008474; 
	Mon, 07 May 2018 14:53:28 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.223.229.139 with HTTP; Mon, 7 May 2018 14:53:07 -0700 (PDT)
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Mon, 7 May 2018 14:53:07 -0700
X-Google-Sender-Auth: xBUMUWo48NaGR66t73_dczeIrVk
Message-ID: <CA+YB3rba5-xUdzRg2jE8oaY6+ZLhu3ROV0O6_=w7Dc+qPVSqpQ@mail.gmail.com>
To: Yocto Project <yocto@yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org
Subject: Yocto Project changes in progress
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
X-List-Received-Date: Mon, 07 May 2018 21:53:28 -0000
Content-Type: multipart/alternative; boundary="0000000000002daaa9056ba4b38f"

--0000000000002daaa9056ba4b38f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hello everyone. I'd like to briefly address rumors around Richard Purdie's
transition from Intel to a more neutral position, and Intel's reduction in
resources for the project.

We set up the Yocto Project in 2010 through Linux Foundation, with over 20
member organizations, so it would function as a true open source project -
neutral, unbiased, and well distributed. Those things are what make open
source projects less vulnerable to any one person or company. This is
actually a very exciting transitional time for the project, and all
existing member organizations are fully behind the project. We will let
people know details as they are available.

Meanwhile, the 2.5 "Sumo" release is on the way and should be released
soon, the 2.6 planning process has started in earnest (please
participate!), and we are excited to see what the future has in store for
the project.

--=20
Jeffrey =E2=80=9CJefro=E2=80=9D Osier-Mixon, Intel Corporation
Open Source Community Ecosystem Strategist

--0000000000002daaa9056ba4b38f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
Hello everyone. I&#39;d like to briefly address rumors around Richard Purdi=
e&#39;s transition from Intel to a more neutral position, and Intel&#39;s r=
eduction in resources for the project.=C2=A0</div><div style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><br></div><div style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial">We set up the Y=
octo Project in 2010 through Linux Foundation, with over 20 member organiza=
tions, so it would function as a true open source project - neutral, unbias=
ed, and well distributed. Those things are what make open source projects l=
ess vulnerable to any one person or company. This is actually a very exciti=
ng transitional time for the project, and all existing member organizations=
 are fully behind the project. We will let people know details as they are =
available.</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><br></div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial">Meanwhile, the 2.5 &quot;Sumo&quot; release is on=
 the way and should be released soon, the 2.6 planning process has started =
in earnest (please participate!), and we are excited to see what the future=
 has in store for the project.</div><div><br></div>-- <br><div class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div dir=3D"ltr"><div>Jeffrey =E2=80=9CJefro=E2=80=9D Osier-Mi=
xon, Intel Corporation</div><div>Open Source Community Ecosystem Strategist=
</div><div><br></div></div></div></div></div></div>
</div>

--0000000000002daaa9056ba4b38f--
