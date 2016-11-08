Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 42D48719EC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 09:27:48 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id x190so207480245qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 01:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xXULIODZKKSGKwgTxYkf4svhsmAk+qtwk0Z18ohaJSU=;
	b=XVPC7HmLL/p3UqjAJFMp/ixdjrPbqQYjmgSt/4sJA8QMkoNhYGhlHWnRgxT2QHoBey
	ejU7zBve1RsUoMXZX/4PhZDTBkIgxKNLcUDvW4GUkXad9ObTkDAbEpt3JQgjFGIvBYa4
	+ozSUL4K7fyujIIiIzoDQJ6gQHZNRQlcU6ecwwEVkXbq/vvpEZ3gtMjrAEmi/0aqkQSu
	28odqoAdP7loKKM+6Pw65ZjWVpJAAZrf4/bA5uKPdTSy67G18t0VdDetvY7CTo/3RrH9
	5EfWe7mxzu5Tq3tT1E9d9YDXUZ5+iJw016J46DdTaUTaUWPSgM/vYoqCBFMQCw3LAjaK
	HvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xXULIODZKKSGKwgTxYkf4svhsmAk+qtwk0Z18ohaJSU=;
	b=GFuWgiq/9/lbBe60v2BcOu/Ll+ZzQ+YyP18fub6n4+8cHA90fAiJHzTamjvwR/+Lf5
	vcjfevrvXrM+htBYlZNOlFw8BbtFXh+xWIgrwQmVhL/sZIEX7ObD/JZxkIev7LbD3Q1F
	P4VFItdZPDiGEEZ3V1ABO13S2Zath3tgkW96r9yk5aePPTfyFIGVSsXv39rlIOET/Sis
	ppGopRe/OvRiOiJ16Rg9ZnHe4MnQ0keuEnfNY0atOkHf97t5Ri/xFmws1o6Q4EemPf5i
	6Ab01U1EHiM0/9OPjqlNigrDK6dz3lSm8jTvn1nBxOrmxDbIPzx9whszOGpJMOCdKaQG
	9kWA==
X-Gm-Message-State: ABUngvc6MFPeQYVO9ucTZBDbkHUnhpFSHIE6U9CJW6tizlG19ERm8AVx/5DGK/3DGK/VAJGi8k9n5mNGz5OG3lEu
X-Received: by 10.55.75.17 with SMTP id y17mr11345086qka.26.1478597269735;
	Tue, 08 Nov 2016 01:27:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 8 Nov 2016 01:27:29 -0800 (PST)
In-Reply-To: <42194f13-8e2c-1baf-faf5-b8d2c7a46c2c@windriver.com>
References: <1478487736-115662-1-git-send-email-li.zhou@windriver.com>
	<42194f13-8e2c-1baf-faf5-b8d2c7a46c2c@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Nov 2016 09:27:29 +0000
Message-ID: <CAJTo0LZ8VsfPneyXTMdw=1UyL-TYumGKTio380DFhOgwSt4t0w@mail.gmail.com>
To: "Zhou, Li" <li.zhou@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH version2] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Tue, 08 Nov 2016 09:27:50 -0000
Content-Type: multipart/alternative; boundary=001a114a88c807970a0540c6c157

--001a114a88c807970a0540c6c157
Content-Type: text/plain; charset=UTF-8

This is merged into my staging branch so should be in master soon.

Ross

On 8 November 2016 at 06:13, Zhou, Li <li.zhou@windriver.com> wrote:

