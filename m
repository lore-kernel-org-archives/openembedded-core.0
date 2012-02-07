Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RupXN-0004Ox-V7
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 19:13:06 +0100
Received: by lahc1 with SMTP id c1so4313250lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 10:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=w+nAL5Qg+xKtMCWE+Iw5zLQJEP67Gr9+eLBLgg+6FG4=;
	b=vA9tqCL8bs0MJRPR6TTPaXF7Yk53jahuRBqphRkbKv0yUhlL86XfqeO53a9uuGkBYS
	PjibbJxy8NSnZewtRwR2r5XotUKnRUOig1SAqSAqVva6z3aT150Ll+pl8harvrutg7UF
	8C5l6I4HlRXlsl1KliGbnHe73ze+0Notw7tRU=
Received: by 10.152.114.169 with SMTP id jh9mr13142958lab.20.1328637903376;
	Tue, 07 Feb 2012 10:05:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 7 Feb 2012 10:04:32 -0800 (PST)
In-Reply-To: <4F316443.9020508@linux.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<d311646dbcb0be12596125a5cf8c97e713741182.1328510189.git.raj.khem@gmail.com>
	<4F316443.9020508@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 10:04:32 -0800
Message-ID: <CAMKF1soUrwGgqPpKWvnwOAfwdQh2Dg-uNep6jc92LE2C8FEm0w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/20] mirrors.bbclass: Add yp.org and oe.org to fallback mirrors
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
X-List-Received-Date: Tue, 07 Feb 2012 18:13:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 9:49 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/05/2012 10:40 PM, Khem Raj wrote:
>>
>> This should improve the fetching errors users see
>> when upstream src_uri is unavailable
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0meta/classes/mirrors.bbclass | =C2=A0 21 ++++++++++++++++++++-
>> =C2=A01 files changed, 20 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
>> index 2146087..69f44cd 100644
>> --- a/meta/classes/mirrors.bbclass
>> +++ b/meta/classes/mirrors.bbclass
>> @@ -52,5 +52,24 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
>> =C2=A0ftp://gd.tuwien.ac.at/utils/adm
>> =C2=A0ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
>> =C2=A0ftp://sunsite.ualberta.ca/pub/Mirror/lsof/ \n \
>> =C2=A0ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
>> =C2=A0ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
>> =C2=A0http://www.apache.org/dist =C2=A0http://archive.apache.org/dist \n=
 \
>> +cvs://.*/.* =C2=A0 =C2=A0 http://autobuilder.yoctoproject.org/pub/sourc=
es/ \n \
>> +svn://.*/.* =C2=A0 =C2=A0 http://autobuilder.yoctoproject.org/pub/sourc=
es/ \n \
>> +git://.*/.* =C2=A0 =C2=A0 http://autobuilder.yoctoproject.org/pub/sourc=
es/ \n \
>> +hg://.*/.* =C2=A0 =C2=A0 =C2=A0http://autobuilder.yoctoproject.org/pub/=
sources/ \n \
>> +bzr://.*/.* =C2=A0 =C2=A0 http://autobuilder.yoctoproject.org/pub/sourc=
es/ \n \
>> +svk://.*/.* =C2=A0 =C2=A0 http://autobuilder.yoctoproject.org/pub/sourc=
es/ \n \
>> +p4://.*/.* =C2=A0 =C2=A0 =C2=A0http://autobuilder.yoctoproject.org/pub/=
sources/ \n \
>> +osc://.*/.* =C2=A0 =C2=A0 http://autobuilder.yoctoproject.org/pub/sourc=
es/ \n \
>> +https?$://.*/.* http://autobuilder.yoctoproject.org/pub/sources/ \n \
>> +ftp://.*/.* =C2=A0 =C2=A0 http://autobuilder.yoctoproject.org/pub/sourc=
es/ \n \
>
>
> Please use: http://downloads.yoctoproject.org/mirror/sources

updated

>
> That makes it clearer.
>
> Thanks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>
>
>> +cvs://.*/.* =C2=A0 =C2=A0 http://sources.openembedded.org/ \n \
>> +svn://.*/.* =C2=A0 =C2=A0 http://sources.openembedded.org/ \n \
>> +git://.*/.* =C2=A0 =C2=A0 http://sources.openembedded.org/ \n \
>> +hg://.*/.* =C2=A0 =C2=A0 =C2=A0http://sources.openembedded.org/ \n \
>> +bzr://.*/.* =C2=A0 =C2=A0 http://sources.openembedded.org/ \n \
>> +svk://.*/.* =C2=A0 =C2=A0 http://sources.openembedded.org/ \n \
>> +p4://.*/.* =C2=A0 =C2=A0 =C2=A0http://sources.openembedded.org/ \n \
>> +osc://.*/.* =C2=A0 =C2=A0 http://sources.openembedded.org/ \n \
>> +https?$://.*/.* http://sources.openembedded.org/ \n \
>> +ftp://.*/.* =C2=A0 =C2=A0 http://sources.openembedded.org/ \n \
>> =C2=A0"
>> -


