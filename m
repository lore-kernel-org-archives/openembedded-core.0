Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6jEc-00053e-Af
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 15:22:38 +0200
Received: by fxi1 with SMTP id 1so2749736fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 06:17:18 -0700 (PDT)
Received: by 10.223.23.10 with SMTP id p10mr3014435fab.112.1316697438763;
	Thu, 22 Sep 2011 06:17:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n12sm7470788fan.9.2011.09.22.06.17.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 06:17:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <j5fbi7$opp$1@dough.gmane.org>
Date: Thu, 22 Sep 2011 15:17:11 +0200
Message-Id: <C9AF5103-2487-4DA1-A348-1E28411FAD29@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>	<CAP9ODKqwxc7TcZhgNtuZfan_Kbdn2hJ7UELfy=BeFtGS3iGKGQ@mail.gmail.com>	<j5f9i0$9uf$1@dough.gmane.org>
	<95C58349-35C4-4027-BDEA-7841ED3B4A16@dominion.thruhere.net>
	<j5fbi7$opp$1@dough.gmane.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/5] kernel.bbclass: blacklist 'perf-dbg' as well for the modules metapackage
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
X-List-Received-Date: Thu, 22 Sep 2011 13:22:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 sep. 2011, om 15:00 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:

> On 09/22/2011 04:35 PM, Koen Kooi wrote:
>>=20
>> Op 22 sep. 2011, om 14:25 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:
>>=20
>>> On 09/18/2011 02:23 AM, Otavio Salvador wrote:
>>>> I have sent this in July and it was nacked. See at
>>>> =
https://github.com/OSSystems/oe-core/commit/5c53cbf951a11ed92fb2ad0837991d=
b256c11489
>>>=20
>>> Answering the original question by Saul:
>>> A possible better question is why perf-dbg is getting generated and =
what's in it?
>>>=20
>>> perf and perf-dbg are generated to contain perf tool if it's not =
directly enabled (AFAIK), but you can compile it by running make in =
tools/perf. It has some additional depends (like binutils-dev, =
elfutils-dev, news-dev, etc., so it's not enabled by default. Probably =
we should enable it though.
>>=20
>> the oe core kernel.bbclass builds perf by default
>=20
> according to kernel.bbclass: "perf must be enabled in individual =
kernel recipes"

And pretty much everything uses recipes-kernel/linux/linux-tools.inc, =
which enables it. I had to add do_compile_perf() { : } to my old kernel =
recipes that have a broken perf, so it's opt-out, not opt-in.=


