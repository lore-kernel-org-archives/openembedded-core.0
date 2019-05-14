Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 10DC97C79F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 21:05:02 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id D4A321C0267;
	Wed, 15 May 2019 09:05:02 +1200 (NZST)
To: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
	openembedded-core@lists.openembedded.org
References: <20190514055559.17676-1-douglas.royds@taitradio.com>
	<5d269448-8fac-8405-7315-1f97786e04c9@taitradio.com>
	<6aabd03c-d747-4a4f-4c9d-7496abf5fee4@geanix.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <126796a7-f50a-9bc1-fb24-9c30290bdfbf@taitradio.com>
Date: Wed, 15 May 2019 09:05:02 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6aabd03c-d747-4a4f-4c9d-7496abf5fee4@geanix.com>
Subject: Re: [PATCH] distutils: Tidy and simplify for readability
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
X-List-Received-Date: Tue, 14 May 2019 21:05:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 14/05/19 6:41 PM, Martin Hundeb=C3=B8ll wrote:

> On 14/05/2019 08.16, Douglas Royds via Openembedded-core wrote:
>> Can anyone explain why I appear on patchwork as "Andrii Bordunov via=20
>> Openembedded-core"?
>
> Yes.
>
> Because the DMARC policy for your domain is "quarantine":
>
> =C2=A0 % dig _dmarc.taitradio.com TXT | grep -oE 'p=3D(reject|quarantin=
e|none)'
> =C2=A0 p=3Dquarantine
>
> If the mailing list simply forwards your mails, they will fail=20
> validation, and thus be held back by the receiving mail servers. To=20
> avoid this, Mailman changes the "From:" header to "Douglas Royds via=20
> Openembedded-core <openembedded-core@lists.openembedded.org>".
>
> Now the email address seen by patchwork is the same for everyone with=20
> either "reject" or "quarantine" as DMARC policy. I guess patchwork has=20
> that address associated with Andrii (maybe he came first).
>
> More info from mailman: https://wiki.list.org/DEV/DMARC


Great, thanks for that.


