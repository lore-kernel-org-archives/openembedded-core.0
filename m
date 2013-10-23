Return-Path: <kirgene@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 265876D2BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 10:53:37 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id i7so323085qcq.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 03:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=fDFGE6KD+ecRO7SMZU4+38BzRmxiLltFrO7tIZAyvKo=;
	b=0NRu9d34vr3oHneJBPpVxcNfIrHoYi+j6O06e79rqthZdsTmx4U6HXZHeauIsrmfcL
	l/enGciPAo6Dgc1BZi7/pBfv8h28Or6rJZGuWogtVoMbV4ysqlIUl2Hf8Ll+VLgwQ7Dg
	OryJJsXZrnYSXNceMusuWNMu7Zrr65+XmG+WwDImcekoIBDrPUdaxgHK52IxhkSjNHBA
	sTupXknEMwql07kTVxVj5Hk0bhioqcm9H+jK3v+bhGptW48qwCWZBFK3nEepl7wVaBGr
	l1wdUZIL9cRcmQdDlvyXyFBKYmiDhuY2FibkjNfTfSeCu38tTpXAQpugH6iHh934lgF3
	cphw==
MIME-Version: 1.0
X-Received: by 10.49.127.179 with SMTP id nh19mr1130353qeb.1.1382525618794;
	Wed, 23 Oct 2013 03:53:38 -0700 (PDT)
Received: by 10.96.164.36 with HTTP; Wed, 23 Oct 2013 03:53:38 -0700 (PDT)
Date: Wed, 23 Oct 2013 13:53:38 +0300
Message-ID: <CADV-EXHtc2EVTwHhaxGdm3bxmm_uNf2RN4ZinDgZU0mhF=P2vg@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd.bbclass: do not call 'systemctl restart ${SYSTEMD_SERVICE}' at systemd_postinst
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
X-List-Received-Date: Wed, 23 Oct 2013 10:53:37 -0000
Content-Type: multipart/alternative; boundary=047d7b62249a66b7f504e966543b

--047d7b62249a66b7f504e966543b
Content-Type: text/plain; charset=ISO-8859-1

Current version of opkg has an issue with upgrading systemd services:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4213

Best regards,
Yevhen

--047d7b62249a66b7f504e966543b
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div>Current version of opkg has an issue with upgrading systemd services:</div><div><a href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=4213">https://bugzilla.yoctoproject.org/show_bug.cgi?id=4213</a><br>
</div><br clear="all"><div>Best regards,<br>Yevhen</div>
</div>

--047d7b62249a66b7f504e966543b--
