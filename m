Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSvNn-0002FP-Hy
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 21:20:07 +0200
Received: by eekd49 with SMTP id d49so823352eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=CenJVoevn2N2u9zPaq5llzotKhndl/cgGBxz9ezH5AY=;
	b=h4O7GM2ee6a7QFUm852Ky4fWM5pMYcXfKNTG0k+B79jCIbZtMj8KsUN03U5/WowQvl
	wtJF/6JscUU6m7YV/YX2cqBRMnG4toXmz4x0YZaMvCEXsYfKd8ZI2ROjOCmj5qJ6YkjJ
	LXQ1uXckGTHnSLo9STktcQX8wMYUiMPPxWk4v/aWs7t5hNSV4+g8ASX6TJVu/bXNBjq2
	18rZ14/RzsN5IbVfZNTLt5RSUnDWIVA/z0k5tfb8cmkGzal4Rl6XS5HROk88v5NJU0jK
	rJ+0gEw+1MHhICVR4pKWIl0a65sKmmjwhHHqMgl/nchyyLRrH1SLxnoUYR48fj4x/ehR
	3rBA==
Received: by 10.213.20.200 with SMTP id g8mr2755087ebb.103.1336763411489; Fri,
	11 May 2012 12:10:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Fri, 11 May 2012 12:09:41 -0700 (PDT)
In-Reply-To: <4FAD4E28.5030206@linux.intel.com>
References: <cover.1336524034.git.raj.khem@gmail.com>
	<4FAD4E28.5030206@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 May 2012 12:09:41 -0700
Message-ID: <CAMKF1sriuhZq6vP9XYvFbS=WEfyBeXJDQP56mSJK7HgmjbeQSw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Let uclibc provide rtld(GNU_HASH)
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
X-List-Received-Date: Fri, 11 May 2012 19:20:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2012 at 10:36 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 05/08/2012 05:43 PM, Khem Raj wrote:
>>
>> We have seen reports where rtld(GNU_HASH) is found missing
>> on uclibc based images infact uclibc rtld does provide GNU_HASH
>> support as default so we add that to PROVIDES
>>
>> snapshot mirror url is changed. Currently the url will fetch
>> html files which will end in corrupted downloads so we
>> update the url location in mirrors class.
>>
>> The following changes since commit
>> 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:
>>
>> =C2=A0 kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)
>>
>> are available in the git repository at:
>> =C2=A0 git://git.openembedded.org/openembedded-core-contrib kraj/misc-fi=
xes
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dkraj/misc-fixes
>>
>> Khem Raj (2):
>> =C2=A0 uclibc.inc: uclibc rtld does support GNU_HASH
>> =C2=A0 classes/mirrors.bbclass: Point snapshot.debian.org mirror to work=
ing
>> =C2=A0 =C2=A0 location
>>
>> =C2=A0meta/classes/mirrors.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A02 +-
>> =C2=A0meta/recipes-core/uclibc/uclibc.inc | =C2=A0 =C2=A03 ++-
>> =C2=A02 files changed, 3 insertions(+), 2 deletions(-)
>>
>
> Merged into OE-Core

FWIW both these fixes are needed on denzil too.


