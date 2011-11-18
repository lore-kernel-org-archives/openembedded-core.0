Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RRHJN-0002Dv-U2
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 06:48:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAI5g2xQ010044
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 21:42:02 -0800 (PST)
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 Nov 2011 21:42:02 -0800
Message-ID: <4EC5F027.90605@windriver.com>
Date: Fri, 18 Nov 2011 13:41:59 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1321421127.git.kai.kang@windriver.com>
	<c7dca7b45c59a9fddbd9551cac5426906a1036c2.1321421127.git.kai.kang@windriver.com>
	<20111116085857.GA11275@mi.fu-berlin.de>
In-Reply-To: <20111116085857.GA11275@mi.fu-berlin.de>
X-Originating-IP: [128.224.162.225]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pAI5g2xQ010044
Subject: Re: [PATCH 1/1] mesa: fix cross compile failure
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
X-List-Received-Date: Fri, 18 Nov 2011 05:48:30 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B411=E6=9C=8816=E6=97=A5 16:58, Henning Heinold wrote:
> On Wed, Nov 16, 2011 at 02:09:03PM +0800, Kang Kai wrote:
>> the bin/mklib file in mesa source code uses commands "ar ranlib" on bu=
ild
>> machine, this causes build failed on some platform.

Hi Bye,
>
>
> Hi,
>
> you added CC and CXX variables for linking too, shouldn't that mentione=
d in the
> commit msg too?

Fine, I'll add this msg

Thanks,
Kai


