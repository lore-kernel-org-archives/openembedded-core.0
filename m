Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id DA90073191
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 16:45:04 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 2so2508798oif.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Sep 2016 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=BHr8XHnA6zr/U+Rc1JF3Kyj2vUmq6qpSQqxBrvw50N4=;
	b=S1R45fdugO18UdKgcZLD/Bh7DQWNqzzisD3BeYv+RHu4bFx+jkQ6BTfy9LaXP7jtLN
	aByiIIhR8GDB5zYnSS0vJWKTv6guip/Ums9+y1jh1KGvZKM5Xbppnb3J04Gp4GzyfG55
	D7hBcnbOtUxTrsOBIWigx0HIbIRz/NWHPFiaGi4+Z1JxZeDu/HnXHiyls/3xEu4b44KG
	TsEUl7InDJKZnZ17XICO1BywDT7sYSsBnzMHJ3Y+6AWR/Wp4KFZKKuPiAgJgZKI0VwUF
	izlIPD02x3z2dbZgKImL+w/7Ai6Jr+NSpBlhv9Mj4BjTRLJ1XzvZ5lavNvdqWtLz1zOp
	YgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=BHr8XHnA6zr/U+Rc1JF3Kyj2vUmq6qpSQqxBrvw50N4=;
	b=OCrSnJbGu6XX0Ok2gwUg6+CASysCfPoXGpXxDEI8J+6CsuJlUfEtWL91MQARGngtbE
	6jUMQ+oHc35PJcA3uoNXzKZZQ/LcVtOrvmD5RGvTxBjXGIIkq413WSnbSXMD3YntnfdO
	MvVZ3Nvz6EzESaEvy707FFVnicTIwF/KBkmVf3nYyeSj3mM8S8oZkCGB9dQvBaX1JfQX
	OmCafRiqoDPqMHjv8JEDwYHnAF6/xwdfd47JECXgnfyPZd3l1Z5AWMNUoQgIc3lzVNCS
	oMZrFwnNtccaYiypHUuLDBO5Wa0qWZvWw/682Kl2mXioEGx1lzN+R295Ed+9CeIiiBRH
	YIbQ==
X-Gm-Message-State: AE9vXwObRZODMxPRilqjODiSFmqUos7dbBh+6bWbDI1oeJTEoRcNGHhPjsf9Ov4ALMQH5Amc0xW/xKImvv49lw==
X-Received: by 10.202.45.22 with SMTP id t22mr25893873oit.133.1473266704657;
	Wed, 07 Sep 2016 09:45:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Wed, 7 Sep 2016 09:44:44 -0700 (PDT)
In-Reply-To: <CAJTo0LYK5DPCSzhtWtexBe6Y-tZKu61EeEHzPcVz=qkrqCj_Jg@mail.gmail.com>
References: <1473199905-13645-1-git-send-email-henry.bruce@intel.com>
	<1473199905-13645-2-git-send-email-henry.bruce@intel.com>
	<CAJTo0LYK5DPCSzhtWtexBe6Y-tZKu61EeEHzPcVz=qkrqCj_Jg@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 7 Sep 2016 09:44:44 -0700
X-Google-Sender-Auth: eIJwo5YZIb3Xm4YMQORWwvVzqRM
Message-ID: <CABcZAN=OO-7P-YA2nd5WQ2XtbniPS8DLJJVSdWepfOvN6s2-og@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] utils.bbclass: Added error checking for oe_soinstall
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
X-List-Received-Date: Wed, 07 Sep 2016 16:45:06 -0000
Content-Type: multipart/alternative; boundary=001a1137a4429738f9053beda2b8

--001a1137a4429738f9053beda2b8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 7, 2016 at 9:27 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 6 September 2016 at 23:11, Henry Bruce <henry.bruce@intel.com> wrote:
>
>> +       if [[ "$libname" =3D=3D *.so ]]; then
>>
>
> That's a lot of bashisms in one place ;)
>
> [ not [[
> =3D not =3D=3D
> *.so will need to be escaped in case it matches anything in cwd and
> expands.
>

Good catch, I expect what he really needs is a case statement, since he
doesn=E2=80=99t want an exact match, but to check if the wildcard matches.

case =E2=80=9C$libname=E2=80=9D in
    *.so)
        =E2=80=A6
        ;;
esac
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1137a4429738f9053beda2b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 7, 2016 at 9:27 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_=
extra"><span class=3D""><div class=3D"gmail_quote">On 6 September 2016 at 2=
3:11, Henry Bruce <span dir=3D"ltr">&lt;<a href=3D"mailto:henry.bruce@intel=
.com" target=3D"_blank">henry.bruce@intel.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div>+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [[ &quot;$li=
bname&quot; =3D=3D *.so ]]; then<br></div></blockquote></div><br></span>Tha=
t&#39;s a lot of bashisms in one place ;)</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">[ not [[</div><div class=3D"gmail_extra=
">=3D not =3D=3D</div><div class=3D"gmail_extra">*.so will need to be escap=
ed in case it matches anything in cwd and expands.</div></blockquote></div>=
<br>Good catch, I expect what he really needs is a case statement, since he=
 doesn=E2=80=99t want an exact match, but to check if the wildcard matches.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">case =
=E2=80=9C$libname=E2=80=9D in</div><div class=3D"gmail_extra">=C2=A0 =C2=A0=
 *.so)</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=80=
=A6</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;</div><di=
v class=3D"gmail_extra">esac<br>-- <br><div class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br=
>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1137a4429738f9053beda2b8--
