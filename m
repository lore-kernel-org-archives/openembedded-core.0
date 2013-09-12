Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 17E5C605A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 08:29:51 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wm4so210588obc.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 01:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=sqeHAnvs8oPWV3V4uqlW/l530gQLa1L38OnkKGD9m48=;
	b=SxzqdeToyjTxg/zSBb81/pIQvB3+7i5QBentweyuthLJ9BTzQ10s/zti6/EtCx8ADn
	+Z+0VAsT6O1o4V5UK+bUwPPB/uTjy8OX2upFomqYfsneoTJHJ1yJrNkjYYgbi2R6A8rZ
	xudSTORnO11JD2HsoT5FEqtQNgoqKp0nD0RglmhBEuVizic+9NlGvhb5PBux+ZPnWEST
	0kVMLew5e3f8Myp3iSYSjzCFuE3DcR4dgKteiW1i4A4/jGQdpu5vkmhCJVNeYdhW4CiY
	Q9mdJp1Ea1Kz0ySOGTTH/LAIkJZ5imaSBI5Nw3XN9KSbWJTe5ZNTh7CwOllnhX1iE78j
	jq/A==
MIME-Version: 1.0
X-Received: by 10.60.51.41 with SMTP id h9mr5544599oeo.49.1378974591857; Thu,
	12 Sep 2013 01:29:51 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Thu, 12 Sep 2013 01:29:51 -0700 (PDT)
In-Reply-To: <1378972945.3484.217.camel@ted>
References: <1378892564.3484.172.camel@ted>
	<CAFyqS9rx5ycOOzfxkCxr5N+wCKBTgqQYjzzmc3CA5u-MZNHA1g@mail.gmail.com>
	<1378972945.3484.217.camel@ted>
Date: Thu, 12 Sep 2013 10:29:51 +0200
Message-ID: <CAFyqS9q0hLpdgA+rnQSZ7U51HRGSXCXVDGb+ADUYBbeMcofVkg@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image/populate_sdk: Ensure symlinks in target sysroot are relative
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
X-List-Received-Date: Thu, 12 Sep 2013 08:29:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 10:02 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2013-09-12 at 09:48 +0200, Hans Beck=E9rus wrote:
>> I have a slight problem with this patch. The new
>> sysroot-relativelinks.py does not obtain the proper access protection
>> bits!?
>> Which results in the following error when packaging the SDK
>>
>> /home/poky/build/tmp/work/zynq_zc706-poky-linux-gnueabi/rootfs-default/1=
.0-r0/temp/run.populate_sdk_image.20803:
>> line 496: /home/poky/scripts/sysroot-relativelinks.py: Permission
>> denied
>>
>> [home/poky]: ls -l scripts/sysroot-relativelinks.py
>> -rw-rw-r-- 1  poky poky 959 Sep 12 09:38 scripts/sysroot-relativelinks.p=
y
>>
>> The execution bit is missing!?
>>
>> I can of course apply the execution bit manually, but what may cause
>> the patch to not set the bits properly in my scripts folder for new
>> files? Please advise.
>
> I checked the poky and oe-core trees and they have a+x:
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/scripts
> http://git.openembedded.org/openembedded-core/tree/scripts
>
> so I'm a bit puzzled. How did you update your tree?
>
All the other scripts in the scripts folder has a+x, it is only the
new .py file added by your patch that does not obtain it in my local
tree.

> Cheers,
>
> Richard
>

