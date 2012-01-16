Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RmuDM-00020V-1n
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 22:35:40 +0100
Received: by qcsp14 with SMTP id p14so1585711qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 13:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=xHzaz0LbK3Wag0QbG4G4x3mQKmIcKlhVzhOzxRhBg0s=;
	b=DSqIbl39bRj/PseB9mW869WYFnBojXMO8EQPZLGqlDPAF3seXLx326wH4SBqmTzIBX
	rw5ZBLDygOTGtBSElFOldLVrs2v4lo80SDhR7tiZTXq4EM5UJam1zfzMnJdXt/F1RY7m
	ddhC+hnC2AX9lKUGLcVJGvrZNF/r+pu+QvXUo=
Received: by 10.229.102.149 with SMTP id g21mr2727657qco.116.1326749283348;
	Mon, 16 Jan 2012 13:28:03 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.186.149 with HTTP; Mon, 16 Jan 2012 13:27:42 -0800 (PST)
In-Reply-To: <4F146249.6080905@linux.intel.com>
References: <1326225078-18652-1-git-send-email-kergoth@gmail.com>
	<lyty41ro95.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CABcZANkAfrhbi13Mr4jfVmNsfkMG7hVF2KYw-MXN9GZHbKfE9A@mail.gmail.com>
	<4F146249.6080905@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 16 Jan 2012 14:27:42 -0700
X-Google-Sender-Auth: snvp3LvrYGuRiYmS6WKkLiQJ2Vk
Message-ID: <CABcZAN=WQnLKrr=nKO4GZ1wsWO3FHkfyBrSTcZ4rj+=d-9WP6w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses-native: install to libdir, not base_libdir
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
X-List-Received-Date: Mon, 16 Jan 2012 21:35:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 16, 2012 at 10:45 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/16/2012 07:32 AM, Chris Larson wrote:
>>
>> On Thu, Jan 12, 2012 at 7:25 AM, Enrico Scholz
>> <enrico.scholz@sigma-chemnitz.de> =C2=A0wrote:
>>>
>>> Christopher Larson<kergoth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> writes:
>>>
>>>> --- a/meta/recipes-core/ncurses/ncurses.inc
>>>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>>>> ...
>>>> +# natives don't generally look in base_libdir
>>>> +base_libdir_virtclass-native =3D "${libdir}"
>>>
>>>
>>> I do not think that this should be done per recipe (afais, at least
>>> libusb is affected by the same issue).
>>>
>>> Adding '-L<baselibdir>' and the '-Wl,-rpath-link' + '-Wl,-rpath' option=
s
>>> to BUILD_LDFLAGS would be a more general solution.
>>
>>
>> Alternatively, could simplify the layout of the native sysroot and
>> adjust things in the native class. It could make a certain amount of
>> sense, as it makes more sense for our structure for native to match
>> the host than it does the target.
>
>
> So, Chris, are you going to implement this and do we drop the ncurses pat=
ch
> for now?

Enrico sent his general change in a patch series already. Someone will
need to make the call on the preferred long term solution.
--=20
Christopher Larson


