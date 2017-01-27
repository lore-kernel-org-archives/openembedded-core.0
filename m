Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id EF82C77473
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:37:00 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c206so157648958wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=AZ2kTrh748HigrKBYg3WtkoKdOuk8Bf1mxcnsqHxAeY=;
	b=sdfbP7sFAvrtMmiyW7PZ1ImjVWXGsooWNRsVXegF3F6yt5h1JvOhOWAmOEUWxPQBSR
	8VmY/i84QRsXgBTRoi4VBihCFsXo9YJcxLuXDBe6pi67TLGcl5ydgrAg11/5D+Vl0S90
	W4mDCFn77fvWQfDIzl+bkITcbl43bvRSLsjF3cuTg8LLIBI92QvtQlidKgroHoLVkfz6
	qAZ9HjaAYNPceJ9+MC1MvYaXiyid59pAid54iEF2fG4EAAMSUMxh+sT2u83I8WM3Ioyw
	7uKo+ZKeQH4HWVjcPmrC3TYS1a4hr93D7Z4OJi3DYptIUrSABPrQfv2jyG6FkvgZ9rgt
	4dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=AZ2kTrh748HigrKBYg3WtkoKdOuk8Bf1mxcnsqHxAeY=;
	b=q77mw+GIT03cNrGqjyceLY/ctL35TeV8YusBPo73lMw6AwWoHr0snNPd3UZF6JCPRp
	UmkvH6L0jmzO1OAVrQJqtWeF9HLNBMARXJbkJqhZU23HDl1SUK75PPeMci08use7D+jo
	gol5xJQHN5ltZESP4KpOz6bj54oLblqUg+PgM4l1wQpx0biYsyVpI1RVUcucl/t3ZSp+
	CKGNF22OTVFzjVmQKaYCIr5m2yXkZY+HACozk1A9byNYTDGLy3l2AAj/CQQwHOQFnohx
	MuOlFETI0Y7wj/ABy47jzfPLKhH8S1qbQtj9RA+e6fcy550cZfDA2XxmZX/PSlYPeit/
	SxdQ==
X-Gm-Message-State: AIkVDXICqQXwTxTIDL12LhKAV1uTQnKsJ6ot7JPB5x3FRRGwSaWjpUiRdaTbPJGYpneJhvXAEMKkXn6pxmwpGg==
X-Received: by 10.28.47.2 with SMTP id v2mr4477890wmv.138.1485549420300; Fri,
	27 Jan 2017 12:37:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.98.164 with HTTP; Fri, 27 Jan 2017 12:36:59 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 27 Jan 2017 12:36:59 -0800
Message-ID: <CAJ86T=W2qeo7bf6f3JCxY1x+YHZQPDfusq5F7qq5XXDOQB17jw@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: virtual/ -vs- virtual-
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
X-List-Received-Date: Fri, 27 Jan 2017 20:37:03 -0000
Content-Type: text/plain; charset=UTF-8

Is the rule about using "virtual/foo" for PROVIDES and "virtual-foo"
for RPROVIDES documented somewhere?

