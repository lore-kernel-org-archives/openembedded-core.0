Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id E78507F363
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 11:23:50 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id v129so58035245vsb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=af6evUbVY62qtV8soNzjDGdo7gJA+ZuE6AzRQj8VhHA=;
	b=J9v3FbErRHYM0p8pdkI3GiMJnqSWkjJF0h6FPIllk41oixvvjiq+ytsEfOvwIdvgOH
	aqmtmhkwZFPnoUdqFlJ25nADkKU+Ihzy/F5gnrkD219UAJ5Y93ZVT3MuxKZx6tQSBXq1
	+sKEnG2VfSN8ysAHOkyODC+iiezWZkzcx52N4kyQrFljloQBBFcyuJ+7gqqtpIv/Lbkp
	uX26YBXe26aG2Y35voqtfkcbq+2wZe1TzTO4/Hn7GPCdLItwY1lAUbZ1bdCCbET0ylyk
	jpLdvK5ElpwwZdX6TbC4SMPltDply3EzHKxG8qiP/f8L1behvbsguGOHOl84izrItV+a
	jVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=af6evUbVY62qtV8soNzjDGdo7gJA+ZuE6AzRQj8VhHA=;
	b=NQhIA1tzmfCzyjQpKWZDDC18AZ22snnlz3OlWl4SoK/kXWm66pMJvQisoKCCock6xS
	bhqIk9xFdDo7FaVMIrNrjB434gLR+JoHph2rIGu5ll8SvaDuarkMjOshxA33g3kQmrcF
	L0uYICMY0eVW2DkEyPqgNA0Ve39nymLTRF9vQfImnsJJWmGwYPwwVlo6yPE71pFYypLb
	0wmnEL/NnsBdHT21wiDe1laYy5JmpXwzaL3A8n3mbKUkftUBY6vLNcNbat7GsqZ2jIPY
	1XxBAqrpxAn893n2HoXt0KstHmuLszu5KmELwVNZYthrxN/POiSFqCqW1jSk4j6jAY8S
	N+Nw==
X-Gm-Message-State: APjAAAUBswAiz482RS/rEwP0UtmZvCYjCAckmIkqPJR+62n8JzZv4gBc
	szQwG4t9PZ0kZWhsbe/xG35ULQxwMsGgXewZT90=
X-Google-Smtp-Source: APXvYqwy5OZiMFaZs6NAUC3j+Pq0JPbYi0exczwr867shIjqAP/tdWFyZe8nezVrdRI+08h303LcMu8jmMhv27xfgNc=
X-Received: by 2002:a05:6102:db:: with SMTP id
	u27mr1843086vsp.83.1565090631737; 
	Tue, 06 Aug 2019 04:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565090985.git.liezhi.yang@windriver.com>
	<b1f29c78cdca27e574a89d9dd9b750e6a43cc7de.1565090985.git.liezhi.yang@windriver.com>
In-Reply-To: <b1f29c78cdca27e574a89d9dd9b750e6a43cc7de.1565090985.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 13:23:40 +0200
Message-ID: <CANNYZj-x4O4rtFhZi9j+h09AmJy4tqP-hLqFnZksT-xwvCCuCA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] stress-ng: Add bash to RDEPENDS_stress-ng-bash-completion
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
X-List-Received-Date: Tue, 06 Aug 2019 11:23:51 -0000
Content-Type: multipart/alternative; boundary="000000000000256668058f710f9b"

--000000000000256668058f710f9b
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 13:06, Robert Yang <liezhi.yang@windriver.com> wrote:

> Fixed:
> $ bitbake stress-ng bash -ccleansstate && bitbake stress-ng
> ERROR: stress-ng-0.10.00-r0 do_package_qa: QA Issue:
> /usr/share/bash-completion/completions/stress-ng contained in package
> stress-ng-bash-completion requires /bin/bash, but no providers found in
> RDEPENDS_stress-ng-bash-completion? [file-rdeps]
>

 /usr/share/bash-completion/completions/stress-ng has an unnecessary
#!/bin/bash at the start. The correct way to address this is to patch it
out at the source level.

Alex

--000000000000256668058f710f9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 6 Aug 2019 at 13:06, Robert Yang =
&lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Fixed:<br>
$ bitbake stress-ng bash -ccleansstate &amp;&amp; bitbake stress-ng<br>
ERROR: stress-ng-0.10.00-r0 do_package_qa: QA Issue: /usr/share/bash-comple=
tion/completions/stress-ng contained in package stress-ng-bash-completion r=
equires /bin/bash, but no providers found in RDEPENDS_stress-ng-bash-comple=
tion? [file-rdeps]<br></blockquote><div><br></div><div>=C2=A0/usr/share/bas=
h-completion/completions/stress-ng has an unnecessary #!/bin/bash at the st=
art. The correct way to address this is to patch it out at the source level=
.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000256668058f710f9b--
