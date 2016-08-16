Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id D2D1473190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 22:41:15 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id m101so121095857ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 15:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WQwzF8bXJgQAJ5+TtZLHBvzZEOV5WVuERVccCctLbDw=;
	b=Ew/plQYvs6cas+KR9A2jZ7Xh/DYpNkvD8PsQesZGXOqe8DduPUWFJa+w7uS1f9YyO9
	ZV3tE2snWvIN1pMdWEKAu8awgIl5WOrvlFr9+DE2IA7od5NYN4MDVVGfFLKJ9j1tHbcB
	OyH0hdxI/6CSHMrNuyl0FjClNm3MVrQrAbeQTZofmth0sP1azWbc1w/g/yCx9/8Yln99
	hheGnAJs8zH/EO++lFVAuxanYARhEgOo3wRo2HuSC3q2EefwcactUK9+Gfh35vkAGThS
	ArfsxsqaXrYd84GbUknL/s9uh7b25V+AyHvRUZDsxWJihVWMouaA880DnJOFEJMQX3a7
	ZoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WQwzF8bXJgQAJ5+TtZLHBvzZEOV5WVuERVccCctLbDw=;
	b=GF4RPjKCrmQEZRq48phmt5p5BQj61jmbj9GDL4hfupUxRFXzZhKc+DAnjTILImb+99
	CtiIZ3s93eZ1POf9m7YzPJhRzMryP4LYMsF4Y7Zw/5AqHeoCnL3ttQjAUUuo0KS0PWUu
	/BSsqeu8YyMLIE6YmefiedXwKCbyB22tHzKXxX3ZmzqCpDN3oowy6I2EzxvGEkxPmi8Q
	2xZVgU2FUzDy6IQvxUQA3k0ubZFEoH8QY8NaA0uisMrwmr98cx5AS9Tn2UF9Wx/t+LNG
	Nrtc2peQyk3oMSwOF1PjQZwfN01aiv//kXc737BfJmnlIZXR3fsu8OsOonAo8tBnc0Uk
	sqpQ==
X-Gm-Message-State: AEkoout1Wr1Vh12eV1BKpiz2l8ka2NnhJO5+VtddbOYqaM2TpQb9WvejX4KwqH+XGBohv5Q/G+3qBmK4Rif3SXd/
X-Received: by 10.107.154.196 with SMTP id c187mr41662895ioe.99.1471387275650; 
	Tue, 16 Aug 2016 15:41:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 15:40:55 -0700 (PDT)
In-Reply-To: <CAP9ODKp7XCfL7ozG0GU2x6KfKXW1KJ5jLbVi6guWWKPnpKKLHg@mail.gmail.com>
References: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAP9ODKrzOHomALoD28h7nJ6xT5puNkrzbd1FZVr=xij_wYUsxg@mail.gmail.com>
	<00da7e65-bfa1-0ffc-a2bb-1b44e0978864@xilinx.com>
	<CAP9ODKp7XCfL7ozG0GU2x6KfKXW1KJ5jLbVi6guWWKPnpKKLHg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 23:40:55 +0100
Message-ID: <CAJTo0LZe0X13aKjrqprgDuND+B8F7QVFooJRCWqqbJ5xrTyGAg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: Enable out-of-tree builds
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
X-List-Received-Date: Tue, 16 Aug 2016 22:41:18 -0000
Content-Type: multipart/alternative; boundary=001a1140e81ee48328053a380b86

--001a1140e81ee48328053a380b86
Content-Type: text/plain; charset=UTF-8

On 16 August 2016 at 23:00, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> But you removed the suffix from the binaries it seems
>

Just double-checked the diff, I think the line wrapping is making you think
that.  Or, paste the hunk that is broken please.

Ross

--001a1140e81ee48328053a380b86
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 August 2016 at 23:00, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salva=
dor@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":9l" class=3D"a3s aXjCH m156955fe94988f81">But you removed the=
 suffix from the binaries it seems<br></div></blockquote><div><br></div><di=
v>Just double-checked the diff, I think the line wrapping is making you thi=
nk that.=C2=A0 Or, paste the hunk that is broken please.</div><div><br></di=
v><div>Ross=C2=A0</div></div><br></div></div>

--001a1140e81ee48328053a380b86--
