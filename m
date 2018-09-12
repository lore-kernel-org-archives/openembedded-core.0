Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw1-f41.google.com (mail-yw1-f41.google.com
	[209.85.161.41])
	by mail.openembedded.org (Postfix) with ESMTP id 607257966B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 17:30:36 +0000 (UTC)
Received: by mail-yw1-f41.google.com with SMTP id x67-v6so2422ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=dLYG7TfJU5tvVGiMT12sSNNM8QxbTw1Ai39N/B9jmtA=;
	b=t1lmOVwylBNTM1141En+69tN0dN4jk81kGKlvxXFC7apDLmPtR9OFyADFDjk8NJ7u2
	euvqmV1ZL2ItqJuwAtt3JIsLisPuuuXWx6K//GfxhC+t9U97QHMek8yw3XB8f8z6KH6X
	SPiFjn33cqtVmfm/FvbYSqdOILI7r0qe9OOI/rvxiG6MYl3iEt5weUzxor/2e17Wl3fm
	3RjVOka11HhZzpq2Hkx9YFxOYnKX2vSneVbFntB2VZgSbo6AnYfulWFYPB3xPUzYoliO
	IgvN9SIf5c8dmmvgu2zBGmvcMxFrNq8LoTwcBikL/pMI8L+vDuuvMPwUXDpiYxvfyymR
	C7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=dLYG7TfJU5tvVGiMT12sSNNM8QxbTw1Ai39N/B9jmtA=;
	b=ocber7HslfL1yiXniK9pAJWpA5V+KekMLhTEkM58+GeNEqU6sWtpfg0u4YMtuNvmZX
	4AUYbeoQbIg1IYzrURUYluE5gNyPbR6CRdFCiNdjchFjVE7YQPsvSRkaYofgemJFAyUZ
	qa5uW4NhchgX2zIdKfslhHE0Noq2lrO/W9LOSp7jlg8ludz0JABzdTBRc6/bDyyCiUaD
	kVdPMcSZsfHTw+Jc9b6ytNFqFmMVxLHVXqJ8fnvHvXGmvrE1t5LYfjV0Gt9/1uutohEk
	PfCFziPpj30Jm5MXSIDPCGza7Aw7fc8jWFinxGM+rpQOEIIbZBa9gNVGoMGOV+WLkiSl
	/Lpw==
X-Gm-Message-State: APzg51DBjha4TMRr6rHNbuN/9TiKdLFGcyydd/hgU1VGpYXprfBBvxtk
	yPZBVDMp0dm8x3RFNyGU75R9pmNbs+B7zHpZ1aGINQ==
X-Google-Smtp-Source: ANB0VdaapFr6rE7Aw9xKHl5eT9J7LCwj7EPYypjrHZMccWrBGadoKhNpBefbbfM/LgJFT3XwxXoI/NeSAjsdESZbqeI=
X-Received: by 2002:a0d:eb8a:: with SMTP id
	u132-v6mr1443525ywe.102.1536773436903; 
	Wed, 12 Sep 2018 10:30:36 -0700 (PDT)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Wed, 12 Sep 2018 13:30:16 -0400
Message-ID: <CAFeBWL6uk=k-59AC0wLhTCCQ2Bc26vtyf-twvCyn+78fSihfZg@mail.gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: inputattach deprecated?
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
X-List-Received-Date: Wed, 12 Sep 2018 17:30:36 -0000
Content-Type: multipart/alternative; boundary="000000000000ce95b50575aff244"

--000000000000ce95b50575aff244
Content-Type: text/plain; charset="UTF-8"

I see "inputattach" tool has been used quite frequently until a few years
ago (judging by Google search result).
What have we replaced it with? I can't seem to find another way to attach a
UART keyboard as an input device.

Adam

--000000000000ce95b50575aff244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see &quot;inputattach&quot; tool has been used quite fre=
quently until a few years ago (judging by Google search result).<div>What h=
ave we replaced it with? I can&#39;t seem to find another way to attach a U=
ART keyboard as an input device.</div><div><br></div><div>Adam</div></div>

--000000000000ce95b50575aff244--
