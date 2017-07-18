Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8869B77FC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 10:47:50 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id k71so11115574iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WulujzKGCJgI2QViCkqoJpFh5Ro1jN/icFt4JyjXIJ8=;
	b=lDiWtFnlA6wmgLlwximwF41sp1TTXpspQC0rIhoA3M87PkMhHAwnGCxggRpk2dc2+Y
	KthoNWS2fsEHk2tFGkKuG6KxAAR1SBq1EJsDRfaJOEP9olOFSBC3ITet9P1v4NuTmWOr
	RI0Wq4IqaL80xtSa0jbXStczjpOR8+LRqV2KfQdXJZHvnz60TNXArNnOri/UHvFJvbEy
	5Fppovo9wzf6sZwJ0YwtbCD0SlJ0UOjKy0ORdu9ZiO+OjmjoZsWsXJW6u4+qUuxiO3kz
	QFshlxoGGzAtfLj6NGEWOc5IWHahwqsK8c6XNZMjFg3SskajnlLSVmmifu9BA+2Rno51
	d/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WulujzKGCJgI2QViCkqoJpFh5Ro1jN/icFt4JyjXIJ8=;
	b=r1OzMOSFYYPFmZN2Bh4CA42A+dXCVAMBWIA7UN7McaePaRHABZNYrFN+kHFpq6W/Bp
	MFNLWrvD6nAYlDTmqcVDvwMHRVLmiJfG7kfkFwQPEr9nSHKS+CdzDwooW0QvryClqLmY
	jQcFERbFdcmInhlvKWU5FENdy12tZT4WohRC0sIlGMCTegVyTZiYu7jtFjkBuuKH9Fb0
	5Fp7Hl6OLzjlYd5QWmIJFsVAocKc2cMsNvSkcI/o2yR8wKzfleii0bb+iboSAAULjany
	Q3TFDuBs3vfHX5U+2z2W8rbATSLbHb0wiKqzIw8h+mw4oohU392ZUDKOaUvBRaGuLTHj
	OJzA==
X-Gm-Message-State: AIVw1100EMb4uofzC7Ox5dlaSruL5VqQoQG+CtasSH+7IMjkwdmzYmx4
	ADvOEOEDpLjxM4LZBrrQwocNwTYNxhGa
X-Received: by 10.107.6.23 with SMTP id 23mr893456iog.122.1500374871812; Tue,
	18 Jul 2017 03:47:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.178.143 with HTTP; Tue, 18 Jul 2017 03:47:31 -0700 (PDT)
In-Reply-To: <20170718100352.2686-1-ricardo.ribalda@gmail.com>
References: <20170718100352.2686-1-ricardo.ribalda@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jul 2017 11:47:31 +0100
Message-ID: <CAJTo0LZjtttpf+HfoXczKwcMQVrXUtXZzam4oUgKqRU2Oo3G8g@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Add unzip hosttool
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
X-List-Received-Date: Tue, 18 Jul 2017 10:47:51 -0000
Content-Type: multipart/alternative; boundary="001a113f8e7e4458a70554953fea"

--001a113f8e7e4458a70554953fea
Content-Type: text/plain; charset="UTF-8"

On 18 July 2017 at 11:03, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com
> wrote:

> Unzip is required for jar files. Without this patch:
> ERROR: junit4-4.3.1-r0 do_unpack: Unpack failure for URL:
> 'http://downloads.sourceforge.net/junit/junit-4.3.1-src.jar'. Unpack
> command
> PATH="/var/lib/jenkins/workspace/qt5122-dyspro/build/
> tmp/sysroots-uninative/x86_64-linux/usr/bin ......."
> unzip -q -o '/var/lib/yocto/downloads/junit-4.3.1-src.jar' failed with
> return value 127
>

Proper fix is to fix the automatic dependency generation.

The bitbake fetcher handles jar files:

            elif file.endswith('.zip') or file.endswith('.jar'):
                ...
                cmd = 'unzip -q -o'

But the dependency generation in base.bbclass just handles .zip:

        # .zip should DEPEND on unzip-native for unpacking
        elif path.endswith('.zip'):
            d.appendVarFlag('do_unpack', 'depends', '
unzip-native:do_populate_sysroot')

So the fix is to extend that test in base.bbclass to handle .zip and .jar.

Ross

--001a113f8e7e4458a70554953fea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 July 2017 at 11:03, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:13q"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m15d552879fca8250">Unzip is required =
for jar files. Without this patch:<br>
ERROR: junit4-4.3.1-r0 do_unpack: Unpack failure for URL:<br>
&#39;<a href=3D"http://downloads.sourceforge.net/junit/junit-4.3.1-src.jar"=
 rel=3D"noreferrer" target=3D"_blank">http://downloads.sourceforge.<wbr>net=
/junit/junit-4.3.1-src.jar</a>&#39;<wbr>. Unpack<br>
command<br>
PATH=3D&quot;/var/lib/jenkins/<wbr>workspace/qt5122-dyspro/build/<wbr>tmp/s=
ysroots-uninative/x86_64-<wbr>linux/usr/bin .......&quot;<br>
unzip -q -o &#39;/var/lib/yocto/downloads/<wbr>junit-4.3.1-src.jar&#39; fai=
led with<br>
return value 127<br></div></blockquote></div><br>Proper fix is to fix the a=
utomatic dependency generation.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">The bitbake fetcher handles jar files:</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gm=
ail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif file.endswith(&#3=
9;.zip&#39;) or file.endswith(&#39;.jar&#39;):</div><div class=3D"gmail_ext=
ra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...</div><div c=
lass=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cmd =3D &#39;unzip -q -o&#39;<br></div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">But the dependency generation in base.bbcla=
ss just handles .zip:</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra"><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 # .=
zip should DEPEND on unzip-native for unpacking</div><div class=3D"gmail_ex=
tra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif path.endswith(&#39;.zip&#39;):</div><=
div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appen=
dVarFlag(&#39;do_unpack&#39;, &#39;depends&#39;, &#39; unzip-native:do_popu=
late_sysroot&#39;)</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">So the fix is to extend that test in base.bbclass to handle .z=
ip and .jar.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div></div></div>

--001a113f8e7e4458a70554953fea--
