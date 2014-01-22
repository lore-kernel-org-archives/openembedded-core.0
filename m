Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3FA6360E7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 18:17:40 +0000 (UTC)
Received: from [172.16.141.123] (172.16.141.123) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 22 Jan 2014 19:15:44 +0100
Message-ID: <52E00ACA.10502@enea.com>
Date: Wed, 22 Jan 2014 19:15:38 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1390405731-19334-1-git-send-email-david.nystrom@enea.com>
	<CAP9ODKqQ1Y-p_tAyMY=Rmw8t4ct7jXqxV=mBaqLdLXXpW+er1g@mail.gmail.com>
In-Reply-To: <CAP9ODKqQ1Y-p_tAyMY=Rmw8t4ct7jXqxV=mBaqLdLXXpW+er1g@mail.gmail.com>
X-Originating-IP: [172.16.141.123]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-standalone-sdk-target: Add qemuwrapper-cross to target sysroot
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
X-List-Received-Date: Wed, 22 Jan 2014 18:17:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2014-01-22 19:08, Otavio Salvador wrote:
> On Wed, Jan 22, 2014 at 1:48 PM, David Nystr=F6m
> <david.c.nystrom@gmail.com> wrote:
>> Some postinstall scripts use the qemuwrapper script, so to be able to
>> offline install these packages outside of the bitbake environment, this =
script
>> needs to be exposed also in the SDK.
>>
>> This to enable rootfs generation from a package repository using only a
>> package repository and the toolchain tarball.
>>
>> See https://github.com/nysan/rootfs-sandbox for examples.
>>
>> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
>
> Shouldn't this be a RDEPENDS of the postinst package?
>

Do you mean a RDEPENDS on the run-postinsts package ?
In that case no.

When $D is set, postinstalls interpret this as a offline install,
some postinstalls call postinstall-intercepts, which in turn use the=20
qemuwrapper script _only_ if $D is set.

run-postinsts should be installed if there are postinstalls which failed=20
to run during the offline install.

Just to clarify this, the qemuwrapper-cross will only be installed to=20
the target SDK sysroot, never on the target rootfs.

Br,
David

