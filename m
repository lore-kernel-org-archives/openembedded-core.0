Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2819CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:05:28 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.214214.1697547920924543325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=DiOd/chw;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=To:Cc:Date:Message-Id:Subject:Mime-Version:
	Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=seKLGZXYa48dnq5tkbc88A404qEIWvnDPBUPF0vSulk=; b=DiOd/chwqrIme+9PpVq2RCc34F
	jMEqLj2ENUX20hdFRZCarpD/uMoIJzORc+PvGX5Df+Ce+O+L9t2edjHWp98V0qBttNLVfZTrSYXZq
	L8i5T2ETLMpTb2G2Dlx2JgYmQhBtC1Djg6WLNp6aMb0k9ZSwKTAtESD5Zd8FJ8PYZXH2wTUXuQHQR
	8BdbRZOgw0trYqGdDFawaiQP/jQNmamMFsz5vRJQjv/P++TuBLBI+rOMxIlJF7zCIqGWIr5keSfB9
	uO+NhfSdJAvnylQGNMRL6rK3Wx6Cowgu3qHAHiXon74DGgKR5Zhvqu/CRvIGe2ClRw5sPrHoBg1iv
	EfV1XBSA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qsjl7-0000c5-0N; Tue, 17 Oct 2023 15:05:17 +0200
Received: from [185.17.218.86] (helo=smtpclient.apple)
	by sslproxy06.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qsjl6-00081r-LX; Tue, 17 Oct 2023 15:05:16 +0200
From: Sean Nyekjaer <sean@geanix.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: weston-init: how to debug with systemd
Message-Id: <A3F3DAF2-8744-47F1-A9B3-EF93448DD30E@geanix.com>
Date: Tue, 17 Oct 2023 15:05:06 +0200
Cc: openembedded-core@lists.openembedded.org
To: denis@denix.org,
 alex.kanavin@gmail.com,
 raj.khem@gmail.com
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27064/Tue Oct 17 10:11:10 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189323

Hi,

To my understanding the weston.service doesn=E2=80=99t log to journal. =
If I'm is running the weston binary there is fine output on stdout.

Looks like TTYPath is eating the logs, but I could be wrong.

Adding:
ExecStart=3D/usr/bin/weston --modules=3Dsystemd-notify.so =
--log=3D/tmp/weston.log

Will of course give logs in that file

/Sean=

