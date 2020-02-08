Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
	[209.85.221.180])
	by mail.openembedded.org (Postfix) with ESMTP id 87CFD60F39
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 14:47:45 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id u6so607160vkn.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 06:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zw9Bi/fShC+QjFrMkFIlk2SEvG+sQsj8N65BUsrGRWk=;
	b=VwzEK89/P+KyRj8SJziMXjM292bDtOPnL1/cs/O2YBDeOxFAHphvoENLvOdiQaDK40
	1LP1tz90LB2EWHlRWjCV2fw4OFkw/TeoD/AqCLivD4/AkXEIgjQX/a+Tizu3AJqGwfOX
	wJpB4gZJlmJmn+2jKOMhQ9wQzkqC/ZDQl7QglNL386D0ej5h2MFcD2pFw8mYz5q84T2b
	aE0RBaKEQh5GSrab6ec105sBwz20TSW5OIuq2pFjesJK4wCfeKz9X83tFYNyafjcfmtT
	K/L4e/o+tzUvygQkJWTCS5WRvxzyeDwqtZYJoAzh5OuN+et381kiqr0YgEd7vsfesU9H
	M5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zw9Bi/fShC+QjFrMkFIlk2SEvG+sQsj8N65BUsrGRWk=;
	b=ACNeEzxR0TB/Z9N6NB6/fSgZ0MZNA38K/YMB89h5Ghx0K+3eZXzRlwegJqBUMJWNSr
	6CW2tTDm5jjy3V9tb6AhjKWyMEPmr+b3w93ZbRthcxSxI8yGyCU/XHRhFGj/g/VaeCaT
	guDsyB7Am5O4VcovnQI8MC5lL0vx1alyPWZ3bB44bHGpOT9OzYZLqUrnpaFousDZkP3A
	/j9pp4KUEFC6979uejcL3DO1zlDvo6flsxU+sZaaxWdHSA0E9Bwb1PrJZi8wm5g3orbu
	fEMfPCCPrzoCvO5VEljZO+JMMb0QvS4eHOmW2zGKQiYgbZfJEpDepsCLn1N0nqTwesWu
	UsQQ==
X-Gm-Message-State: APjAAAXnN6GQ4JIQ3TxankZJBLT5uw51FvKxTHDa7P0ut1nVI+fk1DVK
	jrOqEldPxrcgSBsgrTMrAu5CGFHOMy1xV6oqAUc=
X-Google-Smtp-Source: APXvYqxyx71kVNW8e0xOJ/9BkziRHQV1baYsHoo9beVx9p6dF68pBDD8dqGeNjVuWr8MF2H9TExJrr2Nbu4xrZ4EuaE=
X-Received: by 2002:a1f:fe45:: with SMTP id l66mr2282265vki.9.1581173265936;
	Sat, 08 Feb 2020 06:47:45 -0800 (PST)
MIME-Version: 1.0
References: <20200207213440.10462-1-scott.branden@broadcom.com>
	<CANNYZj9JY0joj=ddZKPzq0QyPquu_riHbAKkZOb1oEy9VQrqNw@mail.gmail.com>
	<073d103e-a32e-ff07-1223-220f9f97dcec@broadcom.com>
	<065b0daf-ec38-b518-c1ab-195b514e5054@broadcom.com>
In-Reply-To: <065b0daf-ec38-b518-c1ab-195b514e5054@broadcom.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 8 Feb 2020 15:47:34 +0100
Message-ID: <CANNYZj_WspzruDbxjnz8bNJYQhdQcgz8TocD2vACpFO7s-vfeQ@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x265: add x265 recipe
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
X-List-Received-Date: Sat, 08 Feb 2020 14:47:45 -0000
Content-Type: multipart/alternative; boundary="000000000000d83524059e119624"

--000000000000d83524059e119624
Content-Type: text/plain; charset="UTF-8"

What I meant is that upstream is actually tagging releases:
https://github.com/videolan/x265/releases
and therefore we should package the latest release, rather than a random
commit.

Which means you should name the recipe x265_3.1.2.bb and set SRCREV to
match the 3.1.2 tag. Going forward, the recipe should be updated the same
way: rename file to the new version, update SRCREV.

Another problem is that github is not synced properly with the original
x265 repo, and is several months behind. SRC_URI should probably refer to
https://bitbucket.org/multicoreware/x265/src/default/
Alternatively, don't use git at all and fetch tarballs:
http://ftp.videolan.org/pub/videolan/x265/

Alex

On Sat, 8 Feb 2020 at 00:28, Scott Branden <scott.branden@broadcom.com>
wrote:

