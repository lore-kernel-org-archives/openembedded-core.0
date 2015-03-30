Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5EA73C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 15:08:12 +0000 (UTC)
Received: by qgep97 with SMTP id p97so190916026qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 08:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0ampY4ouKoQpzkKzGSplK+paOtqZysv2alch3/NjYfI=;
	b=jZlAAHkqyJGCXvh8262Jg3la0SPRCrklXY+BKlqoVYtQ9Bz6H/4EqskUdP8w8Rm7NK
	BvuRUEQMM/cTUDpLamZGeEaIgTvuxYwrx+2Us/V0DMDmwA0cYpbdYqFjcoxlPKTtMWSi
	b+tVR1hkVQ0KrxzsyfN+DIAw7HQyFabDbhooCR69lAtJjN1SrmcsVqZZrJUd0CQOv3g4
	gsKVCX3xXKcGlWET7cXjkE0RscpcjLqj7QF/LWjc2WvJkjg9ZZA0xHqdD6sNdi3y3cNH
	VOHFJFjdVH6gyCGPmdrNkRVbD4wru36t62UZjODD4OiJrkXbpTbGTet1QCBKzZVYF1LI
	EJzw==
X-Gm-Message-State: ALoCoQlCO1hxLN6bC+lYd0XBVa9Dap0l3GWrIDjeDatowyVfgYCrfAjriEyHLp6a5+cbGjb8RPCs
X-Received: by 10.140.149.150 with SMTP id 144mr42531600qhv.16.1427728093790; 
	Mon, 30 Mar 2015 08:08:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 30 Mar 2015 08:07:53 -0700 (PDT)
In-Reply-To: <1418864567-9676-1-git-send-email-rich.tollerton@ni.com>
References: <1418864567-9676-1-git-send-email-rich.tollerton@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Mar 2015 16:07:53 +0100
Message-ID: <CAJTo0LYWAET6K0zr8ALGByjryEe8zV_kmTkkdVjXV-aTwxajFA@mail.gmail.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal: Disable shopt errexit
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
X-List-Received-Date: Mon, 30 Mar 2015 15:08:15 -0000
Content-Type: multipart/alternative; boundary=001a113577e2dde44c051282d9f7

--001a113577e2dde44c051282d9f7
Content-Type: text/plain; charset=UTF-8

On 18 December 2014 at 01:02, Richard Tollerton <rich.tollerton@ni.com>
wrote:

> `sh -e` causes any errors encountered during shell execution to abort
> the shell. For terminal sessions like devshell, this causes errors
> encountered while executing do_terminal to instantaneously kill the
> session. This is explicitly not what we want for interactive/debugging
> situations like with terminal, so just remove the '-e' from the sh
> invocation.
>

This doesn't happen for me - starting a devshell and running "false"
doesn't cause the terminal to exit.  I wonder what the difference between
your environment and mine is.

Ross

--001a113577e2dde44c051282d9f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 December 2014 at 01:02, Richard Tollerton <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:rich.tollerton@ni.com" target=3D"_blank">rich.tollerton@ni.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1h3" c=
lass=3D"a3s" style=3D"overflow:hidden">`sh -e` causes any errors encountere=
d during shell execution to abort<br>
the shell. For terminal sessions like devshell, this causes errors<br>
encountered while executing do_terminal to instantaneously kill the<br>
session. This is explicitly not what we want for interactive/debugging<br>
situations like with terminal, so just remove the &#39;-e&#39; from the sh<=
br>
invocation.</div></blockquote><div><br></div><div>This doesn&#39;t happen f=
or me - starting a devshell and running &quot;false&quot; doesn&#39;t cause=
 the terminal to exit.=C2=A0 I wonder what the difference between your envi=
ronment and mine is.</div><div><br></div><div>Ross</div></div></div></div>

--001a113577e2dde44c051282d9f7--
