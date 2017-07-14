Return-Path: <niqingliang2003@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2A569601D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 04:36:27 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id v202so11587934itb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 21:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ezuTu+wZjpVf7rNWkaR0pjqhtM2pAin+CRtsysYxrzg=;
	b=obfhc6wV0UlsEUpUIMaW5NqQvC0/WlRWt0h9KK1KKEQkOmyxeGpSZQ+xOHT3WBsmaq
	lazZIpeNBHJi7lVNigHxryNEyZ4jMUZ/8aldrmP/zIZnfUZVDA8g153AC27MxMH6Ef64
	n/j29eVma4YztsTWYffBrEq3lnS2pbEH/yNpaXANUyTKhCc8nTKfJ0aoLW5dJ0LRcg8G
	sBZ1sQtELUsmAEpidUWsRkPs6lv6ppgfz8Tln4O7zjN1AIZ3MCoq1baTjpJxFeuoJDX6
	CNlYltUmUyVSIqnPneFhkHRRL+/ypVFsNPvQlTHwI46JqlNb/vU6KsgQAQZeXupYNc8J
	E2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ezuTu+wZjpVf7rNWkaR0pjqhtM2pAin+CRtsysYxrzg=;
	b=s5s72v7eciiHfmHDspNto7W0DWJ0uA4jAvASB5UZAHX322J+/7pw2OzasAzPuJTLS2
	nvay32HObKXGhiHn7LUM1lUGjCKIfI/7fckXJxjj52wE/SFQfl0T3cWCirXCbbwCci6e
	r87vLyJN+3XtTDuPE7QV8MVeXCzatXgi47QnR+8NI0fCVrbhlhE26FauIOtEyBLduAdo
	zQ6GbrS2cYZOh4cfoTydi7ZQIIki8mcBvt3bUQ5q80lh0njgpNH0msbQ4QVJSAKeUI7y
	lyYrrNnv2AWoJHImxj9hcxbCiSRgFrryex77ACzcdjic5quUz3iS/5NwMMIZ0FllY/6H
	3RsQ==
X-Gm-Message-State: AIVw1129frGcR4tzdO6vPrt2AIKbgCZv99aN1lDXlMEvbc3RJ/7rm2n1
	AKCc+9aU2yJKUnAqdByW1TssPyLyEx7Y
X-Received: by 10.36.26.200 with SMTP id 191mr2011833iti.7.1500006988952; Thu,
	13 Jul 2017 21:36:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.128.39 with HTTP; Thu, 13 Jul 2017 21:36:28 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
Date: Fri, 14 Jul 2017 12:36:28 +0800
Message-ID: <CADwFkYe+ucsFGqy9cO=p_wA7XyK8ocLUbtrzBNQueu_rutxusg@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: how to check which package is installed for specific image, and whey it is installed?
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
X-List-Received-Date: Fri, 14 Jul 2017 04:36:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

I checked the 'taskexp', but can't get what I want.
I want to know what package is installed, and why it is installed,
indeed, for 'systemd-vconsole-setup'.

Thanks!


Yi Qingliang

