Return-Path: <andre.draszik@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF5F77026
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 20:42:57 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id p194so3973746iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 13:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=WvF+QnVpPQ2DTP35TIua+tnJad12uN3JinuOX36zKUM=;
	b=IAmleNLc7t/SmZLyDrTrTHAYGiEt7yq1WNLLP29HrOsZFd2mtrqPZyBy7VyrejDieE
	vxtEjSlAgACO0z0ON3hUk35HkJu0Ra21cWG1ILQVj5CYvyqZEn3nopuZr5G/Cp2Apo5P
	KaGYygORc2m6U6WrP+z58bxTiRkJ+pjFVf/d90o9FKSuNZtPtrGoWlizgs05LqgEFA2V
	ilnpeb8dnDexH012N7B225Di55WBJrOPilhgguQfjoTE9ERXV+Cul58YYV/mNBoJnq0P
	If/w/XIezGMxajAIoji7Gotg5p+P1hfTHiR4bJZOQjGztLjehHRFc/r4c+/DHuXMYsnT
	0W7A==
X-Gm-Message-State: ALyK8tKa9UsBjrdSdh5g+F6Hz+WSbe4O9+unV/+lLwyrIa1YrkeI6C7rNldu1GebY7NLGQ==
X-Received: by 10.107.129.87 with SMTP id c84mr15538302iod.102.1464381777417; 
	Fri, 27 May 2016 13:42:57 -0700 (PDT)
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com.
	[209.85.214.43])
	by smtp.gmail.com with ESMTPSA id g73sm3295876iog.6.2016.05.27.13.42.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2016 13:42:57 -0700 (PDT)
Received: by mail-it0-f43.google.com with SMTP id z123so3061372itg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 13:42:56 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.36.46.67 with SMTP id i64mr514123ita.60.1464381776351; Fri,
	27 May 2016 13:42:56 -0700 (PDT)
Received: by 10.64.24.103 with HTTP; Fri, 27 May 2016 13:42:56 -0700 (PDT)
In-Reply-To: <351f6c15-c64d-106f-2d73-6c27500d5894@windriver.com>
References: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
	<1464346463.28160.45.camel@andred.net>
	<a8f703f6-4b7b-d7f0-722f-df7caee70291@windriver.com>
	<1464360133.3815.7.camel@andred.net>
	<351f6c15-c64d-106f-2d73-6c27500d5894@windriver.com>
Date: Fri, 27 May 2016 21:42:56 +0100
X-Gmail-Original-Message-ID: <CAKUP++sNL9QmS9zqL2_dZBb6wRDiZJFnzkgid9+x+Anv_44QFg@mail.gmail.com>
Message-ID: <CAKUP++sNL9QmS9zqL2_dZBb6wRDiZJFnzkgid9+x+Anv_44QFg@mail.gmail.com>
From: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Fri, 27 May 2016 20:42:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks Mark.

Nothing is pulling vmdk into my builds. vmdk does not end up in my
IMAGE_FSTYPES or IMAGE_FSTYPES_DEBUGFS. Again, the output from bitbake
-e is fine when reverting Ross' patch and applying the patch I posted
earlier instead. With Ross' patch (only), bitbake doesn't even finish
parsing due to the exception being thrown (so bitbake -e output is
empty apart from the exception).

I know I can set IMAGE_FSTYPES_DEBUGFS explicitly to work around the
issue, but that's not it is intended to work.

Cheers,
Andre

On Fri, May 27, 2016 at 4:21 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 5/27/16 9:42 AM, Andr=C3=A9 Draszik wrote:
>> On Fr, 2016-05-27 at 09:21 -0500, Mark Hatle wrote:
>>> On 5/27/16 5:54 AM, Andr=C3=A9 Draszik wrote:
>>>> This doesn't work for me (at least on krogoth):
>>>>
>>>>     ERROR: poky/meta/recipes-core/images/build-appliance-
>>>> image_14.0.0.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry
>>>> 'debugfs_vmdk' - possibly invalid type name or missing support class
>>>>     ERROR: Failed to parse recipe: poky/meta/recipes-core/images/build=
-
>>>> appliance-image_14.0.0.bb
>>>>
>>>> I *instead* am using the attached patch successfully.
>>>>
>>>> Is anybody else facing the same issue?
>>>
>>> Ross's patch should have fixed this.  It ensures that
>>> IMAGE_FSTYPES_DEBUGFS is
>>> always set to 'something'.
>>
>> Yes, and now bitbake is looking for an IMAGE_CMD for debugfs_vmdk accord=
ing
>> to the error message. Note that I didn't specify vmdk anywhere, my
>> IMAGE_FSTYPES is set to .tar.gz only.
>>
>>> You should check if the patch has been applied to the "krogoth" branch.
>>
>> I did apply it locally. For me, it only works if i revert Ross' patch an=
d
>> apply my patch instead.
>>
>
> Use bitbake -e <image>.  View the IMAGE_FSTYPES and IMAGE_FSTYPES_DEBUGFS=
.  Do
> you see vmdk in the former?  If so, look at the comments above it and it =
shoudl
> show you where it came from.
>
> My guess is you have an image or BSP that is hard coding a specific 'vmdk=
'.
>
> I agree there is a problem here, some filesystem types do not make sense =
for
> debugfs type.  I'm not sure how to necessarily reconcile this behavior, b=
ut vmdk
> doesn't seem reasonable to me here..
>
> But first figure out where it's coming from.
>
> Setting IMAGE_FSTYPES_DEBUGFS =3D "tar.gz" in your local.conf should be e=
nough to
> set the value and avoid the behavior.  If it's not, again look at the bit=
bake -e
> output and see what it's saying it's doing.
>
> --Mark
>
>> Cheers,
>> Andr=C3=A9
>>
>

