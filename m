Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qo3Jp-0006Al-EJ
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 02:58:49 +0200
Received: by gwb11 with SMTP id 11so4393085gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 17:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=fKUFLFFahUuSAbShKMe3Qbd6RN8+yBSSQaSDuZxBjk0=;
	b=ib2RYXOGyhV3chInFwbb9EZPENh6dXoKWLnKJ8cunLVF+cye/6qeIfR8/dwKY6Nq/3
	TPLQXUqCP78CqBio8sbiY57M9hwPEAh2M/wxzKZkQpjxKQuBU3JQDJl8dOh3W5XE661m
	tAtHaer1iaKTTkFfMt1TpTk1yPp4/VuAh81r8=
Received: by 10.68.35.105 with SMTP id g9mr7734443pbj.479.1312246467838; Mon,
	01 Aug 2011 17:54:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Mon, 1 Aug 2011 17:53:57 -0700 (PDT)
In-Reply-To: <4E3728A7.1050707@linux.intel.com>
References: <cover.1311758282.git.kai.kang@windriver.com>
	<d5e06516ed6656364b8127740700d1403b72d567.1311758282.git.kai.kang@windriver.com>
	<2070961.C8JsuWrOh5@perseus> <4E3728A7.1050707@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Aug 2011 17:53:57 -0700
Message-ID: <CAMKF1sosKO92oLq8tNgD=Sb7_bYNBFFw3edutmTeCoxPRE+QtA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ghostscript: fix parallel build issue
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
X-List-Received-Date: Tue, 02 Aug 2011 00:58:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 1, 2011 at 3:28 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/30/2011 11:20 AM, Khem Raj wrote:
>>
>> On Wednesday, July 27, 2011 05:34:45 PM Kang Kai wrote:
>>>
>>> From: Kang Kai<kai.kang@windriver.com>
>>>
>>> ghostscript fails some time on autobuilder, it seems a parallel build
>>> issue.
>>> Add patch to fix it.
>>>
>>> Fixes [Yocto #1202]
>>>
>>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>>> ---
>>> =C2=A0.../ghostscript-9.02-parallel-make.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 17
>>> +++++++++++++++++
>>> .../ghostscript/ghostscript_9.02.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++-
>>> =C2=A02 files changed, 19 insertions(+), 1 deletions(-)
>>> =C2=A0create mode 100644
>>>
>>> meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel=
-mak
>>> e.patch
>>>
>>> diff --git
>>>
>>> a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parall=
el-m
>>> ake.patch
>>>
>>> b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parall=
el-m
>>> ake.patch new file mode 100644
>>> index 0000000..76d1676
>>> --- /dev/null
>>> +++
>>>
>>> b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parall=
el-m
>>> ake.patch @@ -0,0 +1,17 @@
>>> +When parallel make it will fail with multi copy, see
>>> +http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1202
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Kang Kai<kai.kang@windriver.com>
>>> +--- ghostscript-9.02/base/unixhead.mak.orig =C2=A0 =C2=A02011-07-27
>>> 17:06:17.749456100
>>> +0800 ++++ ghostscript-9.02/base/unixhead.mak =C2=A0 2011-07-27
>>> 17:06:37.449456100
>>> +0800 +@@ -54,7 +54,7 @@
>>> +
>>> + # Define generic commands.
>>> +
>>> +-CP_=3Dcp
>>> ++CP_=3Dcp -f
>>
>> It means it will first delete the target if it exists. Did you check if
>> this
>> is correct behavior ?
>>
> Khem,
>
> As far as I know the file is that is being copied to is the same file and
> the CP is only used in that case, the 2 files are copied to the same
> location due to the Parallel make.

if thats the case then probably checking for existence of file before
copying it over
might be one approach


