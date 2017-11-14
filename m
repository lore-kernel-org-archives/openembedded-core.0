Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 295A1600EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 02:12:15 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id n63so1689915vkf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 18:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=98X/lN8QxtPAhEmn1t6jlmG2fK+ergBSk2XapNVj72w=;
	b=o59NJRy+3zHGz45C84Qk/9isbs6SBR4X04bimZq//P4HsZinbZMEoofgcO2OvxkHFu
	1DMMMDZqR9tY5d8g3ljteoWQWg6JW1vy4SFu5hDLHFGpp4VCQlZSGODMQngaaphWRLqB
	VnY1Je/YCpeu5SD0iBoLTAhc35/id4LXNo1Ga3nLsVNYzhWTLC0SuabaJnHJ7H0Z+UW0
	/HXqfUZb+fjREDor1eDDxbWqUfPhAZUMcZo/lHEnEmkczj14Nfzq5V5er5tW9/YLhSCe
	+bIZ/Lk0jzRAidWhSq5d7tRS1Kxg/2qyMbBqNrjSVbGUXE2KoqjuSTDfi2NBRSIjXyZT
	B/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=98X/lN8QxtPAhEmn1t6jlmG2fK+ergBSk2XapNVj72w=;
	b=fJ1/Qtl5039QvJMi9EETftd2RDW2b8yJkD5uClV/dn3Ve68NFrzu8kW4DLmd+GsOBq
	WlMdnSVvuSjkLmuHxEV8tH7PYwpoVlu0h8s4N2B694sthPqnuuWPsUtUUlwVJJsNSdm3
	fzpmASG6gTGIDrb56eN+Z7tZPMU6ZHAhKLaCKPp7E4AlgNghadRsvusQeHgE6M/poR52
	dzWd4GPyiSradibQ5ZN0ZLVK8sIYVqPMyp3d0DIDhN2WNo7UKtUvKRIzvQAM1hCJnN0z
	1U7TQ0n5P39D6myomc0vGUDL7dn3880E26LMzP1EPq9Ubbxwb91p4E7YwKuk28Ngd5Yu
	/Opg==
X-Gm-Message-State: AJaThX5O9rjLzTh6e3Pvf2lh6pMOMaUYNWmMD8z64e74bnKRFiawudn3
	DrhS+d8QCWDgyTj+mBJZ0snntqwZgG7vtbmspxE=
X-Google-Smtp-Source: AGs4zMaaulCNqfuEo3oJEVcif5/OXg3YzPRUraKYza/ahShgVIOJ/RsUEgfRhN4aVswe9hfeWq2h/cDuytoPMHIehpk=
X-Received: by 10.31.128.5 with SMTP id b5mr8583612vkd.170.1510625537218; Mon,
	13 Nov 2017 18:12:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.19.130 with HTTP; Mon, 13 Nov 2017 18:11:56 -0800 (PST)
In-Reply-To: <CABcZANm=eqp+x9YPPrSUESXUCkowC0XfAXFvuJPGkWfFJ1s+Mw@mail.gmail.com>
References: <1510597074-24537-1-git-send-email-martyn@welchs.me.uk>
	<CABcZANm=eqp+x9YPPrSUESXUCkowC0XfAXFvuJPGkWfFJ1s+Mw@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 13 Nov 2017 19:11:56 -0700
Message-ID: <CABcZANmweukni+UHbi8gANk+orN4SyUtaKxAa2fAkyDcMU9SOA@mail.gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>
Cc: yocto <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [PATCH 1/2] package.bbclass: add prohibited-path qa test
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
X-List-Received-Date: Tue, 14 Nov 2017 02:12:16 -0000
Content-Type: multipart/alternative; boundary="001a114295ea88dedc055de7ea69"

--001a114295ea88dedc055de7ea69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2017 at 7:10 PM, Christopher Larson <kergoth@gmail.com>
wrote:

