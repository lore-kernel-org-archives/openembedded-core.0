Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QlqCU-0000ke-SF
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 00:34:07 +0200
Received: by gxk3 with SMTP id 3so688796gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=A7b+X3vcrE0vY5MqKZzjGlNbf4tkc5aoZzsMZQ+Sg9Q=;
	b=ABoEHmvv1DBuG6MXGkpRLN5PMSMgQpOk0P3Ru9luyFLWmckD3LLTG+yI5jb50ZZDvp
	QXOcdDaYsKcHQ/HuxSD3IuSoiCq1znr3bbKSPFXHlNIuF+wDiP3NaIRY9DTqIuhHQzt5
	Wt2h95lhkexmZ979NypklswIHOc8SKHDu7Syc=
Received: by 10.68.28.1 with SMTP id x1mr11616500pbg.77.1311719392063; Tue, 26
	Jul 2011 15:29:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Tue, 26 Jul 2011 15:29:22 -0700 (PDT)
In-Reply-To: <7B0836D8-31B6-407E-848E-FED9C5BFE78A@kernel.crashing.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
	<1311697113.2344.268.camel@rex>
	<7B0836D8-31B6-407E-848E-FED9C5BFE78A@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jul 2011 15:29:22 -0700
Message-ID: <CAMKF1spteYHGqLht8hQ=y1ABGjy0-z__VNm9E-Bur7PhYp+3gw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Tue, 26 Jul 2011 22:34:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2011 at 3:02 PM, Kumar Gala <galak@kernel.crashing.org> wro=
te:
>
> On Jul 26, 2011, at 11:18 AM, Richard Purdie wrote:
>
>>>> You're already found the way to pass configuration to *libc using valu=
es
>>>> in TARGET_FPU to pickup the right configuration.
>>>>
>>>> Is there a use case we're missing?
>>>
>>> Yes, for [e]glibc we have optimized libc functions for a given /
>>> specific PPC processor. =C2=A0So we need someway to tell configure this=
.
>>
>> I'd do this by looking for flags in TUNE_FEATURES as Mark has also
>> mentioned.
>>
>> Cheers,
>>
>> Richard
>
> Are we thinking something like the following in e[glibc] recipes:
>
> EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-w=
ith-cpu=3De500mc", "", d)}"
>

I guess we can make a python function since most architectures can
benefit from --with-cpu

> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


