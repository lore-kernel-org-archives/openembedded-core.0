Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <David.Nystrom@enea.com>) id 1SjRK1-00042Q-QJ
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jun 2012 10:40:29 +0200
Received: from [172.16.140.132] (172.16.140.132) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.247.3;
	Tue, 26 Jun 2012 10:28:33 +0200
Message-ID: <4FE972C1.8000702@enea.com>
Date: Tue, 26 Jun 2012 10:28:49 +0200
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <david.nystrom@enea.com>
References: <1340106529-47436-1-git-send-email-david.nystrom@enea.com>
In-Reply-To: <1340106529-47436-1-git-send-email-david.nystrom@enea.com>
X-Originating-IP: [172.16.140.132]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc backport of ARM ucontext
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
X-List-Received-Date: Tue, 26 Jun 2012 08:40:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Arrgh,

Please ignore this, this was cached and resent due to a
malconfigured sendmail instance.

Br,
David

On 06/19/2012 01:48 PM, david.nystrom@enea.com wrote:
> From: David Nystr=C3=B6m<david.nystrom@enea.com>
>
> Last patch sent was corrupted due to sendmail issues,
> lets hope for better luck this time :).
>
> Allows for setcontext, getcontext swapcontext et.c. on ARM targets.
>
> David Nystr=C3=B6m (1):
>    Added backported ucontext support for ARM in eglibc
>
>   meta/recipes-core/eglibc/eglibc_2.13.bb            |    1 +
>   meta/recipes-core/eglibc/eglibc_2.15.bb            |    1 +
>   .../eglibc/files/0001-ucontext-for-arm.patch       |  434 +++++++++++++=
+++++++
>   3 files changed, 436 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/files/0001-ucontext-for-arm=
.patch
>



