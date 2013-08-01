Return-Path: <djszapi@archlinux.us>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7C2DA6B1F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 11:18:42 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id q10so1897278pdj.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 04:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=8rXe6kqOzvH/3iL665Cb5zHUj402ifdpnuDwedFl95w=;
	b=nvOtMsWfg8KWvbsc3ZeN980ADHg49gPZLRY8Eh8AiA4peKzwEXygA+0/ihzWE4LWK2
	dtE8+YBj3XUGOJHsjkd2y8MPQXREZGZvHdisHWvSzN0XIYau58GnKQAjM03UFLdckpai
	5SY7lxJ0mvX1sLyrC6LyOZQOzYT2me/7Ozk/+B0RsNHP8q7EULF8SNDXibFI4/8BnfUk
	x9+k/0McNf4SSlFD98TI9xrmX4AKxQ+CtM4KVzzoxhhtq3PkTWDF9Pq+HOu/XLToE7pO
	JZKO+Z6VRiyxOexHqPcMtSIrOkLr8RZpwpOVhP6eAJR2chlaTBX5L/aGvzWoai+QJeqv
	VW9A==
MIME-Version: 1.0
X-Received: by 10.66.27.143 with SMTP id t15mr3301682pag.171.1375355921190;
	Thu, 01 Aug 2013 04:18:41 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Thu, 1 Aug 2013 04:18:41 -0700 (PDT)
In-Reply-To: <CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
	<CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
Date: Thu, 1 Aug 2013 12:18:41 +0100
X-Google-Sender-Auth: 9p4HEXh0ghipkq7HC1tYOp54Noc
Message-ID: <CAOMwXhPi108Q0yWNPgZ-XfGA99+AUpaL+oPSH9W5yS8HhuZd3Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmVm/Thp3VMbFrE7gnxYitb1dwoTuDEtqsaj6aoi6Nzi/+MZ8J7VYuoeWTouC6rWjZAOGbx
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 11:18:43 -0000
Content-Type: multipart/alternative; boundary=bcaec52bea191f668204e2e101db

--bcaec52bea191f668204e2e101db
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 11:56 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 1 August 2013 11:50, Laszlo Papp <lpapp@kde.org> wrote:
> > Speaking of gerrit terms: I would prefer that you didn't submit this.
> >
> > I would like it to be more specific. If it cannot be more specific, it
> > should provide further information to get more specific information.
> Note,
> > machine configuration can be the command line as well, so this would
> still
> > be vague.
>
> It cannot be more specific without dumping the entire machine
> configuration, which won't help because a variable is *not* set.
>

No no, it could print out the concrete file to look up, not just a name.
Besides, I would probably even print a warning about the entry point and
load address not set.


> By "machine configuration can be in the command line" do you mean
> MACHINE=foo?  And if so, why does that mean the statement is vague?
>

Well, you could place a warning for instance when it is set to the same as
in the config file. That is probably not what the user intended.

--bcaec52bea191f668204e2e101db
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 1, 2013 at 11:56 AM, Burton, Ross <span dir=3D=
"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.b=
urton@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 1 August 2013 11:50, La=
szlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:=
<br>

&gt; Speaking of gerrit terms: I would prefer that you didn&#39;t submit th=
is.<br>
&gt;<br>
&gt; I would like it to be more specific. If it cannot be more specific, it=
<br>
&gt; should provide further information to get more specific information. N=
ote,<br>
&gt; machine configuration can be the command line as well, so this would s=
till<br>
&gt; be vague.<br>
<br>
</div>It cannot be more specific without dumping the entire machine<br>
configuration, which won&#39;t help because a variable is *not* set.<br></b=
lockquote><div><br></div><div>No no, it could print out the concrete file t=
o look up, not just a name. Besides, I would probably even print a warning =
about the entry point and load address not set.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
By &quot;machine configuration can be in the command line&quot; do you mean=
<br>
MACHINE=3Dfoo? =A0And if so, why does that mean the statement is vague?<br>=
</blockquote><div><br></div><div>Well, you could place a warning for instan=
ce when it is set to the same as in the config file. That is probably not w=
hat the user intended.</div>
</div></div></div>

--bcaec52bea191f668204e2e101db--
