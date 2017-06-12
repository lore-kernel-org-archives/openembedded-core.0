Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2636A78262
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 11:12:33 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id k93so53652059ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 04:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kKKALKUK1nRc21YQQDLpyeqWohc57n+547mBxPSyRvA=;
	b=sF/xWMnFZMh0GBpkE3FA2brn0I3mmQ2308wXIJ4Gy9ncWiNR3JZBcrnJUj9IQesoOK
	V4B0REsVwcNRD4z/hspTJKpE2Vg0ct0yVKDQ5b4D92TzW+YbceIg0uo3n7qlYlRtlRYw
	nSHl+VwEPcsPEXApXMZmDBk83hBuJK6b8QeSgDElN4wFJLk5edulPp2zyzBD8VkIj//V
	wjY1oOHlA2TSdRSbkmzS1pg97OsZ4EimipQJ0fTMCsjzsSbpxIBZ8eRRcT/3y8r2tgj4
	NWzswt2xYBJWQev16b7RHuuIRtX6MS981dDFe9kjf/H8jcJxj1rzha+4fdLx2gQgXYrf
	h4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kKKALKUK1nRc21YQQDLpyeqWohc57n+547mBxPSyRvA=;
	b=Tjws8/s+OUyUHWPtYpo7I3gD8WBD8frJH6veVTxswhHxvcOK7XEEcagSaX2TnOjHQG
	ioGEsKKkz1n5CaJ9d+wi2A2qUyD9WGvFbOW1e1QLv/J9N7//GR84gRE0uF6MovfCLA/U
	1tTOfg4lhgLI7tjj4ND2Jed4+xV7X7SeyjHjAiQEufgfaXd7A3bIECmGWWv6RqTsPdM3
	dUYNFoBtC4ZiNP6PTPan+hI7PFhq8cd9xo1+fES1PRnPxa0XjidDtiaFsfjofx7qDzla
	WGV7dUE3hSbaXOCFlprOBWRUFx0Oa38dnJvPg+zvp5hlfCdifZ94EtAjLIKQCnqtrDX5
	qaMw==
X-Gm-Message-State: AKS2vOx0vOvmqxVNZias34ZGKHsDKIKT5m96VUmij0frvS89jGZy+iNg
	2mqd8vvXMn+lN1iMcTmiCUuUMe/spw==
X-Received: by 10.107.9.160 with SMTP id 32mr9175901ioj.212.1497265955155;
	Mon, 12 Jun 2017 04:12:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.16 with HTTP; Mon, 12 Jun 2017 04:12:34 -0700 (PDT)
In-Reply-To: <CAJTo0LbyKHf=FR8vPta5QhpvYC9dYvtgg26y5L3m02a=4fU4+Q@mail.gmail.com>
References: <1497069672-2012-1-git-send-email-changhyeok.bae@gmail.com>
	<CAJTo0LbyKHf=FR8vPta5QhpvYC9dYvtgg26y5L3m02a=4fU4+Q@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Mon, 12 Jun 2017 20:12:34 +0900
Message-ID: <CACrLJgAze4cvjruZgYY5e4mHq-WPyxxXRK-KHsCj1nQ_-VLRDw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Mon, 12 Jun 2017 11:12:34 -0000
Content-Type: multipart/alternative; boundary="001a113eac9a643bc00551c16513"

--001a113eac9a643bc00551c16513
Content-Type: text/plain; charset="UTF-8"

Add LICENSE explanation.

Thanks
Changhyeok

2017-06-12 20:00 GMT+09:00 Burton, Ross <ross.burton@intel.com>:

> Of course openssl would be shipping pre-compiled binaries...  :/
>
> On 10 June 2017 at 05:41, Changhyeok Bae <changhyeok.bae@gmail.com> wrote:
>
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
>>
>
> Still not explaining why this change is needed.
>
> Ross
>



-- 
Thanks
Changhyeok

--001a113eac9a643bc00551c16513
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Add LICENSE explanation.<br></div><div><br></div><div=
>Thanks</div><div>Changhyeok</div></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">2017-06-12 20:00 GMT+09:00 Burton, Ross <span dir=3D=
"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.b=
urton@intel.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra">Of course openssl would be shipping pre=
-compiled binaries... =C2=A0:/</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra"><span class=3D""><div class=3D"gmail_quote">On 10 =
June 2017 at 05:41, Changhyeok Bae <span dir=3D"ltr">&lt;<a href=3D"mailto:=
changhyeok.bae@gmail.com" target=3D"_blank">changhyeok.bae@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span>-LIC_FILES_CHKSUM =
=3D &quot;file://LICENSE;md5=3D27ffa5d74b<wbr>b5a337056c14b2ef93fbf6&quot;<=
br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D057d9218c6<wbr>180e1d9ee40=
7572b2dd225&quot;<br></span></blockquote></div><div class=3D"gmail_extra"><=
br></div></span>Still not explaining why this change is needed.</div><span =
class=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Th=
anks<div>Changhyeok</div></div></div>
</div>

--001a113eac9a643bc00551c16513--