>
>
> On Mon, Nov 13, 2017 at 11:17 AM, Martyn Welch <martyn@welchs.me.uk>
> wrote:
>
>> From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
>>
>> Sometimes we wish to ensure that packages don't install files or
>> directories somewhere that may prove detrimental to the operation of the
>> system. For example, this may be the case if files are placed in a
>> directory that is utilised as a mount point at run time, thus making the=
m
>> inaccessible once when the mount point is being utilised.
>>
>> Implement the prohibited-path QA test, which enables such locations to b=
e
>> specified in a "PROHIBITED_PATH" variable. This implementation allows fo=
r
>> exact matches and simple wildcards (paths ending with an asterisk. An
>> error will be raised should a match be found, or in the case of a
>> wildcard, for any files added below the specificed location(s).
>>
>> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
>> Signed-off-by: Martyn Welch <martyn@welchs.me.uk>
>> ---
>>  meta/classes/insane.bbclass  |  2 +-
>>  meta/classes/package.bbclass | 11 +++++++++++
>>  2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index def9c70..fb10681 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -33,7 +33,7 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files
>> arch pkgconfig la \
>>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
>>              split-strip packages-list pkgv-undefined var-undefined \
>>              version-going-backwards expanded-d invalid-chars \
>> -            license-checksum dev-elf file-rdeps \
>> +            license-checksum dev-elf file-rdeps prohibited-path \
>>              "
>>  # Add usrmerge QA check based on distro feature
>>  ERROR_QA_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge'=
,
>> ' usrmerge', '', d)}"
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 2053d46..721ca1e 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -1162,6 +1162,17 @@ python populate_packages () {
>>                  continue
>>              seen.append(file)
>>
>> +            prohibited_path =3D d.getVar('PROHIBITED_PATH')
>> +            if prohibited_path is not None:
>> +                for p in prohibited_path.split():
>> +                    exactmatch =3D True
>> +                    if p.endswith("*"):
>> +                        p =3D p[:len(p)-1]
>> +                        exactmatch =3D False
>> +                    if file[1:].startswith(p) and ((file[1:] !=3D p) or
>> exactmatch) :
>> +                        msg =3D "%s is in a prohibited path.\n" % file[=
1:]
>> +                        package_qa_handle_error("prohibited-path", msg,
>> d)
>>
>
> Unless I=E2=80=99m missing something, you aren=E2=80=99t checking for sta=
rtswith(p +
> os.sep), so a file in libexec would match a prohibited path of lib, as it=
=E2=80=99d
> still start with that, no?
>

You might also consider some form of path normalization if you=E2=80=99re c=
omparing
directly like this, otherwise i.e. //foo wouldn=E2=80=99t match /foo, even =
though
it=E2=80=99s the same path.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114295ea88dedc055de7ea69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Nov 13, 2017 at 7:10 PM, Christopher Larson <span dir=3D"ltr">&=
lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><=
br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div clas=
s=3D"h5">On Mon, Nov 13, 2017 at 11:17 AM, Martyn Welch <span dir=3D"ltr">&=
lt;<a href=3D"mailto:martyn@welchs.me.uk" target=3D"_blank">martyn@welchs.m=
e.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Fabien L=
ahoudere &lt;<a href=3D"mailto:fabien.lahoudere@collabora.co.uk" target=3D"=
_blank">fabien.lahoudere@collabora.co<wbr>.uk</a>&gt;<br>
<br>
Sometimes we wish to ensure that packages don&#39;t install files or<br>
directories somewhere that may prove detrimental to the operation of the<br=
>
system. For example, this may be the case if files are placed in a<br>
directory that is utilised as a mount point at run time, thus making them<b=
r>
inaccessible once when the mount point is being utilised.<br>
<br>
Implement the prohibited-path QA test, which enables such locations to be<b=
r>
specified in a &quot;PROHIBITED_PATH&quot; variable. This implementation al=
lows for<br>
exact matches and simple wildcards (paths ending with an asterisk. An<br>
error will be raised should a match be found, or in the case of a<br>
wildcard, for any files added below the specificed location(s).<br>
<br>
Signed-off-by: Fabien Lahoudere &lt;<a href=3D"mailto:fabien.lahoudere@coll=
abora.co.uk" target=3D"_blank">fabien.lahoudere@collabora.co<wbr>.uk</a>&gt=
;<br>
Signed-off-by: Martyn Welch &lt;<a href=3D"mailto:martyn@welchs.me.uk" targ=
et=3D"_blank">martyn@welchs.me.uk</a>&gt;<br>
---<br>
=C2=A0meta/classes/insane.bbclass=C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/classes/package.bbclass | 11 +++++++++++<br>
=C2=A02 files changed, 12 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index def9c70..fb10681 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -33,7 +33,7 @@ ERROR_QA ?=3D &quot;dev-so debug-deps dev-deps debug-file=
s arch pkgconfig la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perms dep-cmp pkgvarcheck p=
erm-config perm-line perm-link \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0split-strip packages-list p=
kgv-undefined var-undefined \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version-going-backwards exp=
anded-d invalid-chars \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 license-checksum dev-elf file-rd=
eps \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 license-checksum dev-elf file-rd=
eps prohibited-path \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0# Add usrmerge QA check based on distro feature<br>
=C2=A0ERROR_QA_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATU=
RES&#39;, &#39;usrmerge&#39;, &#39; usrmerge&#39;, &#39;&#39;, d)}&quot;<br=
>
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass<br=
>
index 2053d46..721ca1e 100644<br>
--- a/meta/classes/package.bbclass<br>
+++ b/meta/classes/package.bbclass<br>
@@ -1162,6 +1162,17 @@ python populate_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seen.append(file)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prohibited_path =3D d.getVar(&#3=
9;PROHIBITED_PATH&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if prohibited_path is not None:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for p in prohibite=
d_path.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exac=
tmatch =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p=
.endswith(&quot;*&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 p =3D p[:len(p)-1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exactmatch =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if f=
ile[1:].startswith(p) and ((file[1:] !=3D p) or exactmatch) :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 msg =3D &quot;%s is in a prohibited path.\n&quot; % file[1:]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 package_qa_handle_error(&quot;prohi<wbr>bited-path&quot;, msg, d=
)<br></blockquote><div><br></div></div></div><div>Unless I=E2=80=99m missin=
g something, you aren=E2=80=99t checking for startswith(p + os.sep), so a f=
ile in libexec would match a prohibited path of lib, as it=E2=80=99d still =
start with that, no?</div></div></div></div></blockquote><div><br></div><di=
v>You might also consider some form of path normalization if you=E2=80=99re=
 comparing directly like this, otherwise i.e. //foo wouldn=E2=80=99t match =
/foo, even though it=E2=80=99s the same path.</div></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Found=
er - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor =
Graphics</div></div></div></div>
</div></div>

--001a114295ea88dedc055de7ea69--
