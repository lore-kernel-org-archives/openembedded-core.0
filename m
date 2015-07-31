Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id D3AD47648B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 08:55:18 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so49847847wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 01:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=FxuSIRgu2odmdfg4gDDKXJPMTPHG7ZzwjB8dRwTlENE=;
	b=bLt4H2rqVmg/YEACPVHYmoFSdVf7iWgeG3TkcC7fF3voH2QB9+cim+vamcfjxUi25G
	FDJsKQOMtBYpYxoQ2LvBzyVHCqdpIGPV3sb+leei+wE5h6TtXPJZCInsnazFe0YYAaIw
	dIU+5vckOZdm2+vtLtPks+XM1yQi0gOuNKJ54EtccvWwHEmwydS6AOMWmMXg4cGDyEyS
	3IOYAy7FqcYtuM+bCexX8oAygpfDk+G8DoetPpCPs9aEmEs53xKy2q4ZHV4Eort4pLCn
	6TZl4ExP60N4NSu9ANyDuwL11M8OEYZjKMTYdK/nLDOPVGZCCw8Fxnam8P+63ralwzqB
	XSlg==
X-Gm-Message-State: ALoCoQnGadf7kTwT56tirIThtv4O5seFNZKlrcNBXm/zu3fRP5QWdkehfqz79I06kyalULn09f9j
X-Received: by 10.180.94.7 with SMTP id cy7mr3930174wib.79.1438332918235;
	Fri, 31 Jul 2015 01:55:18 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	iy4sm3341065wic.24.2015.07.31.01.55.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jul 2015 01:55:17 -0700 (PDT)
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Martin Jansa <Martin.Jansa@gmail.com>, Denis Carikli <GNUtoo@no-log.org>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <55BB37F3.9030304@dresearch-fe.de>
Date: Fri, 31 Jul 2015 10:55:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
Subject: outdated compat-wireless
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
X-List-Received-Date: Fri, 31 Jul 2015 08:55:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

meta-openembedded contains a recipe for compat-wireless. According to [1] this is really outdated and replaced by a renamed project called backports[2].

Has anyone tried or plans to replace compat-wireless with this?

[1] <https://wireless.wiki.kernel.org/en/users/Download>
[2] <https://backports.wiki.kernel.org>

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

