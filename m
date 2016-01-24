Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 624917707B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 23:20:26 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id cy9so70807039pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 15:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=NHeznB3cjR/EPe+ApDFMxk0MrwL6moRO8Hhgz5169vI=;
	b=g2Lkf7/bmq/5ko/JP5UAVmL4Xt9JgySjkaulR/DasXiK2P4awZnHWfwfrC4B74F6Ak
	zsM8y6cFL4F4FGd6Ea0D6UEj20+Pte7Q/yTCoRia3mi4G2WRcf1uuNv7PI8eWJDgTcPK
	9JyaTQzmb85JIOoTDbguII7k0g6geNcvSVeTh+d4R5NGIajqEMHlu+YFrvQbMIAl6s49
	6hhS4vVE2M/yHAzHDKv6l14DMceQsc9Idh4Z6j5I2p/xvOqsW7F9b19mUI5p4cXD9Bwp
	ePw9GQZdzMSzqwixA1Hup+qJ3Na+X9XONtohpaNdMOQecOaXHoFWF4t9z8IjqZnI15mM
	FqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type:content-transfer-encoding;
	bh=NHeznB3cjR/EPe+ApDFMxk0MrwL6moRO8Hhgz5169vI=;
	b=QdQrHI7S6TOpfwQXiK6xliL/RBXL/3lIzYAX4+oO84xC5ZM2lIRmY0KbkTIOWdIg8u
	OHopWvs8ZGVn5jKB5W7EtrDw8UZ7jfGo1QYRvYbp3beMFjlFM16kWFS5ZpDTvqkeZRg6
	QWDPf5oBkNE6NPueY8pWLHOcQo54fPbWUgnij4WAlUYRZ3BGuin0iNnQRWCJKOsA4Yx9
	001DMkobmxEQX+/cnzyctTIGtult2gvfQPoYaO/eyE2yOe2GNAwTsgRl9Vnp5fRPqQMC
	B+l+IgM33TazQaQzQ6r5q2vS6P8gEIvA6K4Js33MFUwqFD3QKRZGJJo3QeuUtqEXPs98
	vXpg==
X-Gm-Message-State: AG10YOSdTUBp59UlC/pxOZi+MC6MEirMeNUObQqRSyiHuodHCUMTuXlrx05srFA8+w5Gjw==
X-Received: by 10.66.236.69 with SMTP id us5mr21463733pac.93.1453677627962;
	Sun, 24 Jan 2016 15:20:27 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:b584:3e69:b68e:9dba?
	([2601:202:4000:1239:b584:3e69:b68e:9dba])
	by smtp.googlemail.com with ESMTPSA id
	b84sm23816094pfj.25.2016.01.24.15.20.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jan 2016 15:20:26 -0800 (PST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56A55C2D.9030205@gmail.com>
Date: Sun, 24 Jan 2016 15:20:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: Jethro backport request
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
X-List-Received-Date: Sun, 24 Jan 2016 23:20:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


Please backport a2f23fa62858b89850aab339ddec16dcf6026b37  from master to
Jethro

regards,
Armin

