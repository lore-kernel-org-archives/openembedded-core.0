Return-Path: <prvs=0141995b2e=mike.looijmans@topicproducts.com>
X-Greylist: delayed 1935 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Nov 2016 08:30:51 UTC
Received: from mx6-09.smtp.antispamcloud.com (mx6-09.smtp.antispamcloud.com
	[95.211.2.200])
	by mail.openembedded.org (Postfix) with ESMTP id ABD0771AB7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 08:30:51 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx6.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cBdJ9-0000kp-C7; Tue, 29 Nov 2016 08:58:33 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 29 Nov 2016 08:58:30 +0100
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
References: <6df42b3b-66b7-25dc-faac-e26e19fefbfd@topic.nl>
	<9147101c-f99a-92fc-d45c-0b67f477a57e@topic.nl>
	<CADkTA4N-PEZZdDh7nrzaXBQb7jm0-SUkGbpcShXcQAJKe5bfEg@mail.gmail.com>
	<B3A9B210-3501-47BB-8B16-CC31C7A4BCC5@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <de64dc20-cff3-5f25-7e66-55887e641e3e@topic.nl>
Date: Tue, 29 Nov 2016 08:58:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <B3A9B210-3501-47BB-8B16-CC31C7A4BCC5@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw5xo+yL19ZkIV8F4VBe+tCaqeJUWd0HiubIWOWFjsT3ac1G7xK3gxSPcF7yYBLgvIXk/
	bVJ0XWECXvuiqkAs68ltP3IHr7mRRBdQ+rEKkqhnmNb6vV/9OcbV5CTmBwBTZeKGZApkiKnNYOLT
	Iu2CQPjaBRK0rMNzZTSwTZAPbSs+k/RKYcawF5EyqxxarlByymhsaqFQ/ea47b1uq8lozVwCUf24
	YVbkZ8UVNMoPwHH4YVEG/c9G1xPKGKsIrdK8O6/nTAF5gmi6SYm5pEeiDdhb5wxwq6a5JGTNj4jS
	CHVbq1Nh30Fnu3fU1J6CuXj1ppFVgpT1b21uZVckGp0ccOY05guNsa2Nl1J/2pvGKzma2sWSLFwZ
	4CJju5wll4p3LFNaAhoZRraaMNflySj+cWKLBDMrD7q/cJogwbqzsuok/AYaMlht8Ta56kt9vcRo
	0PxpVuXaTJf4+evRuujKQaLWCwLygtcx5XY/0/S88MKZDuSdok4dfJvvgKS8xFacO87dr5uSpYo8
	4vyLqDMs3KnrDMZSUZYgu1eIOjfHIjBKX2XX9bIsGDSYq5OAASmskVxxb52Ta22MKkYKziEOS1wT
	K7ZuFu5WTL/45b4i4DZ+bZtH5JQSNlZ3ejz4I1THOXkxbFU0wjhtdR15L5J+1bxthWJcDArBQLlQ
	+zm4f1mvXMZCrFUeI14mn3kw3+LRTg==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Classification: not-spam/combined
