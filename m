Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0D977736B6;
	Tue,  1 Sep 2015 23:47:20 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so1379652igb.0;
	Tue, 01 Sep 2015 16:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=S4V/g0hWoSFhfH0kuPVmkIKokRcXUAXwGhKC0LhWmFg=;
	b=Xdm5ba1w9C7hLKUKNFoN9C8ZfT9sROCAGBVgQnsbdhWC+PVlKLw8HFxnyzaoOBsU2h
	133tJT8PRHYFFMPewbtSVm0lavHoRx9a0/hfSn3LiWcKpjdBV91uLh388aSXCnV8WjWj
	cG1FDPGitR1VHGOTsnx07ot1qDM/Zizyc4Uo+XOlrDjIIVqo9JjQn5/6+nXur3Y35AxJ
	tdmu6d7Po/Cha0COPQr1Cn9mLyQEs0QvB8CpoGjRWzlxBoc8dOqNSFSZH5tdnJcmB/2G
	jJ/om/WBu4ycccSIYlZQA4jmzRO3euUCmp2AUGVTwuXYFjDLRgo853w+rf2TBMM8rJUI
	FaQg==
X-Received: by 10.50.176.134 with SMTP id ci6mr848049igc.10.1441151240729;
	Tue, 01 Sep 2015 16:47:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Tue, 1 Sep 2015 16:47:01 -0700 (PDT)
In-Reply-To: <55E63099.8090003@linux.intel.com>
References: <20150901104522.9FC59505A9@opal.openembedded.org>
	<20150901190902.GD2458@jama> <55E63099.8090003@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 1 Sep 2015 16:47:01 -0700
X-Google-Sender-Auth: qlHuveZtVjmoYw3-dG7jgw6D2Ro
Message-ID: <CABcZANnjLEcMbLLnCb3C-QeFb9+_ZEu-CDHk46UjBfbHm+7STg@mail.gmail.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Alex Franco : Fix mode +st on TMPDIR when creating it
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
X-List-Received-Date: Tue, 01 Sep 2015 23:47:23 -0000
Content-Type: multipart/alternative; boundary=089e0111dd26c57ce9051eb82bf7

--089e0111dd26c57ce9051eb82bf7
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 1, 2015 at 4:11 PM, Alex Franco <
alejandro.franco@linux.intel.com> wrote:

> I gather the original reason (for the sanity test, as well as these
> changes) is that it is better for everything under BUILDDIR - and certainly
> TMPDIR to be owned by the user running bitbake and have standard
> permissions, the sticky bit itself would prevent a user running bitbake,
> even with +rwx permissions, from making changes to items it might need to
> manipulate, if those are not owned by this user. Similarly setuid and
> setgid might propagate user/group ownerships different from the user
> bitbake is running as, into BUILDDIR and TMPDIR (and items therein).
>
> For more info take a look at:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7669
>
> Perhaps there are more pressing reasons, perhaps Christopher Larson can
> comment a bit on this.
>

Indeed, the g+s can flow down into the files put into the packages, and
then into the rootfs. I ran into a this problem quite a bit, since my
project areas are in a g+s area to keep the files accessible to the group.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0111dd26c57ce9051eb82bf7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Sep 1, 2015 at 4:11 PM, Alex Franco <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alejandro.franco@linux.intel.com" target=3D"_blank">alejandro.fr=
anco@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":1g4" class=3D"a3s" style=3D"overflow:hidden">I gather the ori=
ginal reason (for the sanity test, as well as these changes) is that it is =
better for everything under BUILDDIR - and certainly TMPDIR to be owned by =
the user running <span class=3D"il">bitbake</span> and have standard permis=
sions, the sticky <span class=3D"il">bit</span> itself would prevent a user=
 running <span class=3D"il">bitbake</span>, even with +rwx permissions, fro=
m making changes to items it might need to manipulate, if those are not own=
ed by this user. Similarly setuid and setgid might propagate user/group own=
erships different from the user <span class=3D"il">bitbake</span> is runnin=
g as, into BUILDDIR and TMPDIR (and items therein).<br>
<br>
For more info take a look at: <a href=3D"https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D7669" rel=3D"noreferrer" target=3D"_blank">https://bugzil=
la.yoctoproject.org/show_bug.cgi?id=3D7669</a><br>
<br>
Perhaps there are more pressing reasons, perhaps Christopher Larson can com=
ment a <span class=3D"il">bit</span> on this.</div></blockquote></div><br>I=
ndeed, the g+s can flow down into the files put into the packages, and then=
 into the rootfs. I ran into a this problem quite a bit, since my project a=
reas are in a g+s area to keep the files accessible to the group.<br>-- <br=
><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth do=
t com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<=
br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e0111dd26c57ce9051eb82bf7--
