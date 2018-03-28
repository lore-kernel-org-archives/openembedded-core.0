Return-Path: <piyushkumar29995@gmail.com>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id E806E78425
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 10:14:51 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id h55-v6so527937ote.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 03:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=k5AWygy29ItDfylOrTrMmuRvx971G/gwDAnD1BeIV6Y=;
	b=V5jyrg9aUPTgSSy0uxIMUiGVxGBbaqrWUNlxg6m7tIzLvUOte4wyCsDTGCakA4tUdB
	v2yNKlvNg/oA1EF5UKvBY0rKMev3M2KIQnlYEsoFnjVgYReHGQkQD9sKW3+6ozeLVZEO
	LuPXQS3ROZ1L3KKpTirrwrmaKWow0FYnftkuuOLfw7CBbAMPCkqU/p4Q1RNIG38kH1YC
	6/ibQkSShKCOdNFfr6BKX9Rmr8bk3/pWD1oqCxGjkMFCsRzSDBdg/E0oIFjBSxlcs45r
	XzjCiKBmtS1WWQteO0ZB530b9vbwfN7kBLdU4+ho0eWlG0OYWswvLgDj+Sp5tzyaY2GY
	R/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=k5AWygy29ItDfylOrTrMmuRvx971G/gwDAnD1BeIV6Y=;
	b=MUodZ8V4tNo6mfBvprn//YFDX8oN1Lj3aJuoDlicyWvjsi6NZW+XFeSUWCgi9k/8tv
	cZb8YlEiKMKr2msLOE0QTc8/srik/fH7xcLCIr8njZ5w7k4rPenJnTxWrwMNAQPmmiNn
	50c2HQXL7kRkFhVLvJIwLfFZaeNmIooh80cuWdomZ5qBmkee3Fwabh0kc30Rx4yqEDC0
	360OK1brQ9bcEYdbgUiLmkS188+OkRjFu4T/22yA6p/G4+Ew6IpDAEy7wpL1GIClutff
	SjDduTDVatmbNNCTAFxcyIUZv9XyQd6XqlTvxqsb3ZcdkrjlEDbUjJxAKJBg9FlR0zQd
	mwDg==
X-Gm-Message-State: ALQs6tCePFxJhb8aAS8D0LonQ96mnNtywB5FaruDVYx21wDZ/BtZ24dP
	laPNJvMrXYZJjeC22DwZ17XIL+0kgyF/xwYHiED5Og==
X-Google-Smtp-Source: AIpwx49hxu17FdQ/3LS1dZqn0rEF8U6pfX4v8Xza7Sk2MZpzMffkqmN1DXjMHra40G8kYAvWidcKbTSp+jvdPJWpENE=
X-Received: by 2002:a9d:40d:: with SMTP id 13-v6mr1933243otc.42.1522232092679; 
	Wed, 28 Mar 2018 03:14:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5541:0:0:0:0:0 with HTTP; Wed, 28 Mar 2018 03:14:52
	-0700 (PDT)
From: piyush kumar <piyushkumar29995@gmail.com>
Date: Wed, 28 Mar 2018 15:44:52 +0530
Message-ID: <CAOVPQjfJrkxuXcLmGffr_76c-bsZKg3Z+QjB6SaFMaAEwDSghQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: network issue pip is not able to fetch internet on yocto
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
X-List-Received-Date: Wed, 28 Mar 2018 10:14:52 -0000
Content-Type: multipart/alternative; boundary="00000000000026649e0568764702"

--00000000000026649e0568764702
Content-Type: text/plain; charset="UTF-8"

I am trying to do a pip install on poky for one of the python
package(i.e. wheel) and
it is resulting in this error


Retrying (Retry(total=4, connect=None, read=None, redirect=None)) after
connection broken by
'NewConnectionError'('<pip._vendor.requests.pacages.urllib3.connection.VerifiedHTPSConenction
object at 0xb68f988c>': Failed to establish a new connection: [Errno -2]
Name or service not known',): /simple/pyros-setup/
Could not find a version that satisfies the requirement wheel (from
versions: ) No matching distribution found for wheel
Do help

Thanks,

Piyush

--00000000000026649e0568764702
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><pre>I am trying to do a pip install on poky for one of the python package(i.e. wheel) and
it is resulting in this error


Retrying (Retry(total=4, connect=None, read=None, redirect=None)) after
connection broken by
&#39;NewConnectionError&#39;(&#39;&lt;pip._<wbr>vendor.requests.pacages.<wbr>urllib3.connection.<wbr>VerifiedHTPSConenction
object at 0xb68f988c&gt;&#39;: Failed to establish a new connection: [Errno -2]
Name or service not known&#39;,): /simple/pyros-setup/
Could not find a version that satisfies the requirement wheel (from
versions: ) No matching distribution found for wheel
Do help<br>
Thanks,<br><br></pre><pre>Piyush</pre><br></div>

--00000000000026649e0568764702--
