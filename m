Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QM6QS-0005zc-3p
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 00:38:08 +0200
Received: by ewy5 with SMTP id 5so1442816ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 15:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=KkwJ5t80ou1gqBoOU5bkjGwn2MIWWqmTM6PKqd5BUcA=;
	b=NFfTZAGwjmhY4lD8m0d74NOCIYLS4G5gnauGPPSpqXSzvOJSCnZnDOWg8/wTgZUqt4
	2WQ9ggwlRGblyyb2wb3qSo4hzzoV5GjYtxoL1l+U+r5qV4M9BuRqgcpHmwmFjDlz42Q4
	5u8udeNRX2RFPfs/Y998HlPNJDeGaHy878hKI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Qe6+O50aN0+T7hiWuG+MQmR0kwEf4bJzHBnAF0FXzNB7wDul1zeCckTG8pIFBAvkjS
	1R/ULAQedFj0+7ITUZB0dgtCA2pbveIaaoJz/We8Mde80Ue+Qk9fSmNH3wKp3SBtHxF7
	RC3lZ4oUrFdldagdVbhj7VSxTUEiPOZVi38A8=
Received: by 10.14.119.1 with SMTP id m1mr1840142eeh.44.1305585315405; Mon, 16
	May 2011 15:35:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Mon, 16 May 2011 15:34:45 -0700 (PDT)
In-Reply-To: <4DD18DA1.4080501@intel.com>
References: <cover.1305418871.git.sgw@linux.intel.com>
	<E943FF3D-A282-4E6D-8B5A-B954A678A0E1@gmail.com>
	<4DD13B6F.4010009@intel.com>
	<BANLkTi=0TcHgXmYpwCjX6P5h6+y9O2YQFw@mail.gmail.com>
	<1305575479.3424.102.camel@rex> <4DD18DA1.4080501@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2011 15:34:45 -0700
Message-ID: <BANLkTi=dSy1J3oP-aRH7QGSLeB3vy7Ykjw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 0/3] Move Old Recipes to meta-extras
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
X-List-Received-Date: Mon, 16 May 2011 22:38:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 1:48 PM, Saul Wold <saul.wold@intel.com> wrote:
> On 05/16/2011 12:51 PM, Richard Purdie wrote:
>>
>> On Mon, 2011-05-16 at 10:08 -0700, Khem Raj wrote:
>>>
>>> On Mon, May 16, 2011 at 7:57 AM, Saul Wold<saul.wold@intel.com> =C2=A0w=
rote:
>>>>
>>>> On 05/15/2011 11:19 PM, Khem Raj wrote:
>>>>>
>>>>>
>>>>> On May 14, 2011, at 5:23 PM, Saul Wold<sgw@linux.intel.com> =C2=A0 wr=
ote:
>>>>>
>>>>>> From: Saul Wold<sgw@linux.intel.com>
>>>>>>
>>>>>> This proposes to move the YAFFS2-utils, older clutter-1.4
>>>>>> and older GCC version (4.3.3 and 3.4.4) as they are unused
>>>>>> and currently unbuildable.
>>>>>>
>>>>>
>>>>> Are we left with any GPLv2 version of gcc after this ?
>>>>>
>>>> Khem,
>>>>
>>>> Is not having a GPLv2 version of gcc an issue? For the non-gplv3
>>>> version, my
>>>> understanding is to have an installed user-space for oe-core for a
>>>> non-development system, therefore gcc is not an issue.
>>>>
>>>
>>> there are certain parts of gcc which go onto target e.g. libgcc libstdc=
++
>>
>> These have specific license exceptions allowing non-gpl code to use them
>> as system libraries though?
>>
> Richard is correct, there are exception for the runtime parts of GCC.
> Sorry Khem, I was not catching to original gist of the question.

exceptions yes but they are not same exceptions between GPLv2 and GPLv3 gcc=
.

>
> Sau!
>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


