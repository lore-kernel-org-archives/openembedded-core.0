Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S3vBn-00043Q-6U
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 21:04:23 +0100
Received: by lagw12 with SMTP id w12so3429120lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2012 11:55:50 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.23.100 as permitted sender) client-ip=10.112.23.100; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.23.100 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.23.100])
	by 10.112.23.100 with SMTP id l4mr6763676lbf.24.1330804550686 (num_hops
	= 1); Sat, 03 Mar 2012 11:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Q28IM85RoTRc3kzKf/UFgFBSbofdPsJuSeqSxK5OfoQ=;
	b=KxHgw4PmL6uKGhEnO0l7Sv/Cywddt20ZR26MUdaYo/9BDfA3DglZUp6NJeBphEUsiB
	8FtMz4ttr88rHJ/Oiea5iyeO+ucDAAH2jTs+uY52XeHsCvmy2gSEKpBr+zMTQjAJ4tZT
	EW/VCCPtgKcP4oQOaJJdjFPmpsoAw0YkeVkORRZ72CoOvtxxBH9kUBClEko2SX2DnCin
	G5iQqmu1LsUIL8MErNoHPSWf7bZ5MXvvYwysfUR5K4cpOkFYnkh2DpmHQfWPRayvnyFd
	2Ii9R61ar8OlY9KJNaHQJIMPHP1bFWirQpyAxf8Q0dtlpxbsVyjv+TwRgLkM2dINuy4Q
	9cmA==
Received: by 10.112.23.100 with SMTP id l4mr5588537lbf.24.1330804550324; Sat,
	03 Mar 2012 11:55:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Sat, 3 Mar 2012 11:55:20 -0800 (PST)
In-Reply-To: <CAJG6M_OO4o6E7EZv1ROReYigpycDBUWXWb+KuvbV-KO8u+_ocg@mail.gmail.com>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
	<CAJG6M_OO4o6E7EZv1ROReYigpycDBUWXWb+KuvbV-KO8u+_ocg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Mar 2012 11:55:20 -0800
Message-ID: <CAMKF1sr+mqhe5P5zgvpHvcoqnRYA66JkRBbji=eeb+dwM8K3tg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 03 Mar 2012 20:04:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 2, 2012 at 11:48 PM, Yury Bushmelev <jay4mail@gmail.com> wrote:
>> meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>
> net-tools confirmed to fail with P_M disabled when build was run with
> BB_N_T="7" and P_M="-j 7".

hmmm this is reversal of course. so I guess in order to declare them good
they should be compiled in variety of combinations.


