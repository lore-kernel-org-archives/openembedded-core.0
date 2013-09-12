Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3106B60C0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 14:54:08 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wm4so607696obc.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=bPAqzcFhPN2aFbkxpGXUUAET0Cp2Bp9Uvvrkmw+agBo=;
	b=IpcQsA6NHmZbr7jCs8PyP+r36Q9JKbT5qjJC4GQH2vRCwCn7j9+FPjH1t0TRnWCEKy
	Fo7WMw5aasuI/FH2Sj16T/Ch/GE+Qd6Hdw3YAzBxpijamlR/9xKyLtBVL58TvfqqUQho
	fGm5kaGiV26z0Rf9ROvfcbUNPdN5sCln12bncuOs+/Q5diZf3pS0pm2XYjgX+0wkMs1J
	80A2wDW6o8VfUYURscTpwII6ytJPTvbOnIF0L7Z/vzVvvj/WTSgXXFLU7OxxsxPR8K3/
	dGT0bU7eiylUIjQTt4/i0F3qjzYaYt1Jg1X5grnom7DFDCMFSJ7+D9KRtbS/7q/ajqZq
	SWug==
MIME-Version: 1.0
X-Received: by 10.182.101.198 with SMTP id fi6mr1420016obb.79.1378997649546;
	Thu, 12 Sep 2013 07:54:09 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Thu, 12 Sep 2013 07:54:09 -0700 (PDT)
In-Reply-To: <CAFyqS9q0hLpdgA+rnQSZ7U51HRGSXCXVDGb+ADUYBbeMcofVkg@mail.gmail.com>
References: <1378892564.3484.172.camel@ted>
	<CAFyqS9rx5ycOOzfxkCxr5N+wCKBTgqQYjzzmc3CA5u-MZNHA1g@mail.gmail.com>
	<1378972945.3484.217.camel@ted>
	<CAFyqS9q0hLpdgA+rnQSZ7U51HRGSXCXVDGb+ADUYBbeMcofVkg@mail.gmail.com>
Date: Thu, 12 Sep 2013 16:54:09 +0200
Message-ID: <CAFyqS9oZ7F58rfHcdHLPZcu0vknzEr+8Pt9dS1vAdpc8CxKfTQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 12 Sep 2013 14:54:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2013 at 10:29 AM, Hans Beck=E9rus <hans.beckerus@gmail.com>=
 wrote:
> On Thu, Sep 12, 2013 at 10:02 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2013-09-12 at 09:48 +0200, Hans Beck=E9rus wrote:
>>> I have a slight problem with this patch. The new
>>> sysroot-relativelinks.py does not obtain the proper access protection
>>> bits!?
>>> Which results in the following error when packaging the SDK
>>>
>>> /home/poky/build/tmp/work/zynq_zc706-poky-linux-gnueabi/rootfs-default/=
1.0-r0/temp/run.populate_sdk_image.20803:
>>> line 496: /home/poky/scripts/sysroot-relativelinks.py: Permission
>>> denied
>>>
>>> [home/poky]: ls -l scripts/sysroot-relativelinks.py
>>> -rw-rw-r-- 1  poky poky 959 Sep 12 09:38 scripts/sysroot-relativelinks.=
py
>>>
>>> The execution bit is missing!?
>>>
>>> I can of course apply the execution bit manually, but what may cause
>>> the patch to not set the bits properly in my scripts folder for new
>>> files? Please advise.
>>
>> I checked the poky and oe-core trees and they have a+x:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky/tree/scripts
>> http://git.openembedded.org/openembedded-core/tree/scripts
>>
>> so I'm a bit puzzled. How did you update your tree?
>>
> All the other scripts in the scripts folder has a+x, it is only the
> new .py file added by your patch that does not obtain it in my local
> tree.
>
As Richard so correctly pointed out to me, this is expected when I use
'patch' to bring it in :(
I must learn my lesson and start using 'git am' instead.

Thanks.
Hans

>> Cheers,
>>
>> Richard
>>