> Hi Alex,
>
> more comment below about PV.
>
> On 2020-02-07 2:26 p.m., Scott Branden wrote:
>
> HI Alex,
>
> On 2020-02-07 2:09 p.m., Alexander Kanavin wrote:
>
> Can you also enable x265 in ffmpeg and gstreamer plugins recipes, so there
> would be actual users of the codec in oe-core?
>
> I do have a patch for ffmpeg and have tested that works.  I'll add that to
> the patch series.
>
>
> Also, x265 git repo does have tagged releases, and so PV/SRCREV in recipe
> should be set to match a release tag.
>
> You'll have to help me out a little here on exactly what you want.
>
> This is based off the stable tag.
> I already specified the SRCREV in the recipe.
>
> Do you want PV to be:
> PV = "stable+git${SRCPV}"
>
> ?
>
> I was trying to follow the x264 recipe.
>
> Do you want me do something like name the recipe x265_stable.bb instead
> and not specify PV?
>
>
> Alex
>
> On Fri, 7 Feb 2020 at 22:35, Scott Branden via Openembedded-core <
> openembedded-core@lists.openembedded.org> wrote:
>
>> Add x265 recipe from latest revision of stable branch.
>>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>  meta/recipes-multimedia/x265/x265_git.bb | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 meta/recipes-multimedia/x265/x265_git.bb
>>
>> diff --git a/meta/recipes-multimedia/x265/x265_git.bb
>> b/meta/recipes-multimedia/x265/x265_git.bb
>> new file mode 100644
>> index 0000000000..7c230e2b1e
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/x265/x265_git.bb
>> @@ -0,0 +1,21 @@
>> +SUMMARY = "H.265/HEVC video encoder"
>> +DESCRIPTION = "A free software library and application for encoding
>> video streams into the H.265/HEVC format."
>> +HOMEPAGE = "http://www.videolan.org/developers/x265.html"
>> +
>> +LICENSE = "GPLv2"
>> +LICENSE_FLAGS = "commercial"
>> +LIC_FILES_CHKSUM =
>> "file://../COPYING;md5=c9e0427bc58f129f99728c62d4ad4091"
>> +
>> +DEPENDS = "nasm-native"
>> +DEPENDS = "gnutls zlib libpcre"
>> +
>> +SRC_URI = "git://github.com/videolan/x265;branch=stable \
>> +          "
>> +
>> +SRCREV = "4ef6b67fd46e1584e52a11a264812edcaef02526"
>> +
>> +S = "${WORKDIR}/git/source"
>> +
>> +inherit lib_package pkgconfig cmake
>> +
>> +AS[unexport] = "1"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>

--000000000000d83524059e119624
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What I meant is that upstream is actually tagging rel=
eases:</div><div><a href=3D"https://github.com/videolan/x265/releases">http=
s://github.com/videolan/x265/releases</a></div><div></div><div>and therefor=
e we should package the latest release, rather than a random commit. <br></=
div><div><br></div><div>Which means you should name the recipe <a href=3D"h=
ttp://x265_3.1.2.bb">x265_3.1.2.bb</a> and set SRCREV to match the 3.1.2 ta=
g. Going forward, the recipe should be updated the same way: rename file to=
 the new version, update SRCREV.</div><div><br></div><div>Another problem i=
s that github is not synced properly with the original x265 repo, and is se=
veral months behind. SRC_URI should probably refer to <a href=3D"https://bi=
tbucket.org/multicoreware/x265/src/default/">https://bitbucket.org/multicor=
eware/x265/src/default/</a></div><div>Alternatively, don&#39;t use git at a=
ll and fetch tarballs: <a href=3D"http://ftp.videolan.org/pub/videolan/x265=
/">http://ftp.videolan.org/pub/videolan/x265/</a></div><div><br></div><div>=
Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, 8 Feb 2020 at 00:28, Scott Branden &lt;<a href=3D"m=
ailto:scott.branden@broadcom.com">scott.branden@broadcom.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    Hi Alex,<br>
    <br>
    more comment below about PV.<br>
    <br>
    <div>On 2020-02-07 2:26 p.m., Scott Branden
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      HI Alex,<br>
      <br>
      <div>On 2020-02-07 2:09 p.m., Alexander
        Kanavin wrote:<br>
      </div>
      <blockquote type=3D"cite">
       =20
        <div dir=3D"ltr">
          <div>Can you also enable x265 in ffmpeg and gstreamer plugins
            recipes, so there would be actual users of the codec in
            oe-core?</div>
        </div>
      </blockquote>
      I do have a patch for ffmpeg and have tested that works.=C2=A0 I&#39;=
