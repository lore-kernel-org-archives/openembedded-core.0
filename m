Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1S3jqR-00087Q-SL
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 08:57:35 +0100
Received: by lagw12 with SMTP id w12so3047009lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 23:49:03 -0800 (PST)
Received-SPF: pass (google.com: domain of jay@jay-tech.ru designates
	10.152.136.36 as permitted sender) client-ip=10.152.136.36; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of jay@jay-tech.ru
	designates 10.152.136.36 as permitted sender)
	smtp.mail=jay@jay-tech.ru
Received: from mr.google.com ([10.152.136.36])
	by 10.152.136.36 with SMTP id px4mr11323974lab.47.1330760943924
	(num_hops = 1); Fri, 02 Mar 2012 23:49:03 -0800 (PST)
Received: by 10.152.136.36 with SMTP id px4mr9324825lab.47.1330760943455; Fri,
	02 Mar 2012 23:49:03 -0800 (PST)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.112.87.197 with HTTP; Fri, 2 Mar 2012 23:48:43 -0800 (PST)
X-Originating-IP: [2.92.3.29]
In-Reply-To: <CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Sat, 3 Mar 2012 10:48:43 +0300
X-Google-Sender-Auth: ghVQ3vNay4Mzdc6KlBvzJzSURi4
Message-ID: <CAJG6M_OO4o6E7EZv1ROReYigpycDBUWXWb+KuvbV-KO8u+_ocg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm03d6yz8so2GbqYOuNQbDi+vLvoGUqPDLjriKa/MGl378Zq2g/dnGOaykWESYT5seHnerZ
Subject: Re: Recipes with disabled parallel make
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2012 07:57:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/3/3 Yury Bushmelev <jay4mail@gmail.com>:
> 2012/2/10 Khem Raj <raj.khem@gmail.com>:
>> Hi
>>
>> Just grepped for the occurances of disabled parallel make and I see
>> around 40 cases on oe-core
[skip]

> 2. Recipes _not_ confirmed to fail with P_M enabled (i.e. are building
> ok in my environment with P_M enabled):
[skip]
> meta/recipes-extended/net-tools/net-tools_1.60-23.bb

net-tools confirmed to fail with P_M disabled when build was run with
BB_N_T="7" and P_M="-j 7".

-- 
Yury Bushmelev


