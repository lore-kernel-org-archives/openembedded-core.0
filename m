Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1S3xN3-0007eH-1r
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 23:24:09 +0100
Received: by lagw12 with SMTP id w12so3495310lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2012 14:15:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jay@jay-tech.ru designates
	10.112.100.169 as permitted sender) client-ip=10.112.100.169; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of jay@jay-tech.ru
	designates 10.112.100.169 as permitted sender)
	smtp.mail=jay@jay-tech.ru
Received: from mr.google.com ([10.112.100.169])
	by 10.112.100.169 with SMTP id ez9mr6392597lbb.82.1330812936427
	(num_hops = 1); Sat, 03 Mar 2012 14:15:36 -0800 (PST)
Received: by 10.112.100.169 with SMTP id ez9mr5245260lbb.82.1330812936062;
	Sat, 03 Mar 2012 14:15:36 -0800 (PST)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.112.87.197 with HTTP; Sat, 3 Mar 2012 14:15:15 -0800 (PST)
X-Originating-IP: [2.92.3.29]
In-Reply-To: <CAMKF1sr+mqhe5P5zgvpHvcoqnRYA66JkRBbji=eeb+dwM8K3tg@mail.gmail.com>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
	<CAJG6M_OO4o6E7EZv1ROReYigpycDBUWXWb+KuvbV-KO8u+_ocg@mail.gmail.com>
	<CAMKF1sr+mqhe5P5zgvpHvcoqnRYA66JkRBbji=eeb+dwM8K3tg@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Sun, 4 Mar 2012 01:15:15 +0300
X-Google-Sender-Auth: omY2xL-oqNlLHsAwpGdshMevw_c
Message-ID: <CAJG6M_PbM=k0ceFynF4V34rL59q4F_wfydoOkKUkBvvt8CRkyg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQljINjX6eB+2dmx9KVN35NE07wBKuT2rZbRbLFwB6FjvtHcE6kqSOe2E8nkuqr+dDk+P64b
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
X-List-Received-Date: Sat, 03 Mar 2012 22:24:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/3/3 Khem Raj <raj.khem@gmail.com>:
> On Fri, Mar 2, 2012 at 11:48 PM, Yury Bushmelev <jay4mail@gmail.com> wrote:
>>> meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>>
>> net-tools confirmed to fail with P_M disabled when build was run with
>> BB_N_T="7" and P_M="-j 7".
>
> hmmm this is reversal of course. so I guess in order to declare them good
> they should be compiled in variety of combinations.

Doing this today. Tested P_M in range [2..7]. Following 2 recipes
failed and gone to list #1:

meta/recipes-core/eggdbus/eggdbus_0.6.bb
meta/recipes-extended/net-tools/net-tools_1.60-23.bb

I'll run some more extreme builds tonight.

-- 
Yury Bushmelev


