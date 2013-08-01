Return-Path: <djszapi@archlinux.us>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 506E161883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 17:09:45 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so2361546pab.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 10:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=dEsNsSARF2VAoQi5of97lkVLCODw8Rht/LECahES+bA=;
	b=ZzEy+M4Nwe6bdA4D6WAwJUFvgCIrZ6iAQ/dWV3CL5T//eeUzmSc0kRlvFiTeHc+sGJ
	h03peZCUll+qKpw8LDVQ7p6zoQNFRaj5tWy2eyVU3lGNTm5CKbhVsTbHr+v+0e4+OdZR
	kN9VSY8tZaiF+SD3dKp6MOSKNVMr5Ita+/TLdQc0wRN4AMKCf0FX6V5qpaAQ/ENeOKJj
	wfOD+1RRu4EWQAprPTMEGm8GEdQQJi2qDwyc4j6C6zfjHrYFRziSbQDPxJvmVSOik1Dp
	wT+ASp5UaqYkfT7+/4hX4z8nCq69m54OgRvvKmjLhXP2J+ESW/QUToM7jEQ3d2kdKrF7
	ZP9g==
MIME-Version: 1.0
X-Received: by 10.68.59.98 with SMTP id y2mr3233727pbq.135.1375376986162; Thu,
	01 Aug 2013 10:09:46 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Thu, 1 Aug 2013 10:09:46 -0700 (PDT)
In-Reply-To: <1981575.9KzFInvyxm@helios>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrXScWCUTfL8_hO6Jm+gFHUbzgADZoBd-iW7xjZW1679w@mail.gmail.com>
	<CAOMwXhM5ofGEhzDoQCiuuknpuFyg+6vB-LwuNh8m9yibmGFT3Q@mail.gmail.com>
	<1981575.9KzFInvyxm@helios>
Date: Thu, 1 Aug 2013 18:09:46 +0100
X-Google-Sender-Auth: 1_QxIn_yE_PNaOCgrI32KYGI7ig
Message-ID: <CAOMwXhO-g9N3b0b27jrmZYbgDwPDNziJFF9_ryGbXF+RgBZyCw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQlh9IKJMzD6Uc/JmajnH0wFSzkiD7TURsXRBAI2qnOJetjTa1LhNXgy+cEkeW7MzapYF1GO
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
X-List-Received-Date: Thu, 01 Aug 2013 17:09:45 -0000
Content-Type: multipart/alternative; boundary=bcaec5304f81b15f9504e2e5e822

--bcaec5304f81b15f9504e2e5e822
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 6:02 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> I'm afraid this is not practical. The ability to specify the value for
> MACHINE
> and other variables from the external environment is not just there for
> folks
> running bitbake manually from the command line, but also external scripts
> as
> well, and they could quite legitimately set it to the same value that has
> been
> specified in the configuration file and showing a warning in that case
> would be
> undesirable.
>

Oh yeah, it cannot happen with compiler outputs the same way? Answer is: it
can.

You can add another feature later though if you wish to suppress warnings.
That makes sense to me.


> I'm not sure I understand the value of showing this warning in any case.
> The
> system is not going to do anything that the user won't expect - the user
> specified the value of MACHINE on the command line and that's the value
> that is
> being used. The fact that it is the same as what's in the configuration
> file is
> incidental.
>

Have you used gcc, clang, etc? Do you have experience with warnings in
general? They are there in certain cases because the programmer may have or
probably made a mistake. It is a lot easier to figure out at that time than
debugging very hard later...

Actually, it is even getting more serious in your "script" case where it
would be totally hidden by the script if it is not logging properly, and
you would only realize an issue later.

Surely, we all copy paste wrong on a daily basis, and we also write "foo"
instead "fow" and "bar" at times. So, I do not follow your comment. Nothing
to reinvent the wheel here, just follow the general practice that other
software developers have figured out along the decades.

--bcaec5304f81b15f9504e2e5e822
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 1, 2013 at 6:02 PM, Paul Eggleton <span dir=3D=
"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank=
">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmai=
l_extra">
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><div class=3D""><div class=3D"h=
5"><span style=3D"color:rgb(34,34,34)">I&#39;m afraid this is not practical=
. The ability to specify the value for MACHINE</span><br>
</div></div>
and other variables from the external environment is not just there for fol=
ks<br>
running bitbake manually from the command line, but also external scripts a=
s<br>
well, and they could quite legitimately set it to the same value that has b=
een<br>
specified in the configuration file and showing a warning in that case woul=
d be<br>
undesirable.<br></blockquote><div><br></div><div>Oh yeah, it cannot happen =
with compiler outputs the same way? Answer is: it can.</div><div><br></div>=
<div>You can add another feature later though if you wish to suppress warni=
ngs. That makes sense to me.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">I&#39;m not sure I understand the value of s=
howing this warning in any case. The<br>

system is not going to do anything that the user won&#39;t expect - the use=
r<br>
specified the value of MACHINE on the command line and that&#39;s the value=
 that is<br>
being used. The fact that it is the same as what&#39;s in the configuration=
 file is<br>
incidental.<br></blockquote><div><br></div><div>Have you used gcc, clang, e=
tc? Do you have experience with warnings in general? They are there in cert=
ain cases because the programmer may have or probably made a mistake. It is=
 a lot easier to figure out at that time than debugging very hard later...<=
/div>
<div><br></div><div>Actually, it is even getting more serious in your &quot=
;script&quot; case where it would be totally hidden by the script if it is =
not logging properly, and you would only realize an issue later.</div><div>
<br></div><div>Surely, we all copy paste wrong on a daily basis, and we als=
o write &quot;foo&quot; instead &quot;fow&quot; and &quot;bar&quot; at time=
s. So, I do not follow your comment. Nothing to reinvent the wheel here, ju=
st follow the general practice that other software developers have figured =
out along the decades.</div>
</div></div></div>

--bcaec5304f81b15f9504e2e5e822--
