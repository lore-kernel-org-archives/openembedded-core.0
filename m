Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4E83465D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 11:26:51 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id b13so6234863qcw.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 03:26:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YWnDmXvud3OOG2sC+3IatgQSn3lrnJ81DvdkT6z9e3k=;
	b=Cqf74jGBZzDUxNrd6FJVjna7ZBnKxg6LuczWBPgJi0IUYTKPx0t+xvA+jtjy9fE7WN
	0YNR/5wD7hKIEtjEjMb83/BvhJRE8kQG0/Qw/DB1aLI+WqTk093yvTSRabHiJ6GCYx/t
	NEcHteWaWi57gAjvTv7CV/v/S+cK53ByE2n2jdOseaHTipHWgWNaIbJQjEc7+9dr33At
	3oqumbcwwkpvcw/sAct8MRPD8+VKfDVKsoJOwqBF666Ym0lZn9aXqICUqxOdzkUPZV+F
	KT59bnCQeyzK/NG2cswXZYtJkqgYH+vdzThRnu/md8mRhZ/W2DVHYNFfgDh9Y7SN6bA9
	Ypjw==
X-Gm-Message-State: ALoCoQlTvWPJ/5jC+deXt9AnHZr0e/Lwht3ERhBo9klGj5cgNnfoeGAaUo1xXkdsVQroLMqIddDl
X-Received: by 10.224.138.2 with SMTP id y2mr39055481qat.52.1415618812534;
	Mon, 10 Nov 2014 03:26:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 10 Nov 2014 03:26:32 -0800 (PST)
In-Reply-To: <5460849B.9070403@windriver.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<CANyK_8eJXjkRzPNsEnvbj6ve=DQ-8YkXUnG9uTE5RqmG-GEF+Q@mail.gmail.com>
	<5460849B.9070403@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Nov 2014 11:26:32 +0000
Message-ID: <CAJTo0LbNiXyo3dND_1rJU7A5OcfxNM9wdr=7kUrs1DdficXS7Q@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/24] V2: Add machine qemuarm64
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
X-List-Received-Date: Mon, 10 Nov 2014 11:27:02 -0000
Content-Type: multipart/alternative; boundary=047d7b6709c3757c0305077f704c

--047d7b6709c3757c0305077f704c
Content-Type: text/plain; charset=UTF-8

On 10 November 2014 09:25, Kang Kai <Kai.Kang@windriver.com> wrote:

>    gcc-4.9: redefine default library install directory
>>>    Revert "gcc-4.9: redefine default library install directory"
>>>
>> Can the original commit just be removed from the series rather than
>> reverted?
>>
>
> We just want to keep the history how we get here. If nobody cares it, I'll
> remove them.
>

Nothing is gained by knowing that you tried something and it was wrong.  If
nothing else is required to be done to this series then we'll remove that
pair when merging.

Ross

--047d7b6709c3757c0305077f704c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2014 09:25, Kang Kai <span dir=3D"ltr">&lt;<a href=3D"mailto=
:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0 =C2=A0gcc-4.9: re=
define default library install directory<br>
=C2=A0 =C2=A0Revert &quot;gcc-4.9: redefine default library install directo=
ry&quot;<br>
</blockquote>
Can the original commit just be removed from the series rather than reverte=
d?<br>
</blockquote>
<br></span>
We just want to keep the history how we get here. If nobody cares it, I&#39=
;ll remove them.<br></blockquote></div><br>Nothing is gained by knowing tha=
t you tried something and it was wrong.=C2=A0 If nothing else is required t=
o be done to this series then we&#39;ll remove that pair when merging.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--047d7b6709c3757c0305077f704c--
