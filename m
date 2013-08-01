Return-Path: <djszapi@archlinux.us>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id DAF3C61883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 16:33:29 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id jh10so2331830pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 09:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=IlNyVTqn16mNtdKVbx4y0kPciQfGk+8dGiyfQEi0cmc=;
	b=CvRQsCNr8F6jYgZuSNQHRE+aZr/Gm37/BRMLEAndyOFxDS7xqFa7bUFtALKMOujZUM
	DbI/vkGueLkQcg6dXPDDw9g65AIStgEQPar8zHkj1WIiUs2cWGTx/Cp7onEW6pobLEvI
	whiJdqyKSmdDM5IfaQ5AvvUABSUExfz9cZ/C+ZKbgLuOFAcNtKWQbgrf8g47D7jy5Hrm
	2nkXjLODuVjq8CRhedCnWv1IlkvWL8vkujVffIxjssHisEteCbVLuLZnW6JV3DbsBzbv
	OIuBfVGaxunRqEeZeAOdzDwye/fLEath09GiibW3AcB0DPFkXypQT1li2CI9cZrOYBk6
	a87A==
MIME-Version: 1.0
X-Received: by 10.68.2.165 with SMTP id 5mr3110601pbv.105.1375374810747; Thu,
	01 Aug 2013 09:33:30 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Thu, 1 Aug 2013 09:33:30 -0700 (PDT)
In-Reply-To: <CAJTo0LbVOSEz53G8TT0hn4UKyyhhJu6uacRb3XbCjnwBej7zGQ@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAOMwXhNbDzsi4=mBb+0=iqdxafnAezRsMvJbG1dPetCTMEhJQQ@mail.gmail.com>
	<CAJTo0LYPD48S3rjYPfh5HPyeuzxrx=ZiJOguz5doxjd2r3PAXw@mail.gmail.com>
	<CAOMwXhPi108Q0yWNPgZ-XfGA99+AUpaL+oPSH9W5yS8HhuZd3Q@mail.gmail.com>
	<CAJTo0LbVOSEz53G8TT0hn4UKyyhhJu6uacRb3XbCjnwBej7zGQ@mail.gmail.com>
Date: Thu, 1 Aug 2013 17:33:30 +0100
X-Google-Sender-Auth: 1fMxHKz6VCnKoQfZwIT5SGvGIwE
Message-ID: <CAOMwXhNfdQ_41HybptW0xgqBZhOGOx7pgdJ8M5F+qVs5Qd5vvA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQknfdAtnFmAKKOrUCYh3ERyjiKKeY3LSQg+yHqJBRoYsI7rDH0KrbX1IQedh0zbetLN6VCu
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
X-List-Received-Date: Thu, 01 Aug 2013 16:33:30 -0000
Content-Type: multipart/alternative; boundary=bcaec5215afb072ef904e2e5677e

--bcaec5215afb072ef904e2e5677e
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 1:58 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 1 August 2013 12:18, Laszlo Papp <lpapp@kde.org> wrote:
> >> It cannot be more specific without dumping the entire machine
> >> configuration, which won't help because a variable is *not* set.
> >
> > No no, it could print out the concrete file to look up, not just a name.
> > Besides, I would probably even print a warning about the entry point and
> > load address not set.
>
> This is a simple "can I even build?" check, and UBOOT_MACHINE is
> sufficient.
>
> Our users are not totally useless, I think they can find their own
> machine configuration files.
>

It is not about users being useful or "useless" as you claim. It is about
getting the output I can pass to the editor right away as that would be the
most common action anyway. Why would they need to find on their own when it
can be returned right away? You do not like working more than needed,
surely?


> >> By "machine configuration can be in the command line" do you mean
> >> MACHINE=foo?  And if so, why does that mean the statement is vague?
> >
> > Well, you could place a warning for instance when it is set to the same
> as
> > in the config file. That is probably not what the user intended.
>
> I'm not sure what you meant here.  Do you mean a situation where the
> local.conf says MACHINE=foo and the user also sets MACHINE=foo in the
> environment?
>

Yes.

--bcaec5215afb072ef904e2e5677e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Aug 1, 2013 at 1:58 PM, Burton, Ross <span dir=3D"ltr">&lt;=
<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@inte=
l.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 1 August 2013 12:18, La=
szlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:=
<br>

&gt;&gt; It cannot be more specific without dumping the entire machine<br>
&gt;&gt; configuration, which won&#39;t help because a variable is *not* se=
t.<br>
&gt;<br>
&gt; No no, it could print out the concrete file to look up, not just a nam=
e.<br>
&gt; Besides, I would probably even print a warning about the entry point a=
nd<br>
&gt; load address not set.<br>
<br>
</div>This is a simple &quot;can I even build?&quot; check, and UBOOT_MACHI=
NE is sufficient.<br>
<br>
Our users are not totally useless, I think they can find their own<br>
machine configuration files.<br></blockquote><div><br></div><div>It is not =
about users being useful or &quot;useless&quot; as you claim. It is about g=
etting the output I can pass to the editor right away as that would be the =
most common action anyway. Why would they need to find on their own when it=
 can be returned right away? You do not like working more than needed, sure=
ly?</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">&gt;&gt; By &quot;machine configuration can be in the com=
mand line&quot; do you mean<br>
&gt;&gt; MACHINE=3Dfoo? =A0And if so, why does that mean the statement is v=
ague?<br>
&gt;<br>
&gt; Well, you could place a warning for instance when it is set to the sam=
e as<br>
&gt; in the config file. That is probably not what the user intended.<br>
<br>
</div>I&#39;m not sure what you meant here. =A0Do you mean a situation wher=
e the<br>
local.conf says MACHINE=3Dfoo and the user also sets MACHINE=3Dfoo in the<b=
r>
environment?<br></blockquote><div><br></div><div>Yes.</div></div></div></di=
v>

--bcaec5215afb072ef904e2e5677e--
