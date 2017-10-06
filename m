Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 976BA71D9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 22:34:40 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id b11so10444324pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=KFQMby8eY0Ejv6I1WMxNUgWAwTYNZPWCP3x2Iwrha/c=;
	b=MtGrTwgjUxrXPAcDBsYzpilAQxkoo4p25eOAX6L26ztRjqHbTeNcGmaePTtDSH2lB8
	41/Hyq6gGiLkuTYVeb7a0bw1Bo3zufDVTls3g1sEsK2OI7gctkHo99WcbvTpFtGM6fxA
	w0r8zqnU4lNJ0zI84RgEjTYsZ2jRWCKwO4vwLNbwsK6skEz3oxcMo07y3l2Ldw3orkUU
	nhCU6N5mF8cYBfCypCVtrokq9dHeA7yhDR83W+Xrm6a1ecALoKJ1o0h7T8ApH7X9SHaF
	8h51ePkhZ5iFyf4OiiCy1e7RinOzSbW7T/3QnzkKqIDj6PebqrZ2pEveJUwhMmF1tRYy
	V8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=KFQMby8eY0Ejv6I1WMxNUgWAwTYNZPWCP3x2Iwrha/c=;
	b=l5W6r+oRHW0P/wngoHAd+O5Q4fNsDrmNoJE6HBbjPC8zzR5bvRw7wf3RtcZwOPMfKT
	NgtHDcMcpFidYK+M8dEva6iMJjafH/ZZtmm+fpsFDIhZOEQpRtqqd/25vonB5OteqUpb
	jdO5z3FopmFxBGckyyrgxSRsy1JObnSTiQE5ID/JtrMf7NJHzNyfssXsfQFkv4zUHpCL
	zbsbXrwdXBaiOkbQkuBIzk4kNvMEcVkakJqYg0HHeLJI0wKb5heHEem3u4pBgv/y6OBO
	OU+H8pdklw5Ttr6FvaAm4jMp0NLO18IYV9EzE6cPzKL6ipfeYsdMydcTL+nGHg8O2Wxh
	NFtg==
X-Gm-Message-State: AMCzsaVwShFvRswEVYnE2VpJSrLUftZI1I9mVp67An11dPus0Kycawei
	MXs0i3TSWPJoOZZsSqC7r5F3rQ==
X-Google-Smtp-Source: AOwi7QA+whGcA3Je71VtdSTkSEizgk0eHYzQ05HbuK6+aGcJPx79uX9ovc9rhGHm4HXpFyC8wsZFeg==
X-Received: by 10.99.120.3 with SMTP id t3mr3138432pgc.388.1507329281537;
	Fri, 06 Oct 2017 15:34:41 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:2592:db33:fab5:1bd8?
	([2601:202:4001:9ea0:2592:db33:fab5:1bd8])
	by smtp.gmail.com with ESMTPSA id 68sm4979785pfo.24.2017.10.06.15.34.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 15:34:41 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1507301999.git.akuster808@gmail.com>
	<CAJ86T=Xw7rBZ_2N2NT1kWKwspx9S88wmASx5mgxxGYcG4QqBVA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0a9943ac-68c6-ef68-5182-5e39d442424e@gmail.com>
Date: Fri, 6 Oct 2017 15:34:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xw7rBZ_2N2NT1kWKwspx9S88wmASx5mgxxGYcG4QqBVA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/16] Morty next pull request
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
X-List-Received-Date: Fri, 06 Oct 2017 22:34:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


Hello Andre,

On 10/06/2017 02:28 PM, Andre McCurdy wrote:
> Hi Armin,
>
> On Fri, Oct 6, 2017 at 8:02 AM, Armin Kuster <akuster808@gmail.com> wro=
te:
>> Cover letter only
>>
>> Please consider these changes for Morty.
>> Clean build on AB
> I guess these changes are too late for this round but please consider
> for the next one:
For this current request yes. This current set was held up by build
issues and I did not want to add any more variations in until we got
things sorted out.
This does not stop me from queuing yours up and getting a build going. I
do need to double check Pyro to ensure the changes are there all ready.
=C2=A0
thanks for the patches.