> ping
>
>
>
> On 11/07/2016 11:02 AM, Li Zhou wrote:
>
>> The swpb in macro MUTEX_SET will cause "undefined instruction" error
>> on the new arm arches which don't support this assembly instruction
>> any more. If use ldrex/strex to replace swpb, the old arm arches don't
>> support them. So to avoid this issue, just disable the ARM assembler
>> mutex code, and use the default pthreads mutex.
>>
>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ---
>>   meta/recipes-support/db/db_6.0.35.bb | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/meta/recipes-support/db/db_6.0.35.bb
>> b/meta/recipes-support/db/db_6.0.35.bb
>> index f60edf9..b1bec0e 100644
>> --- a/meta/recipes-support/db/db_6.0.35.bb
>> +++ b/meta/recipes-support/db/db_6.0.35.bb
>> @@ -77,15 +77,6 @@ do_configure() {
>>         oe_runconf
>>   }
>>   -# Override the MUTEX setting here, the POSIX library is
>> -# the default - "POSIX/pthreads/library".
>> -# Don't ignore the nice SWP instruction on the ARM:
>> -# These enable the ARM assembler mutex code
>> -ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
>> -MUTEX = ""
>> -MUTEX_arm = "${ARM_MUTEX}"
>> -MUTEX_armeb = "${ARM_MUTEX}"
>> -EXTRA_OECONF += "${MUTEX}"
>>   EXTRA_OEMAKE_append_class-target = " LIBTOOL=${STAGING_BINDIR_CROSS
>> }/${HOST_SYS}-libtool"
>>   EXTRA_OEMAKE += "STRIP=true docdir=${docdir}/db/"
>>
>>
>
> --
> Best Regards!
> Zhou Li
> Phone number: 86-10-84778511
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114a88c807970a0540c6c157
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is merged into my staging branch so should be in mast=
er soon.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On 8 November 2016 at 06:13, Zhou, Li <span dir=
=3D"ltr">&lt;<a href=3D"mailto:li.zhou@windriver.com" target=3D"_blank">li.=
zhou@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
ping<div><div class=3D"h5"><br>
<br>
<br>
On 11/07/2016 11:02 AM, Li Zhou wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The swpb in macro MUTEX_SET will cause &quot;undefined instruction&quot; er=
ror<br>
on the new arm arches which don&#39;t support this assembly instruction<br>
any more. If use ldrex/strex to replace swpb, the old arm arches don&#39;t<=
br>
support them. So to avoid this issue, just disable the ARM assembler<br>
mutex code, and use the default pthreads mutex.<br>
<br>
Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com" target=
=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-support/db/<a href=3D"http://db_6.0.35.bb" rel=3D"noref=
errer" target=3D"_blank">db_6.0<wbr>.35.bb</a> | 9 ---------<br>
=C2=A0 1 file changed, 9 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/db/<a href=3D"http://db_6.0.35.bb" rel=3D=
"noreferrer" target=3D"_blank">db_6<wbr>.0.35.bb</a> b/meta/recipes-support=
/db/<a href=3D"http://db_6.0.35.bb" rel=3D"noreferrer" target=3D"_blank">db=
_6<wbr>.0.35.bb</a><br>
index f60edf9..b1bec0e 100644<br>
--- a/meta/recipes-support/db/<a href=3D"http://db_6.0.35.bb" rel=3D"norefe=
rrer" target=3D"_blank">db_6<wbr>.0.35.bb</a><br>
+++ b/meta/recipes-support/db/<a href=3D"http://db_6.0.35.bb" rel=3D"norefe=
rrer" target=3D"_blank">db_6<wbr>.0.35.bb</a><br>
@@ -77,15 +77,6 @@ do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runconf<br>
=C2=A0 }<br>
=C2=A0 -# Override the MUTEX setting here, the POSIX library is<br>
-# the default - &quot;POSIX/pthreads/library&quot;.<br>
-# Don&#39;t ignore the nice SWP instruction on the ARM:<br>
-# These enable the ARM assembler mutex code<br>
-ARM_MUTEX =3D &quot;--with-mutex=3DARM/gcc-assembly<wbr>&quot;<br>
-MUTEX =3D &quot;&quot;<br>
-MUTEX_arm =3D &quot;${ARM_MUTEX}&quot;<br>
-MUTEX_armeb =3D &quot;${ARM_MUTEX}&quot;<br>
-EXTRA_OECONF +=3D &quot;${MUTEX}&quot;<br>
=C2=A0 EXTRA_OEMAKE_append_class-targ<wbr>et =3D &quot; LIBTOOL=3D${STAGING=
_BINDIR_CROSS<wbr>}/${HOST_SYS}-libtool&quot;<br>
=C2=A0 EXTRA_OEMAKE +=3D &quot;STRIP=3Dtrue docdir=3D${docdir}/db/&quot;<br=
>
=C2=A0 <br>
</blockquote>
<br>
-- <br></div></div>
Best Regards!<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Zhou Li<br>
Phone number: 86-10-84778511</font></span><div class=3D"HOEnZb"><div class=
=3D"h5"><br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114a88c807970a0540c6c157--
