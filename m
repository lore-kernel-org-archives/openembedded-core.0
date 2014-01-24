Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id EA8266E721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 11:15:28 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id i7so3563351oag.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 03:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=TvbjJun8FSvjlsz3IBVWcOI9+cqLDHUhPHceHpHxYSM=;
	b=W9lY9h+rInfvTBrkaUf3zK4kfGkFn5G8n08sTTPTc2T4m/TAP/C61aSp27AzeF71ty
	UvR4G8VPAQy9J5M8mL8O6pTZDiYVzd4tYKzhaJ7860P98GlMLN9EHhAPdf4U8q86hXep
	JCVJjdxw9wbNJ/A/8OrNnezo1O5gOrQeJ4GzXYJRbml7G629bos5fA0oUVACkWKKAmDe
	4Rio++vi19VztvmTbWSN6BvkCjtZCjFuz3r8oUOwyTu45h5YqxU7JUCLPNJTaczoa6ZC
	WtbW3jjaArLCHvipYBU1dyGkLIHmrGeLWoX8vjw95czSmUVZj/Iw1gxTYEk4ajZLALIx
	ESfw==
MIME-Version: 1.0
X-Received: by 10.60.131.141 with SMTP id om13mr29729oeb.68.1390562129203;
	Fri, 24 Jan 2014 03:15:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 24 Jan 2014 03:15:28 -0800 (PST)
In-Reply-To: <52E22984.8010000@gmail.com>
References: <1390403335-14487-1-git-send-email-david.nystrom@enea.com>
	<CAP9ODKr4WxcPVkxGMR+ZZ98b6mLbmUyr9Qs=BWe-S5HVJSn=hg@mail.gmail.com>
	<52E007CC.5070405@gmail.com>
	<CAP9ODKpAQDTg-UV-vR4419Q+6zvt=xNL=Wo5dH+feQi4wsWiGQ@mail.gmail.com>
	<52E0D539.9090402@gmail.com>
	<CAP9ODKqD-Xe4emQY8t6s4i_kbVGZFh4+2_y7h4+qiYfH_eSzVA@mail.gmail.com>
	<52E22984.8010000@gmail.com>
Date: Fri, 24 Jan 2014 09:15:28 -0200
X-Google-Sender-Auth: 3Ku9Ntx7CLGG8rW9M5SDMPndOmY
Message-ID: <CAP9ODKp9+fCnxAGonTr2ANtc=SBrRQx7c-HLj0-5aEnB5cyduA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] postinst-intercept: New recipe to include postinstall intercepts in nativesdk
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
X-List-Received-Date: Fri, 24 Jan 2014 11:15:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2014 at 6:51 AM, David Nystr=F6m
<david.c.nystrom@gmail.com> wrote:
> On 2014-01-23 11:56, Otavio Salvador wrote:
>>
>> On Thu, Jan 23, 2014 at 6:39 AM, David Nystr=F6m
>> <david.c.nystrom@gmail.com> wrote:
>>>
>>> On ons 22 jan 2014 19:11:21, Otavio Salvador wrote:
>>>>
>>>>
>>>> On Wed, Jan 22, 2014 at 4:02 PM, David Nystr=F6m
>>>> <david.c.nystrom@gmail.com> wrote:
>>>>>
>>>>>
>>>>> On ons 22 jan 2014 16:47:06, Otavio Salvador wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On Wed, Jan 22, 2014 at 1:08 PM, David Nystr=F6m
>>>>>> <david.c.nystrom@gmail.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Adding ability to use postinstalls intercepts in the nativesdk env,
>>>>>>> and
>>>>>>> making sure the correlate between repo + SDK.
>>>>>>>
>>>>>>> This to enable rootfs generation from a package repository using on=
ly
>>>>>>> a
>>>>>>> package repository and the toolchain tarball.
>>>>>>>
>>>>>>> See https://github.com/nysan/rootfs-sandbox for examples.
>>>>>>>
>>>>>>> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Much better. Thanks.
>>>>>>
>>>>>> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
>>>>>>
>>>>>> Regarding the rootfs-sandbox, how are you intending to proper
>>>>>> integrate it with the toolchain?
>>>>>>
>>>>>
>>>>> Search the oe-core list for the previous discussions with Tom Zanussi=
.
>>>>> I believe the long term goals is to redo rootfs_*.bbclass in python,
>>>>> and
>>>>> let
>>>>> both bitbake and MIC(WIC) use
>>>>> the same code for image creation.(SDK env + bitbake env.)
>>>>>
>>>>> I'm fine with continued dev/inclusion of rootfs-sandbox, but I think
>>>>> that
>>>>> might not be acceptable as a long term solution since
>>>>> it may be maintenance heavy, since it uses alot of oe-core internal
>>>>> env.
>>>>> vars.
>>>>>
>>>>> Possible routes are:
>>>>> 1. Use common code for rootfs assembly. (WIC)
>>>>> 2. Cleanup env. var. usage in postinstall hooks, and be aggressive in
>>>>> denying new additions. (Continue dev. on rootfs-sandbox)
>>>>>
>>>>> Off-topic:
>>>>> With above patches, I'm down to 1 postinstall failures for
>>>>> packagegroup-core-lsb:
>>>>> 1. missing shlibsign, (nss), cant get the damn thing to compile for
>>>>> nativesdk yet.
>>>>>
>>>>> There are 2 other failures as well, but they fail when bitbake:ing as
>>>>> well.
>>>>> Only works well with ipk sofar.
>>>>
>>>>
>>>>
>>>> So I think we ought to work on this in a layer and put things in
>>>> OE-Core when it is ready.
>>>>
>>>> What do you think?
>>>>
>>>
>>> Sorry, read your mail again, I think I misunderstood.
>>> For rootfs-sandbox I agree, this is WIP.
>>>
>>> I suspect that others already have these features, and regardless of WI=
C
>>> or
>>> rootfs-sandbox or other.
>>> they will need the same functionality exposed in the SDK.
>>> We are working on the same thing here, and as such, I think the small
>>> pieces
>>> needed to do this should be centralized in oe-core so
>>> we can cooperate around them, and define interfaces between the SDK and
>>> bitbake env in an open environment.
>>
>>
>> I agree with the principle but I think we can accomplish the same with
>> a layer, if properly announced and put in layer index.
>>
>> The reason I dislike this WIP to be in OE-Core is that implementation
>> starts to be considered stable and people and projects starts to
>> depends on it so changing it radically is hard as we need to carry
>> backward compatibility.
>
>
> We  need to carry backward compatibility ?.
>
> In a stable branch I would agree to this, but not in master.

In April master is going to be 1.6, thus a stable.

> When the sstate was introduced and developed, you mean it never broke the
> ABI from then till now ?
> Buildhistory DB ABI, license report formats, build output directory
> renaming, naming conventions never broke the ABI ?
>
> Can you give any other examples of where new functionality additions were
> rejected due to the non-stable clause ?

The point here is implementation wise.

>> Don't take me wrong, I do think this is important and I do think this
>> ought to be in OE-Core but I am unsure about it being mature enough
>> for it.
>
> This will be a quite minimal layer containing these 2 patches, and one mo=
re
> upcoming nativesdk-nss patch.

Well, until complete we cannot known what will be the size of it.

I will let others comment and give their view of it. I'd prefer it to
be in a layer for now.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

