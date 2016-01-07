Return-Path: <scerveau@connected-labs.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DE0016FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 15:27:18 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l65so101410178wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 07:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=connected-labs-com.20150623.gappssmtp.com; s=20150623;
	h=sender:to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=/BIMAGgB9WzLk1U/iULprva8iAK33wCF/w3M4d/rrxs=;
	b=Oa8hTQSADyruk0Q0AYpsM09yjdOGD3vEUWDMW13yBTAoMWy/26b5s41j6RQnzECeEY
	PS03Nuj6mtncAFpGVhJYpeowqQaZUUTAgEVnvS0ZSjM0zkaSo72Wx45/9hKyOZebSVRm
	qhxMWedO8IXTsIswlRY921sjkHAI2NRTMgkxGWsl/DMCpoFXMfI86qLu5uqCPUFRyUlm
	ArKSvRMrJ0bCmBwAN4PojS2neeajPYWQ0lnyoWQ0YfIEUye+vIWs6PNPDMKqCDdS3VsT
	gOBfPHxEX3ZF//ncESmIYLuZg5LdLv89hO/RwlgJ+sJ8uw6Tn24mjj+Np69zl+uA9Es5
	j8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:to:from:subject:message-id:date
	:user-agent:mime-version:content-type:content-transfer-encoding;
	bh=/BIMAGgB9WzLk1U/iULprva8iAK33wCF/w3M4d/rrxs=;
	b=fPe4yI5yUNWvm4yTuoexdfj9NK75mexWvpLioDKjiJf2yZNpizuwH8YgNikJSnzMCZ
	BuZ+mYZutPy7rngVdnyI3fcc7Q120Hppw1IRxyGTmEftoZEclKIV6Y8i5g+JjmvXE6cf
	/HJ5PcXCfDncEXOB5lMCdibiFpuZ2aB3FwWvd1PzOgYva6ky0Gwg1u6cE0o/h5ETuxyT
	L8FJmTZsfDSh8wgPTAJJuPdqakLh2H3dAqjqakwJ5RTA1hMrdu2uQKpWmYPI4pgB1wt0
	BVSjzcUV0pY+eVliB9RSza80J+cajgNgYDKHjLNxkBbFd1xcbhviQD1f3wnVLkyMY2DT
	znxg==
X-Gm-Message-State: ALoCoQl086He7vYyFzs0o4dvnpJ9WDdKIj4TDH+UsI4iGgvqSi3YNCwCO/S+wjugYjYcz+gRvIXsHNn/BdP6y8jIQgIOnMyNVQ==
X-Received: by 10.194.85.165 with SMTP id i5mr127825896wjz.173.1452180439123; 
	Thu, 07 Jan 2016 07:27:19 -0800 (PST)
Received: from [172.24.63.46]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by smtp.googlemail.com with ESMTPSA id
	ql10sm101632158wjc.23.2016.01.07.07.27.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 07:27:18 -0800 (PST)
Sender: Stephane Cerveau <scerveau@connected-labs.com>
To: OE-core <openembedded-core@lists.openembedded.org>
From: scerveau <scerveau@voxtok.com>
Message-ID: <568E83D5.3020702@voxtok.com>
Date: Thu, 7 Jan 2016 16:27:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
Subject: mariadb: Some binaries could be packaged in client-test
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
X-List-Received-Date: Thu, 07 Jan 2016 15:27:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear all,

I would like to submit a patch to create a new package in mariadb recipe

FILES_${PN}-client-test = "\
     ${bindir}/mysql_client_test \
     ${bindir}/mysql_client_test_embedded \
     ${bindir}/mysqltest_embedded"

It could save up to 23 MB on target.

Please advise if it could be interesting for the community ?

-- 
Stéphane Cerveau
Tech Lead Audio
Voxtok Technologies
04 34 40 82 43
www.voxtok.com


