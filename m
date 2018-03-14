Return-Path: <jpmv27@yahoo.com>
Received: from sonic317-27.consmr.mail.bf2.yahoo.com
	(sonic317-27.consmr.mail.bf2.yahoo.com [74.6.129.82])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3C26011B
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 15:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1521040953; bh=fV9lUroMGwekTn3NZIaQj11Ofw8caY9occkoeA4R37A=;
	h=To:From:Subject:Date:From:Subject;
	b=kAywP0ooGKlx0jpZbKEKUUmFhskNPlz6Uig83JPdNHvZymqp39kmmKue3lQwQEmECo3yCv2rv29TKjJA9r2p8QG8jNTh0ZRdf66BimuKN750FG6gXftNnnadHZ7x+JYOjLMp+jP/oXB08uqci2WzXb7ulu4H5wSEe1gk5N4hTtbb4oFuRIJeJSqA1kPvHqLuNStt6H04zvqCoXR+ptMoEJ96xPGMqgyc/pmPr3z/Elf/IA9jOOdARCWk2Uy82e29jswIGyTKCytUoTsVbQ7Zd1D1bGAalnBNKGMLOhcKgqoIsmVXZMzdbSO/SExbUADZSP7G4gcqJMTeDe+KLh2Nsg==
X-YMail-OSG: drmLPl4VM1lKYffqKPFpdoNKVNNfkjWYjEp092Gc5aHSW6PwFqLd8leHm2HyFwM
	tX24RNUzdc7AWJ5SYv.LtKkAo_ZYdnsFC0zLtsD8BwgM7Dhj78WEo74bCM8BFJgfYb4J.NlU7d0n
	NA4uhPoKz.nA7ZUFuiSzRiwbn2gg0Jsn64dl8_S419FlKI5OpYqMZw_bynKxbbQbGgHuYDvliXbx
	O3RWi3bnXK.YnNJBFdDAXnHhPijU9qnGDJhC6rEupi._CdRvaprNL7b.cEmP.b2qvwXwIurvEoiz
	mUc6u5qEjRBY63EpV3mtmphhKLAhkGmIh3jnQiEzWBdTfzzE6ZiSsFRId.4Rd67i6GLp9aOtvNnk
	P7eN5LatC9kcrmG1WOn4vYEIcxnyE1con7OVZrz6n.nAUmdHMQQEpYrl6AwEjqxDUkxOKIKAC_5E
	_c5Cu9Aq.1r2vue7yfP4xAvf2CJUInMUx8DaNoBo_bUTJjuGo0TZTkmIZEcqRZ3SUI_pwo07HpyR
	0RT0-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic317.consmr.mail.bf2.yahoo.com with HTTP;
	Wed, 14 Mar 2018 15:22:33 +0000
Received: from CPE000db93f888c-CM001404556d28.cpe.net.cable.rogers.com (EHLO
	[10.11.12.90]) ([99.246.128.134])
	by smtp429.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
	5835c6c35d292a9bf007a7586ddf4f66
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 15:22:28 +0000 (UTC)
To: Openembedded-core@lists.openembedded.org
From: Martin Vuille <jpmv27@yahoo.com>
Message-ID: <c1fcdce0-7ad4-d7ce-287b-3783579fc631@yahoo.com>
Date: Wed, 14 Mar 2018 11:22:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
Subject: Recipe for Linux page-types tool
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
X-List-Received-Date: Wed, 14 Mar 2018 15:22:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I have a recipe for building the page-types Linux kernel VM tool.
Is there any interest in this?
If so, to what project/layer should I send it?

MV