ll add
      that to the patch series.<br>
      <blockquote type=3D"cite">
        <div dir=3D"ltr">
          <div><br>
          </div>
          <div>Also, x265 git repo does have tagged releases, and so
            PV/SRCREV in recipe should be set to match a release tag.<br>
          </div>
        </div>
      </blockquote>
      You&#39;ll have to help me out a little here on exactly what you
      want.=C2=A0 <br>
      <br>
      This is based off the stable tag.<br>
      I already specified the SRCREV in the recipe.<br>
      <br>
      Do you want PV to be:<br>
      PV =3D &quot;stable+git${SRCPV}&quot;<br>
      <br>
      ?<br>
    </blockquote>
    I was trying to follow the x264 recipe.<br>
    <br>
    Do you want me do something like name the recipe <a href=3D"http://x265=
_stable.bb" target=3D"_blank">x265_stable.bb</a>
    instead and not specify PV?<br>
    <blockquote type=3D"cite">
      <blockquote type=3D"cite">
        <div dir=3D"ltr">
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, 7 Feb 2020 at 22:35=
,
            Scott Branden via Openembedded-core &lt;<a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@li=
sts.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add x265 recipe=
 from
            latest revision of stable branch.<br>
            <br>
            Signed-off-by: Scott Branden &lt;<a href=3D"mailto:scott.brande=
n@broadcom.com" target=3D"_blank">scott.branden@broadcom.com</a>&gt;<br>
            ---<br>
            =C2=A0meta/recipes-multimedia/x265/<a href=3D"http://x265_git.b=
b" rel=3D"noreferrer" target=3D"_blank">x265_git.bb</a>
            | 21 +++++++++++++++++++++<br>
            =C2=A01 file changed, 21 insertions(+)<br>
            =C2=A0create mode 100644 meta/recipes-multimedia/x265/<a href=
=3D"http://x265_git.bb" rel=3D"noreferrer" target=3D"_blank">x265_git.bb</a=
><br>
            <br>
            diff --git a/meta/recipes-multimedia/x265/<a href=3D"http://x26=
5_git.bb" rel=3D"noreferrer" target=3D"_blank">x265_git.bb</a>
            b/meta/recipes-multimedia/x265/<a href=3D"http://x265_git.bb" r=
el=3D"noreferrer" target=3D"_blank">x265_git.bb</a><br>
            new file mode 100644<br>
            index 0000000000..7c230e2b1e<br>
            --- /dev/null<br>
            +++ b/meta/recipes-multimedia/x265/<a href=3D"http://x265_git.b=
b" rel=3D"noreferrer" target=3D"_blank">x265_git.bb</a><br>
            @@ -0,0 +1,21 @@<br>
            +SUMMARY =3D &quot;H.265/HEVC video encoder&quot;<br>
            +DESCRIPTION =3D &quot;A free software library and application =
for
            encoding video streams into the H.265/HEVC format.&quot;<br>
            +HOMEPAGE =3D &quot;<a href=3D"http://www.videolan.org/develope=
rs/x265.html" rel=3D"noreferrer" target=3D"_blank">http://www.videolan.org/=
developers/x265.html</a>&quot;<br>
            +<br>
            +LICENSE =3D &quot;GPLv2&quot;<br>
            +LICENSE_FLAGS =3D &quot;commercial&quot;<br>
            +LIC_FILES_CHKSUM =3D <a>&quot;file://../COPYING;md5=3Dc9e0427b=
c58f129f99728c62d4ad4091&quot;</a><br>
            +<br>
            +DEPENDS =3D &quot;nasm-native&quot;<br>
            +DEPENDS =3D &quot;gnutls zlib libpcre&quot;<br>
            +<br>
            +SRC_URI =3D &quot;git://<a href=3D"http://github.com/videolan/=
x265;branch=3Dstable" rel=3D"noreferrer" target=3D"_blank">github.com/video=
lan/x265;branch=3Dstable</a>
            \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
            +<br>
            +SRCREV =3D &quot;4ef6b67fd46e1584e52a11a264812edcaef02526&quot=
;<br>
            +<br>
            +S =3D &quot;${WORKDIR}/git/source&quot;<br>
            +<br>
            +inherit lib_package pkgconfig cmake<br>
            +<br>
            +AS[unexport] =3D &quot;1&quot;<br>
            -- <br>
            2.17.1<br>
            <br>
            -- <br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a href=3D"mailto:Openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
            <a href=3D"http://lists.openembedded.org/mailman/listinfo/opene=
mbedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedde=
d.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--000000000000d83524059e119624--
