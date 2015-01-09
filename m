Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9E672027
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 13:13:08 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id j5so8422162qga.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jan 2015 05:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0h5WbwARK7TWKSieA5FYvr32kiHUDCpisQ2ud+wGT/E=;
	b=O9NFdv02AAEXY3wWRaeRqwhY4OAtYC3hywrbTiO7ME8uLqpM8854Pnqz/5OsUk/+vS
	JGdm69OA8H3FISRDabBd20hIU3hrEVolKOxZ8NGD++8djzH1Vgmv0SjNYfUr1U/p2ztQ
	077EC6SltLfatwimEkVzoptGHZVcCNu/VrpJgJPYhJLm4NeZRCJ166Bq8vo+6uKHSqjl
	+ER/zKrXgGO6hEh/PV+p9H/wj2lumaAoe+Tu2dzoq9OLMDlks8Lhzh2JkwjpEp2EB3MJ
	jM7RxVydIyAwlH8oGpwpQftxEc75KxXuOTd/vRxxgX7Rzg8n7Tf2ZVXCxP82zJH2lzEA
	exiw==
X-Gm-Message-State: ALoCoQm1mFdtKGpoai8Vfx07CsIQhVVXO2hQVtrL4FXkKpvU27qweF5CkMMs1PN9nyNAMlJ5lKo+
X-Received: by 10.229.61.5 with SMTP id r5mr26511162qch.28.1420809189207; Fri,
	09 Jan 2015 05:13:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 9 Jan 2015 05:12:48 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1501090801450.11009@localhost>
References: <alpine.LFD.2.11.1501090801450.11009@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jan 2015 13:12:48 +0000
Message-ID: <CAJTo0LaGfrmQ=nMtvan_sJVGVkbygMePRT9GWuwyzhTz9HpJsw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: do_install(), do_install_append() in qemu.inc
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
X-List-Received-Date: Fri, 09 Jan 2015 13:13:17 -0000
Content-Type: multipart/alternative; boundary=001a1132e4b4044c99050c37ebad

--001a1132e4b4044c99050c37ebad
Content-Type: text/plain; charset=UTF-8

On 9 January 2015 at 13:07, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   BTW, the only reason i tripped over this is that the YP dev manual
> discourages one from defining both do_install() and
> do_install_append() in the same file, so i thought i would do a quick
> check under poky to see which files were doing just that, and there
> are a few others. should they be adjusted? it does seem weird to
> explicitly define do_install() then, immediately, append to it in the
> same file.
>

It's certainly redundant if not harmful, when I come across instances like
that I tend to merge them.

Ross

--001a1132e4b4044c99050c37ebad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 January 2015 at 13:07, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8hf" cla=
ss=3D"a3s" style=3D"overflow:hidden">=C2=A0 BTW, the only reason i tripped =
over this is that the YP dev manual<br>
discourages one from defining both do_install() and<br>
do_install_append() in the same file, so i thought i would do a quick<br>
check under poky to see which files were doing just that, and there<br>
are a few others. should they be adjusted? it does seem weird to<br>
explicitly define do_install() then, immediately, append to it in the<br>
same file.</div></blockquote></div><br>It&#39;s certainly redundant if not =
harmful, when I come across instances like that I tend to merge them.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a1132e4b4044c99050c37ebad--
