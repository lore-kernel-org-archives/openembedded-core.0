Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 00779706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 13:31:01 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id n4so22066134qaq.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 05:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7lWvDM53XvrQbvYxXC/ySOZmlpMa4p6E7VJXv7rRX10=;
	b=WzgXU9nhv0mwn5UOhGBNsS8XMEezPKnOJZwW/Wh5rjf5j/PhdVavNuNjEaZhpouQ2n
	ixcKN4BXaWwO0k8UfwklMKhdU6xUR7p3V863Yg5j3g8bBFqPLKBTX/YejX0pTQG6WvD6
	jgoV4r8HR8PmKZp2qurIahOqXpeK2GgKOT546pmAWaryqvgxjmKbbY4czQJxEo7dKplm
	EcDw5t0K1djBlZ5ap6dmT+U5QfH1mGkLd47YtDNYswgdtqY5xYB2EuxqPptI0saPUnMW
	CXRSemhEOs0hAVC6l2Etv63oJOQ1l1vjR/DFuB5//ut7n+rHiczE7X09kguz9rN/zwlR
	7OCw==
X-Gm-Message-State: ALoCoQn2lAGiEPpm18a1zo7+LTWzN1z7pS6JF38QTy4/Jsd3ETL+Z88z1WdJMYdzFo8USeb6lZsz
X-Received: by 10.229.78.137 with SMTP id l9mr13080047qck.11.1424698262737;
	Mon, 23 Feb 2015 05:31:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 23 Feb 2015 05:30:41 -0800 (PST)
In-Reply-To: <1424515460-52075-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1424515460-52075-1-git-send-email-sven.ebenfeld@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Feb 2015 13:30:41 +0000
Message-ID: <CAJTo0LZTJxSc8XDs7t3=cPCUT7KXAkUrzi-xwUdp8icsTPwDnA@mail.gmail.com>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal.py: No --disable-factory for gnome-terminal >= 3.10
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
X-List-Received-Date: Mon, 23 Feb 2015 13:31:03 -0000
Content-Type: multipart/alternative; boundary=001a1134046adce9dc050fc169e2

--001a1134046adce9dc050fc169e2
Content-Type: text/plain; charset=UTF-8

Hi Sven,

On 21 February 2015 at 10:44, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:

> @@ -235,6 +246,8 @@ def check_konsole_version(konsole):
>

Can you rename check_konsole_version to something generic such as
check_terminal_version?

Cheers,
Ross

--001a1134046adce9dc050fc169e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Sven,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 21 February 2015 at 10:44, Sven=
 Ebenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:sven.ebenfeld@gmail.com" =
target=3D"_blank">sven.ebenfeld@gmail.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div id=3D":48b" class=3D"a3s" style=3D"overflow:hid=
den">@@ -235,6 +246,8 @@ def check_konsole_version(konsole):<br></div></blo=
ckquote></div><br>Can you rename check_konsole_version to something generic=
 such as check_terminal_version?</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a1134046adce9dc050fc169e2--
