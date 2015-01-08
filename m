Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id CEDA865D72
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 16:48:27 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id l89so3125941qgf.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 08:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Cy/nmqlP2RZU/17n4FuH4ia5qe862fPZF6mUsapZmAk=;
	b=kFfwve9sP3PGeW+xfDUOUijwEkuIA6e2agnsuw9pUYe5zNpbILhjcyFyq/2z7je/5Y
	GbGKwDGWc3jCU62H4u+sYTXtndGb9MEZaBcE0hiZQaCVVEZaus+WlrSt23GZTfHJaNwD
	Vv5FvqQ2NvfAnrhxPWs1Wol06Y2ogH3IZ49h55qqYswyDNa/AxgU2g/XLJtwF7ygJL3r
	0kRT8tgtJRhtdHi26DINPzsKgrP5znKlis9ER3+kTSXNuzsSrBLH/HES1mIrXs2jsJRf
	U5DSVQXPh8WPXB8trZ2H1H1GnyTVdFjnWpbpScS45Udt1bTZFm9qvNdXQ76tUUi6+azR
	LMyw==
X-Gm-Message-State: ALoCoQkxdId8JjnmywQGUja4T/fM8G5Z8udnYqYP+YrQMXFSIUuuKMe5Opb3IQ9itUH2JWs/DglN
X-Received: by 10.224.3.137 with SMTP id 9mr17858476qan.64.1420735708191; Thu,
	08 Jan 2015 08:48:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 8 Jan 2015 08:48:07 -0800 (PST)
In-Reply-To: <3e2a14de446a26cc2ae207b13f19a5b060269f17.1420359776.git.Qi.Chen@windriver.com>
References: <cover.1420359776.git.Qi.Chen@windriver.com>
	<3e2a14de446a26cc2ae207b13f19a5b060269f17.1420359776.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Jan 2015 16:48:07 +0000
Message-ID: <CAJTo0LZFKHp82NA2fzTkpWjX_hXFmaJNtVCLbjnCTabN4ObCOg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] sysklogd: upgrade to 1.5.1
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
X-List-Received-Date: Thu, 08 Jan 2015 16:48:31 -0000
Content-Type: multipart/alternative; boundary=001a11c2480a34fac0050c26cf12

--001a11c2480a34fac0050c26cf12
Content-Type: text/plain; charset=UTF-8

On 4 January 2015 at 10:04, Chen Qi <Qi.Chen@windriver.com> wrote:

> +PR = "r7"
>

Remember to drop PR when upgrading.  I've made this change locally when
queuing for testing, no need to send another patch unless there's another
problem.

Ross

--001a11c2480a34fac0050c26cf12
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 January 2015 at 10:04, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":68c" class=3D"a3s"=
 style=3D"overflow:hidden">+PR =3D &quot;r7&quot;<br></div></blockquote></d=
iv><br>Remember to drop PR when upgrading.=C2=A0 I&#39;ve made this change =
locally when queuing for testing, no need to send another patch unless ther=
e&#39;s another problem.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a11c2480a34fac0050c26cf12--
