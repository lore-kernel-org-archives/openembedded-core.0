Return-Path: <jason.liu@gumstix.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 77CB477EAC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 17:34:36 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id 191so6923232oii.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 10:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gumstix.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=HWQ/aa/vkL8lSATrNB1kz9RJJyG0LobdpBI5/DtayjY=;
	b=ZeaHLWGSwTAQKPAkBjCoxHk4AETEwn7GyX3wWZaYF+s6lMhvVKZk0tupd8Ksu2pSJz
	xHIVmgzxjgHsI1OVlvkFQ6EGknpooV+r/NoTtd72ihgkR0XV73SC6xPPG0bxlxsaI2xS
	bwVO+ZNMJXiFqyMfD/aiAw9QXIuX14zrTGKDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=HWQ/aa/vkL8lSATrNB1kz9RJJyG0LobdpBI5/DtayjY=;
	b=PZenPcNA0KuEhEBdGJGPXkCf8WVbmiPe3IHNYDD7dTjwZ/wao6PsCAwErxH7X4UiVS
	Q7tDISvZgUDemdmvQGxaQM2Lp2qqddZpB2ebVsrmz+eQOYP7TIYT1neivzMXsqr5/bPF
	6ArldN3YS971unQdVzOuLaHXx07GgMjPfsmi7MVC4jV+FX8+3lbDzD1jj13l7zP7gd0O
	w6La8KI3NnbVNzQFdKF/GsrpmqiY3KeNBInR9qy4ZLWoT/TqSYv6QAC7PvmEj41D3sHL
	OiiEIMbcmHoJGzXBHo7YvaBQWRipc/k6RY88Q7YUVrVFEkMdXEy3AQjMrpvHKttgU6Y7
	LLVg==
X-Gm-Message-State: AIVw112Ddtc4wS25KU2WH6tkUHhrhbYAA28Nn5LaKNcJlAonx6lYm9eu
	uhyf9wurk33ANb1HRIesFR8I3Jf17Tsh
X-Received: by 10.202.94.131 with SMTP id s125mr2413920oib.74.1500485677288;
	Wed, 19 Jul 2017 10:34:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.129.18 with HTTP; Wed, 19 Jul 2017 10:34:36 -0700 (PDT)
In-Reply-To: <CAGkS5bk6MHaROpUXNUytnR7JHhP1yWk29WR+hOQmPqeaBSWSnA@mail.gmail.com>
References: <CAGkS5bk6MHaROpUXNUytnR7JHhP1yWk29WR+hOQmPqeaBSWSnA@mail.gmail.com>
From: Jason Liu <jason.liu@gumstix.com>
Date: Wed, 19 Jul 2017 10:34:36 -0700
Message-ID: <CAGkS5b=rJ-YBbaqV1-8T_PF9j4L1ReuCY3i7m-3hb_NHd2JtcA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Nothing PROVIDES 'libvdpau'
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
X-List-Received-Date: Wed, 19 Jul 2017 17:34:36 -0000
Content-Type: multipart/alternative; boundary="001a113d22cec9193b0554af0bca"

--001a113d22cec9193b0554af0bca
Content-Type: text/plain; charset="UTF-8"

Hello Openembedded,

Currently I have a compile error saying: Nothing PROVIDES 'libvdpau'.
I opened a issue on git but I think nobody are watching the git one so I
post here.
The detail can be seen here: https://github.com/openembedded/meta-
openembedded/issues/47

Regards,
Jason

--001a113d22cec9193b0554af0bca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">Hello Openembe=
dded,<div><br></div><div>Currently I have a compile error saying:=C2=A0Noth=
ing PROVIDES &#39;libvdpau&#39;.<br></div><div>I opened a issue on git but =
I think nobody are watching the git one so I post here.</div><div>The detai=
l can be seen here:=C2=A0<a href=3D"https://github.com/openembedded/meta-op=
enembedded/issues/47" target=3D"_blank">https://github.com/<wbr>openembedde=
d/meta-<wbr>openembedded/issues/47</a></div><div><br></div><div>Regards,</d=
iv><div>Jason</div></div>
</div><br></div>

--001a113d22cec9193b0554af0bca--
