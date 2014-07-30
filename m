Return-Path: <freesilicon@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id BDE8A70900
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 09:40:40 +0000 (UTC)
Received: by mail-yk0-f181.google.com with SMTP id q200so515003ykb.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7nCzcCoy0rLGDIj+n//Laqkbo+SRnFSfYPtRynYrIAA=;
	b=0KY2pxxocUQBf6keQQ37NEVvoAt/3yB0GNhCo6sj/C/4PLf+LWvWRTN6wyoMcMfDS4
	GvLYKNQ8osNjz/NS7SrqXQM5ri6nhdb5ho8hGObv+WKk3YnN13WHjz9T5HWk8qBMK8hi
	V1rNny5JnteK+jO+v3I/FtFhhE4jhhEMsOOi68uOimg6QiKs3/qYLvIn6C3mqoynhmr3
	yA6pNgGfJrPadTCGmOWgE8oPMdvq0rz0UGEOzdp9+HPOHrHJImEm3eJQZ2BPLM+6JZvZ
	IlQv/oaOGT0jh7Ftt6sevBalXJEzMsTEAJD7L2saE3Lr7hBpVgzkt0e3QZPQoyoO02+r
	D4JA==
MIME-Version: 1.0
X-Received: by 10.236.60.201 with SMTP id u49mr4912502yhc.166.1406713241987;
	Wed, 30 Jul 2014 02:40:41 -0700 (PDT)
Received: by 10.170.123.210 with HTTP; Wed, 30 Jul 2014 02:40:41 -0700 (PDT)
In-Reply-To: <20140728164200.55019693@e6520eb>
References: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
	<20140728135853.35af7ee0@e6520eb>
	<CAKRNOGx_e_cNLuzhETFuL2k12fhGsHBPdYT9ND8uP_F67=VA7A@mail.gmail.com>
	<20140728164200.55019693@e6520eb>
Date: Wed, 30 Jul 2014 11:40:41 +0200
Message-ID: <CAKRNOGzHyDxDd09=fUHSPm5Gj9Tt8ZhG+oF_4TfHjBYHqFMewg@mail.gmail.com>
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] barebox: Add recipe
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
X-List-Received-Date: Wed, 30 Jul 2014 09:40:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry to come back on this subject, but what is the current status of
this request?

Do you need more background? Are you waiting for more opinions or a
vote on this subject? Should I submit a v2 of this patch with what we
have discussed to make it more polished for OE-Core (or another
layer)?

Again, sorry for the noise!

Greetings,
David

2014-07-28 16:42 GMT+02:00 Eric B=C3=A9nard <eric@eukrea.com>:
> Hi David,
>
> Le Mon, 28 Jul 2014 14:15:12 +0200,
> David Vincent <freesilicon@gmail.com> a =C3=A9crit :
>> > Why don't you use $BAREBOX_BINARY instead of hardcoding
>> > barebox-flash-image which won't work on old versions of barebox where
>> > barebox's binary is named barebox.bin ?
>>
>> I didn't know that, but I am not sure I can use $BAREBOX_BINARY since
>> this variable is used in $DEPLOY_DIR. I tried to mimic u-boot recipe
>> behavior as much as possible.
>>
> you can use the variable as it's defined upper. u-boot recipe does it
> this way :
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-bsp/u-bo=
ot/u-boot.inc#n19
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-bsp/u-bo=
ot/u-boot.inc#n63
>
> FWIW you can find here the initial barebox recipe we have in
> meta-fsl-arm :
> https://github.com/Freescale/meta-fsl-arm/tree/master/recipes-bsp/barebox
>
> Best regards,
> Eric

