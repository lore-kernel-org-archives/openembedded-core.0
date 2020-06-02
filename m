Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web11.5674.1591083027568598128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 00:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d4H2K3DP;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id w20so915060uaa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 00:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=koLWhSMtOM8eIyAUys9ldgxUw7gz75yNJV7t8ZW55hk=;
        b=d4H2K3DPPbI8jE/K7fTcmt+w0sTubKX+FwtdE0+HjTcvVEfiz244JLOcsIu+LyTW4g
         mTIc29YkFoIYvUH5ZTUYIGhegbg9hhXURQkQ5oYKlYYkiHz+X9WsRVrRk0veKEA1sRAM
         qKAWHFTfh8tQCTwxmV7kq9hj895uNItJSasy+7ormohJos+oMQsJfrTVM+EReIaZEvwl
         0OfPba0R9+1yz4oMnOXlglrLzLKrOEiz4O7k0NTPLi80TnNoDNfEp9V/930hQbfVI6BK
         zF8TbRFabsVQYbR8OWwHLKnfovDmHsNPuA6eOC0epTgUyKchnvX4ctOzetGq6VXMTCtE
         0LcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=koLWhSMtOM8eIyAUys9ldgxUw7gz75yNJV7t8ZW55hk=;
        b=ibFuTRl+MndN7/L/oLxPPfonkT3ivS4Q/5RZzohqWLZKYieq7pFcUTtnERfpRMztHB
         oKAhiHyzLb4nPQqF36UvNyVDtsm9J8VjkjKQyJ2O8orJ3VNQXHf16Tst5m8EXw356+Jo
         1+9q7dIg0kGasZQaL3qWr2n57O7d6I2Y6u9uwArs/cCarRNuZbVCK2Hr1nHfKFzux7JN
         JNDORCYAzGAPzIFRavh0DwXvGZBLAFI2SZ+xbsQH5abhI9cpraQU7vz5ow7uCJyiU3x9
         ti3Qw1r5hLcIocWS+eHLsOPCZqKAwt3m+Y7g25KV6HbmDdH3sVkHQ7KF0Wjn9sscYg6x
         3dQA==
X-Gm-Message-State: AOAM531PFkkOw18gemSdzabMdPC0AFN1dpWM9f9KeNyX+gzdPhQkJDcD
	G09ENdIFIHQQTg/WneFl6m/GTprN91GHafeOZpFWjkSvbMk=
X-Google-Smtp-Source: ABdhPJxUeLO2R/5X2eowA5SkM+egN61ctUawLS4C+/kSwxQavBmQrExYxK1b4g+21bwkyxyfV2hX1k35TSGxFQrrVno=
X-Received: by 2002:ab0:2b14:: with SMTP id e20mr16653196uar.89.1591083026688;
 Tue, 02 Jun 2020 00:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-65-alex.kanavin@gmail.com> <e2f4088c4e4a43f4ad105a81b95057f5@XBOX03.axis.com>
In-Reply-To: <e2f4088c4e4a43f4ad105a81b95057f5@XBOX03.axis.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 2 Jun 2020 09:30:15 +0200
Message-ID: <CANNYZj9fr4o5C3X7DOCs6Oza9RA4QKh1CnGnV=8hdTaBvf7rvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit copyright year lines.
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009d31f505a714e22d"

--0000000000009d31f505a714e22d
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2020 at 00:12, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> > Sent: den 31 maj 2020 17:53
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > Subject: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to omit
> > copyright year lines.
>
> Eh, what? That's definitely not the right thing to do. For a license
> that says "The above copyright notice and this permission notice shall
> be included in all copies or substantial portions of the Software.",
> removing the copyright information makes the file useless as part of,
> e.g., ${PN}-lic.
>

As far as I understand, the extracts from LIC_FILES_CHKSUM are not used in
copies or substantial portions of the software,
they are used in tmp/deploy/licenses (which is neither). Is it beneficial
to have the copyright years and owners
there? The idea behind dropping them is that we can avoid continuous
adjusting of the checksum on version updates.

If you archive the source code, or install binaries to the target, this
mechanism is not involved.

I am not aware of ${PN}-lic, can you please point where that is defined?

Alex

--0000000000009d31f505a714e22d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 2 Jun 2020 at 00:12, Peter Kjelle=
rstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellersted=
t@axis.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Alexander Kanavin<br>
&gt; Sent: den 31 maj 2020 17:53<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH 65/70] libyaml: adjust license checksum to o=
mit<br>
&gt; copyright year lines.<br>
<br>
Eh, what? That&#39;s definitely not the right thing to do. For a license <b=
r>
that says &quot;The above copyright notice and this permission notice shall=
 <br>
be included in all copies or substantial portions of the Software.&quot;, <=
br>
removing the copyright information makes the file useless as part of, <br>
e.g., ${PN}-lic.<br></blockquote><div><br></div><div>As far as I understand=
, the extracts from LIC_FILES_CHKSUM are not used in copies or substantial =
portions of the software,</div><div>they are used in tmp/deploy/licenses (w=
hich is neither). Is it beneficial to have the copyright years and owners</=
div><div>there? The idea behind dropping them is that we can avoid continuo=
us adjusting of the checksum on version updates.<br></div><div><br></div><d=
iv>If you archive the source code, or install binaries to the target, this =
mechanism is not involved.</div><div><br></div><div>I am not aware of ${PN}=
-lic, can you please point where that is defined?</div><div><br></div><div>=
Alex<br></div></div></div>

--0000000000009d31f505a714e22d--
