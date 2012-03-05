Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S4h4G-0000WQ-Gf
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 00:11:48 +0100
Received: by lagw12 with SMTP id w12so5480069lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 15:03:13 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.111.229 as permitted sender) client-ip=10.152.111.229; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.111.229 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.111.229])
	by 10.152.111.229 with SMTP id il5mr19969451lab.19.1330988593589
	(num_hops = 1); Mon, 05 Mar 2012 15:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=vsyDDVhsppoOvxO8bZ+kJwfYZuMzDn6InVRsGCh3UiA=;
	b=tjpkHvujSauJCZHSJCBR9e/+LvWX5Oqrjx6huEOl0W47NApNO6+kISxNoi0+kx1D8N
	+gwIiH6dUbyBVdVRW/z++nlzRHCHKvCrvFPiDyZx408UOX4oYmjADYSEDXzx8C6ubpHL
	ASS1Yn7ikTl23CsMVW/moC07hVAaHlNSqZfVOFo3svT9KHfrluwJcEpzo+0TQfuCBcxc
	vXvmc6tvW6L/1ch2iPH+/efzdF/vHpVWHjqbz0ZUhMm5KW8Npy23vWW2uMaHC23OzBCB
	X2F0TJFS4VgDMQH+V5d9d8BFXa7Swsebb3p4GAr5Qm9QXUDeTPs2gl2W7KonC0DXKAA0
	nYBQ==
Received: by 10.152.111.229 with SMTP id il5mr16358283lab.19.1330988593468;
	Mon, 05 Mar 2012 15:03:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 5 Mar 2012 15:02:43 -0800 (PST)
In-Reply-To: <4F5531C5.30007@linux.intel.com>
References: <cover.1330053959.git.raj.khem@gmail.com>
	<bab8960657c873358e301979445c8fa4e81cc15f.1330053959.git.raj.khem@gmail.com>
	<1330100504.5477.6.camel@ted>
	<CAMKF1srNpxainQ2ZyZ=wKZmmuLdp_fEjyTr1JKMRGVO4X8QV2w@mail.gmail.com>
	<4F5531C5.30007@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Mar 2012 15:02:43 -0800
Message-ID: <CAMKF1soJSWut5Oa73vm6r2xLXEEBePT2YEfiC5=cETwMEwAJNg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] default-distrovars: Add empty weak definition for DISTRO variable
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
X-List-Received-Date: Mon, 05 Mar 2012 23:11:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 1:36 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 02/24/2012 09:05 AM, Khem Raj wrote:
>>
>> On Fri, Feb 24, 2012 at 8:21 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> =C2=A0wrote:
>>>
>>> On Thu, 2012-02-23 at 19:33 -0800, Khem Raj wrote:
>>>>
>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>> ---
>>>> =C2=A0meta/conf/distro/include/default-distrovars.inc | =C2=A0 =C2=A07=
 +++++++
>>>> =C2=A01 files changed, 7 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/meta/conf/distro/include/default-distrovars.inc
>>>> b/meta/conf/distro/include/default-distrovars.inc
>>>> index 16b3108..dba204e 100644
>>>> --- a/meta/conf/distro/include/default-distrovars.inc
>>>> +++ b/meta/conf/distro/include/default-distrovars.inc
>>>> @@ -41,6 +41,13 @@ NO32LIBS ??=3D "1"
>>>>
>>>> =C2=A0# Default to emitting logfiles if a build fails.
>>>> =C2=A0BBINCLUDELOGS ??=3D "yes"
>>>> +
>>>> +# dummy distro related variables
>>>> +# they should be overridden by real distros
>>>> +# these fallbacks only serve the purpose of
>>>> +# oe-core standalone testability
>>>> +
>>>> +DISTRO ??=3D ""
>>>> =C2=A0SDK_VERSION ??=3D "oe-core.0"
>>>> =C2=A0DISTRO_VERSION ??=3D "oe-core.0"
>>>
>>>
>>> Why do we need this? The commit message tells me what you're doing but
>>> not why. I'm really getting frustrated with one line commit messages
>>> with no details.
>>>
>>> I don't think we should need this either, I'm not sure I like the
>>> change. The whole idea was OE-Core could run "distroless".
>>>
>>
>> There is an error case I dont remeber how I obtained that where it
>> prints bogus value if DISTRO is not
>> defined at all but and empty DISTRO var is distroless in essence anyway
>> IMO
>>
> Khem,
>
> Please let us know what the reproducer for this is. =C2=A0Once we have a
> reproducer we can look into the issue.

yeah.

>
> Sau!
>
>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