- armin
>
>   http://lists.openembedded.org/pipermail/openembedded-core/2017-Octobe=
r/142985.html
>
>> The following changes since commit e2fcc721c2af8e2785a91eaceea1d81f503=
ea2ec:
>>
>>   devtool.py: update testcase Ids in morty (2017-09-25 22:21:45 +0100)=

>>
>> are available in the git repository at:
>>
>>   git://push.yoctoproject.org/poky-contrib akuster/morty-next
>>
>> Alexander Kanavin (1):
>>   v86d: take tarball from debian
>>
>> Armin Kuster (7):
>>   linux-yocto/4.1: update to 4.1.43 plus bluetooth CVE-2017-1000251
>>   linux-yocto/4.4: update to 4.4.87 plus bluetooth: CVE-2017-1000251
>>   lunux-yocto/4.8: update to 4.8.25 plus bluetooth: CVE-2017-1000251
>>   linux-yotoc/4.1: update to 4.1.43 plus CVE-2017-1000251
>>   linux-yotoc/4.4: update to 4.4.87 plus CVE-2017-1000251
>>   linux-yotoc/4.8: update to 4.8.25 plus CVE-2017-1000251
>>   libpng: lsb version 1.2.56 url fix
>>
>> Bruce Ashfield (1):
>>   linux-yocto/4.1: fix gcc7 compilation and v4.1.39
>>
>> Leonardo Sandoval (2):
>>   selftest/cases/signing: ignore removal errors when cleaning temporar=
y
>>     gpg directory
>>   sign_rpm.bbclass: force rpm serial signing
>>
>> Maxin B. John (1):
>>   hostap-utils: use w1.fi for SRC_URI
>>
>> Nicolas Dechesne (1):
>>   kernel.bbclass: fix KERNEL_IMAGETYPE(S) for Image.gz
>>
>> Ross Burton (3):
>>   bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
>>   diffstat: use HTTP mirror for SRC_URI
>>   libpng: use SourceForge mirror
>>
>>  .../recipes-kernel/linux/linux-yocto_4.1.bbappend  | 20 ++++++-------=

>>  .../recipes-kernel/linux/linux-yocto_4.4.bbappend  | 20 ++++++-------=

>>  .../recipes-kernel/linux/linux-yocto_4.8.bbappend  | 20 ++++++-------=

>>  meta/classes/kernel.bbclass                        | 18 ++++++------
>>  meta/classes/sign_rpm.bbclass                      |  6 ++++
>>  meta/lib/oeqa/selftest/signing.py                  |  7 +++--
>>  meta/recipes-bsp/hostap/hostap-utils.inc           |  5 ++--
>>  meta/recipes-bsp/v86d/v86d_0.1.10.bb               |  6 ++--
>>  meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
>>  .../bluez5/bluez5/cve-2017-1000250.patch           | 34 +++++++++++++=
+++++++++
>>  meta/recipes-devtools/diffstat/diffstat_1.61.bb    |  2 +-
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |  6 ++--
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  6 ++--
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |  6 ++--
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |  6 ++--
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  6 ++--
>>  meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  |  6 ++--
>>  meta/recipes-kernel/linux/linux-yocto_4.1.bb       | 20 ++++++-------=

>>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 20 ++++++-------=

>>  meta/recipes-kernel/linux/linux-yocto_4.8.bb       | 20 ++++++-------=

>>  meta/recipes-lsb4/libpng/libpng12_1.2.56.bb        |  6 ++--
>>  meta/recipes-multimedia/libpng/libpng_1.6.24.bb    |  6 ++--
>>  22 files changed, 145 insertions(+), 102 deletions(-)
>>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-1=
000250.patch
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



