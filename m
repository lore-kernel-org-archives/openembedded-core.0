Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA346148D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 09:30:43 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id 12so244836vbf.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 02:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=Hvb7GDkDqGDPWJ7jKo9zQhK1hQ03SYIFYEamHzwUUPI=;
	b=AsBsdhan3UTe7wWqs+idMxmZrQdH9slHQpoQB6R6hE5dCzm8lHBnFbMOi6xCRYSRc8
	PqCp/GpgOi/tCUxdBy/M5TQX0lN8riOzAqLl8LNGXi1HRdlIMzcPEL1wL8TzpGfHymoT
	nrjvUOmt7V5Qsac47FSLXxVrzDkzv5t/8o85AhtjWbjxDqPqOlYKoi6i1Nk5f1YEaUT4
	r921GJlM7lvi3qz8GHMjvAY7xpagh06e1eUMoRNg6tWZU5wG1Cv5zw+bjhB82kY6e3v/
	XpzOkLG3QMZLzTBFUSNz7VKydBg6MhOsXMu7vSmWnjvtjWuLyvIsleSLhrIjy4pEXaOH
	+Qcw==
MIME-Version: 1.0
X-Received: by 10.58.90.66 with SMTP id bu2mr545854veb.29.1369128642961; Tue,
	21 May 2013 02:30:42 -0700 (PDT)
Received: by 10.220.98.7 with HTTP; Tue, 21 May 2013 02:30:42 -0700 (PDT)
In-Reply-To: <1369119875-4984-1-git-send-email-b40527@freescale.com>
References: <1369119875-4984-1-git-send-email-b40527@freescale.com>
Date: Tue, 21 May 2013 10:30:42 +0100
Message-ID: <CAJTo0LZA89rPdGy65ShyfxjS4jenHsinO5JPsTbWNi3sgOD=Eg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
To: "b40527@freescale.com" <b40527@freescale.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlQk79us+vQqwqp8K4i4lUvjxYcOyHU59Ytvr8I6VgVXdsRu+90HJjT+Tn/ASXNyG4oJS+v
Subject: Re: [PATCH] base-files:fix the command line wrap around issue
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
X-List-Received-Date: Tue, 21 May 2013 09:30:43 -0000
Content-Type: multipart/alternative; boundary=089e013cc3866a741104dd371a55

--089e013cc3866a741104dd371a55
Content-Type: text/plain; charset=UTF-8

On Tuesday, 21 May 2013, wrote:

> +export COLUMNS=2000
>

But there are not 2000 columns, you're just hard-coding a value that is
expected to dynamically change.

i.e, on my desktop in a gnome-terminal:

$ echo $COLUMNS
80

Then if I resize the window:

$ echo $COLUMNS
117

This is a bad workaround, can you explain the actual problem?  Are you not
seeing wrapping at a VT, in a terminal, or what?

Ross

--089e013cc3866a741104dd371a55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, 21 May 2013,   wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+export=
 COLUMNS=3D2000<br></blockquote><div><br></div><div>But there are not 2000 =
columns, you&#39;re just hard-coding a value that is expected to dynamicall=
y change.</div>
<div><br></div><div>i.e, on my desktop in a gnome-terminal:</div><div><br><=
/div><div><div>$ echo $COLUMNS</div><div>80</div><div><br></div><div>Then i=
f I resize the window:</div><div><br></div><div>$ echo $COLUMNS</div><div>
117</div></div><div><br></div><div>This is a bad workaround, can you explai=
n the actual problem? =C2=A0Are you not seeing wrapping at a VT, in a termi=
nal, or what?</div><div><br></div><div>Ross</div>

--089e013cc3866a741104dd371a55--
