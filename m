Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RupZo-0004T7-L8
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:15:38 +0100
Received: by lahc1 with SMTP id c1so4315932lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 10:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=30z56fXu65vUJJHCf8JGZOofp53UZIBXS4sFNdrCGKA=;
	b=dvYogGyZ8HnE1hMCA9XSWT4rnAKh1R2k9X6VIfYR5MLJ3HtpgQJKMPz1tIop4C05S/
	we8KnS/6osjLV845DcnAiCcVPeQAHz9aEhWIImD6yQ/44wLJFgR2n/4SHhdrY0aosy7j
	nKkOGMsIBKPUfcXWNFcpi9U5DRCHU+FQU6tX4=
Received: by 10.112.28.169 with SMTP id c9mr6608777lbh.42.1328638054246; Tue,
	07 Feb 2012 10:07:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 7 Feb 2012 10:07:04 -0800 (PST)
In-Reply-To: <4F315DA4.50106@linux.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<2f04aa9f17c455c3d42ecb81975e425746973bef.1328510189.git.raj.khem@gmail.com>
	<4F315DA4.50106@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 10:07:04 -0800
Message-ID: <CAMKF1spJ+PU1us62_sWJm1D9sZqHcbzwOxN-zFzWadH29OfwQA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/20] gcc-cross-testing: Fix evaluation of user and target name
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
X-List-Received-Date: Tue, 07 Feb 2012 18:15:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 9:21 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/05/2012 10:40 PM, Khem Raj wrote:
>>
>> Dont use -q to grep we pipe to /dev/null anyway all we
>> care is the return status of grep
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>
>> xxx
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>
>
> The patch seem valid, but the commit message needs to be cleaned up.

also updated


>
>
> Sau!
>
>
>> ---
>> =C2=A0meta/recipes-devtools/gcc/gcc-cross.inc | =C2=A0 =C2=A06 +++---
>> =C2=A01 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
>> b/meta/recipes-devtools/gcc/gcc-cross.inc
>> index 6acf8c5..b16c57d 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
>> @@ -65,11 +65,11 @@ then
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1;
>> =C2=A0fi
>>
>> -echo "\$target" | grep =E2=88=92q "@">& =C2=A0/dev/null
>> +echo "\$target" | grep "@">& =C2=A0/dev/null
>> =C2=A0if [ "x\$?" =3D "x0" ]
>> =C2=A0then
>> - =C2=A0 user=3Decho \$target | cut -d '@' -f 1
>> - =C2=A0 target=3Decho \$target | cut -d '@' -f 2
>> + =C2=A0 user=3D\$(echo \$target | cut -d '@' -f 1)
>> + =C2=A0 target=3D\$(echo \$target | cut -d '@' -f 2)
>> =C2=A0else
>> =C2=A0 =C2=A0 user=3D\$USER
>> =C2=A0fi


