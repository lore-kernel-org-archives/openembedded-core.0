Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4500378CDE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 06:44:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6U6iJUd025046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jul 2018 23:44:20 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 29 Jul 2018 23:44:18 -0700
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <cf6a8d01-cdc3-c160-c586-e1a7b5bcf8b8@windriver.com>
Date: Mon, 30 Jul 2018 14:48:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
X-Originating-IP: [128.224.162.218]
Subject: Why do we use sysklogd as the default syslog?
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
X-List-Received-Date: Mon, 30 Jul 2018 06:44:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I just noticed that we are using sysklogd as the default syslog.
meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb:VIRTUAL-RUNTIME_syslog 
?= "sysklogd"

sysklogd has stopped development for about 4 years, and as far as I can 
see, nobody is maintaining it.
Is there some specific reason why we want to keep it as the default 
syslog for our reference images? small size?

Best Regards,
Chen Qi

