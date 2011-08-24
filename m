Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qw2dX-0001J5-Oz
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 03:52:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7O1lN2w023492
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Aug 2011 18:47:23 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 23 Aug 2011 18:47:23 -0700
Message-ID: <4E545824.8000408@windriver.com>
Date: Wed, 24 Aug 2011 09:47:16 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: Holger Freyther <zecke@selfish.org>
References: <4E522492.9050706@windriver.com> <4E523DE7.8060609@selfish.org>
In-Reply-To: <4E523DE7.8060609@selfish.org>
X-Originating-IP: [128.224.162.196]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p7O1lN2w023492
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: question about meta/class/qmake-base.bbclass
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
X-List-Received-Date: Wed, 24 Aug 2011 01:52:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B408=E6=9C=8822=E6=97=A5 19:30, Holger Freyther wrote:
> On 08/22/2011 11:42 AM, Kang Kai wrote:
>> Hi Holger,
>>
>> I am confused that why unset QMAKESPEC first and then use it a argumen=
t for
>> qmake?
>> Could you help me to get out of that?
> Hi,
>
> it has been a long time and I can only speculate right now. It might ha=
ve been
> that QMAKESPEC was not shell exported, and we really wanted to make sur=
e that
> it is using the QMAKESPEC we use in the recipe. Alternatively  it might=
 be a
> style issue, e.g. it is easier to see which spec is used by looking at =
the
> qmake invocation (also when changing the .pro in the ${S} the right spe=
c would
> be used again).
>
> holger
>

Hi Holger,

Thanks for your reply, and I think I can understand them right now.

Thank you!
Kai


