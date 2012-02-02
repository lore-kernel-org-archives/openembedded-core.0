Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rsp5L-00046c-QO
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 06:19:53 +0100
Received: by lahc1 with SMTP id c1so1071176lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 21:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Ron0jz6rMoY/on/6O3SuPbVXDzu32ZQDlzGweyfQFNw=;
	b=eikrn9Z6K8ozCIVnzOu9rn0ZrvqjEI1NwtH826SHOWHvHfxN2wtZxBHVibpbOU/qNw
	cB94ggAeBxP/HXunpL67z6VbYhXDKuGJ6zN9/J0hfuEGMP42M5q5UDqtnKdFUzmac9Op
	ULAsBrxbQuwf2towhQM+eUIAtaOcX1VjsZFrE=
Received: by 10.152.146.163 with SMTP id td3mr716065lab.6.1328159506490; Wed,
	01 Feb 2012 21:11:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 1 Feb 2012 21:11:16 -0800 (PST)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C012FB236@ORSMSX106.amr.corp.intel.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
	<6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
	<c960e8c29574bd5b5ca6649394468169ec264854.1328133261.git.nitin.a.kamble@intel.com>
	<CAMKF1srmsx1KQ_3Y4===JVFaOHaPMt7nyanjymD=yF+ksQO9JQ@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C012FB236@ORSMSX106.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Feb 2012 21:11:16 -0800
Message-ID: <CAMKF1spLK461XdSw56C25EOZkEm48TXjCiQq3-cVXc=AAAPq8Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] gmp: upgrade from 5.0.2 to 5.0.3
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
X-List-Received-Date: Thu, 02 Feb 2012 05:19:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2012 at 3:20 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Wednesday, February 01, 2012 2:03 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 2/8] gmp: upgrade from 5.0.2 to 5.0.3
>>
>> On Wed, Feb 1, 2012 at 1:55 PM, =C2=A0<nitin.a.kamble@intel.com> wrote:
>> >
>> > Removed sh4-asmfix.patch as it is not needed with the newer code.
>>
>> has it been applied upstream ? or is there any other reason that fixes
>> the underlying problem.
> The code the patch is patching is restructured in the new version, and lo=
oking at the patch it is not needed anymore.

only if its built for SH you can verify it. there was someone who was using=
 SH
with oe-core may be he can verify this patch works for SH