X-Recommended-Action: accept
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Kernel: Builds use old version of defconfig
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
X-List-Received-Date: Tue, 29 Nov 2016 08:30:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 29-11-16 03:03, Khem Raj wrote:
>
>> On Nov 24, 2016, at 5:55 AM, Bruce Ashfield <bruce.ashfield@gmail.com
>> <mailto:bruce.ashfield@gmail.com>> wrote:
>>
>>
>>
>> On Thu, Nov 24, 2016 at 5:32 AM, Mike Looijmans <mike.looijmans@topic.nl
>> <mailto:mike.looijmans@topic.nl>> wrote:
>>
>>     On 24-11-16 11:10, Mike Looijmans wrote:
>>
>>         I'm currently experiencing a problem with "defconfig" files and =
the
>>         kernel.
>>
>>         In short, when I make a change to the "defconfig" file, the kern=
el
>>         is rebuilt
>>         (which is correct), but the resulting kernel has been built usin=
g
>>         the old
>>         defconfig from a previous build, instead of the new one.
>>
>>         The kernel recipe just contains "file://defconfig" in its SRC_UR=
I. The
>>         defconfig file is in the project's overlay.
>>
>>         For example, I have a kernel with "CONFIG_DEVMEM" disabled:
>>
>>         # gunzip < /proc/config.gz | grep DEVMEM
>>         # CONFIG_DEVMEM is not set
>>
>>         Now, I change the defconfig to contain CONFIG_DEVMEM=3Dy and bui=
ld the
>>         image.
>>         The result:
>>
>>         # gunzip < /proc/config.gz | grep DEVMEM
>>         # CONFIG_DEVMEM is not set
>>
>>         So the change did not make it into the actual kernel, even thoug=
h
>>         the kernel
>>         was rebuild as a result of the change.
>>
>>         I run "bitbake -c cleansstate virtual/kernel" and build the imag=
e again:
>>
>>         # gunzip < /proc/config.gz | grep DEVMEM
>>         CONFIG_DEVMEM=3Dy
>>
>>         After cleaning, the result is correct and the new defconfig is a=
ctive.
>>
>>         I'm trying to figure out how this can happen, any help is welcom=
e...
>>
>>
>>     What seems to be the problem is this code in kernel.bbclass:
>>
>>             # Copy defconfig to .config if .config does not exist. This =
allows
>>             # recipes to manage the .config themselves in
>>     do_configure_prepend().
>>             if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ];=
 then
>>                     cp "${WORKDIR}/defconfig" "${B}/.config"
>>             fi
>>
>>     This keeps any existing ".config" file if it happens to still be in =
the
>>     $B path, which is the case if you're rebuilding a kernel.
>>
>>     I see two possible ways to fix this.
>>
>>     1) During "cleanup" also remove the .config file in the build dir.
>>     However, the build dir is probably kept alive for a reason? I also c=
an't
>>     figure out how that "cleanup" is being done.
>>
>>
>>     2) Remove the second part of the "if" statement, so it becomes:
>>
>>             # Copy defconfig to .config if "defconfig" exists. This allo=
ws
>>             # recipes to manage the .config themselves in
>>     do_configure_prepend().
>>             if [ -f "${WORKDIR}/defconfig" ]; then
>>                     cp "${WORKDIR}/defconfig" "${B}/.config"
>>             fi
>>
>>     I've tested that, and it solves my problem. However, it will probabl=
y
>>     break other people's config mangling?
>>
>>
>> Yep, in particular all the fragment processing which has the capability =
of
>> starting
>> with a defconfig and then apply fragments from any number of other place=
s. When
>> that task completes, a full .config is in ${B}.  If that statement comes
>> along and
>> clobbers the .config =E2=80=A6
>
> so you either assume that .config is valid once generated or you dont. Wh=
en a
> configure task
> is triggered it should recreate .config everytime.

The problem seems to be that the class "do_configure" does things that shou=
ld=20
happen before and after things that the recipe would want to change.

Copying defconfig or whatever means to create a .config should be first.

Next, the specific kernel recipe would want to mangle that configuration to=
=20
suit its needs, like applying fragments and such.

Then the makeoldconfig (or whatever) task should run.


The current system assumes that the kernel recipe creates a=20
do_configure_prepend to do the mangling, which is rather counterintuitive, =
one=20
would expect to "append" extra actions.

A structured approach would be to split the do_configure into two parts tha=
t=20
should run in sequence, and then kernel recipes can inject their actions by=
=20
appending to them as they see fit. The first task would create the .config=
=20
file by (forcibly) copying any defconfig or starting point. The second task=
=20
would call the kernel's make script to futher process it.

But this too would break existing recipes.



>>
>> I'm actually working in the 2.3 release cycle to make the fragment proce=
ssing
>> be available to all kernels, which will likely solve this problem .. but=
 we
>> can't
>> wait for that.
>>
>> So I'm hoping that there's a way to make the behaviour cover both use ca=
ses.
>>
>> Maybe someone with more bitbake knowledge can point out a way that can
>> detect if the task is being run due to a change in the task signature.
>>
>> Since if you've modified the defconfig, the task is being re-run for tha=
t change
>> and at that point we could safely remove the .config (versus forcing it =
on the
>> clean step).




Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






